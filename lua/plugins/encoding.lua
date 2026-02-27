
return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "v0.2.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",

            {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
            "nvim-telescope/telescope-live-grep-args.nvim",
            "nvim-telescope/telescope-ui-select.nvim",         -- UI 选择扩展
            -- "debugloop/telescope-undo.nvim",                    -- 撤销历史扩展
        },
        config = function()
            require("configs.telescope")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("configs.nvim-treesitter")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",           -- LSP 补全源
            "hrsh7th/cmp-buffer",             -- 缓冲区文本补全
            "hrsh7th/cmp-path",               -- 文件路径补全
            "hrsh7th/cmp-cmdline",            -- 命令行补全
            "saadparwaiz1/cmp_luasnip",       -- LuaSnip 片段支持
            "L3MON4D3/LuaSnip",               -- 片段引擎
            "rafamadriz/friendly-snippets",   -- 预定义片段集合
        },
        config = function()
            require("configs.cmp")
        end,
    },
}

