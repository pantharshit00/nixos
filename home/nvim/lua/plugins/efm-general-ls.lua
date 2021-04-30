-- Example configuations here: https://github.com/mattn/efm-langserver
-- python
local flake8 = {
    LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}
local isort = {formatCommand = "isort --quiet -", formatStdin = true}
local yapf = {formatCommand = "yapf --quiet", formatStdin = true}
-- lua
local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}
-- JavaScript/React/TypeScript
local prettier = {formatCommand = "prettierd ${INPUT}", formatStdin = true}

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    rootMarkers = {
        '.eslintrc','.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.yml', '.eslintrc.json', '.git', 'package.json'
    }
}

local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}

local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}

require"lspconfig".efm.setup {
    -- init_options = {initializationOptions},
    init_options = {documentFormatting = true},
    filetypes = {
        "lua", "typescript", "typescriptreact", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml",
        "markdown"
    },
    settings = {
        rootMarkers = {".git/"},
        languages = {
            -- lua = {luaFormat},
            python = {isort, yapf},
            javascript = {prettier, eslint},
            typescript = {prettier, eslint},
            javascriptreact = {prettier, eslint},
            typescriptreact = {prettier, eslint},
            sh = {shellcheck, shfmt},
            lua = {luaFormat},
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier}
        }
    }
}

-- Automatically Run Prettier on Save
-- vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.formatting()")
