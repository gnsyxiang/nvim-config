

local function map(mode, lhs, rhs, desc)
    local options = {noremap = true, silent = true}

    if desc then
        options = vim.tbl_extend("force", options, {desc = 'keymaps: ' .. desc})
    end

    vim.keymap.set(mode, lhs, rhs, options)
end

map("i", "jk",          "<ESC>",        "")

map("n", "qq",          ":q!<CR>",      "")
map("n", "<leader>q",   ":qa!<CR>",     "")


-- alt + hjkl  窗口之间跳转
map("n", "<A-h>",       "<C-w>h",       "")
map("n", "<A-j>",       "<C-w>j",       "")
map("n", "<A-k>",       "<C-w>k",       "")
map("n", "<A-l>",       "<C-w>l",       "")

vim.cmd([[
    nnoremap ; :
    :command W w
    :command WQ wq
    :command Wq wq
    :command Q q
    :command Qa qa
    :command QA qa
]])

