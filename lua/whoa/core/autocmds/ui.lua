-- Variables
local autocmd = vim.api.nvim_create_autocmd

autocmd("ModeChanged", {
  callback = function()
    local mode = vim.fn.mode()
    if mode == "n" then
      vim.cmd [[ hi StatusLine guifg=#FFFFFF guibg=#007ACC ]]
    elseif mode == "i" then
      vim.cmd [[ highlight StatusLine guifg=#FFFFFF guibg=#009688 ]]
    elseif mode == "v" or mode == "V" then
      vim.cmd [[ hi StatusLine guifg=#FFFFFF guibg=#D32F2F ]]
    else
      vim.cmd [[ hi StatusLine guifg=#FFFFFF guibg=#3F51B5 ]]
    end
  end,
})
