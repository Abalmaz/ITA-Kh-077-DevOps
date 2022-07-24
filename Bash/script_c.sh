#!/bin/bash

COMMAND_LINE_OPTIONS_HELP='
The data backup script that takes the following data as parameters:
- path to the syncing directory
- the path to the directory where the copies of the files will be stored
Usage: '`basename $0`'  [syncing_dir] [dir_to_backup]

Examples:
        '`basename $0`' /home/username/db  /home/username/backups
'

function info {
  echo "$COMMAND_LINE_OPTIONS_HELP"
  exit 1;
}

function checkDirectory(){
  if [ "$1" = "" ]; then
    echo "You didn't give the the syncing directory. "
    info
elif [ ! -d "$1" ]; then
    echo "The directory $1 does not exist."
    info
fi
}

checkDirectory $1
checkDirectory $2

rsync -av --delete --out-format "%t %o %n" --log-file=/var/log/rsync/srync.log "$1/" "$2"


# For adding script to cron for run every minute:
# crontab -e
# or
# sudo nano /etc/crontab
# * * * * * /path_to_script/script_c.sh [syncing_dir] [dir_to_backup]
