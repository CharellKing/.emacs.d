#!/bin/bash

CUR_DIR=$(cd "$(dirname "$0")"; pwd)

APT_GET=""
PIP_GET=""
NPM_GET=""

SYSTEM_TYPE=""

if [ -f "/System/Library/CoreServices/SystemVersion.plist" ]; then
    SYSTEM_TYPE="mac"
elif [ -f "/etc/issue" ]; then
    SYSTEM_TYPE="linux"
else
    echo "can't check system type"
    exit 1
fi

if [ "x${SYSTEM_TYPE}" == "xmac" ]; then
    APT_GET="brew"
    PIP_GET="pip"
    NPM_GET="npm"
elif [ "x${SYSTEM_TYPE}" == "xlinux" ]; then
    SYSTEM_INFO=`cat /etc/issue | tr 'A-Z' 'a-z'`

    SYSTEM_APT_GETS=("redhat rpm" "fedora rpm" "centos rpm" "debian apt-get" "ubuntu apt-get" "kali apt-get" "mint apt-get")

    for SYSTEM_APT_GET in ${SYSTEM_APT_GETS[@]}
    do
        SYSTEM_APT_GET=(${SYSTEM_APT_GET})
        if `echo ${SYSTEM_INFO} | grep -q  ${SYSTEM_APT_GET[0]}`; then
            SYSTEM_TYPE="${SYSTEM_APT_GET[0]}"
            APT_GET="sudo ${SYSTEM_APT_GET[1]} -y"
            break
        fi
    done

    PIP_GET="sudo pip"
    NPM_GET="sudo npm"
else
    echo "can't check system type"
fi


echo ${APT_GET}
echo ${PIP_GET}
echo ${NPM_GET}
echo ${SYSTEM_TYPE}
