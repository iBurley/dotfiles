-- LEADER
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- KEYMAPS
local keymap = vim.keymap.set
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })
keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic details" })
keymap("n", "<leader>ff", function()
	require("fzf-lua").files()
end, { desc = "Find files" })
keymap("n", "<leader>fb", function()
	require("fzf-lua").buffers()
end, { desc = "Find buffers" })
keymap("n", "<leader>fw", function()
	require("fzf-lua").live_grep()
end, { desc = "Live grep search" })
keymap("n", "<leader>fc", function()
	require("fzf-lua").grep_cword()
end, { desc = "Search word under cursor" })
keymap("n", "<leader>fd", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "Find diagnostics in file" })
keymap("n", "<leader>gc", function()
	require("fzf-lua").git_commits()
end, { desc = "Git commits" })

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

-- COMPLETION
keymap("i", "<Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-n>"
	end
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return "<Tab>"
	end
	return "<C-x><C-o>"
end, { expr = true, desc = "Smart Tab completion/indent" })

keymap("i", "<S-Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-p>"
	end
	return "<C-d>"
end, { expr = true, desc = "Backwards completion or outdent" })
