
return {
	url = "git@github.com:hrsh7th/nvim-cmp",				-- 主插件
	event = "InsertEnter",									-- 插入模式时加载
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",		-- LSP 补全源
		"hrsh7th/cmp-buffer",   		-- 文本缓冲区补全
		"hrsh7th/cmp-path",     		-- 文件路径补全
		"saadparwaiz1/cmp_luasnip",	-- 片段引擎支持（需安装 LuaSnip）
		"L3MON4D3/LuaSnip",			-- 片段引擎（可选，但推荐）
		"onsails/lspkind.nvim",		-- 美化补全菜单图标（可选）
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip") -- 若使用 LuaSnip
		local lspkind = require("lspkind") -- 若使用 lspkind

		-- 基础配置
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)				-- 使用 LuaSnip 展开片段
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),		-- 向上滚动文档
				["<C-f>"] = cmp.mapping.scroll_docs(4),  		-- 向下滚动文档
				["<C-Space>"] = cmp.mapping.complete(),  		-- 手动触发补全
				["<C-e>"] = cmp.mapping.abort(),         		-- 关闭补全窗口
				["<CR>"] = cmp.mapping.confirm({         		-- 确认选择
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
																-- Tab 键导航补全项
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },							-- LSP 补全
				{ name = "luasnip" },							-- 片段补全（需 LuaSnip）
				{ name = "buffer" },							-- 当前缓冲区文本
				{ name = "path" },								-- 文件路径
			}),
																-- 美化补全菜单（需 lspkind）
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
				})
			},
		})
	end,
}

