# Set up gnome-keyring as necessary.
case $XDG_SESSION_DESKTOP in
    sway)
        eval $(gnome-keyring-daemon --start 2>/dev/null)
        export SSH_AUTH_SOCK
        ;;
esac
