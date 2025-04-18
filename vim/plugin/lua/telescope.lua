require("telescope").setup({
    defaults = {
        layout_strategy = "flex",
    },
})
local builtin = require("telescope.builtin")

require("which-key").add({
    { "<leader>ff", builtin.git_files,       desc = "Find Files (via git)" },
    { "<leader>fv", builtin.find_files,      desc = "Find Files (all)" },

    { "<leader>fs", builtin.treesitter,      desc = "Treesitter" },
    { "<leader>fg", builtin.live_grep,       desc = "Grep Files" },
    { "<leader>fd", builtin.lsp_definitions, desc = "LSP Definitions" },
    { "<leader>fr", builtin.lsp_references,  desc = "LSP References" },
})
