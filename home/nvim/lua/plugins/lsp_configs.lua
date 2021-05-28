-- Typescript
-- npm install -g typescript typescript-language-server
-- require'snippets'.use_suggested_mappings()
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true;
-- local on_attach_common = function(client)
-- print("LSP Initialized")
-- require'completion'.on_attach(client)
-- require'illuminate'.on_attach(client)
-- end
require'lspconfig'.tsserver.setup {
    on_attach = function(client)
        if client.config.flags then client.config.flags.allow_incremental_sync = true end
        client.resolved_capabilities.document_formatting = false
    end
}

local function isWindows()
    return package.config:sub(1, 1) == '\\'
end

local lua_bin = isWindows() and 'lua-language-server-bin.cmd' or 'lua-language-server-bin'

-- lua
require'lspconfig'.sumneko_lua.setup {cmd = {lua_bin}}

-- npm install -g vscode-html-languageserver-bin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {on_attach = require'lsp'.common_on_attach, capabilities = capabilities}

-- npm install -g vscode-json-languageserver
local jsonServerCmd = isWindows() and 'vscode-json-languageserver.cmd' or 'vscode-json-languageserver'
require'lspconfig'.jsonls.setup {cmd = {jsonServerCmd, "--stdio"}, on_attach = require'lsp'.common_on_attach}

-- npm install -g graphql-language-service-cli
require'lspconfig'.graphql.setup {on_attach = require'lsp'.common_on_attach}

-- emmet
local nvim_lsp = require 'lspconfig'
local configs = require 'lspconfig/configs'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local emmet_ls_cmd = isWindows() and "emmet-ls.cmd" or "emmet-ls"
configs.emmet_ls = {
    default_config = {
        cmd = {emmet_ls_cmd, '--stdio'},
        filetypes = {
            'html', 'css', "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
            "typescript.tsx"
        },
        root_dir = require'lspconfig'.util.root_pattern('package.json'),
        settings = {}
    }
}

require'lspconfig'.prismals.setup {on_attach = require'lsp'.common_on_attach}

nvim_lsp.emmet_ls.setup {on_attach = require'lsp'.common_on_attach}

-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup {on_attach = require'lsp'.common_on_attach}
local bash_bin_name = isWindows() and "bash-language-server.cmd" or "bash-language-server";
-- npm i -g bash-language-server
require'lspconfig'.bashls.setup {cmd = {bash_bin_name, "start"}, on_attach = require'lsp'.common_on_attach}

require('rust-tools').setup {}

-- autoformat
vim.cmd [[autocmd BufWritePre *.ts,*.css,*.html,*.ts,*.tsx,*.js,*.jsx,*.json,*.rs,*.html,*.graphql,*.prisma,*.c,*.md lua vim.lsp.buf.formatting_sync(nil, 500)]]

