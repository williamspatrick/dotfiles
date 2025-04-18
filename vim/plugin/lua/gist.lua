local wk = require("which-key")

wk.add({
    {
        "<leader>gp",
        "<cmd>tabnew | setlocal buftype=nofile | .! nvim-gist<cr>",
        desc = "Send clipboard to gist",
    },
})
