local u = require("utils")

local M = {}
M.setup = function(on_attach, capabilities)
    local rtools = require("rust-tools")

    -- add rust specific shortcuts here later

    rtools.setup {
        server = require"coq".lsp_ensure_capabilities({
            capabilities = capabilities,
            on_attach = on_attach
        })
    }
end

return M
