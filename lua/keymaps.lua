
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

-- 多窗口的打开与关闭
map("n", "s",           "",             "")    -- 取消 s 默认功能
map("n", "sv",          ":vsp<CR>",     "")
map("n", "sh",          ":sp<CR>",      "")
map("n", "sc",          "<C-w>c",       "")
map("n", "so",          "<C-w>o",       "")

-- alt + hjkl  窗口之间跳转
map("n", "<A-h>",       "<C-w>h",       "")
map("n", "<A-j>",       "<C-w>j",       "")
map("n", "<A-k>",       "<C-w>k",       "")
map("n", "<A-l>",       "<C-w>l",       "")

-- 左右比例控制
map("n", "s,",          ":vertical resize -10<CR>", "")
map("n", "s.",          ":vertical resize +10<CR>", "")
map("n", "<C-Left>",    ":vertical resize -2<CR>",  "")
map("n", "<C-Right>",   ":vertical resize +2<CR>",  "")
-- 上下比例
map("n", "sj",          ":resize +10<CR>",          "")
map("n", "sk",          ":resize -10<CR>",          "")
map("n", "<C-Down>",    ":resize +2<CR>",           "")
map("n", "<C-Up>",      ":resize -2<CR>",           "")
-- 相等比例
map("n", "s=", "<C-w>=", opts)

vim.cmd([[
    nnoremap ; :
    :command W w
    :command WQ wq
    :command Wq wq
    :command Q q
    :command Qa qa
    :command QA qa
]])


