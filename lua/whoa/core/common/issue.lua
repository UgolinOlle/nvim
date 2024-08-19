--- ## Issue module
--
-- Module for creating issues on Github.
--
-- @module issue
-- @copyright 2024

local M = {}

-- Function to create the issue popup
function M.ft_issue_popup()
  local buf = vim.api.nvim_create_buf(false, true)

  -- Options de la fenêtre
  local width = 60
  local height = 10
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 2,
    style = "minimal",
    border = "rounded",
    title = " Créer une nouvelle issue ",
    title_pos = "center",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Add the content to the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
    "Titre de l'issue:",
    "",
    "Description:",
    "",
    "",
    "",
    "[Créer]   [Annuler]",
  })

  -- Configuration of the buffer
  vim.api.nvim_set_option_value(buf, "modifiable", true)
  vim.api.nvim_set_option_value(buf, "buftype", "nofile")

  -- Mappings
  vim.api.nvim_buf_set_keymap(
    buf,
    "n",
    "<CR>",
    [[<cmd>lua require('issue_creator').ft_submit_issue()<CR>]],
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(buf, "n", "q", [[<cmd>q<CR>]], { noremap = true, silent = true })

  -- Save the window data
  vim.api.nvim_win_set_var(win, "issue_creator_win", { buf = buf, win = win })
end

-- Submit the issue
function M.ft_submit_issue()
  local win_data = vim.api.nvim_win_get_var(0, "issue_creator_win")
  local lines = vim.api.nvim_buf_get_lines(win_data.buf, 0, -1, false)

  local title = lines[2]
  local description = table.concat(vim.list_slice(lines, 4, 6), "\n")

  -- Ici, vous feriez votre appel API pour créer l'issue
  -- Par exemple :
  -- local success = api.create_issue(title, description)

  -- Pour cet exemple, nous allons simplement afficher les données
  print "Création d'une nouvelle issue:"
  print("Titre: " .. title)
  print("Description: " .. description)

  -- Fermer la fenêtre
  vim.api.nvim_win_close(win_data.win, true)
end

return M
