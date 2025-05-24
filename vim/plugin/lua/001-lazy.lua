require("lazy").setup({
    import = "williamspatrick-plugins",
    spec = {
        { "folke/snacks.nvim",    priority = 1000 },
        { "folke/which-key.nvim" },

        { "nvim-lua/plenary.nvim" },
        {
            "nvim-treesitter/nvim-treesitter",
            lazy = false,
            branch = "main",
            build = ":TSUpdate",
        },

        { "nvim-tree/nvim-web-devicons" },
        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },
        { "akinsho/bufferline.nvim" },
        { "rcarriga/nvim-notify" },
        { "folke/trouble.nvim" },
        { "nvim-tree/nvim-tree.lua" },

        { "neovim/nvim-lspconfig" },
        { "onsails/lspkind.nvim" },
        { "williamboman/mason.nvim",           version = "1.11.0" },
        { "williamboman/mason-lspconfig.nvim", version = "1.32.0" },
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
        { "tpope/vim-dispatch" },
        { "milanglacier/minuet-ai.nvim" },
    },
    checker = { enabled = true },
})
