require("lspconfig").sumneko_lua.setup({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.stdpath("config"),
                },
            },
        },
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
