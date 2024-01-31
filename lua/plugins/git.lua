return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
			vim.keymap.set("n", "<leader>gpi", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview Hunk Inline" })
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Current Line Blame" })
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function() end,
	},
}
