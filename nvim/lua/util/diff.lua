local highlight = vim.api.nvim_set_hl
local opt_local = vim.opt_local

local M = {}

-- Style when running in diff mode.
M.styling = function()
  if vim.opt.diff:get() then
    opt_local.colorcolumn = "0"
    highlight(0, "MatchParen", {})
    highlight(0, "Visual", { link = "VisualInDiff" })
    vim.cmd([[
      IndentBlanklineDisable!
      wincmd l
    ]])
  end
end

return M
