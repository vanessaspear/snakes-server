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
