return function(_, opts)
	local active, alpha = pcall(require, "alpha")
	if not active then
		return
	end

	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		desc = "Add Whoa dashboard footer",
		once = true,

		callback = function()
			local stats = require("lazy").stats()
			local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
			opts.section.footer.val = { "Whoa loaded " .. stats.count .. " plugins  in " .. ms .. "ms" }
			pcall(vim.cmd.AlphaRedraw)
		end,
	})
end
