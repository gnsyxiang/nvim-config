
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

luasnip.setup({
    history = true,
    delete_check_events = "TextChanged",
})
-- -- 加载友好片段
-- require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
    -- paths = { vim.fn.stdpath("config") .. "/snippets" }
    paths = { "./snippets" }
})

local opts = {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>']       = cmp.mapping.scroll_docs(-4),              -- 向上滚动文档
        ['<C-f>']       = cmp.mapping.scroll_docs(4),               -- 向下滚动文档
        ['<C-Space>']   = cmp.mapping.complete(),                   -- 手动触发补全
        ['<C-e>']       = cmp.mapping.abort(),                      -- 关闭补全
        ['<CR>']        = cmp.mapping.confirm({ select = true }),   -- 回车确认

        ['<Tab>']       = cmp.mapping(function(fallback)            -- Tab 选择补全项
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<S-Tab>']     = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),

    -- 补全来源（优先级从上到下）
    sources = cmp.config.sources({
        { name = "nvim_lsp" },          -- lsp最高优先级
        { name = "luasnip" },           -- 代码片段
        { name = "buffer" },            -- 当前文件文字
        { name = "path" },              -- 文件路劲
    }),

    -- -- 补全菜单图标美化
    -- formatting = {
    --     format = lspkind.cmp_format({
    --         mode = 'symbol_text',  -- 显示图标 + 文字
    --         maxwidth = 50,         -- 最大宽度
    --         ellipsis_char = '...', -- 超长显示省略号
    --     })
    -- },
    --
    -- -- 补全菜单样式
    -- window = {
    --     completion = cmp.config.window.bordered(),    -- 补全菜单边框
    --     documentation = cmp.config.window.bordered(), -- 文档窗口边框
    -- },
}

cmp.setup(opts)

-- 命令行自动补全设置 / ?
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- 命令行模式补全 :
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        {
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        }
    )
})

    --
    --         -- 加载友好片段
    --         require("luasnip.loaders.from_vscode").lazy_load()
    --
    --         cmp.setup({
    --             -- 片段引擎配置
    --             snippet = {
    --                 expand = function(args)
    --                     luasnip.lsp_expand(args.body)
    --                 end,
    --             },
    --
    --             -- 映射配置
    --             mapping = cmp.mapping.preset.insert({
    --                 ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- 确认选择
    --                 ["<C-Space>"] = cmp.mapping.complete(),             -- 打开/关闭补全
    --                 ["<C-e>"] = cmp.mapping.abort(),                    -- 取消补全
    --
    --                 ["<C-p>"] = cmp.mapping.select_prev_item(),         -- 导航
    --                 ["<C-n>"] = cmp.mapping.select_next_item(),
    --                 ["<C-k>"] = cmp.mapping.select_prev_item(),
    --                 ["<C-j>"] = cmp.mapping.select_next_item(),
    --                 ["<Up>"] = cmp.mapping.select_prev_item(),
    --                 ["<Down>"] = cmp.mapping.select_next_item(),
    --
    --                 ["<C-b>"] = cmp.mapping.scroll_docs(-4),            -- 滚动文档窗口
    --                 ["<C-f>"] = cmp.mapping.scroll_docs(4),
    --
    --                 ["<Tab>"] = cmp.mapping(function()                  -- 片段跳转
    --                     if luasnip.expand_or_locally_jumpable() then
    --                         luasnip.expand_or_jump()
    --                     end
    --                 end, { "i", "s" }),
    --                 ["<S-Tab>"] = cmp.mapping(function()
    --                     if luasnip.locally_jumpable(-1) then
    --                         luasnip.jump(-1)
    --                     end
    --                 end, { "i", "s" }),
    --             }),
    --
    --             -- 补全源配置
    --             sources = cmp.config.sources({
    --                 { name = "nvim_lsp" },
    --                 { name = "luasnip" },
    --                 { name = "buffer" },
    --                 { name = "path" },
    --             }),
    --
    --             -- 格式化显示
    --             formatting = {
    --                 format = function(entry, vim_item)
    --                     -- 图标
    --                     local icons = {
    --                         Text = "",
    --                         Method = "󰆧",
    --                         Function = "󰊕",
    --                         Constructor = "",
    --                         Field = "󰇽",
    --                         Variable = "󰂡",
    --                         Class = "󰠱",
    --                         Interface = "",
    --                         Module = "",
    --                         Property = "󰜢",
    --                         Unit = "",
    --                         Value = "󰎠",
    --                         Enum = "",
    --                         Keyword = "󰌋",
    --                         Snippet = "",
    --                         Color = "󰏘",
    --                         File = "󰈙",
    --                         Reference = "",
    --                         Folder = "󰉋",
    --                         EnumMember = "",
    --                         Constant = "󰏿",
    --                         Struct = "",
    --                         Event = "",
    --                         Operator = "󰆕",
    --                         TypeParameter = "󰅲",
    --                     }
    --
    --                     vim_item.kind = string.format("%s %s", icons[vim_item.kind] or "", vim_item.kind)
    --
    --                     -- 源名称
    --                     vim_item.menu = ({
    --                         nvim_lsp = "[LSP]",
    --                         luasnip = "[Snippet]",
    --                         buffer = "[Buffer]",
    --                         path = "[Path]",
    --                         cmdline = "[Cmd]",
    --                     })[entry.source.name]
    --
    --                     return vim_item
    --                 end,
    --             },
    --
    --             -- 排序优先级
    --             sorting = {
    --                 comparators = {
    --                     cmp.config.compare.offset,
    --                     cmp.config.compare.exact,
    --                     cmp.config.compare.score,
    --                     cmp.config.compare.recently_used,
    --                     cmp.config.compare.kind,
    --                     cmp.config.compare.sort_text,
    --                     cmp.config.compare.length,
    --                     cmp.config.compare.order,
    --                 },
    --             },
    --
    --             -- 实验性功能
    --             experimental = {
    --                 ghost_text = true,  -- 显示幽灵文本预览
    --             },
    --         })
    --
    --         -- 命令行补全配置
    --         cmp.setup.cmdline(":", {
    --             mapping = cmp.mapping.preset.cmdline(),
    --             sources = cmp.config.sources({
    --                 { name = "path" },
    --             }, {
    --                     { name = "cmdline" },
    --                 }),
    --         })
    --
    --         cmp.setup.cmdline("/", {
    --             mapping = cmp.mapping.preset.cmdline(),
    --             sources = {
    --                 { name = "buffer" },
    --             },
    --         })
