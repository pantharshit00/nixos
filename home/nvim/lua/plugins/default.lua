-- Autoclose Tags --
vim.api.nvim_set_var('closetag_filenames', '*.html,*.xhtml,*.phtml, *.jsx, *.js, *.tsx')
vim.api.nvim_set_var('closetag_xhtml_filenames', '*.xhtml,*.jsx, *.tsx, *.js')
vim.api.nvim_set_var('closetag_filetypes', 'html,xhtml,phtml')
vim.api.nvim_set_var('closetag_xhtml_filetypes', 'xhtml,jsx')
vim.api.nvim_set_var('closetag_emptyTags_caseSensitive', 1)
vim.api.nvim_set_var('closetag_shortcut', '>')

-- Emmet
-- After you have what you want press C-Y and , at the same time
-- autocmd FileType html,css EmmetInstall
-- vim.g.user_emmet_leader_key='<leader>'
vim.g.user_emmet_mode = 'inv'
vim.g.user_emmet_expandabbr_key = '<C-y>,'
vim.g.user_emmet_expandword_key = '<C-y>;'
vim.g.user_emmet_update_tag = '<C-y>u'
vim.g.user_emmet_balancetaginward_key = '<C-y>d'
vim.g.user_emmet_balancetagoutward_key = '<C-y>D'
vim.g.user_emmet_next_key = '<C-y>n'
vim.g.user_emmet_prev_key = '<C-y>N'
vim.g.user_emmet_imagesize_key = '<C-y>i'
vim.g.user_emmet_togglecomment_key = '<C-y>/'
vim.g.user_emmet_splitjointag_key = '<C-y>j'
vim.g.user_emmet_removetag_key = '<C-y>k'
vim.g.user_emmet_anchorizeurl_key = '<C-y>a'
vim.g.user_emmet_anchorizesummary_key = '<C-y>A'
vim.g.user_emmet_mergelines_key = '<C-y>m'
vim.g.user_emmet_codepretty_key = '<C-y>c'

-- Floaterm
vim.g.floaterm_keymap_toggle = '<F1>'
vim.g.floaterm_keymap_next = '<F2>'
vim.g.floaterm_keymap_prev = '<F3>'
vim.g.floaterm_keymap_new = '<F4>'
vim.g.floaterm_title = ''

vim.g.floaterm_gitcommit = 'floaterm'
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.g.floaterm_wintitle = 0
vim.g.floaterm_autoclose = 1

-- Kommentary
vim.api.nvim_set_keymap("n", "<C-_>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<C-_>", "<Plug>kommentary_visual_default", {})

-- lightbulb
-- Showing defaults

-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

-- LSP Kind
-- symbols for autocomplete
require('lspkind').init({
    with_text = false,
    symbol_map = {
        Text = '  ',
        Method = '  ',
        Function = '  ',
        Constructor = '  ',
        Variable = '[]',
        Class = '  ',
        Interface = ' 蘒',
        Module = '  ',
        Property = '  ',
        Unit = ' 塞 ',
        Value = '  ',
        Enum = ' 練',
        Keyword = '  ',
        Snippet = '  ',
        Color = '',
        File = '',
        Folder = ' ﱮ ',
        EnumMember = '  ',
        Constant = '  ',
        Struct = '  '
    }
})

-- LSP saga
local saga = require 'lspsaga'

saga.init_lsp_saga {code_action_icon = ''}

-- Toggle term
require"toggleterm".setup {
    size = 20,
    open_mapping = [[<c-\>]],
    shade_terminals = true,
    shading_factor = '1',
    start_in_insert = true,
    persist_size = true,
    direction = 'vertical'
}

-- Treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {"haskell"},
    highlight = {
        enable = true -- false will disable the whole extension
    },
    indent = {enable = true},
    incremental_selection = {
        enable = true,
        keymaps = {init_selection = "vi", node_incremental = "n", scope_incremental = "s", node_decremental = "nd"}
    }
}

-- rooter
vim.g.rooter_silent_chdir = 1
