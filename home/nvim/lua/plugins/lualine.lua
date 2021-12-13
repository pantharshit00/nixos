require('lualine').setup {
    options = {theme = 'tokyonight'},
    sections = {
        lualine_b = {'branch', 'diff'},
        lualine_c = {
            'filename', {
                'diagnostics',
                -- table of diagnostic sources, available sources:
                -- nvim_lsp, coc, ale, vim_lsp
                sources = {'nvim_diagnostic'},
                -- displays diagnostics from defined severity
                sections = {'error', 'warn', 'info'}
            }
        }
    }
}
