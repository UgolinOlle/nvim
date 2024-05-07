return function(_, opts)
  -- Autopairs check
  local active, npairs = pcall(require, "nvim-autopairs")
  if not active then return end

  -- CMP check
  local active, cmp = pcall(require, "cmp")
  if not active then return end

  -- If autopairs is not enabled, disable it
  if not vim.g.autopairs_enabled then npairs.disable() end

  -- CMP with autopairs
  cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
end
