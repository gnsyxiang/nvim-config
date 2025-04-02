


require("options")
require("keymaps")

-- 检测操作系统
local system_name = vim.loop.os_uname().sysname

-- 定义全局变量
_G.IS_MAC = system_name == "Darwin"
_G.IS_LINUX = system_name == "Linux"
_G.IS_WINDOWS = system_name == "Windows_NT"

-- 示例：根据系统配置剪贴板
if IS_MAC then
	vim.opt.clipboard:prepend({ "unnamedplus", "unnamed" }) -- macOS 剪贴板集成
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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{import = "plugins.colorscheme"},
	{import = "plugins.nvim-tree"},
}, {
	install = {colorscheme = { "gruvbox" }}, -- 安装后自动应用主题
	checker = {enabled = true}, -- 自动检查更新
	performance = {
		rtp = {
			disabled_plugins = {"netrw"}, -- 禁用默认文件管理器
		},
	},
})

