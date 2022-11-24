local telescope = require("telescope")
telescope.load_extension("luasnip")
vim.keymap.set("n", "<leader>fs", telescope.extensions.luasnip.luasnip, {})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
