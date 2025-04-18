require("icon-picker").setup({
    disable_legacy_commands = true,
})

require("which-key").add({
    { "<leader>fi", "<cmd>IconPickerNormal<cr>", desc = "Icon Picker" },
})
