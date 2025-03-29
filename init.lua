


require("options")
require("keymaps")




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
}, {
	install = {colorscheme = { "gruvbox" }}, -- 安装后自动应用主题
	checker = {enabled = true}, -- 自动检查更新
	performance = {
		rtp = {
			disabled_plugins = {"netrw"}, -- 禁用默认文件管理器
		},
	},
})

