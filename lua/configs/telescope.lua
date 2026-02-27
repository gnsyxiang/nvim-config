local telescope = require("telescope")
local actions = require("telescope.actions")

local open_with_trouble = require("trouble.sources.telescope").open
local add_to_trouble = require("trouble.sources.telescope").add

local opts = {
    defaults = {
        file_ignore_patterns = {
            ".git", ".cache", "node_modules", "target", "build", "dist",
            "%.o", "%.a", "%.out", "%.class",
            "%.pdf", "%.mkv", "%.mp4", "%.zip",
        },
        mappings = {
            i = {
                ["<ESC>"] = actions.close,
                ["<CR>"]  = actions.select_default,
                ["<A-j>"] = actions.move_selection_next,
                ["<A-k>"] = actions.move_selection_previous,
                ["<A-u>"] = actions.preview_scrolling_up,
                -- ["<A-d>"] = actions.preview_scrolling_down,
                ["<A-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<A-t>"] = open_with_trouble,
                ["<A-d>"] = function(prompt_bufnr)
                    local actions = require("telescope.actions")
                    local action_state = require("telescope.actions.state")
                    local selection = action_state.get_selected_entry()
                    if selection then
                        local commit_hash = selection.value                 -- 获取提交哈希（Telescope git_commits 的 entry.value 是哈希值）
                        actions.close(prompt_bufnr)                         -- 关闭 Telescope 窗口
                        vim.cmd("DiffviewOpen " .. commit_hash .. "^!")     -- 用 Diffview 打开该提交（加上 ^! 表示只显示该提交引入的变更）
                    end
                end,
            },
            n = {
                ["<A-t>"] = open_with_trouble,
                ["q"] = actions.close,
            },
        },
        set_env = { ["COLORTERM"] = "truecolor" }, -- 启用真彩色
    },
    pickers = {
        -- 针对特定选择器的定制
        find_files = {
            hidden = true, -- 显示隐藏文件
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }, -- 如果安装了 fd，优先使用
        },
        live_grep = {
            additional_args = { "--hidden" }, -- 搜索隐藏文件
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                       -- 启用模糊匹配
            override_generic_sorter = true,     -- 覆盖通用排序器
            override_file_sorter = true,        -- 覆盖文件排序器
            case_mode = "smart_case",           -- 智能大小写
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }
        },
    },
}

telescope.setup(opts)

-- 加载扩展
pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "live_grep_args")
pcall(telescope.load_extension, "ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files,               { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,                { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,                  { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,                { desc = "Help tags" })

vim.keymap.set("n", "<leader>fr", builtin.oldfiles,                 { desc = "Recent Files" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps,                  { desc = "Keymaps" })

vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols,     { desc = "Document symbols" })
vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols,    { desc = "Workspace symbols" })

vim.keymap.set("n", "<leader>gc", builtin.git_commits,              { desc = "Git commits" })
vim.keymap.set("n", "<leader>gb", builtin.git_branches,             { desc = "Git branches" })
vim.keymap.set("n", "<leader>gs", builtin.git_status,               { desc = "Git status" })

-- vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>",        { desc = "Undo History" })

