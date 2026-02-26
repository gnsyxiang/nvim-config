
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}

    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.keymap.set(mode, lhs, rhs, options)
end

map("i", "jk",          "<ESC>",        {desc = ""})

map("n", "qq",          ":q!<CR>",      {desc = ""})
map("n", "<leader>q",   ":qa!<CR>",     {desc = ""})

-- 多窗口的打开与关闭
map("n", "s",           "",             {desc = ""})    -- 取消 s 默认功能
map("n", "sv",          ":vsp<CR>",     {desc = ""})
map("n", "sh",          ":sp<CR>",      {desc = ""})
map("n", "sc",          "<C-w>c",       {desc = ""})
map("n", "so",          "<C-w>o",       {desc = ""})

-- alt + hjkl  窗口之间跳转
map("n", "<A-h>",       "<C-w>h",       {desc = ""})
map("n", "<A-j>",       "<C-w>j",       {desc = ""})
map("n", "<A-k>",       "<C-w>k",       {desc = ""})
map("n", "<A-l>",       "<C-w>l",       {desc = ""})

-- 左右比例控制
map("n", "s,",          ":vertical resize -10<CR>", {desc = ""})
map("n", "s.",          ":vertical resize +10<CR>", {desc = ""})
map("n", "<C-Left>",    ":vertical resize -2<CR>",  {desc = ""})
map("n", "<C-Right>",   ":vertical resize +2<CR>",  {desc = ""})
-- 上下比例
map("n", "sj",          ":resize +10<CR>",          {desc = ""})
map("n", "sk",          ":resize -10<CR>",          {desc = ""})
map("n", "<C-Down>",    ":resize +2<CR>",           {desc = ""})
map("n", "<C-Up>",      ":resize -2<CR>",           {desc = ""})
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


