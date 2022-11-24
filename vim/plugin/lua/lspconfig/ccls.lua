require("lspconfig").ccls.setup({
    init_options = {
        compilationDatabaseDirectory = vim.g.meson_build_dir,
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
