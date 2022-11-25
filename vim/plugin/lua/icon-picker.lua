require('icon-picker').setup({
    disable_legacy_commands = true
})

vim.keymap.set("n", "<leader>fi", "<cmd>IconPickerNormal<cr>", {})
