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
  settings = {documentFormatting = false}
}

-- lua
require'lspconfig'.sumneko_lua.setup{ }

-- npm install -g vscode-html-languageserver-bin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {on_attach = require'lsp'.common_on_attach, capabilities = capabilities}


-- npm install -g vscode-json-languageserver
require'lspconfig'.jsonls.setup {
  on_attach = require'lsp'.common_on_attach,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}

-- npm install -g graphql-language-service-cli
require'lspconfig'.graphql.setup {on_attach = require'lsp'.common_on_attach}

--emmet
local nvim_lsp = require'lspconfig'
local configs = require'lspconfig/configs'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

configs.emmet_ls = {
  default_config = {
    cmd = {'emmet-ls', '--stdio'};
    filetypes = {'html', 'css', "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"};
    root_dir = function()
      return vim.loop.cwd()
    end;
    settings = {};
  };
}

nvim_lsp.emmet_ls.setup{
  on_attach = on_attach;
}





-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup {
 on_attach = require'lsp'.common_on_attach
}


-- npm i -g bash-language-server
require'lspconfig'.bashls.setup {
  cmd = {"bash-language-server", "start"},
  on_attach = require'lsp'.common_on_attach
}

require('rust-tools').setup{ }


