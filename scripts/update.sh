#!/bin/bash

# exit if any comman fail
set -e 

# check dependency
[[ -f /usr/bin/git ]] || sudo pacman -Syy --noconfirm --needed -S git

# refresh repository tree
git fetch

# update daemon
updateDaemon() {
   if [[ $(pgrep update.sh) ]]; then 
      exit
   else 
      sleep 1h
   fi
}

# update repository
update() {
   echo " > Updating...!"
   git pull 
   echo " > Update Done...!"
}

# check is upadet available 
if [[ $(git checkout | grep -o "Your branch is behind") == "Your branch is behind" ]]; then 
   echo " > Update available...!" && update
else 
   echo " > Update not available...!"
fi

updateDaemon
