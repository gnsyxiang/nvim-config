

return {
    {
        "neovim-treesitter/nvim-treesitter",
        dependencies = {
            "neovim-treesitter/treesitter-parser-registry",
        },
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("configs.nvim-treesitter")
        end,
    },
    {
        "sustech-data/wildfire.nvim",
        event = "VeryLazy",                          -- 在 Neovim 启动完毕后加载
        dependencies = {
            "nvim-treesitter/nvim-treesitter",         -- 必需依赖
        },
        config = function()
            require("configs.wildfire")
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("configs.nvim-surround")
        end,
    },
}

