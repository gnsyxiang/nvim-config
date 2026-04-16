
return {
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("configs.bufferline")
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("configs.lualine")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        version = "*",                  -- 使用最新稳定版
        lazy = false,
        config = function()
            require("configs.nvim-tree")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        version = '*',
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",

            {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},   -- 高性能FZF排序器
            "nvim-telescope/telescope-live-grep-args.nvim",
            "nvim-telescope/telescope-ui-select.nvim",                      -- 用 Telescope 接管 vim.ui.select 界面
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
    -- {
    --     "stevearc/aerial.nvim",                     -- 代码大纲主插件
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     event = "BufReadPost",                      -- 打开文件时自动加载
    --     config = function()
    --         require("configs.aerial")
    --     end,
    -- },
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

