import mysql.connector
from mysql.connector import Error

def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='recruitment_db',
            user='root',       # Apne MySQL username se replace karein agar alag ho
            password=''        # Apna MySQL password yahan dalein
        )
        if connection.is_connected():
            return connection
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        return None