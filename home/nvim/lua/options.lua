global = {}

vim.wo.number = true -- set numbered lines
vim.cmd('set relativenumber') -- Relative Line Numbers
vim.wo.number = true -- set numbered lines
vim.cmd('set relativenumber') -- Relative Line Numbers
vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set noerrorbells') -- No Error Bells
vim.cmd('set smartcase') -- Smartcase: in one uppercase char then search is case sensitive 
vim.cmd('set undofile') -- Persistent Undo
vim.cmd('set incsearch') -- Incremental Search: Search as you type
vim.cmd('set nohlsearch') -- No Highlight Search 
vim.o.hidden = true -- Required to keep multiple buffers open 
vim.wo.wrap = true -- Display long lines as multiple 
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 2 -- More space for displaying messages
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.go.t_Co = "256" -- Support 256 colors
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.cmd('set tabstop=2') -- Insert 2 spaces for a tab
vim.cmd('set shiftwidth=2') -- Change the number of space characters inserted for indentation
vim.cmd('set expandtab') -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.cmd("filetype plugin on") -- Auto Indentation Levels 
vim.cmd("filetype indent on") -- Auto Indentation Levels
vim.cmd("set fileformat=unix")
vim.g.coq_settings = {
    ["auto_start"] = 'shut-up',
    ["display.pum.fast_close"] = false,
    ["keymap.jump_to_mark"] = '<C-n>',
    ["keymap.recommended"] = false,
    ["keymap.pre_select"] = true,
}
