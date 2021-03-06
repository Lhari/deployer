#!/bin/sh

#----------------------------------------------------
# a simple mysql database backup script.
# version 2, updated March 26, 2011.
# copyright 2011 alvin alexander, http://devdaily.com
#----------------------------------------------------
# This work is licensed under a Creative Commons 
# Attribution-ShareAlike 3.0 Unported License;
# see http://creativecommons.org/licenses/by-sa/3.0/ 
# for more information.
#----------------------------------------------------

# (0) include stuff from vars file
. vars/settings.sh

# (1) set up all the mysqldump variables
timestamp() {
    date +"%H:%M:%S.%d-%m-%y"
}

FILE=dump/$(timestamp).sql
DBSERVER=localhost
DATABASE=$db_name
USER=$db_user
PASS=$db_pass

if [[ ! -d dump ]]; then
	mkdir dump
fi

# (2) in case you run this more than once a day, remove the previous version of the file
unalias rm     2> /dev/null
rm ${FILE}     2> /dev/null
rm ${FILE}.gz  2> /dev/null

# (3) do the mysql database backup (dump)

# use this command for a database server on a separate host:
#mysqldump --opt --protocol=TCP --user=${USER} --password=${PASS} --host=${DBSERVER} ${DATABASE} > ${FILE}

# use this command for a database server on localhost. add other options if need be.
mysqldump --opt --user=${USER} --password=${PASS} ${DATABASE} > ${FILE}

# (4) gzip the mysql database dump file
gzip $FILE

# (5) show the user the result
ls -l ${FILE}.gz
