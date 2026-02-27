
local status, treesitter_config = pcall(require, "nvim-treesitter.configs")     -- 确保nvim-treesitter安装
if not status then
    vim.notify("没有找到 nvim-treesitter")
    return
end

local treesitter_parsers = require("nvim-treesitter.parsers")
local treesitter_install = require("nvim-treesitter.install")

local install_path = vim.fn.stdpath("data") .. "/treesitter_parsers"    -- 自定义解析器的安装路径
vim.fn.mkdir(install_path, "p")                                         -- 创建目录
vim.opt.runtimepath:append(install_path)                                -- 将目录添加到运行时路径

local parsers_config = treesitter_parsers.get_parser_configs()          -- 获取所有解析器配置
for _, config in pairs(parsers_config) do                               -- 为所有解析器设置 SSH URL
    if config.install_info and config.install_info.url then
        local url = config.install_info.url

        -- 将 HTTPS URL 转换为 SSH URL
        if url:find("https://github.com/") then
            config.install_info.url = url:gsub("https://github.com/", "git@github.com:")
        elseif url:find("https://gitlab.com/") then
            -- config.install_info.url = url:gsub("https://gitlab.com/", "git@gitlab.com:")
        end
    end
end

local opts = {
    parser_install_dir = install_path,      -- 指定解析器安装目录

    auto_install = true,                    -- 自动安装语言解析器
    ensure_installed = {                    -- 确保安装的语言解析器
        "lua", "python",
        "c", "cpp",  "c_sharp", "asm", "nasm", "objdump",
        "bash", "vim", "vimdoc",
        "json", "json5", "jsonc", "jsonnet", "hjson",
        "markdown", "markdown_inline",
        "toml", "yaml", "csv", "ini", "xml",
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
        "cmake", "make", "ninja",
        "proto", "sql",
        -- "css", "html", "dockerfile", "go",
        -- "java", "regex", "rust", "tsx", "query",
        -- "typescript", "javascript",
    },
    ignore_install = {},                    -- 忽略安装的解析器

    highlight = {
        enable = true,                      -- 启用语法高亮功能
        disable = {},                       -- 禁用某些语言的高亮
        disable = function(lang, buf)       -- 大文件优化：超过 100KB 的文件禁用 Treesitter 高亮以防止卡顿
            local max_filesize = 100 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,  -- 关闭额外的 vim 正则高亮，避免重复和性能问题
    },

    indent = {
        enable = true,                      -- 启用智能缩进功能
        disable = {},
    },

    incremental_selection = {
        enable = true,                      -- 启用增量选择功能
        keymaps = {
            init_selection = "gnn",         -- 在普通模式下初始化选择
            node_incremental = "grn",       -- 扩大选择到上级节点
            scope_incremental = "grc",      -- 扩大到更大作用域 (如函数)
            node_decremental = "grm",       -- 缩小选择到下级节点
        },
    },

    fold = {
        enable = true,                      -- 启用代码折叠功能
        disable = { "markdown", "yaml" },   -- 警用折叠的语言
        fold_virt_text = true,              -- 在折叠闭合处显示虚拟文本（通常是折叠内容的开头）
        max_fold_lines = 1000,              -- 如果超过这个行数，则禁用折叠, 针对大文件禁用折叠（可选，用于性能优化）

        -- 非常重要的配置：设置默认折叠级别
        -- 注意：这个选项和上面的 `vim.opt.foldlevel` 功能类似，但属于插件层。
        -- 如果设置了它，可能会覆盖 `vim.opt.foldlevel` 的效果。
        -- 通常建议只使用其中一个。Treesitter 文档推荐使用 `vim.opt.foldlevel`。
        -- fold_level = 0, -- 0 是最高折叠级别（折叠所有），99 是最低（几乎不折叠）。不推荐在此设置。
    },
}

treesitter_install.prefer_git = true        -- 使用git下载

treesitter_config.setup(opts)

-- 设置全局折叠选项
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldmethod = 'expr'
vim.opt.foldlevel = 99                      -- 打开文件时默认不折叠
vim.opt.foldlevelstart = 99                 -- 同上
vim.opt.foldenable = true
vim.opt.foldminlines = 1                    -- 至少需要多少行才能折叠（默认 1），可以设置为 3 来避免小折叠
-- vim.opt.foldcolumn = "1"                    -- 显示折叠栏，提供视觉反馈

-- -- 可选：自定义 foldtext
-- vim.opt.foldtext = [[
-- substitute(getline(v:foldstart), '\\t', repeat(' ', &tabstop), 'g')
-- \ . ' ... ' . (v:foldend - v:foldstart + 1) . ' lines'
-- ]]

-- zc：折叠光标下的代码
-- zo：展开光标下的代码
-- za：切换光标下的折叠状态

-- zR：展开所有折叠 (foldlevel=99)
-- zM：折叠所有可折叠的代码 (foldlevel=0)
-- zC / zO: 递归地折叠/展开某一层级

-- -- 可选：为 C/C++ 设置特定的折叠行为
-- -- 例如，默认打开文件时不折叠，可以设置一个自动命令
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--     pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
--     callback = function()
--         -- 设置折叠级别为 99（几乎不折叠），但保留折叠功能
--         vim.opt.foldlevel = 99
--     end,
-- })

