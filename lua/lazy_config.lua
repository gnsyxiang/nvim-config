-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "git@github.com:folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin", -- 定义插件名称，方便后续调用
    --     priority = 1000,
    --     config = function()
    --         require("plugins.catppuccin")
    --     end,
    -- },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("plugins.gruvbox")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
        config = function()
            require("plugins.nvim-tree")
        end,
    },
}, {
    ui = {
        border = "rounded",
    },
    performance = {
        rtp = {
            disabled_plugins = { "netrw", "netrwPlugin" },
        },
    },
    git = {
        url_format = "git@github.com:%s.git",
        timeout = 300,
    },
})

