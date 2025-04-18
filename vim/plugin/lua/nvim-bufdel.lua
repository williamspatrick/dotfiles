require("bufdel").setup()

require("which-key").add({
    {"<leader>q", "<cmd>BufDel<cr>", desc = "Quit" },
    { "<leader>Q", "<cmd>BufDel!<cr>", desc = "Force Quit" },
    { "<C-S-Right>", "<cmd>bn<cr>", desc = "Buffer Next", mode = "inv" },
    { "<C-S-Left>", "<cmd>bp<cr>", desc = "Buffer Prev", mode = "inv" },
})
