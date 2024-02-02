return {
	"mfussenegger/nvim-lint",

	lazy = true,

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local status, lint = pcall(require, "lint")
		if not status then
			return
		end

		lint.linters.norminette = {
			cmd = "norminette",
		}

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "pylint" },
			lua = { "luacheck" },
			codespell = { "codespell" },
			dotenv = { "dotenv_linter" },
			c = { "norminette" },
		}

		local lint_autogroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_autogroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<LEADER>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
