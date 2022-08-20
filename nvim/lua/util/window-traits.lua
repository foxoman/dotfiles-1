local buf_get_option = vim.api.nvim_buf_get_option
local opt = vim.opt
local opt_local = vim.opt_local

local M = {}

-- Render active windows differently to inactive windows.
--
-- In inactive windows disable the following traits: color column, relative line
-- numbers and sign column.
M.activity = function(active)
  if opt.diff:get() or buf_get_option(0, "buftype") == "nofile" then
    -- Do nothing for diffs or 'nofile' buffer types.
    return
  end

  if active then -- Active window
    opt_local.colorcolumn = "81,82"
    opt_local.cursorline = true
    -- Set relative numbering, except for help files.
    if buf_get_option(0, "filetype") ~= "help" then
      opt_local.relativenumber = true
    end
    opt_local.signcolumn = "number"
  else -- Inactive window
    opt_local.colorcolumn = "0"
    opt_local.cursorline = false
    opt_local.relativenumber = false
    opt_local.signcolumn = "no"
  end
end

return M