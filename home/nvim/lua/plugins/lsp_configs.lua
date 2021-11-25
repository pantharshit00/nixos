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
--
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client)

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        -- Set up cursor hold highlight if language server supports it
        vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#393e48
      hi LspReferenceText cterm=bold ctermbg=red guibg=#393e48
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#393e48
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
    end
    require"lsp_signature".on_attach()
end

require'lspconfig'.tsserver.setup {
    on_attach = function(client)
        on_attach(client)
        client.config.flags.allow_incremental_sync = true
        client.resolved_capabilities.document_formatting = false
    end,
    capabilities = capabilities,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                                                           {virtual_text = false, underline = true})
    }
}

local function isWindows()
    return package.config:sub(1, 1) == '\\'
end

local lua_bin = isWindows() and 'lua-language-server-bin.cmd' or 'lua-language-server-bin'

-- lua
require'lspconfig'.sumneko_lua.setup {cmd = {lua_bin}, on_attach = on_attach, capabilities = capabilities }

-- npm install -g vscode-html-languageserver-bin
require'lspconfig'.html.setup {on_attach = on_attach, capabilities = capabilities}

-- npm install -g vscode-json-languageserver
local jsonServerCmd = isWindows() and 'vscode-json-languageserver.cmd' or 'vscode-json-languageserver'
require'lspconfig'.jsonls.setup {cmd = {jsonServerCmd, "--stdio"}, on_attach = on_attach, capabilities = capabilities}

-- npm install -g graphql-language-service-cli
require'lspconfig'.graphql.setup {on_attach = on_attach, capabilities = capabilities}


require'lspconfig'.prismals.setup {on_attach = on_attach, capabilities = capabilities}


-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup {on_attach = on_attach, capabilities = capabilities}
local bash_bin_name = isWindows() and "bash-language-server.cmd" or "bash-language-server";
-- npm i -g bash-language-server
require'lspconfig'.bashls.setup {cmd = {bash_bin_name, "start"}, on_attach = on_attach, capabilities = capabilities }

require('rust-tools').setup {
  server = {
    capabilities = capabilities
  }
}

-- autoformat
vim.cmd [[autocmd BufWritePre *.ts,*.css,*.html,*.ts,*.tsx,*.js,*.jsx,*.json,*.rs,*.html,*.graphql,*.prisma,*.c,*.md lua vim.lsp.buf.formatting_sync(nil, 500)]]

