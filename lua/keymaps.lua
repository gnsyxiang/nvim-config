
-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local map = vim.keymap.set

map("i", "jk",			"<ESC>",		opts)

-- alt + hjkl  窗口之间跳转
map("n", "<A-h>",		"<C-w>h",		opts)
map("n", "<A-j>", 		"<C-w>j", 		opts)
map("n", "<A-k>", 		"<C-w>k", 		opts)
map("n", "<A-l>", 		"<C-w>l", 		opts)

-- 多窗口的打开与关闭
map("n", "s",			"",				opts)    -- 取消 s 默认功能
map("n", "sv", 			":vsp<CR>",  	opts)
map("n", "sh", 			":sp<CR>",   	opts)
map("n", "sc", 			"<C-w>c",    	opts)
map("n", "so", 			"<C-w>o",    	opts)

-- 退出
map("n", "qq",			":q!<CR>",      opts)
map("n", "<leader>q",	":qa!<CR>",     opts)

vim.cmd([[
    nnoremap ; :
    :command W w
    :command WQ wq
    :command Wq wq
    :command Q q
    :command Qa qa
    :command QA qa
]])

