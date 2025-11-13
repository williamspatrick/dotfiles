vim.lsp.config("ccls", {
    init_options = {
        compilationDatabaseDirectory = vim.g.meson_build_dir,
        clang = {
            extraArgs = { "-std=c++23" },
        },
    },
})
vim.lsp.enable("ccls")
