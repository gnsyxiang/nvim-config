
return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        version = "V1",
        event = "VeryLazy",
        config = function()
            require("configs.nvim-tree")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("configs.bufferline")
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require("configs.lualine")
        end,
    },
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
        "rmagatti/auto-session",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        lazy = false,
        config = function()
            require("configs.auto-session")
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("configs.noice")
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require("configs.which-key")
        end,
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {"<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                           desc = "Diagnostics (Trouble)"},
            {"<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",              desc = "Buffer Diagnostics (Trouble)"},
            {"<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",                   desc = "Symbols (Trouble)"},
            {"<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",    desc = "LSP Definitions / references / ... (Trouble)"},
            {"<leader>xL", "<cmd>Trouble loclist toggle<cr>",                               desc = "Location List (Trouble)"},
            {"<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                                desc = "Quickfix List (Trouble)"},
        },
    },
}

