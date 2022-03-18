import os

SECRET_KEY = os.urandom(64)

#Folder where the script runs
basedir = os.path.dirname(__name__)

#Debug mode
DEBUG = True

# Connect to database