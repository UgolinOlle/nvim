return {
	"mfussenegger/nvim-dap",

	event = "User AstroFile",

	dependencies = {
		{
			"jay-babu/mason-nvim-dap.nvim",

			dependencies = { "nvim-dap" },

			cmd = { "DapInstall", "DapUninstall" },

			opts = { handlers = {} },
		},
		{
			"rcarriga/nvim-dap-ui",

			opts = { floating = { border = "rounded" } },

			config = require("plugins.configs.dap-ui"),
		},
		{
			"rcarriga/cmp-dap",

			dependencies = { "nvim-cmp" },

			config = require("plugins.configs.cmp-dap"),
		},
	},

	config = function()
		local active, dap = pcall(require, "dap")
		if not active then
			return
		end

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "/Users/ugolin-olle/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.cpp = {
			{
				name = "CPP debugger",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.c = dap.configurations.cpp
	end,
}
