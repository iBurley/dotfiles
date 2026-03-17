-- AUTO PAIRS
require("nvim-autopairs").setup({
	check_ts = true,
})

-- COLORIZER
require("colorizer").setup()

-- COLORSCHEME
require("kanagawa").load("wave")

-- GIT SIGNS
require("gitsigns").setup()

-- LUALINE
require("lualine").setup({
	options = {
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_b = {
			{ "branch", icon = "" },
			{ "diff" },
		},
		lualine_c = {
			{ "filename" },
			{
				"diagnostics",
				symbols = {
					error = " ",
					warn = " ",
					hint = " ",
					info = " ",
				},
			},
		},
		lualine_x = {
			{ "filetype", icon = "" },
		},
	},
})

-- NEO-TREE
require("neo-tree").setup({})

-- TREESITTER
require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	indent = { enable = true },
})
