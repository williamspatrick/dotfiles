require("neoclip").setup()

local telescope = require("telescope")
telescope.load_extension("neoclip")

require("which-key").add({
    { "<leader>fy", telescope.extensions.neoclip.default, desc = "Neoclip" },
})
