
return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("configs.gruvbox")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        main = "ibl",                               -- V3 版本的主模块名
        config = function()
            require("configs.indent-blankline")
        end,
    },
}

