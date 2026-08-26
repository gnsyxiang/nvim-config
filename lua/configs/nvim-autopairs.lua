
local opts = {
    check_ts = true, -- 启用 Treesitter 上下文感知
    ts_config = {
        lua = { "string", "source" },                       -- 在 Lua 的字符串中不配对
        javascript = { "string", "template_string" },
        -- java = false,                                       -- 完全禁用 Java 的自动配对
    },
    fast_wrap = {
        map = "<M-e>",                                      -- 触发快捷键，Alt+e
        chars = { "{", "[", "(", '"', "'" },                -- 可用的环绕字符
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
    },
}

require("nvim-autopairs").setup(opts)


-- 如何使用
-- 自动配对：输入 (, [, {, ", ' 等符号时，会自动补全另一半。
-- 智能删除：删除左符号（如 (），右符号（如 )）也会被自动删除。
-- 跳出配对：在右括号前输入相同的右括号字符（如 )），光标会智能地跳到右括号之后。
-- 回车换行：在一对括号或花括号中间按回车，会自动换行并正确缩进

