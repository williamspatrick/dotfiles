require("trouble").setup()

require("which-key").add({
    { "<C-`>", "<cmd>Trouble diagnostics toggle<cr>", desc="Toggle Trouble", mode = "inv" }
})
