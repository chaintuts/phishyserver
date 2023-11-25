#!/usr/bin/bash
# This file creates a user for the PhishyServerDB database
# Update with your own configuration information and rename to "user.sh"
#
# Author: Josh McIntyre
#

# Clear the existing database for ease of development
# Uncomment this line if you wish to delete the existing database when running this script
# mongosh --eval "db.getSiblingDB(\"PhishyServerDB\").dropDatabase()"
# mongosh --eval "db.getSiblingDB(\"PhishyServerDB\").dropUser(\"PhishyUser\")"

# This block creates the user and grants read privileges
mongosh --eval "db.getSiblingDB(\"PhishyServerDB\").createUser( \

	{ \
		\"user\" : \"MyUser\", \
		\"pwd\" : \"MyPassword\", \
		\"roles\" : [ \"read\" ] \
	}\
)"
