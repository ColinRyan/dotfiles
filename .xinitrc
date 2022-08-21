dbus-update-activation-environment --systemd DISPLAY
export SSH_AUTH_SOCK


[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# For dual monitor 
xrandr --output HDMI-2 --right-of HDMI-1
xrandr --output HDMI-2 --mode 1920x1080 --rate 60
xrandr --output HDMI-2 --mode 5120x1440 --rate 60

# This line must go last
exec i3 

