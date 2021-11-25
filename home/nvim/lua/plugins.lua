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
    use 'kyazdani42/nvim-tree.lua'
      
    use {
        "nathom/filetype.nvim",
        config = function()
            require("filetype").setup({})
        end,
    }
    use {'hoob3rt/lualine.nvim'}

    use 'kyazdani42/nvim-web-devicons' -- Devicons for Plugins

    -- Web Dev
    use 'jparise/vim-graphql'
    use 'windwp/nvim-ts-autotag'

    -- LSP
    use 'neovim/nvim-lspconfig' -- Language Server Protocol Config
    -- TODO: replace after https://github.com/glepnir/lspsaga.nvim/issues/241 is fixed 
    -- use 'glepnir/lspsaga.nvim'
    use 'rinx/lspsaga.nvim'

    use 'onsails/lspkind-nvim' -- Better icons for autcomplete
    -- use 'kosayoda/nvim-lightbulb'
    -- use 'anott03/nvim-lspinstall'
    use 'folke/tokyonight.nvim'
    use 'marko-cerovac/material.nvim'

    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        "ray-x/lsp_signature.nvim"
    }

    -- Autcomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
      
    -- use 'cohama/lexima.vim'

    -- Telescope
    use 'nvim-telescope/telescope.nvim' -- Telescope: Searching  
    use 'nvim-lua/popup.nvim' -- Neovim Popup API
    use 'nvim-lua/plenary.nvim' -- Functions you don't wanna write again
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/playground'

    use 'hrsh7th/vim-vsnip' -- Snipper Integration for Neovim
    use 'hrsh7th/vim-vsnip-integ'
    use 'tpope/vim-surround'

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
 
    use { 'jdhao/better-escape.vim', event = 'InsertEnter' }

    -- find and replace example
    use 'kevinhwang91/nvim-bqf'
    use 'airblade/vim-rooter'
    use 'b3nj5m1n/kommentary'
    use {'simrat39/symbols-outline.nvim', cmd = {'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose'}}
    use 'andymass/vim-matchup' -- Better %
    use 'wakatime/vim-wakatime'

    use 'mbbill/undotree' -- Undotree to undo stuff well
    use 'moll/vim-bbye' -- Better Tab Closing; Incompat. with Barbar
    use 'windwp/nvim-autopairs'
    use 'rmagatti/auto-session'

    -- Tool Specific
    use 'pantharshit00/vim-prisma'
    use 'simrat39/rust-tools.nvim'

end)
