
return {
    {
        "nvim-telescope/telescope.nvim",
        version = '*',                          -- 推荐锁定到最新发布版本，以避免潜在的兼容性问题
        cmd = "Telescope",
        keys = {
            { "<leader>ff", desc = "查找文件" },
            { "<leader>fg", desc = "全文搜索" },
            { "<leader>fb", desc = "缓冲区" },
            { "<leader>fh", desc = "帮助标签" },
            { "<leader>fp", desc = "Lazy 插件列表" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",

            {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},   -- 高性能FZF排序器
            "nvim-telescope/telescope-live-grep-args.nvim",
            "nvim-telescope/telescope-ui-select.nvim",                      -- 用 Telescope 接管 vim.ui.select 界面
            "tsakirist/telescope-lazy.nvim",
            -- "debugloop/telescope-undo.nvim",                    -- 撤销历史扩展
        },
        config = function()
            require("configs.telescope")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        version = "*",                          -- 使用最新稳定版
        lazy = false,                           -- 不建议延迟加载，避免启动顺序问题
        config = function()
            require("configs.nvim-tree")
        end,
    },
}

