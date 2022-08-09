local cmd = vim.cmd
local fn = vim.fn

-------------------------------------------------------------
-- OPTIONS
-------------------------------------------------------------
require("custom.options")


-------------------------------------------------------------
-- FUNCTIONS
--
-- ~/dotfiles/nvim/autoload - custom functions
-------------------------------------------------------------


-------------------------------------------------------------
-- MAPPINGS
-------------------------------------------------------------
require("custom.mappings")


-------------------------------------------------------------
-- PLUGINS
-------------------------------------------------------------
require("plugin.packer")

-------------------------------------------------------------
-- AUTOCMDS
-------------------------------------------------------------
cmd([[runtime custom/autocmds.vim]])
    -- ~/dotfiles/nvim/ftplugin       - file type options, mappings
    -- ~/dotfiles/nvim/after/ftplugin - file type overrides


-------------------------------------------------------------
-- COLOR SCHEME
-------------------------------------------------------------
if fn.filereadable(fn.expand("~/.colorscheme")) == 1 then
  cmd([[colorscheme ]] .. fn.readfile(fn.expand('~/.colorscheme'))[1])
else
  cmd([[colorscheme moonfly]])
end
