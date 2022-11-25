return require("packer").startup(function(use)
    use("lewis6991/impatient.nvim")

    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")

    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update =
            require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
            })
        end,
    })

    use("nvim-tree/nvim-web-devicons")
    use("nvim-lualine/lualine.nvim")
    use("akinsho/bufferline.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("rcarriga/nvim-notify")
    use("stevearc/dressing.nvim")
    use("folke/trouble.nvim")

    use("neovim/nvim-lspconfig")
    use("onsails/lspkind.nvim")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("jose-elias-alvarez/null-ls.nvim")

    use("hrsh7th/nvim-cmp")
    use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-omni", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
    use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })

    use("L3MON4D3/LuaSnip")
    use({ "honza/vim-snippets", after = "LuaSnip" })
    use({ "rafamadriz/friendly-snippets", after = "LuaSnip" })

    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("AckslD/nvim-neoclip.lua")
    use("benfowler/telescope-luasnip.nvim")
    use("axieax/urlview.nvim")

    use("klen/nvim-test")
    use("numToStr/FTerm.nvim")
    use("ojroques/nvim-bufdel")
    use("tpope/vim-commentary")
    use("tpope/vim-dispatch")
end)
