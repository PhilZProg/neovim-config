return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason", -- load mason when running :Mason command
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy", -- load this after critical plugins
		opts = {
			auto_install = true,
		},
		-- config = function()
		-- 	require("mason-lspconfig").setup({
		-- 		ensure_installed = { "lua_ls", "clangd" },
		-- 	})
		-- end,
	},
	{
		"neovim/nvim-lspconfig",
		-- load lsp config when reading a buffer or creating a new one
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities })
			--Temporary disable clangd in favor of ccls for correct vim-pio
			--plugin work
			--lspconfig.clangd.setup({capabilities})
			lspconfig.ccls.setup({ capabilities })
			vim.keymap.set("n", "D", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
