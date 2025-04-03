
return {
	url = "git@github.com:lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		indent = {
			char = "▏",
			tab_char = "▏",
			highlight = { "CursorColumn", "Whitespace" },
		},
		scope = {
			enabled = true,
			show_start = true,
			show_end = true,
			injected_languages = true,
			highlight = { "Identifier", "Title", "Function", "Label" },
		},
		exclude = {
			filetypes = {
				"help", "dashboard", "lazy", "mason", "toggleterm"
			}
		}
	},
    config = function(_, opts)
      require("ibl").setup(opts)
    end
}

