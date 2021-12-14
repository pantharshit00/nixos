local u = require('utils')
vim.g.mapleader = ' '

u.nmap('<C-b>', ':CHADopen<CR>')

-- quick fix lists
u.nmap('<leader>qf', ':copen<CR>')
u.nmap('<leader>qj', ':cnext<CR>')
u.nmap('<leader>qk', ':cprevious<CR>')

u.nmap('<leader>p', ':lua vim.lsp.buf.formatting()<CR>')

-- Better Window Movement

u.nmap('<C-h>', ':wincmd h<CR>')
u.nmap('<C-j>', ':wincmd j<CR>')
u.nmap('<C-k>', ':wincmd k<CR>')
u.nmap('<C-l>', ':wincmd l<CR>')

-- Better Indenting
u.vmap('<', '<gv')
u.vmap('>', '>gv')

u.imap('jk', '<Esc>', {noremap = false, silent = false})

u.nmap('<leader>xx', ':TroubleToggle<CR>')
