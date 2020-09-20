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

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if (xrandr | grep "HDMI1 disconnected"); then
  xlayoutdisplay --dpi 200 -p eDP1
  echo "rofi.dpi: 200" | xrdb -merge
else
  xlayoutdisplay -p HDMI1 -o HDMI1
  xrandr --output eDP1 --off
fi

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
slstatus &
picom &
flameshot &
xautolock -time 5 -locker slock &
feh --bg-scale /home/jarias/Pictures/d78b1219f9991c69a7619d362548cb79f4d29e02_hq2.jpg

exec dwm
