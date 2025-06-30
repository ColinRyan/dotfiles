dbus-update-activation-environment --systemd DISPLAY
export SSH_AUTH_SOCK


[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# For dual monitor 
xrandr --output DP-0 --right-of HDMI-0
xrandr --output HDMI-1 --left-of HDMI-0  --mode 1920x1080

# This line must go last
exec i3 

