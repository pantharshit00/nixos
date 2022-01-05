
local u = require("utils")


local M = {}
M.setup = function(on_attach, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig["prismals"].setup(require"coq".lsp_ensure_capabilities({
        on_attach = on_attach,
        capabilities = capabilities
    }))
end

return M
