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
