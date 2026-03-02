
local opts = {
    -- log_level = "error",        -- 日志级别，可选项： "debug", "info", "error"
    auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",     -- 自定义会话保存目录
    suppressed_dirs = {
        "~/",
        "~/Projects",
        "~/Downloads",
        "/"
    },                                          -- 不保存会话的目录
    auto_save = true,                           -- 自动保存会话
    auto_restore = true,                        -- 自动恢复会话
    auto_session_enable_last_session = false,   -- 是否启用 :SessionRestoreLast 命令
    session_lens = {                            -- 如果使用 telescope 插件，可以启用会话搜索
        load_on_setup = true,
        theme = "dropdown",
        previewer = false,
        mappings = {
            delete_session = { "i", "<C-d>" },
            alternate_session = { "i", "<C-s>" },
            copy_session = { "i", "<C-y>" },
        },
    },
    load_on_setup = true,
}

require("auto-session").setup(opts)

-- 可选：设置快捷键
vim.keymap.set("n", "<leader>ss", "<cmd>AutoSession search<CR>", { desc = "Search session for auto session" })

vim.keymap.set("n", "<leader>sr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" })
vim.keymap.set("n", "<leader>se", "<cmd>AutoSession save<CR>", { desc = "Save session for auto session" })
vim.keymap.set("n", "<leader>sa", "<cmd>AutoSession toggle<CR>", { desc = "Toggle session for auto session" })

-- :SessionSave：手动保存当前会话。
-- :SessionRestore：恢复当前目录对应的会话。
-- :SessionRestoreLast：恢复上一次关闭时的会话（需要启用选项 auto_session_enable_last_session = true）。
-- :SessionDelete：删除当前目录对应的会话。
