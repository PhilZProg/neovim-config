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
		config = function()
			require("clangd_extensions.inlay_hints").setup_autocmd()
			require("clangd_extensions.inlay_hints").set_inlay_hints()
		end,
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
			lspconfig.clangd.setup({ capabilities })
			lspconfig.ccls.setup({ capabilities })
			vim.keymap.set("n", "D", vim.lsp.buf.hover, { desc = "Show documentation" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		end,
	},
}
