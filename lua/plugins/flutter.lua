return {
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"mfussenegger/nvim-dap",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = function()
			require("flutter-tools").setup({
				debugger = {
					enabled = false,
					run_via_dap = false,
					-- WINDOS CONFIGURATION!!!! REMOVE THE --
					-- register_configurations = function(paths)
					-- local dap = require("dap")

					-- dap.set_log_level("TRACE")

					-- local flutterBin = vim.fn.resolve(vim.fn.exepath("flutter.bat"))
					-- local flutterSdk = vim.fn.fnamemodify(flutterBin, ":h:h")
					-- local dartSdk = flutterSdk .. "\\bin\\cache\\dart-sdk"

					-- dap.adapters.dart = {
					-- type = "executable",
					-- command = flutterBin,
					-- args = { "-v", "debug-adapter" },
					-- options = {
					-- detached = false,
					-- },
					-- }

					-- dap.configurations.dart = {
					-- {
					-- type = "dart",
					-- request = "launch",
					-- name = "Launch Flutter",
					-- dartSdkPath = dartSdk,
					-- flutterSdkPath = flutterSdk,
					-- program = "${workspaceFolder}\\lib\\main.dart",
					-- cwd = "${workspaceFolder}",
					-- toolArgs = { "-d", "windows" },
					-- sendLogsToClient = true,
					-- },
					-- }
					-- end,
				},

				dev_log = {
					enabled = true,
					notify_errors = true, -- if there is an error whilst running then notify the user
					open_cmd = "belowright 8 split", -- command to use to open the log buffer
				},

				lsp = {
					color = { -- show the derived colours for dart variables
						enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
						background = true, -- highlight the background
						background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
						foreground = false, -- highlight the foreground
						virtual_text = true, -- show the highlight using virtual text
						virtual_text_str = "■", -- the virtual text character to highlight
					},
				},

				decorations = {
					statusline = {
						app_version = true,
						device = true,
						project_config = true,
					},
				},
			})
		end,
	},
}
