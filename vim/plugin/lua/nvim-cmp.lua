local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Esc>"] = cmp.mapping.close(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
    }, {
        { name = "path" },
        { name = "buffer", keyword_length = 2 },
        { name = "emoji", insert = true },
    }),
    completion = {
        keyword_length = 1,
        completeopt = "menu,noselect",
    },
    view = {
        entries = "custom",
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
                nvim_lsp = "[LSP]",
                luasnip = "[LS]",
                nvim_lua = "[Lua]",
                path = "[Path]",
                buffer = "[Buffer]",
                emoji = "[Emoji]",
                omni = "[Omni]",
            },
        }),
    },
})

-- see https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu
vim.cmd([[
  highlight! link CmpItemMenu Comment
  " gray
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#586e75
  " blue
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#268bd2
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#268bd2
  " light blue
  highlight! CmpItemKindVariable guibg=NONE guifg=#808080
  highlight! CmpItemKindInterface guibg=NONE guifg=#808080
  highlight! CmpItemKindText guibg=NONE guifg=#808080
  " pink
  highlight! CmpItemKindFunction guibg=NONE guifg=#d33682
  highlight! CmpItemKindMethod guibg=NONE guifg=#d33682
  " orange
  highlight! CmpItemKindKeyword guibg=NONE guifg=#cb4b16
  highlight! CmpItemKindProperty guibg=NONE guifg=#cb4b16
  highlight! CmpItemKindUnit guibg=NONE guifg=#cb4b16
]])
