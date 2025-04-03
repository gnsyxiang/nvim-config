
return {
	url = "git@github.com:nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },			-- 启用语法高亮
			indent = { enable = true },				-- 启用代码缩进
			ensure_installed = {					-- 确保安装指定的语法解析器
				"bash", "c", "cpp", "lua", "python",
				"javascript", "typescript", "html", "css"
			},
		})
	end,
}

