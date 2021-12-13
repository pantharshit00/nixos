local api = vim.api

local get_map_options = function(custom_options)
    local options = {noremap = true, silent = true}
    if custom_options then
        options = vim.tbl_extend("force", options, custom_options)
    end
    return options
end

local M = {}

M.map = function(mode, target, source, opts)
    api.nvim_set_keymap(mode, target, source, get_map_options(opts))
end

for _, mode in ipairs({"n", "o", "i", "x", "t", "v"}) do
    M[mode .. "map"] = function(...) M.map(mode, ...) end
end

M.buf_map = function(bufnr, mode, target, source, opts)
    api.nvim_buf_set_keymap(bufnr or 0, mode, target, source,
                            get_map_options(opts))
end

M.command =
    function(name, fn) vim.cmd(string.format("command! %s %s", name, fn)) end

M.lua_command = function(name, fn) M.command(name, "lua " .. fn) end

M.t =
    function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

M.input = function(keys, mode)
    vim.api.nvim_feedkeys(M.t(keys), mode or "i", true)
end

M.warn = function(msg) api.nvim_echo({{msg, "WarningMsg"}}, true, {}) end

return M
