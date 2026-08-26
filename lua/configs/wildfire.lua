
local opts = {
}

require("wildfire").setup(opts)

-- 默认配置
-- {
--     -- 定义需要匹配的符号对
--     surrounds = {
--         { "(", ")" },
--         { "{", "}" },
--         { "<", ">" },
--         { "[", "]" },
--     },
--
--     -- 自定义快捷键
--     keymaps = {
--         init_selection = "<CR>",
--         node_incremental = "<CR>",
--         node_decremental = "<BS>",
--     },
--
--     -- 排除的文件类型，在这些文件中不会启用插件快捷键，{ "qf" } (快速修复窗口)
--     filetype_exclude = { "qf" },
-- }

-- 如何使用
-- 1，递增选择，<CR>
-- 2，递减选择，<BS>
-- 3，使用数字前缀加速，3<CR>
-- 4，进入视觉模式后，就可以对选中的文本执行任何操作，如 y（复制）、d（删除）、c（修改）等。

