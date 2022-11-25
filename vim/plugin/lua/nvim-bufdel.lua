require("bufdel").setup()

vim.keymap.set("n", "<leader>q", "<cmd>BufDel<cr>", {})
vim.keymap.set("n", "<leader>Q", "<cmd>BufDel!<cr>", {})
vim.keymap.set({ "i", "n", "v" }, "<C-S-Right>", "<cmd>bn<cr>", {})
vim.keymap.set({ "i", "n", "v" }, "<C-S-Left>", "<cmd>bp<cr>", {})
