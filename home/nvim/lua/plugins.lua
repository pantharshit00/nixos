local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    -- Appearence
    use 'challenger-deep-theme/vim' -- Challenger deep theme
    use 'haishanh/night-owl.vim' -- night-owl Theme
    -- TODO: Change from this fork to main repo when fixes are merged
    use 'sindrets/nvim-tree.lua' -- Explorer
    use {'glepnir/galaxyline.nvim', branch = 'main'}

    use 'kyazdani42/nvim-web-devicons' -- Devicons for Plugins
    use 'romgrk/barbar.nvim' -- make the top tab bar pretty

    -- Web Dev
    use 'alvan/vim-closetag'
    use 'jparise/vim-graphql'

    -- LSP
    use 'neovim/nvim-lspconfig' -- Language Server Protocol Config
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim' -- Better icons for autcomplete
    use 'kosayoda/nvim-lightbulb'
    use 'anott03/nvim-lspinstall'
    use {
        "folke/lsp-trouble.nvim",
        config = function()
            require("trouble").setup {}
        end
    }

    -- Autcomplete
    use 'hrsh7th/nvim-compe' -- Autocompletion
    use 'mattn/emmet-vim'
    use 'dsznajder/vscode-es7-javascript-react-snippets'
    use 'rust-lang/vscode-rust'
    -- use 'cohama/lexima.vim'

    -- Telescope
    use 'nvim-telescope/telescope.nvim' -- Telescope: Searching  
    use 'akinsho/nvim-toggleterm.lua' -- Terminal for Neovim
    use 'nvim-lua/popup.nvim' -- Neovim Popup API
    use 'nvim-lua/plenary.nvim' -- Functions you don't wanna write again
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/playground'
    use 'p00f/nvim-ts-rainbow'

    -- Snippets
    use 'hrsh7th/vim-vsnip' -- Snipper Integration for Neovim
    use 'hrsh7th/vim-vsnip-integ'

    -- General
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    }

    -- find and replace example
    use 'kevinhwang91/nvim-bqf'
    use 'airblade/vim-rooter'
    use 'voldikss/vim-floaterm'
    use 'liuchengxu/vista.vim'
    use 'b3nj5m1n/kommentary'
    use 'bfredl/nvim-miniyank'
    use 'andymass/vim-matchup' -- Better %
    use 'wakatime/vim-wakatime'

    use 'TimUntersberger/neogit' -- Git integration for Neovim
    use 'mbbill/undotree' -- Undotree to undo stuff well
    use 'moll/vim-bbye' -- Better Tab Closing; Incompat. with Barbar
    use 'windwp/nvim-autopairs'

    -- Tool Specific
    use 'pantharshit00/vim-prisma'
    use 'simrat39/rust-tools.nvim'

end)
