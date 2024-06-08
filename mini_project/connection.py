import mysql.connector
import MySQLdb
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

def create_connection():
    connection = None
    try:
        connection = mysql.connector.connect(
            host=os.getenv("DB_HOST"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            database=os.getenv("DB_NAME")
        )
        if connection.is_connected():
            print("Connection to MySQL DB successful")
    except MySQLdb.Error as e:
        print(f"The error '{e}' occurred")
    return connection

conn = create_connection()
