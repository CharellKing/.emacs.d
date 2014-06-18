;;================================================
;; install cpplint
;;================================================
sudo apt-get install python-pip python-dev build-essential
sudo pip install cpplint

;;================================================
;;clang
;;================================================
cd ~/.emacs.d/
git clone https://github.com/Sarcasm/irony-mode.git
git clone https://github.com/MJPA/SimpleJSON.git
mv irony-mode* irony-mode
mv SimpleJSon* SimpleJSon
mv SimpleJSon  irony-mode/lib
sudo apt-get install clang3.5 libclang-dev

;;================================================
;;python
;;================================================
sudo apt-get install py-pip
sudo pip install elpy jedi rope

