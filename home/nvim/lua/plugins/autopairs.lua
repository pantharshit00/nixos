require('nvim-autopairs').setup()
local npairs = require('nvim-autopairs')

local function imap(lhs, rhs, opts)
    local options = {noremap = false}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap('i', lhs, rhs, options)
end

_G.MUtils = {}

-- TEST
vim.g.completion_confirm_key = ""

MUtils.tab = function()
    if vim.fn.pumvisible() ~= 0 then
        return npairs.esc("<C-n>")
    else
        if vim.fn["vsnip#available"](1) ~= 0 then
            vim.fn.feedkeys(string.format('%c%c%c(vsnip-expand-or-jump)', 0x80, 253, 83))
            return npairs.esc("")
        else
            return npairs.esc("<Tab>")
        end
    end
end

MUtils.s_tab = function()
    if vim.fn.pumvisible() ~= 0 then
        return npairs.esc("<C-p>")
    else
        if vim.fn["vsnip#jumpable"](-1) ~= 0 then
            vim.fn.feedkeys(string.format('%c%c%c(vsnip-jump-prev)', 0x80, 253, 83))
            return npairs.esc("")
        else
            return npairs.esc("<C-h>")
        end
    end
end

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end

imap('<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})


imap("<Tab>", "v:lua.MUtils.tab()", {expr = true, noremap = true})
imap("<S-Tab>", "v:lua.MUtils.s_tab()", {expr = true, noremap = true})

