require("lspconfig").jedi_language_server.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
