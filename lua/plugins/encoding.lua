

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
}

