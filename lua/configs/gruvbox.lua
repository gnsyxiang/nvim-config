
local opts = {
    contrast = "soft",
}

require("gruvbox").setup(opts)

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- 可选: 设置终端颜色以匹配主题
if vim.fn.has("termguicolors") then
    vim.o.termguicolors = true
end

