import json
from urllib.parse import urlparse, parse_qs
from http.server import BaseHTTPRequestHandler, HTTPServer
from views import get_all_owners, get_all_snakes, get_all_species
from views import get_single_owner, get_single_snake, get_single_species
from views import get_snakes_by_species, create_snake

# Method mapper for all resources
method_mapper = {
    "owners": {
        "single": get_single_owner,
        "all": get_all_owners
    },
    "snakes": {
        "single": get_single_snake,
        "all": get_all_snakes
    },
    "species": {
        "single": get_single_species,
        "all": get_all_species
    }
}

class HandleRequests(BaseHTTPRequestHandler):
    """Controls the functionality of any GET, PUT, POST, DELETE requests to the server
    """

    def parse_url(self, path):
        """Parse the url into the resource and id"""
        parsed_url = urlparse(path)
        path_params = parsed_url.path.split('/')
        resource = path_params[1]

        if parsed_url.query:
            query = parse_qs(parsed_url.query)
            return (resource, query)

        pk = None
        try:
            pk = int(path_params[2])
        except (IndexError, ValueError):
            pass
        return (resource, pk)

    def get_all_or_single(self, resource, id):
        """Returns a single matching resource dictionary or an entire resource list

        Args:
            resource (string): The resource to be accessed
            id (int): The primary key of the requested resource dictionary

        Returns:
            dict: The matching resource dictionary
        """
        if id is not None:
            response = method_mapper[resource]["single"](id)

            if response is not None:

                if response == "Aonyx cinerea":

                    self._set_headers(405)

                else: 
                    self._set_headers(200)

            else:
                self._set_headers(404)
                response = "Resource doesn't exist.  Please enter a valid resource id."
        else:
            self._set_headers(200)
            response = method_mapper[resource]["all"]()

        return response
    
    def verify_resource(self, resource):
        """Verifies that the resource used by the client is supported by the API

        Args:
            resource (string): Resource requested by the client
        """
        valid_resources = ["owners", "snakes", "species"]

        if resource in valid_resources:
            return True

        self._set_headers(404)
        response = {}
        return response

    def do_GET(self):
        """Handles GET requests to the server
        """
        response = {}
        parsed = self.parse_url(self.path)
        (resource, id) = parsed

        resource_validity = self.verify_resource(resource)

        if resource_validity:

            if '?' not in self.path:
                response = self.get_all_or_single(resource, id)
            else:
                parsed = self.parse_url(self.path)
                (resource, query) = parsed
                
                if query.get('species') and resource == 'snakes':
                    
                    response = get_snakes_by_species(query['species'][0])

                    if response is not None:
                        self._set_headers(200) 
                    else: 
                        self._set_headers(404)
                        response = "Resource  id doesn't exist.  Please enter a valid resource id."

        self.wfile.write(json.dumps(response).encode())
            
    def do_POST(self):
        """Handles POST requests to the server"""

        content_len = int(self.headers.get('content-length', 0))
        post_body = self.rfile.read(content_len)
        post_body = json.loads(post_body)

        (resource, id) = self.parse_url(self.path)
        resource_validity = self.verify_resource(resource)
        new_resource = {}

        if resource_validity:

            if resource == "snakes":

                if (
                    "name" in post_body
                    and "owner_id" in post_body
                    and "species_id" in post_body
                    and "gender" in post_body
                    and "color" in post_body
                    ) and len(post_body) < 6:
                    self._set_headers(201)
                    new_resource = create_snake(post_body)
                else:
                    self._set_headers(400)
                    
                    if len(post_body) >= 6:
                        new_resource = "The submission has an additional property and is invalid.  This resource should only have the following properties: name, owner_id, species_id, gender, and color."
                    else:
                        new_resource = {"message":f'{"name is required" if "name" not in post_body else ""} {"owner_id is required" if "owner_id" not in post_body else ""} {"species_id is required" if "species_id" not in post_body else ""} {"gender is required" if "gender" not in post_body else ""} {"color is required" if "color" not in post_body else ""}'}
            else:
                self._set_headers(405)

        else:
            self._set_headers(404)

        self.wfile.write(f"{new_resource}".encode())

    def do_PUT(self):
        """Handles PUT requests to the server
        """
        response = {}
        self._set_headers(405)
        self.wfile.write(f"{response}".encode())

    def _set_headers(self, status):
        """Sets the status code, Content-Type and Access-Control-Allow-Origin
        headers on the response

        Args:
            status (number): the status code to return to the front end
        """
        self.send_response(status)
        self.send_header('Content-type', 'application/json')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()

    def do_OPTIONS(self):
        """Sets the options headers
        """
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods',
                         'GET, POST, PUT, DELETE')
        self.send_header('Access-Control-Allow-Headers',
                         'X-Requested-With, Content-Type, Accept')
        self.end_headers()

    def do_DELETE(self):
        """Deletes dictionary from database
        """
        response = {}
        self._set_headers(405)
        self.wfile.write(f"{response}".encode())

def main():
    """Starts the server on port 8088 using the HandleRequests class
    """
    host = ''
    port = 8088
    HTTPServer((host, port), HandleRequests).serve_forever()


if __name__ == "__main__":
    main()
