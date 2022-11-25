local urlview = require("urlview")
urlview.setup()

vim.keymap.set("n", "<leader>fu", urlview.search, {})
