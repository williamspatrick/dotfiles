require("neoclip").setup()

local telescope = require("telescope")
telescope.load_extension("neoclip")

vim.keymap.set("n", "<leader>fy", telescope.extensions.neoclip.default, {})
