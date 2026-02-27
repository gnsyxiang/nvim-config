
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",        -- Lua
        "clangd",        -- C/C++
        "pyright",       -- Python
        "rust_analyzer", -- Rust
        "ts_ls",         -- TypeScript/JavaScript
        "bashls",        -- Bash
        "jsonls",        -- JSON
        "yamlls",        -- YAML
        -- "gopls",         -- Go
    },
    automatic_installation = true,
})

vim.lsp.config('clangd', {
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    -- 如果需要自定义命令或根目录标记，也可以在这里添加
    -- cmd = { ... },
    -- root_markers = { ... },
    settings = {
        -- clangd 的特定设置（可选）
    },
    -- 也可以在这里定义 on_attach，但更推荐使用下面的 LspAttach 事件，更干净
})

vim.lsp.enable('clangd')

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end,
})

