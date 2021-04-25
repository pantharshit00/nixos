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
vim.g.user_emmet_mode='inv'
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
vim.g.floaterm_keymap_next   = '<F2>'
vim.g.floaterm_keymap_prev   = '<F3>'
vim.g.floaterm_keymap_new    = '<F4>'
vim.g.floaterm_title=''

vim.g.floaterm_gitcommit='floaterm'
vim.g.floaterm_autoinsert=1
vim.g.floaterm_width=0.8
vim.g.floaterm_height=0.8
vim.g.floaterm_wintitle=0
vim.g.floaterm_autoclose=1

-- Indent line
vim.g.indent_blankline_buftype_exclude = {'terminal'}
vim.g.indent_blankline_filetype_exclude = {'help', 'startify', 'dashboard', 'packer', 'neogitstatus'}
vim.g.indent_blankline_char = '▏'
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
    'class', 'return', 'function', 'method', '^if', '^while', 'jsx_element', '^for', '^object', '^table', 'block',
    'arguments', 'if_statement', 'else_clause', 'jsx_element', 'jsx_self_closing_element', 'try_statement',
    'catch_clause', 'import_statement', 'operation_type'
}

-- Kommentary
vim.api.nvim_set_keymap("n", "<C-_>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<C-_>", "<Plug>kommentary_visual_default", {})

-- lightbulb
-- Showing defaults
require'nvim-lightbulb'.update_lightbulb {
  sign = {
      enabled = true,
      -- Priority of the gutter sign
      priority = 10,
      text = "💡",
  },
  float = {
      enabled = false,
      -- Text to show in the popup float
      text = "💡",
      -- Available keys for window options:
      -- - height     of floating window
      -- - width      of floating window
      -- - wrap_at    character to wrap at for computing height
      -- - max_width  maximal width of floating window
      -- - max_height maximal height of floating window
      -- - pad_left   number of columns to pad contents at left
      -- - pad_right  number of columns to pad contents at right
      -- - pad_top    number of lines to pad contents at top
      -- - pad_bottom number of lines to pad contents at bottom
      -- - offset_x   x-axis offset of the floating window
      -- - offset_y   y-axis offset of the floating window
      -- - anchor     corner of float to place at the cursor (NW, NE, SW, SE)
      -- - winblend   transparency of the window (0-100)
      win_opts = {},
  },
  virtual_text = {
      enabled = false,
      -- Text to show at virtual text
      text = "💡",
  }
}


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
  },
})

-- LSP saga
local saga = require 'lspsaga'

saga.init_lsp_saga {code_action_icon = ''}

-- Toggle term
require"toggleterm".setup{
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
  highlight = {
      enable = true, -- false will disable the whole extension
  },
  indent = {
    enable = true
  },
  playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false -- Whether the query persists across vim sessions
  },
  autotag = {enable = true},
  incremental_selection = {
      enable = true,
      keymaps = {init_selection = "vi", node_incremental = "n", scope_incremental = "s", node_decremental = "nd"}
  },
  rainbow = {enable = true}
  -- refactor = {highlight_definitions = {enable = true}}
}

-- rooter
vim.g.rooter_silent_chdir = 1
