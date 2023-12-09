-- ## Whoa utilities
--
-- Various utility functions to use within AstroNvim and user configurations.
--
---@module whoa.utils
---@copyright 2023

local M = {}

-- Get an icon from internal icons if it is available and return it
---@param kind string Kind of icon in internal icons pack to retrieve
---@param padding? integer Padding to add at the end of the icon
---@param no_fallback? boolean Whether or not to disable fallback to text icon
---@return string icon
function M.get_icon(kind, padding, no_fallback)
	if not vim.g.icons_enabled and no_fallback then
		return ""
	end

	local icon_pack = vim.g.icons_enabled and "icons" or "text_icons"
	if not M[icon_pack] then
		M.icons = require("whoa-ui.icons.nerd")
		M.text_icons = require("whoa-ui.icons.text")
	end
	local icon = M[icon_pack] and M[icon_pack][kind]
	return icon and icon .. string.rep(" ", padding or 0) or ""
end

-- Merge extented options with a default table of options
---@param default? table Default table that you want to merge into
---@param opts? table New options that should be merged with the default table
---@return table # Merged table
function M.extend_opts(default, opts)
	opts = opts or {}
	return default and vim.tbl_deep_extend("force", default, opts) or opts
end

-- Create notification with Whoa title
---@param content string Notification body
---@param type? number Type of notification (:help vim.log.levels)
---@param opts? table Options to use (:help notify-options)
function M.notify(content, type, opts)
	vim.schedule(function()
		vim.notify(content, type, M.extend_opts({ title = "Whoa" }, opts))
	end)
end
