#!/bin/bash

function checkDirectory(){
  if [ "$1" = "" ]; then
    echo "You didn't give the the syncing directory. "
    exit 1
elif [ ! -d "$1" ]; then
    echo "The directory $1 does not exist."
    exit 1
fi
}

readonly DATETIME="$(date '+%Y-%m-%d_%H:%M:%S')"
readonly BACKUP_PATH="$1/${DATETIME}"

checkDirectory $1
checkDirectory $2

rsync -av --delete "$1/"  --exclude=".cache" "${BACKUP_PATH}"