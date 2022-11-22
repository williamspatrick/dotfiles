return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-commentary'

    use 'kyazdani42/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup {
                options = {
                    theme = "solarized_dark",
                }
            }
        end
    }
end)
