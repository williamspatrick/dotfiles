require("lspconfig").ruff.setup({
    init_options = {
        settings = {
            format = {
                args = { "--line-length=79" },
                lint = { args = { "--ignore=E203,E501" } },
            },
        },
    },
})
