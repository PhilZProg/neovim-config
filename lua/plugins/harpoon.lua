return {
	"ThePrimeagen/harpoon",
	config = function()
		require("harpoon").setup({
			global_settings = {
				-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
				save_on_toggle = false,

				-- saves the harpoon file upon every change. disabling is unrecommended.
				save_on_change = true,

				-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
				enter_on_sendcmd = false,

				-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
				tmux_autoclose_windows = false,

				-- filetypes that you want to prevent from adding to the harpoon list menu.
				excluded_filetypes = { "harpoon" },

				-- set marks specific to each git branch inside git repository
				mark_branch = false,
			},
			menu = {
				width = vim.api.nvim_win_get_width(0) - 4,
			},
		})
		vim.keymap.set("n", "<leader>hm", ":lua require('harpoon.mark').add_file()<CR>", { desc = "Harpoon Mark File", silent = true })
		vim.keymap.set("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Harpoon Toggle Menu", silent = true })
		vim.keymap.set("n", "<A-1>", ":lua require('harpoon.ui').nav_file(1)<CR>", { desc = "Harpoon Navigate File 1", silent = true })
 		vim.keymap.set("n", "<A-2>", ":lua require('harpoon.ui').nav_file(2)<CR>", { desc = "Harpoon Navigate File 2", silent = true })
		vim.keymap.set("n", "<A-3>", ":lua require('harpoon.ui').nav_file(3)<CR>", { desc = "Harpoon Navigate File 3", silent = true })
		vim.keymap.set("n", "<A-4>", ":lua require('harpoon.ui').nav_file(4)<CR>", { desc = "Harpoon Navigate File 4", silent = true })
    vim.keymap.set("n", "<A-5>", ":lua require('harpoon.ui').nav_file(5)<CR>", { desc = "Harpoon Navigate File 5", silent = true })
		vim.keymap.set("n", "<A-right>", ":lua require('harpoon.ui').nav_next()<CR>", { desc = "Harpoon Navigate Next", silent = true })
		vim.keymap.set("n", "<A-left>", ":lua require('harpoon.ui').nav_prev()<CR>", { desc = "Harpoon Navigate Prev", silent = true })
	end,
}
