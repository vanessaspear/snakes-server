import sqlite3
from models import Owner

def get_all_owners():
    """Gets all owners

    Returns:
        (list): Returns a list of owner dictionaries
    """
    with sqlite3.connect("./snakes.sqlite3") as conn:

        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            o.id,
            o.first_name,
            o.last_name,
            o.email
        FROM Owners o
        """)

        owners = []

        dataset = db_cursor.fetchall()

        for row in dataset:

            owner = Owner(row['id'], row['first_name'], row['last_name'], row['email'])

            owners.append(owner.__dict__)

    return owners

def get_single_owner(id):
    """Finds the matching owner dictionary for the specified owner id

    Args:
        id (int): owner id

    Returns:
        object: owner dictionary
    """
    with sqlite3.connect("./snakes.sqlite3") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        SELECT
            o.id,
            o.first_name,
            o.last_name,
            o.email
        FROM Owners o
        WHERE o.id = ?
        """, ( id, ))

        data = db_cursor.fetchone()

        if data is None:

            return None
        
        owner = Owner(data['id'], data['first_name'], data['last_name'], data['email'])

        return owner.__dict__
