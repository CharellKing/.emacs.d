#/bin/bash

SYSTEM_VERSION=""
if [ -f "/System/Library/CoreServices/SystemVersion.plist" ]; then
    SYSTEM_VERSION="MAC"
elif [ -f "/etc/issues" ]; then
    SYSTEM_VERSION="LINUX"
fi

if [ "x" == "x${SYSTEM_VERSION}" ]; then
    echo "can't check system os"
    exit
fi

if [ "x${SYSTEM_VERSION}" == "xMAC" ]; then
    APT_GET="brew"
    PIP_GET="sudo pip"
fi

if [ "x${SYSTEM_VERSION}" == "xLINUX" ]; then
    APT_GET="sudo apt-get"
    PIP_GET="sudo pip"
fi

## 安装软件

### emacs依赖软件
${APT_GET} install python -y
${APT_GET} install git -y
${PIP_GET} install elpy jedi rope flake8 importmagic ipython -y
${APT_GET} install tmux -y


### 传输工具
${APT_GET} install lftp -y


## 配置文件

### tmux配置文件
git clone https://github.com/tony/tmux-config.git ~/.tmux
if [ "x${SYS_VERSION}" == "xMAC" ];then
    ln -s ~/.tmux/.tmux-osx.conf ~/.tmux.conf
elif [ "x${SYS_VERSION}" == "xLINUX" ]; then
    ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
fi

tmux source-file ~/.tmux.conf #更新配置文件

### flake配置
echo "[flake8]\nmax-line-length=120" > ~/.config/flake8
