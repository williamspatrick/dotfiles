require("lspconfig").ccls.setup({
    init_options = {
        compilationDatabaseDirectory = vim.g.meson_build_dir,
        clang = {
            extraArgs = { "-std=c++23" },
        },
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
