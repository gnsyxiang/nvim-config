
return {
    {
        "kylechui/nvim-surround",
        version = "^4.0.0",
        event = "VeryLazy",
        config = function()
            require("configs.nvim-surround")
        end
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
}

