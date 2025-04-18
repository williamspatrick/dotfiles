require("which-key").add({
    { "c", group = "code", icon = "󰯁" },
    { "f", group = "files", icon = "󰉋" },
    { "g", group = "git/goto", icon = "" },
    { "m", group = "indent mode", icon = "󰉶" },
    {
        "<C-S-W>",
        function()
            require("which-key").show({
                loop = true,
                height = { min = 4, max = 10 },
            })
        end,
        desc = "Show which-key legend",
    },
})
