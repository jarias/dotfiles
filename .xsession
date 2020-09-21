#!/bin/sh

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
slstatus &
picom &
flameshot &
xautolock -time 5 -locker slock &
feh --bg-scale /home/jarias/Pictures/d78b1219f9991c69a7619d362548cb79f4d29e02_hq2.jpg
