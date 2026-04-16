
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-nvim-lint").setup({

    ensure_installed = {
        -- lint工具
        -- "luacheck",
        "clang-tidy",
        -- "pylint",
        -- "rustc",
        -- "eslint_d",
        -- "shellcheck",
        -- "jsonlint",
        -- "yamllint",
        -- "golangcilint",
    },

    -- 设置为 true，将自动使用 Mason 安装的 linter 路径，无需手动配置命令
    automatic_installation = true,
})

local lint = require('lint')

-- 1. 配置 语言 -> 检查工具 映射
lint.linters_by_ft = {
    -- lua = { 'luacheck' },
    c = { 'clang-tidy' },
    -- python = { 'pylint' },
    -- javascript = { 'eslint_d' },
    -- typescript = { 'eslint_d' },
    -- javascriptreact = { 'eslint_d' },
    -- typescriptreact = { 'eslint_d' },
    -- go = { 'golangcilint' },
    -- markdown = { 'markdownlint' },
    -- json = { 'jsonlint' },
    -- bash = { 'shellcheck' },
    -- html = { 'htmlhint' },
    -- css = { 'stylelint' },
}

-- 2. 自动触发检查（保存文件 / 离开输入模式时）
local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = lint_augroup,
    callback = function()
        lint.try_lint()
    end,
})

-- 3. 手动触发检查快捷键（可选）
vim.keymap.set('n', '<leader>l', function()
    lint.try_lint()
end, { desc = '手动触发代码语法检查' })


