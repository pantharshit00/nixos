local u = require("utils")
local coq = require("coq")

local lsp = vim.lsp
local api = vim.api

local border_opts = {border = "single", focusable = false, scope = "line"}

vim.diagnostic.config({virtual_text = false, float = border_opts})

lsp.handlers["textDocument/signatureHelp"] =
    lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border_opts)

-- use lsp formatting if it's available (and if it's good)
-- otherwise, fall back to null-ls
local preferred_formatting_clients = {"denols", "eslint", "rust_analyzer","prismals" }
local fallback_formatting_client = "null-ls"

local formatting = function()
    local bufnr = api.nvim_get_current_buf()

    local selected_client
    for _, client in ipairs(lsp.get_active_clients()) do
        if vim.tbl_contains(preferred_formatting_clients, client.name) then
            selected_client = client
            break
        end

        if client.name == fallback_formatting_client then
            selected_client = client
        end
    end

    if not selected_client then return end

    local params = lsp.util.make_formatting_params()
     selected_client.request("textDocument/formatting", params, function(err, res)
          if err then
              local err_msg = type(err) == "string" and err or err.message
              vim.notify("global.lsp.formatting: " .. err_msg, vim.log.levels.WARN)
              return
          end

          if not api.nvim_buf_is_loaded(bufnr) or api.nvim_buf_get_option(bufnr, "modified") then
              return
          end

          if res then
              lsp.util.apply_text_edits(res, bufnr, selected_client.offset_encoding or "utf-16")
              api.nvim_buf_call(bufnr, function()
                  vim.cmd("silent noautocmd update")
              end)
          end
      end, bufnr)
end

global.lsp = {border_opts = border_opts, formatting = formatting}

local on_attach = function(client, bufnr)
    -- commands
    u.lua_command("LspFormatting", "vim.lsp.buf.formatting()")
    u.lua_command("LspHover", "vim.lsp.buf.hover()")
    u.lua_command("LspRename", "vim.lsp.buf.rename()")
    u.lua_command("LspDiagPrev", "vim.diagnostic.goto_prev()")
    u.lua_command("LspDiagNext", "vim.diagnostic.goto_next()")
    u.lua_command("LspDiagLine",
                  "vim.diagnostic.open_float(nil, global.lsp.border_opts)")
    u.lua_command("LspDiagQuickfix", "vim.diagnostic.setqflist()")
    u.lua_command("LspSignatureHelp", "vim.lsp.buf.signature_help()")
    u.lua_command("LspTypeDef", "vim.lsp.buf.type_definition()")

    -- bindings
    u.buf_map(bufnr, "n", "<Leader>rn", ":LspRename<CR>")
    u.buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    u.buf_map(bufnr, "n", "K", ":LspHover<CR>")
    u.buf_map(bufnr, "n", "[g", ":LspDiagPrev<CR>")
    u.buf_map(bufnr, "n", "]g", ":LspDiagNext<CR>")
    u.buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    u.buf_map(bufnr, "n", "<Leader>q", ":LspDiagQuickfix<CR>")
    u.buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

    -- telescope
    u.buf_map(bufnr, "n", "gr", ":LspRef<CR>")
    u.buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    u.buf_map(bufnr, "n", "ga", ":LspAct<CR>")
    u.buf_map(bufnr, "v", "ga", "<Esc><cmd> LspRangeAct<CR>")

    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua global.lsp.formatting()")
    end

    if client.resolved_capabilities.signature_help then
        vim.cmd("autocmd CursorHoldI <buffer> lua vim.lsp.buf.signature_help()")
    end

    require("illuminate").on_attach(client)
end

for _, server in ipairs({"null-ls", "tsserver", "rustls", "prismals"}) do
    require("plugins.lsp." .. server).setup(on_attach)
end

-- suppress lspconfig messages
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("%[lspconfig%]") then return end

    notify(msg, ...)
end

