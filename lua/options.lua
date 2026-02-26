local opt = vim.opt

local options = {
    -- 基础显示配置
    fileencoding = 'utf-8',         -- 用于指定打开文件的编码方式
    encoding = "utf-8",             -- 用于指定Vim内部字符处理的编码方式
    -- termencoding = "utf-8",
    termguicolors = true,           -- 启用真彩色（适配现代终端）
    autoread = true,                -- 当文件被外部程序修改时，自动加载
    clipboard = "unnamedplus",      -- 允许使用系统剪贴板
    mouse = 'a',                    -- 允许使用鼠标
    updatetime = 250,               -- 减少更新延迟
    timeoutlen = 300,               -- 快捷键超时时间

    -- 缩进配置
    -- 1，开启基础自动缩进
    autoindent = true,
    -- 2. 明确关闭旧式的、可能产生冲突的智能缩进
    smartindent = false,            -- smartindent 是一个过时的、功能有限的选项，你应该避免使用它
    cindent = false,                -- 是一个非常强大但专门化的工具，仅在你进行 C/C++ 开发且对风格有极致要求时考虑使用。
    -- 3. 设置通用的缩进格式（空格、宽度）
    tabstop = 4,                    -- 每个Tab显示为4个空格宽度
    shiftwidth = 4,                 -- 每次缩进使用4个空格
    softtabstop = 4,                -- 编辑时Tab键插入4个空格
    expandtab = true,               -- 将Tab转换为空格
    shiftround = true,              -- 启用缩进对齐到shiftwidth的倍数
    -- -- 4. [可选] 如果你主要做C开发，可以仅为c文件类型开启cindent
    -- vim.api.nvim_create_autocmd("FileType", {
        --   pattern = { "c", "h" },
        --   callback = function()
            --     vim.opt_local.cindent = true
            --     -- 可以在这里配置 cinoptions
            --   end,
            -- })
            -- 5. [推荐] 安装并配置 nvim-treesitter 来获得最好的缩进体验

            -- 编辑行为
            wrap = false,                   -- 禁止自动换行
            backup = false,                 -- 禁用备份文件
            swapfile = false,               -- 禁用交换文件
            writebackup = false,            -- 禁止创建备份文件
            undofile = true,                -- 启用持久化撤销
            undodir = vim.fn.stdpath("data") .. "/undo", -- 撤销文件存储路径

            -- 搜索配置
            ignorecase = true,              -- 查找时忽略大小写
            smartcase = true,               -- 包含大写时区分大小写
            hlsearch = true,                -- 搜索高亮
            incsearch = true,               -- 边输入边搜索

            syntax = "off",                 -- 开启语法高亮

            number = true,                  -- 显示行号
            relativenumber = true,          -- 显示相对行号
            cursorline = true,              -- 高亮当前行
            cursorcolumn = true,            -- 高亮当前列
            colorcolumn = "80",             -- 右侧参考线
            ruler = true,                   -- 显示光标位置
            signcolumn = "yes",             -- 始终显示符号列（避免窗口跳动）

            cmdheight = 1,                  -- 命令行高为2，提供足够的显示空间

            -- 允许隐藏被修改过的buffer
            hidden = true,

            --右下角显示模式
            showmode = true,
            conceallevel = 0,

            -- 是否显示不可见字符
            -- 不可见字符的显示，这里只把空格显示为一个点
            list = true,
            --listchars = "space:·,tab:··",

            -- jkhl 移动时光标周围保留8行
            scrolloff = 8,
            sidescrolloff = 8,

            -- 0：不显示标签栏。这意味着在Vim窗口的底部不会显示任何文件标签。
            -- 1：只有在打开了多个文件时才显示标签栏。当只有一个文件打开时，标签栏会被隐藏。
            -- 2：无论是否只有一个文件打开，都显示标签栏。
            showtabline = 2,

            --右下角显示命令
            showcmd = true,
        }

vim.opt.shortmess:append 'c'
for k, v in pairs(options) do
    vim.opt[k] = v
end

-- 如果你希望特定文件类型使用不同设置
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
    vim.opt_local.softtabstop = 8
    vim.opt_local.expandtab = false -- Makefile需要真实的Tab
  end
})

