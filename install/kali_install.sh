#!/bin/bash

CUR_DIR=$(cd "$(dirname "$0")"; pwd)

source ${CUR_DIR}/system.sh

if [ "x${SYSTEM_TYPE}" != "xkali" ]; then
    echo "the system not kali"
    exit 1
fi

# sudo cp /etc/apt/sources.list /etc/apt/sources.list.`date +%s`
# sudo cp ${CUR_DIR}/kali_conf/sources.list /etc/apt/sources.list
${APT_GET} update

${APT_GET} install boot-repair

${APT_GET} install network-manager-openvpn-gnome network-manager-pptp network-manager-pptp-gnome network-manager-strongswan network-manager-vpnc network-manager-vpnc-gnome xclip
