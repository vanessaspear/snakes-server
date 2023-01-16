import sqlite3
from models import Snake

def get_all_snakes():
    """Gets all snakes

    Returns:
        (list): Returns a list of snake dictionaries
    """
    with sqlite3.connect("./snakes.sqlite3") as conn:

        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            s.id,
            s.name,
            s.owner_id,
            s.species_id,
            s.gender,
            s.color
        FROM Snakes s
        """)

        snakes = []

        dataset = db_cursor.fetchall()

        for row in dataset:

            snake = Snake(row['id'], row['name'], row['owner_id'], row['species_id'], row['gender'], row['color'])

            snakes.append(snake.__dict__)

    return snakes

# Function with a single parameter
def get_single_snake(id):
    """Finds the matching snake dictionary for the specified snake id

    Args:
        id (int): snake id

    Returns:
        object: snake dictionary
    """
    with sqlite3.connect("./snakes.sqlite3") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            s.id,
            s.name,
            s.owner_id,
            s.species_id,
            s.gender,
            s.color,
            sp.name species_name
        FROM Snakes s
        JOIN Species sp
            ON sp.id = s.species_id
        WHERE s.id = ?
        """, ( id, ))

        data = db_cursor.fetchone()

        if data is None:

            return None

        if data['species_name'] == "Aonyx cinerea":

            return "Aonyx cinerea"
            
        snake = Snake(data['id'], data['name'], data['owner_id'], data['species_id'], data['gender'], data['color'])

        return snake.__dict__

