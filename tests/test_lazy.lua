-- tests/test_lazy.lua
local helpers = require "test.functional.helpers"(after_each)
local assert = require "luassert"

describe("Lazy.nvim", function()
  before_each(function()
    -- Configurer Neovim avec lazy.nvim
    helpers.clear()
    vim.cmd "packadd lazy.nvim"
  end)

  it("should be loaded", function()
    -- Vérifie que le plugin lazy.nvim est chargé
    local is_loaded = vim.fn.exists ":Lazy" == 2
    assert.is_true(is_loaded, "lazy.nvim should be loaded")
  end)
end)
