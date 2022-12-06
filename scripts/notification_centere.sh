#!/bin/bash
#
# notify-send.py

# pip install notify-send.py
# OR
git clone https://github.com/phuhl/notify-send.py
cd notify-send.py
pip install .

sudo pacman -S dbus-python ninja  python-gobject gtk3
