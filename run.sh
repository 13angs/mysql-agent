#!/bin/bash

source .env

# backup date
datetime=$(date "+%Y-%m-%d_%H:%M:%S")

# backup the db
backup_db(){
    echo "Backing up db..."
    docker exec $CON_NAME mysqldump --all-databases --user=$USERNAME --password=$PASSWORD > "$BACKUP_PATH/all_databases.sql"
}

# restore the db
restore_db(){
    echo "Restoring db..."
    docker exec -i $CON_NAME mysql --user=$USERNAME --password=$PASSWORD < "$BACKUP_PATH/all_databases.sql"
}

# restore / backup
if [ $ACTION == "BACKUP" ]; then
    backup_db
elif [ $ACTION == "RESTORE" ]; then
    restore_db
else 
    echo "Incorrect action"
fi 
