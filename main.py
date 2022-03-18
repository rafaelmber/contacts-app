from flask import Flask, render_template
from database.db import mydb
app = Flask(__name__)
app.config.from_object('config')

@app.route('/')
def index():
    return render_template('public/index.html')