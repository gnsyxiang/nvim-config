
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

-- qflist（Quickfix List）
-- :copen       打开 qflist 窗口（默认在底部，可调整大小）
-- :cclose      关闭 qflist 窗口
-- :cn/:cnext   跳转到 qflist 中的下一个条目
-- :cp/:cprev   跳转到 qflist 中的上一个条目
-- :cc [数字]   跳转到 qflist 中指定序号的条目
-- :cexpr []    清空所有条目
map('n', '<leader>co', ':copen<CR>',        '打开快速修复列表')
map('n', '<leader>cc', ':cclose<CR>',       '关闭快速修复列表')
map('n', '<leader>cl', ':cexpr []<CR>',     '清空快速修复列表')

vim.cmd([[
    nnoremap ; :
    :command W w
    :command WQ wq
    :command Wq wq
    :command Q q
    :command Qa qa
    :command QA qa
]])


