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

-- FORMAT ON SAVE
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Format Bash files on save",
	pattern = "*.sh",
	callback = function()
		local file = vim.fn.expand("%:p")
		vim.fn.system("shfmt -w " .. vim.fn.shellescape(file))
		vim.cmd("edit!")
	end,
})
