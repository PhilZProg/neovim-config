return {
	"Exafunction/codeium.vim",
  -- event = { "BufReadPre", "BufNewFile" }, -- load when a buffer is opened or created
	config = function()
		vim.keymap.set("i", "<A-g>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true, desc = "Codeium: Accept" })
		vim.keymap.set("i", "<A-n>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true, desc = "Codeium: Next Completion" })
		vim.keymap.set("i", "<A-b>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true , desc = "Codeium: Prev Completions" })
		vim.keymap.set("i", "<A-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true, desc = "Codeium: Clear" })
	end,
}
