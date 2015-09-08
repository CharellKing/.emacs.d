#/bin/bash

sudo apt-get install py-pip
sudo apt-get install git
sudo pip install elpy jedi rope flake8 importmagic ipython

echo "[flake8]\nmax-line-length=120" > ~/.config/flake8
