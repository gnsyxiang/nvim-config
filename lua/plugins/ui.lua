
return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("configs.gruvbox")
        end,
    },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin", -- 定义插件名称，方便后续调用
    --     priority = 1000,
    --     config = function()
    --         require("configs.catppuccin")
    --     end,
    -- },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        main = "ibl",
        config = function()
            require("configs.indent-blankline")
        end,
    },
}

