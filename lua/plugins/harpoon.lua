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
		vim.keymap.set("n", "<leader>hm", ":lua require('harpoon.mark').add_file()<CR>")
		vim.keymap.set("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
		vim.keymap.set("n", "1", ":lua require('harpoon.ui').nav_file(1)<CR>")
 		vim.keymap.set("n", "2", ":lua require('harpoon.ui').nav_file(2)<CR>")
		vim.keymap.set("n", "3", ":lua require('harpoon.ui').nav_file(3)<CR>")
		vim.keymap.set("n", "4", ":lua require('harpoon.ui').nav_file(4)<CR>")
    vim.keymap.set("n", "5", ":lua require('harpoon.ui').nav_file(5)<CR>")
		vim.keymap.set("n", "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>")
		vim.keymap.set("n", "<leader>hb", ":lua require('harpoon.ui').nav_prev()<CR>")
	end,
}
