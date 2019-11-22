hs.hints.hintChars = {"A","S","D","F","Q","W","E","R","J","K","L","U","I","O"}
hs.hints.style = "default"

-- cmd-ctrl-tab = window hint switcher
hs.hotkey.bind({"cmd", "ctrl"}, "tab", function()
    hs.hints.windowHints(hs.window.visibleWindows())
end)

-- cmd-ctrl-alt-right = move window to east screen
hs.hotkey.bind({"cmd", "ctrl", "alt"}, "right", function()
    window = hs.window.focusedWindow()
    screen = window:screen()

    window:centerOnScreen(screen:toEast() or screen)
end)

-- cmd-ctrl-alt-left = move window to west screen
hs.hotkey.bind({"cmd", "ctrl", "alt"}, "left", function()
    window = hs.window.focusedWindow()
    screen = window:screen()

    window:centerOnScreen(screen:toWest() or screen)
end)

-- cmd-ctrl-shift-left
-- move window to upper left and resize to w=2/5, h=1/2
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "left", function()
    window = hs.window.focusedWindow()
    screen = window:screen()

    screen_geo = screen:frame()

    new_x = screen_geo.x + 10
    new_y = screen_geo.y + 10
    new_w = (screen_geo.w * 2) / 5 - 10
    new_h = (screen_geo.h) / 2 - 10

    new_geo = hs.geometry.rect(new_x, new_y, new_w, new_h)
    window:move(new_geo)
end)

-- cmd-ctrl-shift-right
-- move window to upper right and resize to w=2/5, h=1/2
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "right", function()
    window = hs.window.focusedWindow()
    screen = window:screen()

    screen_geo = screen:frame()
    window_geo = window:frame()

    new_x = screen_geo.x + (screen_geo.w * 3) / 5
    new_y = screen_geo.y + 10
    new_w = (screen_geo.w * 2) / 5 - 10
    new_h = (screen_geo.h) / 2 - 10

    new_geo = hs.geometry.rect(new_x, new_y, new_w, new_h)
    window:move(new_geo)
end)

-- cmd-ctrl-down
-- move window to bottom half of the screen
hs.hotkey.bind({"cmd", "ctrl"}, "down", function()
    window = hs.window.focusedWindow()
    screen = window:screen()

    screen_geo = screen:frame()
    window_geo = window:frame()

    new_y = screen_geo.y + math.min(screen_geo.h / 2, 
                                    screen_geo.h - (window_geo.h + 10))
    window_geo.y = new_y
    window:move(window_geo)
end)

-- cmd-ctrl-up
-- move window to top half of the screen
hs.hotkey.bind({"cmd", "ctrl"}, "up", function()
    window = hs.window.focusedWindow()
    screen = window:screen()

    screen_geo = screen:frame()
    window_geo = window:frame()

    new_y = screen_geo.y + math.max(10,
                                    screen_geo.h / 2 - (window_geo.h + 10))

    window_geo.y = new_y
    window:move(window_geo)
end)

-- cmd-ctrl-left
-- move window left by 1/5 of the screen
hs.hotkey.bind({"cmd", "ctrl"}, "left", function()
    window = hs.window.focusedWindow()
    screen = window:screen()

    screen_geo = screen:frame()
    window_geo = window:frame()

    new_x = math.max(screen_geo.x + 10,
                     window_geo.x - (screen_geo.w / 5))

    window_geo.x = new_x
    window:move(window_geo)
end)

-- cmd-ctrl-right
-- move window right by 1/5 of the screen
hs.hotkey.bind({"cmd", "ctrl"}, "right", function()
    window = hs.window.focusedWindow()
    screen = window:screen()

    screen_geo = screen:frame()
    window_geo = window:frame()

    new_x = math.min(screen_geo.x + screen_geo.w - 10,
                     window_geo.x + (screen_geo.w / 5))

    window_geo.x = new_x
    window:move(window_geo)
end)
