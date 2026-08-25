
return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        version = "*",                          -- 使用最新稳定版
        lazy = false,                           -- 不建议延迟加载，避免启动顺序问题
        config = function()
            require("configs.nvim-tree")
        end,
    },
}

