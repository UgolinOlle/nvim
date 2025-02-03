local functions = require("whoa.core").WUtils
local notes = require("whoa.core").WNotes
local features = require("whoa.core").WFeatures

local ft_create_cmd, ft_reinstall, ft_issue, ft_switch_model =
  functions.ft_create_cmd, functions.ft_reinstall, functions.ft_issue, functions.ft_switch_model

local ft_features_cmd = features.ft_toggle_selected

local create_note_with_file = notes.create_note_with_file

--- Command to reinstall all plugins.
ft_create_cmd("WhoaReinstall", ft_reinstall)

--- Command to open an issue on Github
ft_create_cmd("WhoaIssue", ft_issue)

--- Command to switch ai model
ft_create_cmd("WhoaSwitchModel", function(opts) ft_switch_model(opts.args) end, { nargs = 1 })

--- Command to take a note with a file name
ft_create_cmd("WhoaTakeNote", function() create_note_with_file() end)

--- Command to list all notes in the default note directory
ft_create_cmd("WhoaListNotes", function() notes.list_notes_with_file() end)

--- Command to setup features in WhoaIDE
ft_create_cmd("WhoaFeatures", function() ft_features_cmd() end, { nargs = 0 })
