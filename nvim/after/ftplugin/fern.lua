local opt_local = vim.opt_local

opt_local.colorcolumn = "0"
opt_local.cursorline = true
opt_local.cursorlineopt = "both"
opt_local.number = false
opt_local.relativenumber = false
if vim.fn.has("nvim-0.9") == 1 then
  opt_local.statuscolumn = nil
end
