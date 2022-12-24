#!/bin/bash

source .env

# backup date
DATETIME=$(date "+%Y-%m-%d_%H:%M:%S")

# backup the db
backup_db(){
    echo "Backing up db as $DATETIME.sql..."
    docker exec $CON_NAME mysqldump --all-databases --user=$USERNAME --password=$PASSWORD > "$BACKUP_PATH/$DATETIME.sql"
}

# restore the db
restore_db(){
    echo "Restoring $RESTORE_DB..."
    docker exec -i $CON_NAME mysql --user=$USERNAME --password=$PASSWORD < "$BACKUP_PATH/$RESTORE_DB"
}

# restore / backup
if [ $ACTION == "BACKUP" ]; then
    backup_db
elif [ $ACTION == "RESTORE" ]; then
    restore_db
else 
    echo "Incorrect action"
fi 
