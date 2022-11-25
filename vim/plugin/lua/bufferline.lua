require("bufferline").setup({
    highlights = {
        buffer_selected = {
            italic = false,
        },
    },
    options = {
        separator_style = "slant",
        always_show_bufferline = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "📂",
                text_align = "left",
                separator = true,
            },
        },
    },
})
