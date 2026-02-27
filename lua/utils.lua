
local M = {}

function M.keymap(mode, lhs, rhs, opts)
    local _opts ={noremap = true, silent = true, nowait = true}

    if opts then
        _opts = vim.tbl_extend("force", _opts, opts)
    end

    vim.keymap.set(mode, lhs, rhs, _opts)
end


return M

