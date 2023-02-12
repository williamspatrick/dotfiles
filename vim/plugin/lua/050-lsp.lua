require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "jedi_language_server",
        "jsonls",
        "lua-language-server",
    },
})

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.beautysh.with({
            extra_args = { "--force-function-style", "fnpar" },
        }),
        null_ls.builtins.formatting.black.with({
            extra_args = { "-l", "79", "--preview" },
        }),
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.isort.with({
            extra_args = { "--profile", "black" },
        }),
        null_ls.builtins.formatting.prettier.with({
            extra_args = { "--print-width=80", "--prose-wrap=always" },
        }),
        null_ls.builtins.formatting.stylua.with({
            extra_args = { "--column-width", "80" },
        }),

        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.diagnostics.flake8.with({
            extra_args = { "--extend-ignore", "E203,E501" },
        }),
        null_ls.builtins.diagnostics.markdownlint.with({
            extra_args = { "--disable", "line-length", "--" },
        }),
        null_ls.builtins.diagnostics.mypy.with({
            extra_args = { "--strict" },
        }),
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.zsh,

        null_ls.builtins.code_actions.shellcheck,
    },
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set({ "n", "i" }, "<c-k>", vim.lsp.buf.signature_help, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>ce", function()
    vim.diagnostic.open_float({ border = "rounded" })
end, {})

vim.keymap.set("n", "<leader>cm", "<cmd>Make<cr>", {})

-- Change style of LSP borders.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] =
vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

vim.cmd([[highlight! link FloatBorder Comment]])
