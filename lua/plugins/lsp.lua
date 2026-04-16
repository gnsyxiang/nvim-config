
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
    {
        "dchinmay2/clangd_extensions.nvim",     -- clangd 增强（内存占用、重构、头文件跳转）
        dependencies = {
            "neovim/nvim-lspconfig"
        },
        ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }, -- 仅C/C++相关文件加载
        config = function()
            require("configs.clangd_extensions")
        end,
    },
    {
        "nvimdev/lspsaga.nvim",                 -- 提供更美观、功能更丰富的代码导航、预览、重命名等界面
        dependencies = {
            "nvim-treesitter/nvim-treesitter",  -- 推荐用于更好的语法高亮
            "nvim-tree/nvim-web-devicons",

            "neovim/nvim-lspconfig",
            -- 如果使用代码片段，还可以添加 "L3MON4D3/LuaSnip"
        },
        event = "LspAttach",                    -- 当 LSP 附加到缓冲区时加载，提高启动速度
        config = function()
            require("configs.lspsaga")
        end,
    },
}

