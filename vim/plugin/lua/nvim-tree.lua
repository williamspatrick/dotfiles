require("nvim-tree").setup()
vim.keymap.set("n", "<leader>ft", require("nvim-tree.api").tree.toggle, {})
