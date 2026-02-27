
local opts = {
    delay = 0.2,                -- 弹出提示的延迟时间（秒）
    icons = {
        mappings = true,        -- 是否显示图标（如果你没有安装图标字体可以设为 false）
    },
    keys = {
        scroll_down = "<c-d>",  -- 提示窗口内向下滚动
        scroll_up = "<c-u>",    -- 提示窗口内向上滚动
    },
    spec = {
        { "<leader>f", group = "file" },
        { "<leader>g", group = "git"  },
    },
    triggers = {
        { "<auto>", mode = "nixs" },  -- 自动触发所有模式
    },

    preset = "helix",           -- "classic" (底部全宽) | "modern" (居中圆角) | "helix" (编辑器风格)
    win = {
      border = "rounded",       -- "none", "single", "double", "rounded", "solid", "shadow"
      title = true,             -- 显示标题
      title_pos = "center",     -- 标题位置: "left", "center", "right"
    },
    show_help = true,           -- 在命令行显示帮助信息
    show_keys = true,           -- 在命令行显示按下的键
}

require("which-key").setup(opts)

