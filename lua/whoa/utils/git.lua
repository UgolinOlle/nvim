--- ### Git module
--
-- Git related functions.
--
-- @module whoa.utils.git
-- @copyright 2024

-- Variables
local Git = { url = "https://github.com/" }

-- Execute git cmd
-- @param args string|table Git args
-- @param cwd? string Directory to run git command in (defaults to current working directory)
-- @return string|nil, boolean - Output of the command and a boolean indicating success
function Git.execute(args, cwd)
  if type(args) == "string" then args = { args } end
  cwd = cwd or vim.loop.cwd()
  local output = require("whoa.utils").execute(vim.list_extend({ "git", "-C", cwd }, args))
  local success = vim.v.shell_error == 0
  if not success then vim.api.nvim_err_writeln("Git command failed: " .. table.concat(args, " ")) end
  return output, success
end

-- Check if git is reachable.
-- @return boolean
function Git.available() return vim.fn.executable "git" == 1 end

-- Get the git client version.
-- @return table|nil - Table with version information or nil if git is not available.
function Git.version()
  if not Git.available() then return nil end
  local version = Git.execute "--version"
  if not version then return nil end
  return { major = tonumber(version:match "git version (%d+)"), raw = version }
end

-- Check if the current directory is a git repository.
-- @return boolean
function Git.is_repo()
  local result = Git.execute("rev-parse", "--is-inside-work-tree")
  return result and result:match "true" ~= nil
end

-- Fetch the current branch name.
-- @param remote string - Remote name
-- @return string - Branch name
function Git.fetch(remote, ...) return Git.execute({ "fetch", remote }, ...) end

return Git
