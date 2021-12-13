require('nvim-ts-autotag').setup()

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    autotag = {enable = true},
    highlight = {
        enable = true -- false will disable the whole extension
    },
    context_commentstring = {enable = true, enable_autocmd = false},
    indent = {enable = true},
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "vi",
            node_incremental = "n",
            scope_incremental = "s",
            node_decremental = "nd"
        }
    }
}

require('kommentary.config').configure_language('typescriptreact', {
    single_line_comment_string = 'auto',
    multi_line_comment_strings = 'auto',
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end
})

require"lsp_signature".setup()

require("project_nvim").setup()
