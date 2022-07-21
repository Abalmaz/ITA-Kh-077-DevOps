#!/bin/bash

COMMAND_LINE_OPTIONS_HELP='
Command line options:
    --all       displays the IP addresses and symbolic names of all hosts in the current subnet
    --target    displays a list of open system TCP ports.

Examples:
        '`basename $0`' --all
        '`basename $0`' --target
'


function checkAndInstallPackage(){
  dpkg -s "$1" > /dev/null 2>&1 || sudo apt-get -y install "$1"
}

function getAllIpInNetwork() {
    checkAndInstallPackage nmap;
    nets=`ip route | grep -w src | awk '{print $1}'`;
    for net in $nets; do
      echo "The IP addresses and names of all hosts in the '$net' subnet:"
      pc=$(nmap -sn "$net" | grep -w report | awk '{gsub( /\(|\)/ , ""); print $5":" , $6}')
      echo "$pc"
      done
    exit 1;
}

function getOpenTCPPort(){
  checkAndInstallPackage nmap;
  ports=$(nmap -T4 -F localhost)
  echo "$ports"
  exit 1;
}

info() {
  echo "$COMMAND_LINE_OPTIONS_HELP"
  exit 1;
}

[ $# -eq 0 ] && info

while [ $# -gt 0 ]; do
    case "$1" in
        "--all")
            getAllIpInNetwork
            ;;
        "--target")
            getOpenTCPPort
            ;;
        *)
            info
            ;;
    esac
done
