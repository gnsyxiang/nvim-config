
return {
	url = "git@github.com:williamboman/mason.nvim",
	cmd = "Mason",										-- 延迟加载命令
	build = ":MasonUpdate",								-- 首次安装后自动更新注册表
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				},
				keymaps = {
					toggle_package_expand = "<CR>",		-- 展开/折叠包详情
					install_package = "i",          	-- 安装包
					update_package = "u",           	-- 更新包
					check_package_version = "c",    	-- 检查版本
					update_all_packages = "U",      	-- 更新全部
					check_outdated_packages = "C",  	-- 检查过期包
					uninstall_package = "X",        	-- 卸载包
					cancel_installation = "<Esc>",  	-- 取消操作
				},
			},
			-- 安装路径（默认为 ~/.local/share/nvim/mason）
			install_root_dir = vim.fn.stdpath("data") .. "/mason",
			-- 自动检测并安装以下工具类型
			providers = {
				"mason.providers.client", -- 通过 Mason CLI 安装
				"mason.providers.registry-api", -- 通过 API 安装
			},
			-- 限制并发安装数量
			max_concurrent_installers = 4,
			-- 自动更新注册表（推荐开启）
			automatic_installation = false, -- 非自动安装（若需自动安装见进阶配置）
		})
	end,
}

