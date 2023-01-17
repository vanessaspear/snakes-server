Snakes API Server
------

### Overview
Snakes API Server is a web REST API that handles HTTP requests from a client to a database that stores information about snakes.  The API server allows the client to perform create and read functionality for authorized resources, and it utilizes SQL queries to access the database. 

### Requirements 

Snakes API Server was designed to handle the following user stories: 

<details>
  <summary>Click to expand</summary>

  * **Given** a client wants to view all species
  * **When** a client makes a GET request to the `/species` endpoint for your API
  * **Then** the client should receive a list of dictionaries in the response body. Each dictionary contains all properties of species.
  * **And** the status code should be 200

  ---

  * **Given** a client wants to view a single species
  * **When** a client makes a GET request to the `/species/{id}` endpoint for your API
  * **Then** the client should receive a dictionary in the response body.
  * **And** the status code should be 200

  ---

  * **Given** a client wants some data that your API doesn't support
  * **When** the client makes a GET, POST, PUT, or DELETE request to any other endpoint
  * **Then** the client should receive a blank request body
  * **And** the status code should be 404

  ---

  * **Given** a client wants to view all snakes
  * **When** the client makes a GET request to `/snakes`
  * **Then** the client should receive a list of dictionaries for all snakes
  * **And** the status code should be 200

  ---

  * **Given** a client wants to view all snakes of a certain species
  * **When** the client makes a GET request to `/snakes` with a query string parameter of `species` that has a valid species primary key
  * **Then** the client should receive a list of dictionaries for all snakes of that species
  * **And** the status code should be 200

  ---

  * **Given** a client wants to view the details of a single snake
  * **When** the client makes a GET request to `/snakes/{id}`
  * **Then** the client should received a dictionary representation of the snake in the response body
  * **And** the status code should be 200
  * **Unless** the species of the snake is "Aonyx cinerea" since these snakes always live in colonies and are never found solo in the wild. A status code of 405 should be used in this case.

  ---

  * **Given** the client wants to create a snake
  * **When** the client send a POST request to `/snakes`
  * **And** the client includes all required properties in the request body
  * **Then** the client should receive dictionary in the response body
  * **And** the response status code should 201

  ---

  * **Given** the client wants to create a snake
  * **When** the client send a POST request to `/snakes
  * **And** the client **does not** include all required properties in the request body
  * **Then** the client should receive a message in the response body detailing the missing properties
  * **And** the response status code should 400

  ---

  * **Given** a client wants to view all owners
  * **When** the client makes a GET request to `/owners
  * **Then** the client should receive a list of dictionaries for all owners
  * **And** the status code should be 200

  ---

  * **Given** a client wants to view the details of a single owner
  * **When** the client makes a GET request to `/owners/{id}`
  * **Then** the client should received a dictionary representation of the owner in the response body
  * **And** the status code should be 200

</details>

### Technologies Used

<img alt="Python" src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue"><img alt="SQLite3" src="https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white"><img alt="Postman" src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white"><img alt="GIT" src="https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white"><img alt="Github" src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"><img alt="VScode" src="https://img.shields.io/badge/VSCode-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white">

Python, SQLite3, and Postman were used to build and test this API.  In the planning stages, I used DB Diagram to create a database model.  The full diagram can be viewed here: [Snakes ERD](https://dbdiagram.io/embed/63c5639c296d97641d79f9c3)

<img width="669" alt="image" src="https://user-images.githubusercontent.com/112430942/212995817-570596aa-4be2-4b04-95d1-04159413d8aa.png">

### Using the API

Navigate to your workspace directory. 

Run the following command in terminal:

```
git clone git@github.com:vanessaspear/snakes-server.git
cd snakes-server
```

Open your preferred API client.  I used [Postman](https://www.postman.com/product/what-is-postman/) while developing this API.

Use the client to perform requests to the API server.  Here are a few requests to get you started:

| Method | URL | Response Body |
|--|--|--|
| GET | http://localhost:8088/species | List |

| Method | URL | Status Code |
|--|--|--|
| PUT | http://localhost:8088/habitats/4 | 404 |

| Method | URL | Response Body |
|--|--|--|
| GET | http://localhost:8088/snakes?species=1 | List |

| Method | URL | Response Body |
|--|--|--|
| POST | http://localhost:8088/snakes | Dictionary |

| Method | URL | Response Body |
|--|--|--|
| GET | http://localhost:8088/owners/4 | Dictionary |

Author
------
Created by Vanessa Spear 

[<img alt="Github" src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white">](https://github.com/vanessaspear)[<img alt="LinkedIn" src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white">](https://www.linkedin.com/in/vanessavspear/)
