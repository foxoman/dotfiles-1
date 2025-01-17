local fn = vim.fn
local opt_local = vim.opt_local

opt_local.formatoptions = "tcqj"
-- Options for 'gf' to successfully operate on local Lua 'require' statements.
opt_local.includeexpr = "substitute(v:fname, '\\.', '/', 'g')"
opt_local.path:prepend(fn.expand("~/dotfiles/nvim/lua"))
opt_local.suffixesadd:prepend(".lua")
