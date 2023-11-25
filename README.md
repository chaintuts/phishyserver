## General
____________

### Author
* Josh McIntyre

### Website
* jmcintyre.net

### Overview
* PhishyServer is a simple demo server for storing exfiltrated data via REST

## Development
________________

### Git Workflow
* master for releases (merge development)
* development for bugfixes and new features

### Building
* make build
Build the application
* make load
Load the database
* make clean
Clean the build and data directories

### Features
* Create a database and user in MongoDB for storing the data
* Run a server that listens for POST requests and writes the data to MongoDB
* Demonstrates a simple exfiltration script using SeedScanner that scans for cryptocurrency seed phrases
* Send the found seed phrases to the server

### Requirements
* Requires Python
* Requires MongoDB

### Platforms
* Windows
* Linux
* MacOSX

## Usage
____________

### Configuration
* Configure your own server database values in `user.sh` and `auth.py`
* Configure your own client exfiltration values in `clientconfig.py`

### Server Usage
* For a simple development server, run `python3 -m flask --app phishyserver run`

### Client Usage
* Run `python3 exfiltrate.py`

