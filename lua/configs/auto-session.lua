
local opts = {
    -- log_level = "error",        -- 日志级别，可选项： "debug", "info", "error"

    -- 1. 核心：自定义会话存储目录
    auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",

    -- 2. 行为控制：自动保存与恢复
    auto_save = true,
    auto_restore = true,
    auto_create = true,

    -- 3. 目录过滤：在特定目录下不工作
    suppressed_dirs = {"/", "~/", "/tmp", "~/Projects", "~/Downloads"},

    -- 4. Git 集成：按分支隔离会话
    git_use_branch_name = true,
    git_auto_restore_on_branch_change = true,

    session_lens = {                            -- 如果使用 telescope 插件，可以启用会话搜索
        picker = "telescope",
        previewer = "summary",
        mappings = {
            delete_session = { "i", "<C-d>" },
            alternate_session = { "i", "<C-s>" },
            copy_session = { "i", "<C-y>" },
        },
    },
    load_on_setup = true,
}

require("auto-session").setup(opts)

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- 可选：设置快捷键
vim.keymap.set("n", "<leader>as", "<cmd>AutoSession search<CR>",    { desc = "Session search" })

vim.keymap.set("n", "<leader>ar", "<cmd>AutoSession restore<CR>",   { desc = "Session restore" })
vim.keymap.set("n", "<leader>aa", "<cmd>AutoSession save<CR>",      { desc = "Session save" })
vim.keymap.set("n", "<leader>at", "<cmd>AutoSession toggle<CR>",    { desc = "Session toggle" })

-- :SessionSave：手动保存当前会话。
-- :SessionRestore：恢复当前目录对应的会话。
-- :SessionRestoreLast：恢复上一次关闭时的会话（需要启用选项 auto_session_enable_last_session = true）。
-- :SessionDelete：删除当前目录对应的会话。

