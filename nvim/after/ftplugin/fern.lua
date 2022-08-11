local fn = vim.fn
local opt_local = vim.opt_local

opt_local.colorcolumn = "0"
opt_local.cursorline = true
if fn.exists("&cursorlineopt") == 1 then
  opt_local.cursorlineopt = "both"
end
opt_local.number = false
opt_local.relativenumber = false
