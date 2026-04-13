-- AUTO PAIRS
require("nvim-autopairs").setup({
	check_ts = true,
})

-- COLORIZER
require("colorizer").setup()

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
		lualine_x = {
			{
				"diagnostics",
				symbols = {
					error = " ",
					warn = " ",
					hint = " ",
					info = " ",
				},
			},
			{ "filetype", icon = "" },
		},
	},
})

-- NEO-TREE
require("neo-tree").setup({})

-- RENDER MARKDOWN
require("render-markdown").enable()

-- TREESITTER
require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	indent = { enable = true },
})

-- VAGUE
require("vague").setup()
vim.cmd("colorscheme vague")
