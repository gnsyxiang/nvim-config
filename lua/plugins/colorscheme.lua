
return {
	url = "git@github.com:ellisonleao/gruvbox.nvim",
	version = "*",
	lazy = false,
	priority = 1000,						-- 确保优先加载
	opts = {
		contrast = "hard",					-- 对比度模式：hard/medium/soft
		transparent_mode = false,			-- 是否透明背景
		italic = {
			strings = false,				-- 字符串不使用斜体
			comments = true, 				-- 注释使用斜体
		},
		overrides = {						-- 自定义高亮组
			["@function"] = { link = "GruvboxOrangeBold" },
			["@keyword"] = { fg = "#fe8019" },
		},
	},
	config = function(_, opts)
		require("gruvbox").setup(opts)
		vim.o.background = "dark"			-- 可选 dark/light
		vim.cmd.colorscheme("gruvbox")		-- 强制应用主题
	end,
}

