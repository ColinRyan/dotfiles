dbus-update-activation-environment --systemd DISPLAY
export SSH_AUTH_SOCK


[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# For dual monitor 
xrandr --output HDMI-2 --left-of HDMI-1

# This line must go last
exec i3 

