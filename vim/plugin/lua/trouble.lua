require("trouble").setup()

vim.keymap.set({ "i", "n", "v" }, "<C-`>", "<cmd>Trouble diagnostics toggle<cr>", {})
