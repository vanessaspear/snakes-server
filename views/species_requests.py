import sqlite3
from models import Species

def get_all_species():
    """Gets all species

    Returns:
        (list): Returns a list of species dictionaries
    """
    with sqlite3.connect("./snakes.sqlite3") as conn:

        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            s.id,
            s.name
        FROM Species s
        """)

        species_list = []

        dataset = db_cursor.fetchall()

        for row in dataset:

            species = Species(row['id'], row['name'])

            species_list.append(species.__dict__)

    return species_list
