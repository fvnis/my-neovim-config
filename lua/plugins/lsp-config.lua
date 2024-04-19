return {
	{
		"williamboman/nvim-lsp-installer",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("nvim-lsp-installer").setup({})
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local border = "single"

			-- LSP settings (for overriding per client)
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.dartls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			require("lspconfig.ui.windows").default_options = {
				border = border,
			}

			lspconfig.tsserver.setup({
				capabilities = capabilities,
				handlers = handlers,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
