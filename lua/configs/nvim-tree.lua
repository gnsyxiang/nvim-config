
local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    -- 辅助函数，用于设置映射选项
    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    -- 默认映射
    api.config.mappings.default_on_attach(bufnr)

    -- 自定义映射
    vim.keymap.set('n', 'h',        api.node.navigate.parent_close,     opts('Close Directory'))
    vim.keymap.set('n', 'l',        api.node.open.edit,                 opts('Open'))

    vim.keymap.set('n', 'V',        api.node.open.vertical,             opts('Open: Vertical Split'))
    vim.keymap.set('n', 'H',        api.node.open.horizontal,           opts('Open: Horizontal Split'))

    vim.keymap.set("n", "?",        api.tree.toggle_help,               opts("Help"))

    vim.keymap.set("n", "<C-h>",    api.tree.toggle_hidden_filter,      opts("Toggle Filter: Dotfiles"))
end

local opts = {
    -- 禁用 netrw
    disable_netrw = true,
    hijack_netrw = true,

    on_attach = on_attach,

    sort = {
        sorter = "case_sensitive",
        folders_first = true,
        files_first = false,
    },
    view = {
        side = "left",              -- 窗口位置（left/right）
        width = 40,                 -- 窗口宽度
    },
    renderer = {
        highlight_git = true,       -- 高亮 git 状态
        indent_markers = {
            enable = true,          -- 显示缩进标记
        },
    },
    git = {
        enable = true,              -- 启用 git 状态图标
    },
    diagnostics = {
        enable = false,
        show_on_dirs = true,
        icons = {
            hint = "H",
            info = "I",
            warning = "W",
            error = "E",
        },
    },
    filters = {
        dotfiles = true,            -- 是否显示点文件（默认 false）
        custom = {                  -- 自定义过滤的文件或目录
            "node_modules",
            "\\.cache",
            "^%.git$"
        },
    },
    actions = {
        open_file = {
            resize_window = true,   -- 打开文件时不自动调整窗口大小
            quit_on_open = false,   -- 打开文件后不自动关闭文件树
        },
    },
}

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup(opts)

vim.keymap.set("n", "<A-n>", "<cmd>NvimTreeToggle<CR>", { desc = "切换文件树" })
vim.keymap.set("n", "<A-f>", "<cmd>NvimTreeFindFile<CR>", { desc = "Find current file in tree" })

-- 可选：自动关闭 nvim-tree 当只剩文件树窗口时
vim.api.nvim_create_autocmd("QuitPre", {
    callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
                table.insert(tree_wins, w)
            end
            if vim.api.nvim_win_get_config(w).relative ~= "" then
                table.insert(floating_wins, w)
            end
        end
        if #wins - #floating_wins == #tree_wins then
            for _, w in ipairs(tree_wins) do
                vim.api.nvim_win_close(w, true)
            end
        end
    end,
})

