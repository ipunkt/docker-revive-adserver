#!/usr/bin/env bash

THIS_VERSION=${REVIVE_VERSION//.}
DB_VERSION=${DB_NAME##*_}

printf "checking revive version %s… " $THIS_VERSION
if [ "$THIS_VERSION" == "$DB_VERSION" ] ; then
    printf "\e[92mfound correct database\e[0m"
else
    printf "\e[91mversion mismatch %s\n\e[0m" $DB_VERSION
    printf "trying to update… "
    if [ "$THIS_VERSION" -lt "$DB_VERSION" ]; then
        printf "\e[91mnewer DB_VERSION found, exiting.\n\e[0m" $DB_VERSION
        exit 1
    fi
    printf "\e[92mupdate to %s possible\n\e[0m" $THIS_VERSION
# 1. backup active database
# mysqldump -uUSER -pPASSWORD OLDDATABASE –skip-lock-tables > FILE.sql
    mysqldump -u$DB_USER -p$DB_PASSWORD $DB_NAME --skip-lock-tables

# 2. import into new database
# mysql -uUSER -pPASSWORD NEWDATABASE < FILE.sql

fi

# Start apache server process
printf "\nstarting apache…\n";
apache2-foreground
