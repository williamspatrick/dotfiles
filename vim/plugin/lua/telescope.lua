require("telescope").setup({
    defaults = {
        layout_strategy= "flex",
    }
})
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.git_files, {})
vim.keymap.set("n", "<leader>fv", builtin.find_files, {})
vim.keymap.set("n", "<leader>fs", builtin.treesitter, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
