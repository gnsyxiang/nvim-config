
local opts = {
}

require("nvim-surround").setup(opts)

-- 如何使用
--
-- 操作	                快捷键	                        说明
-- 添加包围	            ys{motion}{char}	            例如 ysiw) 用括号包围当前单词
-- 删除包围	            ds{char}	                    例如 ds] 删除方括号
-- 更改包围	            cs{target}{replacement}	        例如 cs'" 将单引号改为双引号
-- 可视模式添加	        S{char}	                        在 visual 模式下选中文本后按 S

--     Old text                    Command         New text
-- --------------------------------------------------------------------------------
--     surr*ound_words             ysiw)           (surround_words)
--     surr*ound_words             ysiw(           ( surround_words )
--     *make strings               ys$"            "make strings"
--     [delete ar*ound me!]        ds]             delete around me!
--     remove <b>HTML t*ags</b>    dst             remove HTML tags
--     'change quot*es'            cs'"            "change quotes"
--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--     delete(functi*on calls)     dsf             function calls

-- 默认快捷键配置
-- surrounds = {
--     ["("] = {   -- 在 visual 模式下按 S ( 用括号包围
--     [")"] = {
--     ["{"] = {
--     ["}"] = {
--     ["<"] = {
--     [">"] = {
--     ["["] = {
--     ["]"] = {
--     ["'"] = {
--     ['"'] = {
--     ["`"] = {
--     ["i"] = {
--     ["t"] = {
--     ["T"] = {
--     ["f"] = {
-- },
-- aliases = {
--     ["a"] = ">",
--     ["b"] = ")",
--     ["B"] = "}",
--     ["r"] = "]",
--     ["q"] = { '"', "'", "`" },
--     ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
-- },

