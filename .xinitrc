#!/bin/sh

 export XDG_SESSION_TYPE=x11

# defaults
 export EDITOR=vim
 export TERMINAL=xfce4-terminal
 export BROWSER=firefox
 export DOTS=~/.local/dots
 export SUDO_ASKPASS=~/.local/bin/mypass
#---------------------------------------------------------------------------------

 [ -f ~/.Xresources ] && xrdb ~/.Xresources
#---------------------------------------------------------------------------------

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
#---------------------------------------------------------------------------------

# set Environtmental PATH variable
 [ -d $HOME/.local/bin ] && export PATH="${PATH}:$HOME/.local/bin"

# kill program if running
# pkill -9 mpd dunst picom clipmenud kdeconnect-indicator 

# retore wallpaper
# wal -R &

# mount gDrive (google drive)
#[ -d $HOME/drive ] || mkdir -p $HOME/drive && rclone mount gDrive: $HOME/drive &

# music deamon
# mpd &

# notification deamon
 dunst &

# compositor (picom)
# picom &

# clipmenu daemon
# clipmenud &

# authentication agent (polkit)
 /usr/bin/lxqt-policykit-agent &
# /usr/bin/lxpolkit
# /usr/lib/xfce-polkit/xfce-polkit &

# set wallpaper
feh --no-fehbg --bg-scale ${HOME}/.config/bg.png

# sleeptime
# sudo -A shutdown -h 23:51 &

# kdeconnect
# kdeconnect-indicator &

# lock
# betterlockscreen -l blur 

# start sxhkd
# sxhkd &

#---------------------------------------------------------------------------------

# seassion 
 exec bspwm
# exec i3
