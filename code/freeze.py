#!/usr/bin/python3
from flask_frozen import Freezer
from app import app

app.config.from_pyfile('config.py')

freezer = Freezer(app)

if __name__ == '__main__':
    #print(app.config)
    freezer.freeze()