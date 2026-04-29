
return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter", -- 依赖语法解析
        cmd = "Neogen", -- 命令触发懒加载
        config = function()
            require("configs.neogen")
        end,
        keys = {
            { "<leader>nf", function() require("neogen").generate() end, desc = "生成函数/类注释" },
        },
    },
}

