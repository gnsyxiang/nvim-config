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

	-- 高亮当前行
	-- 不高亮当前列
	-- 右侧参考线
	cursorline = true,
	cursorcolumn = true,
	colorcolumn = "80",

	-- 显示光标位置
	ruler = true,

	--查找时忽略大小写
	--智能大小写
	ignorecase = true, 
	smartcase = true, 

	-- 搜索不要高亮
	-- 边输入边搜索
	hlsearch = true,
	incsearch = true,

	-- 禁止自动换行
	wrap = false,
}

vim.opt.shortmess:append 'c'
for k, v in pairs(options) do
	vim.opt[k] = v
end

if IS_MAC then
	vim.opt.clipboard:prepend({ "unnamedplus", "unnamed" })
elseif IS_LINUX then
	vim.g.clipboard = {
		name = "xclip",
		copy = {
			["+"] = "xclip -selection clipboard",
			["*"] = "xclip -selection clipboard",
		},
		paste = {
			["+"] = "xclip -selection clipboard -o",
			["*"] = "xclip -selection clipboard -o",
		},
	}
end

