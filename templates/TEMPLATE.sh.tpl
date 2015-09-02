#!/usr/bin/bash

DATE=""

function usage() {
    echo "-d 日期"
    (>>>POINT<<<)
}

while getopts "d:h" OPTION
do
  case ${OPTION} in
    d) DATE=$OPTARG ;;
    h) usage; exit;;
    ?) usage; exit;;
  esac
done


if [[ "x" == "x$DATE" ]]; then
    usage
fi
