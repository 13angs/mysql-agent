#!/bin/bash

source .env

# backup the db
docker exec $CON_NAME mysqldump --all-databases --user=$USERNAME --password=$PASSWORD > $BACKUP_PATH/all_databases.sql