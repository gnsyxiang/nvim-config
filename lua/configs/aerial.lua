
require('aerial').setup({
    -- 基础设置
    backends = { 'lsp', 'treesitter', 'markdown' }, -- 优先使用 LSP + 语法树
    layout = {
        -- min_width = 60,                 -- 侧边栏最小宽度
        -- max_width = 100,                 -- 侧边栏最大宽度
        default_direction = 'right',    -- 显示在右侧，left,right,float
    },

    -- autojump = true,                    -- 自动跟随光标定位

    -- icons = {                           -- 图标（美观）
    --     Class = '󰠱',
    --     Function = '󰊕',
    --     Method = '󰆧',
    --     Variable = '󰀫',
    --     Constant = '󰏿',
    --     Interface = '',
    --     Module = '󰏖',
    -- },

    focus_on_open = true,               -- 打开时自动聚焦到大纲窗口，便于立即用 j/k 导航
    close_on_select = true,             -- 跳转后自动关闭大纲窗口

    keymaps = {
        ["V"] = "actions.jump_vsplit",
        ["H"] = "actions.jump_split",
    },
})

vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle<CR>', { desc = '打开/关闭 代码大纲' })

