-- LEADER KEYS
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- BASIC SETTINGS
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.wrap = false

-- KEYMAPS
local keymap = vim.keymap.set
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })
keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic details" })
keymap("n", "<leader>ff", require("fzf-lua").files, { desc = "Find files" })
keymap("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Find buffers" })
keymap("n", "<leader>fw", require("fzf-lua").live_grep, { desc = "Live grep search" })
keymap("n", "<leader>fc", require("fzf-lua").grep_cword, { desc = "Search word under cursor" })
keymap("n", "<leader>fd", require("fzf-lua").diagnostics_document, { desc = "Find diagnostics in file" })
keymap("n", "<leader>gc", require("fzf-lua").git_commits, { desc = "Git commits" })

-- SPLITS
keymap("n", "<leader>h", function()
	vim.cmd("leftabove vsplit")
	require("fzf-lua").files()
end, { desc = "Split left and open file picker" })

keymap("n", "<leader>j", function()
	vim.cmd("rightbelow split")
	require("fzf-lua").files()
end, { desc = "Split down and open file picker" })

keymap("n", "<leader>k", function()
	vim.cmd("leftabove split")
	require("fzf-lua").files()
end, { desc = "Split up and open file picker" })

keymap("n", "<leader>l", function()
	vim.cmd("rightbelow vsplit")
	require("fzf-lua").files()
end, { desc = "Split right and open file picker" })

-- COLORSCHEME
require("kanagawa").load("wave")

-- AUTO PAIRS
require("nvim-autopairs").setup({
	check_ts = true,
})

-- GIT SIGNS
require("gitsigns").setup()

-- STATUS LINE
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

-- FILE TREE
require("neo-tree").setup()

vim.api.nvim_create_autocmd("VimEnter", {
	desc = "Auto-open neo-tree on startup",
	callback = function()
		require("neo-tree.command").execute({ action = "show" })
	end,
})

-- TREESITTER
require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	indent = { enable = true },
})

-- DIAGNOSTICS
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	virtual_text = {
		prefix = "",
		spacing = 2,
	},
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
})

-- COMPLETION
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Enable completion when LSP attaches",
	callback = function(event)
		vim.lsp.completion.enable(true, event.data.client_id, event.buf, { autotrigger = true })
	end,
})

-- BASH_LS CONFIGURATION
vim.lsp.config.bashls = {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
	single_file_support = true,
	settings = {
		bashIde = {
			globPattern = "*@(.sh|.inc|.bash|.command)",
		},
	},
}
vim.lsp.enable("bashls")

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Format Bash files on save",
	pattern = "*.sh",
	callback = function()
		local file = vim.fn.expand("%:p")
		vim.fn.system("shfmt -w " .. vim.fn.shellescape(file))
		vim.cmd("edit!")
	end,
})

-- LUA_LS CONFIGURATION
vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	single_file_support = true,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
vim.lsp.enable("lua_ls")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.lua",
	callback = function()
		local file = vim.fn.expand("%:p")
		vim.fn.system("stylua " .. vim.fn.shellescape(file))
		vim.cmd("edit!")
	end,
})

-- NIXD CONFIGURATION
vim.lsp.config.nixd = {
	cmd = { "nixd" },
	filetypes = { "nix" },
	single_file_support = true,
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			formatting = {
				command = { "nixfmt" },
			},
			options = {
				nixos = {
					expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.desktop.options",
				},
				home_manager = {
					expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.desktop.options.home-manager.users.type.getSubOptions []",
				},
			},
		},
	},
}
vim.lsp.enable("nixd")

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Format Nix files on save",
	pattern = "*.nix",
	callback = function()
		vim.lsp.buf.format()
	end,
})
