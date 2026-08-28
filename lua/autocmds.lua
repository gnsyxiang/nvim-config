

local api = vim.api
local opt_local = vim.opt_local

-- 创建 autocmd 组，便于管理
local indent_group = api.nvim_create_augroup("IndentSettings", { clear = true })

api.nvim_create_autocmd("FileType", {
    group = indent_group,
    pattern = { "c", "cpp", "h", "hpp" },
    callback = function()
      -- 缩进的优先级顺序（由高到低）
      --    1. nvim-treesitter 的 indent 模块（运行时动态缩进）
      --    2. 按文件类型配置（FileType autocmd） opt_local
      --    3. 基础配置（全局默认值） opt
      --    4. Neovim 默认值（通常是 8）


      -- cindent 的工作原理
      --    cindent 会使用 shiftwidth 作为基础缩进单位：
      --    场景	              缩进行为
      --    函数定义后	        缩进 shiftwidth 的倍数
      --    if/for/while 后	  缩进 shiftwidth 的倍数
      --    { 后	              缩进 shiftwidth 的倍数
      --    } 前	              减少缩进 shiftwidth 的倍数
        opt_local.cindent = true
    end,
})

api.nvim_create_autocmd("FileType", {
    group = indent_group,
    pattern = { "python", "py" },
    callback = function()
        opt_local.tabstop = 4
        opt_local.shiftwidth = 4
        opt_local.softtabstop = 4
        opt_local.expandtab = true
    end,
})

api.nvim_create_autocmd("FileType", {
    group = indent_group,
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    callback = function()
        opt_local.tabstop = 2
        opt_local.shiftwidth = 2
        opt_local.softtabstop = 2
        opt_local.expandtab = true
    end,
})

api.nvim_create_autocmd("FileType", {
    group = indent_group,
    pattern = { "go", "golang" },
    callback = function()
        opt_local.tabstop = 8
        opt_local.shiftwidth = 8
        opt_local.softtabstop = 8
        opt_local.expandtab = false     -- Go 语言推荐使用 Tab
    end,
})

api.nvim_create_autocmd("FileType", {
    group = indent_group,
    pattern = { "html", "css", "scss", "less" },
    callback = function()
        opt_local.tabstop = 2
        opt_local.shiftwidth = 2
        opt_local.softtabstop = 2
        opt_local.expandtab = true
    end,
})

-- Makefile 必须使用 Tab，不能转换为空格
api.nvim_create_autocmd("FileType", {
    group = indent_group,
    pattern = { "make", "makefile" },
    callback = function()
        opt_local.expandtab = false
    end,
})

