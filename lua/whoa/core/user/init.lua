local user_dir = vim.fn.stdpath "config" .. "/user"

-- Vérifie si le dossier existe
if vim.fn.isdirectory(user_dir) == 0 then
  -- Crée le dossier s'il n'existe pas
  vim.fn.mkdir(user_dir, "p")
  print("Dossier 'user' créé à : " .. user_dir)
end
