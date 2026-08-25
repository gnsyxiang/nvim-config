
-- 1. 配置安装目录
require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site',
}

-- 2. 安装 C/C++ 及相关解析器
require('nvim-treesitter').install { 
    'c',           -- C 语言
    'cpp',         -- C++
    'cuda',        -- CUDA（如果做 GPU 编程）
    'cmake',       -- CMake 文件
    'make',        -- Makefile
    'glsl',        -- OpenGL Shading Language（如果需要）
    'vim', 'vimdoc', 'lua', 'query'  -- 配置文件和插件支持
}

-- 3. 为 C/C++ 及相关文件类型启用 Treesitter 功能
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 
        'c', 'cpp', 'h', 'hpp',    -- C/C++ 源文件和头文件
        'cuda',                     -- CUDA 文件
        'cmake',                    -- CMakeLists.txt
        'make',                     -- Makefile
        'glsl',                     -- GLSL 着色器
        'lua', 'vim'                -- 配置文件
    },
    callback = function()
        -- 启用 Tree-sitter 语法高亮
        vim.treesitter.start()

        -- 启用基于 Tree-sitter 的代码折叠
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'

        -- 启用基于 Tree-sitter 的缩进
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

        -- C/C++ 特定优化：设置缩进为 4 空格
        if vim.bo.filetype == 'c' or vim.bo.filetype == 'cpp' then
            vim.bo.shiftwidth = 4
            vim.bo.tabstop = 4
            vim.bo.softtabstop = 4
            vim.bo.expandtab = true
        end
    end,
})

-- 4. C/C++ 特定的额外配置（可选）
-- 为头文件添加正确的文件类型检测
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = { '*.h', '*.hpp', '*.hxx', '*.hh' },
    callback = function()
        -- 检测头文件是 C 还是 C++
        local content = vim.api.nvim_buf_get_lines(0, 0, 100, false)
        local is_cpp = false
        for _, line in ipairs(content) do
            if line:match('class%s+%w+') or line:match('namespace%s+%w+') or 
                line:match('template%s*<') or line:match('extern%s+"C++"') then
                is_cpp = true
                break
            end
        end
        if is_cpp then
            vim.bo.filetype = 'cpp'
        else
            vim.bo.filetype = 'c'
        end
    end,
})

