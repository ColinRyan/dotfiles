dbus-update-activation-environment --systemd DISPLAY
export SSH_AUTH_SOCK


[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# This line must go last
exec i3 

