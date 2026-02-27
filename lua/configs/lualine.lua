
local opts = {
    options = {
        disabled_filetypes = {
            "NvimTree",         -- 禁用 NvimTree 窗口中的状态栏
            "packer",           -- 禁用 packer 窗口
            "toggleterm",       -- 禁用终端窗口
            "help",             -- 禁用帮助窗口
            "qf",               -- 禁用 quickfix 窗口
            "spectre_panel",    -- 如果你使用 spectre 搜索插件
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        -- lualine_c = { "filename" },
        lualine_c = { { "filename", path = 1 } },               -- 显示相对路径
        lualine_x = { "fileformat", "filetype" },
        -- lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = { "fzf", "quickfix", "nvim-tree", "trouble" }, -- 常见扩展
}

require("lualine").setup(opts)

