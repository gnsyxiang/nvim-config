
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        -- lsp服务器
        "lua_ls",        -- Lua
        "clangd",        -- C/C++
        "pyright",       -- Python
        "rust_analyzer", -- Rust
        "ts_ls",         -- TypeScript/JavaScript
        "bashls",        -- Bash
        "jsonls",        -- JSON
        "yamlls",        -- YAML
        -- "gopls",         -- Go
    },
    automatic_installation = true,
})

-- 官方原生 LSP 配置 clangd（Neovim 0.10+）
vim.lsp.config('clangd', {
    -- 1. 生效文件类型
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },

    -- 2. 启动 clangd 的命令（最关键！性能/功能全靠这里）
    cmd = {
        'clangd',
        '--background-index',                           -- 后台索引项目，打开大型项目不卡顿
        '--clang-tidy',                                 -- 开启代码规范检查（变量命名、空指针、未使用变量等）
        '--completion-style=detailed',                  -- 补全显示函数参数+返回值
        '--header-insertion=never',                     -- 自动插入缺失头文件（iwyu=include-what-you-use）
        '--offset-encoding=utf-16',                     -- 修复与 nvim-cmp 等补全插件乱码问题
        '--pch-storage=memory',                         -- 预编译头放内存，大幅提速
        '--enable-config',                              -- 允许项目根目录使用 .clangd 配置文件
        '--header-insertion-decorators',                -- 补全时显示头文件来源
        '--log=error',                                  -- 只记录错误日志，减少干扰
    },

    -- 3. 项目根目录标记（自动识别项目根）
    root_markers = {
        'compile_commands.json',                        -- CMake/编译数据库（最重要）
        '.clangd',                                      -- clangd 配置
        'compile_flags.txt',
        '.git',                                         -- Git 仓库根
        'CMakeLists.txt',                               -- CMake 项目
        'Makefile',                                     -- Make 项目
    },

    -- 4. clangd 高级设置（对应 VSCode 的 clangd 配置）
    settings = {
        clangd = {
            -- 自动检测并使用项目的 C++ 标准（c++11/14/17/20/23）
            fallbackFlags = { '-std=c++17' },           -- 无配置时默认 C++17
            diagnostics = {
                severity = {
                    default = 'warning',                -- 把 clangd 警告级别调整为更严格
                },
            },
            -- 代码格式化风格（也可以用 .clang-format 文件）
            format = {
                enable = true,
            },
        },
    },

    -- 5. 能力声明（告诉 nvim 你支持哪些功能）
    capabilities = vim.tbl_deep_extend('force', {
        offsetEncoding = { 'utf-16' },                  -- 必须加，否则乱码
    }, vim.lsp.protocol.make_client_capabilities()),
})

-- 6. 启动 clangd LSP 服务
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')

