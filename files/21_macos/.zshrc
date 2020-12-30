
# Enable solarized textual-irc
zinit ice \
    atclone"mkdir -p ~/Library/Group\ Containers/com.codeux.apps.textual/Library/Application\ Support/Textual/Styles && ln -sf ~/.zinit/plugins/williamspatrick---textual-solarized-dark ~/Library/Group\ Containers/com.codeux.apps.textual/Library/Application\ Support/Textual/Styles/Solarized-Dark" \
    pick"/dev/null" nocompile:!
zinit light williamspatrick/textual-solarized-dark
