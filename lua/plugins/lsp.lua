
return {
    {
        "mason-org/mason-lspconfig.nvim",   -- 作为 Mason 和 LSP 配置的桥梁
        dependencies = {
            "mason-org/mason.nvim",         -- 负责安装 LSP 服务器
            "neovim/nvim-lspconfig",        -- 作为数据源
        },
        config = function()
            require("configs.lsp")
        end,
    },
}

