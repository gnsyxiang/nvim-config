
return {
	"akinsho/bufferline.nvim",
	version = "release",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "BufReadPre",							-- 延迟加载
	opts = {
		options = {
			numbers = "ordinal",					-- 显示缓冲区序号（1-based）
			separator_style = "slant",				-- 分隔符样式（可选 slant/padded等）
			show_close_icon = false,				-- 隐藏关闭按钮
			diagnostics = "nvim_lsp",				-- 显示 LSP 错误提示
			offsets = {								-- 与其他插件（如 nvim-tree）对齐
				{ filetype = "NvimTree", text = "File Explorer", padding = 1 }
			},

			-- 使用 nvim-web-devicons 显示文件类型图标
			indicator = { icon = "▎", style = "icon" },
			modified_icon = "●",
			buffer_close_icon = "",
			close_icon = "",
		}
	},
	config = function(_, opts)
		require("nvim-web-devicons").setup()

		require("bufferline").setup(opts)

		vim.keymap.set("n", "<leader>bh", "<Cmd>BufferLineCyclePrev<CR>",	{ desc = "Previous buffer" })					-- 切换到前一个缓冲区标签（向左切换）
		vim.keymap.set("n", "<leader>bl", "<Cmd>BufferLineCycleNext<CR>",	{ desc = "Next buffer" })						-- 切换到后一个缓冲区标签（向右切换）

		vim.keymap.set("n", "<leader>bd", "<Cmd>BufferLineClose<CR>",		{ desc = "Close buffer" })						-- 关闭当前缓冲区
		vim.keymap.set("n", "<leader>bg", ":BufferLinePick<CR>",			{ desc = "Pick buffer"})						-- 进入交互模式，通过字符选择要切换的缓冲区标签（类似 <leader>f 的模糊选择）
		vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLinePickClose<CR>",	{ desc = "Pick to close buffer" })				-- 进入交互模式，选择要关闭的缓冲区标签（光标移动到目标标签后回车关闭）
		vim.keymap.set("n", "<leader>bo", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", { desc = "Close buffer"})	-- 关闭当前标签左侧和右侧的所有缓冲区（仅保留当前标签）

		vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>",		{ desc = ""})
		vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", 	{ desc = ""})
		vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", 	{ desc = ""})
		vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", 	{ desc = ""})
		vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", 	{ desc = ""})
		vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", 	{ desc = ""})
		vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", 	{ desc = ""})
		vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", 	{ desc = ""})
		vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", 	{ desc = ""})
	end
}

