require("catppuccin").setup({
    flavour = "mocha", -- 配色风格：mocha(深棕)、macchiato(浅灰)、frappe(中灰)、latte(浅白)
    background = {     -- 背景色适配
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- 是否透明背景（如需透明设为 true）
    show_end_of_buffer = false,     -- 隐藏行号后的空白字符
    term_colors = true,             -- 适配终端颜色
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    -- 高亮组自定义（可选）
    custom_highlights = function(colors)
        return {}
    end,
    -- 插件适配（默认已适配绝大多数常用插件）
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        treesitter = true,
        lazy = true, -- 适配 lazy.nvim
        lsp_trouble = true,
        mason = true,
        -- 如需更多插件适配，参考官方文档：https://github.com/catppuccin/nvim
    },
})

-- 设置默认主题
vim.o.background = "dark"
vim.cmd.colorscheme "catppuccin"

