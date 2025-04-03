
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"ellisonleao/gruvbox.nvim",
		"nvim-tree/nvim-web-devicons",									-- 图标支持
		"linrongbin16/lsp-progress.nvim"								-- 可选：LSP 进度条插件
	},
	event = "VeryLazy",													-- 延迟加载（但建议在启动时加载）
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox",										-- 手动指定主题
				component_separators = { left = "|", right = "|" },		-- 组件分隔符
				section_separators = { left = "", right = ""},		-- 区块分隔符（需 Nerd Font）
				disabled_filetypes = { "NvimTree", "alpha" },			-- 对某些文件类型禁用
				globalstatus = true,									-- 全局状态栏（多窗口共享）
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },					-- 带图标的模式显示
				lualine_b = {
					"branch",
					{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
					"diagnostics"
				},
				lualine_c = {
					{ "filename", path = 1 },															-- 显示完整路径
					{ "lsp_progress", spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" } }	-- 集成 LSP 进度
				},
				lualine_x = {
					"encoding",
					{ "fileformat", symbols = { unix = "", dos = "", mac = "" } },
					"filetype"
				},
				lualine_y = { "searchcount", "selectioncount" },										-- 显示搜索/选择计数
				lualine_z = { "location", "%p%%/%L" }													-- 显示百分比和总行数
			},
			extensions = { "nvim-tree", "toggleterm" }													-- 扩展插件支持
		})
	end
}

