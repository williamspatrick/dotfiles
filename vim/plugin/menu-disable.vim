if has("gui_running") && !exists("g:neovide")
    " Remove icon bar.
    unmenu ToolBar
    unmenu! ToolBar
endif
