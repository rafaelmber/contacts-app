import os
from dotenv import load_dotenv
from mysql.connector import connect, Error

load_dotenv()
try:
    with connect(
        host='localhost',
        user=os.environ['DB_USER'],
        password= os.environ['DB_PASSWORD'],
        database='contacts_app'
    ) as mydb:
        print(mydb)
except Error as err:
    print('Error',err)
