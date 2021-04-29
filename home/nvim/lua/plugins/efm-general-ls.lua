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
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

local prettier_global = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

local eslint = {
    lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}

local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}

require"lspconfig".efm.setup {
    -- init_options = {initializationOptions},
    init_options = {documentFormatting = true, codeaction = false},
    filetypes = {"lua", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "markdown"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            -- lua = {luaFormat},
            python = {isort, yapf},
            javascript = {eslint},
            typescript = {eslint},
            javascriptreact = {eslint},
            typescriptreact = {eslint},
            sh = {shellcheck, shfmt},
            lua = {luaFormat},
            html = {prettier_global},
            css = {prettier_global},
            json = {prettier_global},
            yaml = {prettier_global},
        }
    }
}

-- Automatically Run Prettier on Save
-- vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.formatting()")
