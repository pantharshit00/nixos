vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

    use 'wbthomason/packer.nvim' -- Packer can manage itself
    -- tree plugin
    use {'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps'}
    use 'kyazdani42/nvim-web-devicons' -- Devicons for Plugins
    use 'windwp/nvim-ts-autotag' -- auto tag close

    use 'neovim/nvim-lspconfig' -- lsp configs for most langs
    -- lsp navigation
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use 'nvim-lualine/lualine.nvim'

    use 'nathom/filetype.nvim' -- faster file loading
    use 'folke/tokyonight.nvim' -- best theme for nvim
    use 'folke/trouble.nvim' -- better diagnostic menu
    use 'ray-x/lsp_signature.nvim' -- lsp signatures as you type

    -- Completion Engine
    use {'ms-jpq/coq_nvim', branch = 'coq'}
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
    use {'ms-jpq/coq.thirdparty', branch = '3p'}

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/playground'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {
                "nvim-telescope/telescope-fzf-native.nvim", -- better algorithm
                run = "make"
            }
        }
    } -- Telescope: Searching  
    use 'nvim-lua/plenary.nvim' -- Functions you don't wanna write again

    use 'tpope/vim-surround' -- ysiw
    use 'kevinhwang91/nvim-bqf' -- better quickfix window

    -- Git 
    use 'lewis6991/gitsigns.nvim'

    -- Project management
    use "ahmedkhalf/project.nvim"

    use 'b3nj5m1n/kommentary' -- better c-/
    use 'andymass/vim-matchup' -- Better %
    use 'wakatime/vim-wakatime' -- wakatime duh
    use 'windwp/nvim-autopairs' -- automatic pair closing
    use 'RRethy/vim-illuminate'

    use {
        'rmagatti/auto-session',
        config = function()
            require('auto-session').setup {
                log_level = 'info',
                auto_session_suppress_dirs = {'~/', '~/Projects'}
            }
        end
    }

    -- Tool Specific
    use 'pantharshit00/vim-prisma'
    use 'simrat39/rust-tools.nvim'
end)
