local api = require("nvim-tree.api")

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

require("nvim-tree").setup({
    on_attach = on_attach,
    filters = {
        dotfiles = true,
        custom = {"node_modules", "\\.cache", "^%.git$"},
    },

    sort_by = "name",
    view = {
        width = 30,
        side = "left",
    },
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
        },
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
            },
        },
    },
    actions = {
        open_file = {
            quit_on_open = false,
            window_picker = {
                enable = false,
            },
        },
    },
    disable_netrw = true,
    hijack_netrw = true,
})

vim.keymap.set("n", "<A-n>", api.tree.toggle, { desc = "打开/关闭文件树" })

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

