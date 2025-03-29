vim.g.mapleader = " "         -- 设置 Leader 键

local options = {
	termguicolors = true,

	fileencoding = 'utf-8',
	encoding = "utf-8",

	-- 使用相对行号
	number = true,
	relativenumber = true,

	-- tab键转换为4个空格
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	shiftround = true,
}

vim.opt.shortmess:append 'c'
for k, v in pairs(options) do
	vim.opt[k] = v
end

