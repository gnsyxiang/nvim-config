

return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.gitsigns")
        end
    },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        },
        config = function()
            require("telescope").load_extension("lazygit")

            -- (可选) 配置 lazygit 浮动窗口的外观
            -- vim.g.lazygit_floating_window_scaling_factor = 0.8
            -- vim.g.lazygit_floating_window_border_chars = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }
        end,
    },
}

