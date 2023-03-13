#!/bin/sh

 export XDG_SESSION_TYPE=x11
 export XDG_SESSION_CLASS=user
 export XDG_MENU_PREFIX=lxde- # for pcmanfm to work nicely
 export XDG_SESSION_DESKTOP="$(grep "^exec" .xinitrc | cut -d' ' -f2)"
 export XDG_CURRENT_DESKTOP="$(grep "^exec" .xinitrc | cut -d' ' -f2)"
 export XDG_CONFIG_HOME="$HOME/.config"
 export XDG_DATA_DIRS="/usr/local/share:/usr/share"
 export XDG_CONFIG_DIRS="/usr/share/upstart/xdg:/etc/xdg"
 export XDG_CACHE_HOME="$HOME/.cache"
 export XDG_DATA_HOME="$HOME/.local/share/"
 export SAL_USE_VCLPLUGIN=gtk
 export SSH_ASKPASS=torios-askpass  #zenity dialog for ssh
 export SUDO_ASKPASS=torios-askpass  #zenity dialog for sudo -A
 export QT_QPA_PLATFORMTHEME=qt5ct # qt5ct # kvantum
 export OPENAI_API_KEY="$(cat /home/sachin/.chatgptkey)"

# defaults
 export EDITOR=nvim
#  export TERMINAL=alacritty
 export BROWSER=firefox
 export DOTS=~/.local/mydots
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
 [ -d $HOME/.local/scripts ] && export PATH="${PATH}:$HOME/.local/scripts"


# kill program if running
 pkill -9 mpd dunst picom plank polybar # clipmenud kdeconnect-indicator 

# aplication dock
 plank &

# polybar 
 polybar -r &

# lock
# betterlockscreen -l blur & 

# notification deamon
 dunst &

# compositor (picom)
 picom &

# music player daemon (mpd) 
 mpd &

# clipmenu daemon
# clipmenud &

# bluetooth applet (blueman)
 blueman-applet &

# screenshot daemon 
 flameshot &

# authentication agent (polkit)
 /usr/bin/lxqt-policykit-agent &
# /usr/lib/xfce-polkit/xfce-polkit &

# set wallpaper
 feh --no-fehbg --bg-scale "${HOME}"/.config/bg.png "${HOME}"/.config/bg2.png & 

# kdeconnect
kdeconnect-indicator &

# reload sxhkd daemon when sxhkdrc changes
 echo "${HOME}"/.config/sxhkd/sxhkdrc | entr -np pkill -USR1 -x sxhkd &

# reload bspwm when config file changes
 echo "${HOME}"/.config/bspwm/bspwmrc | entr -np bspc wm -r &

# log notification
 notify-log "${HOME}"/.cache/notify.log &

#---------------------------------------------------------------------------------

# seassion 
exec bspwm

#---------------------------------------------------------------------------------
