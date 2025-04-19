require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "gopls",
        "jedi_language_server",
        "jsonls",
        "lua_ls",
        "ruff",
        "rust_analyzer",
    },
})

local null_ls = require("null-ls")
local null_ls_helpers = require("null-ls.helpers")
local null_ls_methods = require("null-ls.methods")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black.with({
            extra_args = { "-l", "79", "--preview" },
        }),
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.isort.with({
            extra_args = { "--profile", "black" },
        }),
        null_ls.builtins.formatting.prettier.with({
            extra_args = { "--print-width=80", "--prose-wrap=always" },
        }),
        null_ls.builtins.formatting.stylua.with({
            extra_args = { "--column-width", "80" },
        }),
        null_ls.builtins.formatting.shfmt.with({
            extra_args = { "-i", "4", "-sr", "-ci" },
        }),

        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.diagnostics.markdownlint.with({
            extra_args = { "--disable", "line-length", "--" },
        }),
        null_ls.builtins.diagnostics.mypy.with({
            extra_args = { "--strict" },
        }),
        require("none-ls-shellcheck.diagnostics"),
        null_ls.builtins.diagnostics.zsh,

        require("none-ls-shellcheck.code_actions"),

        null_ls_helpers.make_builtin({
            name = "meson",
            meta = {
                url = "https://github.com/mesonbuild/meson",
                description = "Builtin formatter for Meson",
            },
            method = null_ls_methods.internal.FORMATTING,
            filetypes = { "meson" },
            generator_opts = {
                command = "meson",
                args = { "format", "-" },
                to_stdin = true,
            },
            factory = null_ls_helpers.formatter_factory,
        }),
    },
})

require("which-key").add({

    { "<leader>gd", vim.lsp.buf.definition, desc = "Goto Definition" },
    {
        "<leader>gt",
        vim.lsp.buf.type_definition,
        desc = "Goto Type Definition",
    },
    { "<leader>gr", vim.lsp.buf.references, desc = "LSP References" },
    {
        "<c-k>",
        vim.lsp.buf.signature_help,
        desc = "Signature",
        mode = "in",
    },
    { "K",          vim.lsp.buf.hover,       desc = "LSP Hover" },
    { "<leader>cr", vim.lsp.buf.rename,      desc = "Symbol Rename" },
    { "<leader>cf", vim.lsp.buf.format,      desc = "Code Format" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
    {
        "<leader>ce",
        function()
            vim.diagnostic.open_float({ border = "rounded" })
        end,
        desc = "LSP Diagnostics",
    },
    { "<leader>cm", "<cmd>Make<cr>", desc = "Build" },
})

-- Change style of LSP borders.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })

vim.cmd([[highlight! link FloatBorder Comment]])
