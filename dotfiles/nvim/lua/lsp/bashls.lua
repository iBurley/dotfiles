-- BASH_LS CONFIGURATION
vim.lsp.config.bashls = {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
	single_file_support = true,
	settings = {
		bashIde = {
			globPattern = "*@(.sh|.inc|.bash|.command)",
			shellcheckPath = "shellcheck",
		},
	},
}
vim.lsp.enable("bashls")

-- FORMAT ON SAVE
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Format Bash files on save",
	pattern = { "*.sh", "*.bash" },
	callback = function()
		vim.cmd("%!shfmt -i 2")
	end,
})
