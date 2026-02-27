return {
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
        lazy = false,
        config = function()
            require("configs.nvim-tree")
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
}

