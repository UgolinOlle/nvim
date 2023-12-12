return {
	"Wansmer/symbol-usage.nvim",

	event = "BufReadPre",

	config = function()
		local status, susage = pcall(require, "symbol-usage")
		if not status then
			return
		end

		susage.setup()
	end,
}
