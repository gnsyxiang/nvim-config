
require("clangd_extensions").setup({
    server = {
        -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--pch-storage=memory",
            "--inlay-hints"
        },
    },
    extensions = {
        autoSetHints = true,
        inlay_hints = { inline = true, highlight = "DiagnosticHint" },
    },
})

local utils = require("utils")

local function opts(tbl)
    tbl = tbl or {}

    if tbl.desc then
        tbl.desc = 'clangd_extensions: ' .. tbl.desc
    end

    return tbl
end

utils.keymap("n", "<leader>ds", "<cmd>ClangdSwitchSourceHeader<CR>",    opts{desc = "switch c/h"})          -- 源/头文件切换
-- utils.keymap("n", "<leader>da", "<cmd>ClangdAST<CR>",                   opts{desc = "view AST"})            -- 查看 AST
-- utils.keymap("n", "<leader>dm", "<cmd>ClangdMemoryUsage<CR>",           opts{desc = "view memory usage"})   -- 查看内存使用
-- utils.keymap("n", "<leader>di", "<cmd>ClangdSymbolInfo<CR>",            opts{desc = "view symbol info"})    -- 查看符号信息
-- utils.keymap("n", "<leader>dh", "<cmd>ClangdToggleInlayHints<CR>",      opts{desc = "toggle inlay hints"})  -- 内联提示开关

