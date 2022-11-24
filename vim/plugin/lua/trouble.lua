require("trouble").setup()

vim.keymap.set({ "i", "n", "v" }, "<C-`>", "<cmd>TroubleToggle<cr>", {})
