
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

luasnip.setup({
    history = true,
    delete_check_events = "TextChanged",
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

