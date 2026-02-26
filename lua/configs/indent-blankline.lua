local opts = {
    indent = {
        char = "┆",                         -- 缩进竖线的字符（可选：│、┆、┊ 等）
    },
    scope = {
      enabled = true,       -- 启用语法块范围高亮
      show_start = true,    -- 显示代码块起始位置
      show_end = false,     -- 不显示代码块结束位置（避免线条杂乱）
    },
}

require("ibl").setup(opts)

-- 自定义缩进线颜色
vim.api.nvim_set_hl(0, "IblIndent", { fg = "#454b54", nocombine = true })
vim.api.nvim_set_hl(0, "IblScope", { fg = "#7aa2f7", nocombine = true })

