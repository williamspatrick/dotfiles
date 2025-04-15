require("lazy").setup({
    spec = {
        { "nvim-lua/plenary.nvim" },
        {
            "nvim-treesitter/nvim-treesitter",
            build = function()
                require("nvim-treesitter.install").update({ with_sync = true })()
            end,
        },

        { "nvim-tree/nvim-web-devicons" },
        { "nvim-lualine/lualine.nvim" },
        { "akinsho/bufferline.nvim" },
        { "lukas-reineke/indent-blankline.nvim" },
        { "rcarriga/nvim-notify" },
        { "stevearc/dressing.nvim" },  ---# Should switch to snacks.nvim
        { "folke/trouble.nvim" },
        { "nvim-tree/nvim-tree.lua" },

        { "neovim/nvim-lspconfig" },
        { "onsails/lspkind.nvim" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        {
            "nvimtools/none-ls.nvim",
            dependencies = {
                { "mason.nvim" },
                { "gbprod/none-ls-shellcheck.nvim" },
            },
        },

        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/cmp-omni" },
        { "hrsh7th/cmp-nvim-lua" },
        { "saadparwaiz1/cmp_luasnip" },

        { "L3MON4D3/LuaSnip" },
        { "honza/vim-snippets" },
        { "rafamadriz/friendly-snippets" },

        {
            "nvim-telescope/telescope.nvim",
            dependencies = { { "nvim-lua/plenary.nvim" } },
        },
        { "AckslD/nvim-neoclip.lua" },
        { "benfowler/telescope-luasnip.nvim" },
        { "axieax/urlview.nvim" },
        { "ziontee113/icon-picker.nvim" },

        { "klen/nvim-test" },
        { "numToStr/FTerm.nvim" },
        { "ojroques/nvim-bufdel" },
        { "tpope/vim-commentary" },
        { "tpope/vim-dispatch" },
        { "huggingface/llm.nvim" },
    },
    checker = { enabled = true },
})
