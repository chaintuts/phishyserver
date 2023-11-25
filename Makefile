# This file contains a make script for the PhishyServer application
#
# Author: Josh McIntyre
#

# This block defines makefile variables
API_FILES=src/api/*
CLIENT_FILES=src/client/*
SH_FILES=src/storage/user.sh

BUILD_DIR=bin/phishyserver
CLIENT_DIR=bin/phishyserver
DATA_DIR=bin/data
DATA_SCRIPT=database.sh

# This rule builds the application
build: $(API_FILES) $(CLIENT_FILES)
	mkdir -p $(BUILD_DIR)
	mkdir -p $(CLIENT_DIR)
	cp $(API_FILES) $(BUILD_DIR)
	cp $(CLIENT_FILES) $(CLIENT_DIR)

# This rule loads the database
load: $(SH_FILES)
	mkdir -p $(DATA_DIR)
	cat $(SH_FILES) > $(DATA_DIR)/$(DATA_SCRIPT)
	chmod +x $(DATA_DIR)/$(DATA_SCRIPT)
	cd $(DATA_DIR); \
		./$(DATA_SCRIPT)

# This rule cleans the build and data directories
clean: $(BUILD_DIR) $(DATA_DIR)
	rm $(BUILD_DIR)/* $(CLIENT_DIR)/* $(DATA_DIR)/*
	rmdir $(BUILD_DIR) $(CLIENT_DIR) $(DATA_DIR) 
