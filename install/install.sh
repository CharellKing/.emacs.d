#!/bin/bash

CUR_DIR=$(cd "$(dirname "$0")"; pwd)

source ${CUR_DIR}/system.sh

## 安装软件
${APT_GET} install python git npm tmux global emacs keepassx sbcl xclip slime

## 安装pip插件
${PIP_GET} install elpy jedi rope flake8 importmagic ipython jslint lftp shadowsocks ipython

## 安装npm插件
echo "registry = https://registry.npm.taobao.org" >> ~/.npmrc
${NPM_GET} config set registry https://registry.npm.taobao.org
${NPM_GET} install jslint -g

### 配置tmux
cp ${CUR_DIR}/common_conf/tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf #更新配置文件

### 配置npm
cp ${CUR_DIR}/common_conf/npmrc.conf ~/.npmrc

### 配置flake
if [ "xmac" == "x${SYSTEM_TYPE}" ]; then
    cp ${CUR_DIR}/common_conf/flake8.conf ~/.flake8rc
else
    cp ${CUR_DIR}/common_conf/flake8.conf ~/.config/flake8
fi
