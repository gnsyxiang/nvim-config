return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({
                -- paths = { vim.fn.stdpath("config") .. "/snippets" }
                paths = { "./snippets" }
            })

            -- 加载友好片段
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    {
        "hrsh7th/nvim-cmp",                     -- 补全引擎核心
        event = "InsertEnter",
        dependencies = {
            -- 补全源
            "hrsh7th/cmp-nvim-lsp",             -- LSP 补全源
            "hrsh7th/cmp-buffer",               -- 缓冲区文本补全
            "hrsh7th/cmp-path",                 -- 文件路径补全
            "hrsh7th/cmp-cmdline",              -- 命令行补全

            -- Snippet 引擎
            "L3MON4D3/LuaSnip",                 -- 片段引擎
            "saadparwaiz1/cmp_luasnip",         -- 连接nvim-cmp和LuaSnip的桥梁
            "rafamadriz/friendly-snippets",     -- 预定义片段集合

            -- 友好的图标
            "onsails/lspkind.nvim",
        },
        config = function()
            require("configs.cmp")
        end,
    },
}

