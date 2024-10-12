return {
  'nanozuki/tabby.nvim',

  dependencies = { 'nvim-lualine/lualine.nvim' },

  config = function()
    require('tabby').setup({
      tabline = require('whoa.core.plugins.tabs.tabby-cfg'),
    })
  end
}
