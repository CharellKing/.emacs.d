#!/bin/bash

CUR_DIR=$(cd "$(dirname "$0")"; pwd)

DATE=""

function usage() {
    echo "-d 日期"
    echo "-h 帮助"
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
    exit 1
fi
