# Set up gnome-keyring as necessary.
case $XDG_SESSION_DESKTOP in
    sway)
        export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
        ;;
esac
