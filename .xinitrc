eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
# This line must go last
exec i3 -l  -V >>~/.i3/i3log >&1

