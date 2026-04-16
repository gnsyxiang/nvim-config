
local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    -- 辅助函数，用于设置映射选项
    local function opts(desc)
        return {desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true}
    end

    -- 默认映射
    api.config.mappings.default_on_attach(bufnr)

    -- 自定义映射
    vim.keymap.set('n', 'h',        api.node.navigate.parent_close,     opts('Close Directory'))
    vim.keymap.set('n', 'l',        api.node.open.edit,                 opts('Open'))

    vim.keymap.set('n', 'V',        api.node.open.vertical,             opts('Open: Vertical Split'))
    vim.keymap.set('n', 'H',        api.node.open.horizontal,           opts('Open: Horizontal Split'))

    vim.keymap.set("n", "<C-h>",    api.tree.toggle_hidden_filter,      opts("Toggle Filter: Dotfiles"))
end

local opts = {
    on_attach = on_attach,
    view = {
        side = "left",              -- 窗口位置（left/right）
        width = 35,                 -- 窗口宽度
        number = false,             -- 是否显示行号
        relativenumber = false,     -- 是否显示相对行号
    },
    filters = {
        dotfiles = false,           -- 是否显示点文件（默认 false）
        custom = {                  -- 自定义过滤的文件或目录
            "node_modules",
            "\\.cache",
            "^%.git$"
        },
    },
    git = {
        enable = true,              -- 启用 git 状态图标
        ignore = true,              -- 是否忽略 .gitignore 中的文件
        timeout = 500,
    },
    sort_by = "name",
    renderer = {
        highlight_git = true,           -- 高亮 git 状态
        group_empty = true,             -- 折叠空文件夹
        indent_markers = {
            enable = true,              -- 显示缩进标记
        },
        icons = {
            show = {
                git = true,             -- 显示 git 图标
                file = true,            -- 显示文件图标
                folder = true,          -- 显示文件夹图标
                folder_arrow = true,    -- 显示文件夹箭头
            },
        },
    },
    actions = {
        open_file = {
            resize_window = false,      -- 打开文件时不自动调整窗口大小
            quit_on_open = false,       -- 打开文件后不自动关闭文件树
        },
    },
    disable_netrw = true,
    hijack_netrw = true,
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

