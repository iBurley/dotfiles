-- COMPLETION
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Enable completion when LSP attaches",
	callback = function(event)
		vim.lsp.completion.enable(true, event.data.client_id, event.buf, { autotrigger = true })
	end,
})

-- NEO-TREE
vim.api.nvim_create_autocmd("VimEnter", {
	desc = "Auto-open neo-tree on startup",
	callback = function()
		require("neo-tree.command").execute({ action = "show" })
	end,
})
