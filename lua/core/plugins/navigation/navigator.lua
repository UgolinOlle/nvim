return {
	"ray-x/navigator.lua",

	dependencies = {
		{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
		"neovim/nvim-lspconfig",
	},

	config = function()
		local status, navigator = pcall(require, "navigator")
		if not status then
			return
		end

		navigator.setup()
	end,
}
