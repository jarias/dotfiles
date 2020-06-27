#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#xlayoutdisplay -p HDMI-1 -o HDMI-1 -o eDP-1

xrandr \
 --dpi 84 \
 --output HDMI1 --mode 1920x1080 --rate 60 --pos 0x0 --primary \
 --output eDP1 --mode 3840x2160 --rate 60 --pos 1920x0 --scale 0.5x0.5 \
 --output DP1 --off \
 --output DP2 --off \
 --output HDMI2 --off

echo "Xft.dpi: 84" | xrdb -merge

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
slstatus &
picom &
flameshot &
xautolock -time 5 -locker slock &
feh --bg-scale /home/jarias/Pictures/nausicaa1.jpg

exec dwm
