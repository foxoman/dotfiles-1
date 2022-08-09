local map = vim.keymap.set

map("n",
    "<Plug>(fern-my-open-expand-collapse)",
    'fern#smart#leaf("<Plug>(fern-action-open:select)", "<Plug>(fern-action-expand)", "<Plug>(fern-action-collapse)")',
    { buffer = true, expr = true })

local opts = { buffer = true }
map("n", "<CR>", "<Plug>(fern-my-open-expand-collapse)", opts)
map("n", "<2-LeftMouse>", "<Plug>(fern-my-open-expand-collapse)", opts)
map("n", "m", "<Plug>(fern-action-mark:toggle)j", opts)
map("n", "N", "<Plug>(fern-action-new-file)", opts)
map("n", "K", "<Plug>(fern-action-new-dir)", opts)
map("n", "D", "<Plug>(fern-action-remove)", opts)
map("n", "M", "<Plug>(fern-action-move)", opts)
map("n", "R", "<Plug>(fern-action-rename)", opts)
map("n", "s", "<Plug>(fern-action-open:split)", opts)
map("n", "v", "<Plug>(fern-action-open:vsplit)", opts)
map("n", "r", "<Plug>(fern-action-reload)", opts)

local opts = { buffer = true, nowait = true}
map("n", "d", "<Plug>(fern-action-hidden:toggle)", opts)
map("n", "<", "<Plug>(fern-action-leave)", opts)
map("n", ">", "<Plug>(fern-action-enter)", opts)

-- Automatically trigger a reload when entering the fern window.
vim.cmd([[
  augroup FernTypeEvents
      autocmd! * <buffer>
      autocmd BufEnter <buffer> silent execute "normal \<Plug>(fern-action-reload)"
  augroup END
]])