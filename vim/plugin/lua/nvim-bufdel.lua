require("bufdel").setup()

vim.keymap.set("n", "<leader>q", "<cmd>BufDel<cr>", {})
vim.keymap.set("n", "<leader>Q", "<cmd>BufDel!<cr>", {})
vim.keymap.set(
    { "i", "n", "v" },
    "<C-S-Right>",
    '<cmd>call buf_utils#GoToBuffer(v:count,"forward")<cr>',
    {}
)
vim.keymap.set(
    { "i", "n", "v" },
    "<C-S-Left>",
    '<cmd>call buf_utils#GoToBuffer(v:count,"backward")<cr>',
    {}
)
