local telescope = require("telescope")
telescope.load_extension("luasnip")

require("which-key").add({
    { "<leader>fp", telescope.extensions.luasnip.luasnip, desc = "Luasnip" },
})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
