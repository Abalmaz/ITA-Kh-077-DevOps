#!/bin/bash

COMMAND_LINE_OPTIONS_HELP='
Usage: '`basename $0`'  [ -h | --host ] [ -p | --page ]
                        [ -r | --requests ] [ -n | --non-existent ]
                        [ -t | --time ] [ -b | --bots] filename

Command line options:
    -h, --host          Displays from which ip were the most requests.
    -p, --page          Displays the most requested page.
    -r, --requests      Displays how many requests were there from each ip.
    -n, --non-existent  Show non-existent pages were clients referred to.
    -t, --time          Show what time did site get the most requests.
    -b, --bots          Display what search bots have accessed the site.

Examples:
        '`basename $0`' -rt  apache.log
'

function info {
  echo "$COMMAND_LINE_OPTIONS_HELP"
  exit 1;
}

function getMostRequestsHost {
  echo "The ip from which were the most requests:"
  cat $1 | awk '{print $1}' | sort | uniq -c | sort -nr | awk '{print$2}' | head -1
}

function getMostRequestsPage {
  echo "The most requested page:"
  cat $1 | egrep -o 'GET (.*) HTTP' | sed -r 's/^GET \/(.+) HTTP/\1/' | sort | uniq -c | sort -nr | awk '{print$2}' | head -1
}

function countRequestsForEachIp {
  echo "The number of requests from each IP:"
  cat $1 | awk '{print $1}' | sort | uniq -c | sort -n
}

function getNonExistentPages {
  echo "Non-existent pages:"
  cat $1 | grep error404 -B 1 | grep 302| egrep -o 'GET (.*) HTTP' | sed -r 's/^GET \/(.+) HTTP/\1/'
}

function getTimeMostRequestsTime {
  echo "Time when site did the most requests:"
  cat $1 | awk '{ print $4 }' | sed -r 's/\[//' | sed 's/...$//' | uniq -c | sort -nr | head -1 | awk '{print $2}'
}

function getBots {
  echo "Search bots that have accessed the site:"
  cat $1 | grep bingbot | awk '{print $1, $12}'| sed -r 's/"//'| uniq | sort
}

PARSED_ARGUMENTS=$(getopt -o hprnetb --long host,page,requests,non-existent,time,bots -- "$@")
VALID_ARGUMENTS=$?

if [ "$VALID_ARGUMENTS" != "0" ]; then
  info
fi

eval set -- "$PARSED_ARGUMENTS"

while :
do
  case "$1" in
    -h | --host)    command+=("getMostRequestsHost")   ; shift   ;;
    -p | --page)    command+=("getMostRequestsPage")       ; shift   ;;
    -r | --requests) command+=("countRequestsForEachIp") ; shift ;;
    -n | --non-existent)  command+=("getNonExistentPages")   ; shift  ;;
    -t | --time) command+=("getTimeMostRequestsTime") ; shift  ;;
    -b | --bots) command+=("getBots") ; shift  ;;
    --) shift; break ;;
    *) echo "Unexpected option: $1 "
       info ;;
  esac
done

filename=$@
if [ "$filename" = "" ]; then
    echo "Filename is empty"
    info
elif [ ! -f "$filename" ]; then
    echo "$filename does not exist."
    exit 1
fi

for c in "${command[@]}"; do
  $c $filename
done
