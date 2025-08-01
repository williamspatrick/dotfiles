local custom_solarized = require("lualine.themes.solarized_dark")
local custom_background = "#586e75"
custom_solarized.normal.b.bg = custom_background
custom_solarized.inactive.b.bg = custom_background

require("lualine").setup({
    options = {
        theme = custom_solarized,
    },
    sections = {
        lualine_x = {
            require("minuet.lualine"),
            "encoding",
            "fileformat",
            "filetype",
        },
    },
    tabline = {
        lualine_a = {
            {
                "buffers",
                mode = 2,
                max_length = vim.o.columns,
                buffers_color = {
                    active = custom_solarized.normal.a,
                    inactive = custom_solarized.inactive.b,
                },
                symbols = {
                    alternate_file = "",
                },
            },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
})
