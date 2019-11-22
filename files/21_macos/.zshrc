
# Enable solarized textual-irc
zplugin ice \
    atclone"mkdir -p ~/Library/Group\ Containers/com.codeux.apps.textual/Library/Application\ Support/Textual/Styles && ln -sf ~/.zplugin/plugins/williamspatrick---textual-solarized-dark ~/Library/Group\ Containers/com.codeux.apps.textual/Library/Application\ Support/Textual/Styles/Solarized-Dark" \
    pick"/dev/null" nocompile:!
zplugin light williamspatrick/textual-solarized-dark
