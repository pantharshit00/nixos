local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {
    b.formatting.prettierd,
    -- b.diagnostics.eslint_d,
    b.formatting.fish_indent, b.formatting.shfmt, b.diagnostics.write_good,
    b.diagnostics.markdownlint, b.diagnostics.teal,
    b.diagnostics.shellcheck.with({diagnostics_format = "#{m} [#{c}]"}),
    b.code_actions.gitsigns, b.code_actions.gitrebase, b.hover.dictionary,
    b.diagnostics.tsc
}

local M = {}
M.setup = function(on_attach) null_ls.setup({sources = sources}) end

return M
