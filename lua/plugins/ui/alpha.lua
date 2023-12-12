return {
	"goolord/alpha-nvim",

	cmd = "Alpha",

	opts = function()
		local active, alpha = pcall(require, "alpha")
		if not active then
			return
		end

		return alpha
	end,

	config = require("plugins.configs.alpha"),
}
