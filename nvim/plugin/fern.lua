local g = vim.g
local map = vim.keymap.set

g["fern#disable_default_mappings"] = 1
g["fern#disable_drawer_smart_quit"] = 1
g["fern#mark_symbol"] = "●"
g["fern#renderer#default#collapsed_symbol"] = "▷ "
g["fern#renderer#default#expanded_symbol"] = "◢ "
g["fern#renderer#default#leading"] = " "
g["fern#renderer#default#leaf_symbol"] = " "
g["fern#renderer#default#root_symbol"] = "~ "

local opts = { silent = true }
map("n", "<Leader>d", ":Fern . -drawer -width=35 -toggle<CR><C-w>=", opts)
map("n", "<Leader>f", ":Fern . -drawer -reveal=% -width=35<CR><C-w>=", opts)
map("n", "<Leader>.", ":Fern %:h -drawer -width=35<CR><C-w>=", opts)

-- Disable Netrw.
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

-- Let fern handle directory paths instead of Netrw.
vim.cmd([[
  augroup FernPluginEvents
      autocmd!
      autocmd BufEnter * ++nested call tree#Open()
  augroup END
]])