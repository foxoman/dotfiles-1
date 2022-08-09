local g = vim.g
local map = vim.keymap.set
local expr_opts = { expr = true }
local silent_opts = { silent = true, remap = true }

-------------------------------
-- Leader
-------------------------------
g.mapleader = ','

-------------------------------
-- General mappings
-------------------------------
-- Enter command mode via ';'
map({ "n", "x" }, ";", ":")
-- Make dot work on visual line selections.
map("x", ".", ":norm.<CR>")
-- U for redo, the opposite of u for undo.
map("n", "U", "<C-r>")
-- 'qq' starts a macro recording, 'q' stops it, Q runs the macro.
map("n", "Q", "@q")
-- Execute macro 'q' over the visual selection.
map("x", "Q", ":'<,'> :normal @q<CR>")
-- Map 'p' to 'P' in visual mode since 'P' will never yank the pasted-over-text
-- into the unnamed register.
map("x", "p", "P")
-- Confirm quit.
map("n", "<C-q>", ":confirm qall<CR>", silent_opts)
-- Make escape work in the Neovim terminal.
map("t", "<Esc>", "<C-\\><C-n>")
-- Make Ctrl-i work in Neovim as a separate key combination from TAB. Refer
-- to https://is.gd/ZT9gzN and to the Alacritty config 'key_bindings'.
map("n", "<C-i>", "<C-i>")
-- Direct changes into the black hole register.
map("n", "c", '"_c')
map("n", "C", '"_C')
-- Wild menu is set to popup menu, it is best to invert the meaning of
-- up/down and left/right keys since this will be more natural
map("c", "<Up>", "pumvisible() ? '<Left>' : '<Up>'", expr_opts)
map("c", "<Down>", "pumvisible() ? '<Right>' : '<Down>'", expr_opts)
map("c", "<Left>", "pumvisible() ? '<Up>' : '<Left>'", expr_opts)
map("c", "<Right>", "pumvisible() ? '<Down>' : '<Right>'", expr_opts)

-------------------------------
-- Helper mappings
-------------------------------
-- Insert from the clipboard register.
-- Note, use Control-q for virtual insertion (e.g insert a real tab).
map("i", "<C-v>", "<C-r>+")
-- Begin a new line above the current cursor position.
map("i", "<C-u>", "<C-o>O")
-- Fix syntax and redraw the screen.
map("n", "<C-l>", ":syntax sync fromstart<CR>:redraw<CR>")
-- Clone paragraph.
map("n", "cp", "yap<S-}>p")
-- Format current paragraph in normal mode.
map("n", "qp", "gqip$")
-- Format current line.
map("n", "qj", "gqj")
-- Paste from the yank register
map("n", "<Leader>p", '"0p')
map("n", "<Leader>P", '"0P')
-- Fold the current indent.
map("n", "<Leader>z", "zazz")
-- Expand all folds.
map("n", "<Leader>Z", ":set nofoldenable<CR>")
-- Toggle crosshair, aka cusorcolumn & cursorline.
map("n", "<Leader>X", ":call crosshair#Toggle()<CR>")
-- Maximise the current file into a standalone new tab.
map("n", "<Leader>m", ":tab split<CR>", silent_opts)
-- Show introduction message.
map("n", "<Leader>i", ":intro<CR>")
-- Preserve visual selection when shifting.
map("x", "<", "<gv")
map("x", ">", ">gv")

-------------------------------
-- Navigation mappings
-------------------------------
map("n", "<Tab>", "<C-w>w")
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")
-- Use same mappings as above to navigate Neovim terminal splits.
map("t", "<A-h>", "<C-\\><C-N><C-w>h")
map("t", "<A-j>", "<C-\\><C-N><C-w>j")
map("t", "<A-k>", "<C-\\><C-N><C-w>k")
map("t", "<A-l>", "<C-\\><C-N><C-w>l")
-- Vertical movements.
map("n", "<C-j>", "10j")
map("n", "<C-k>", "10k")
-- Move vertically by visual line unless preceded by a count. If a movement is
-- greater than 5 then automatically add to the jumplist.
map("n", "j", "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'j' : 'gj'", expr_opts)
map("n", "k", "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'k' : 'gk'", expr_opts)
-- Navigate buffers via 'wildmenu'.
map("n", "<Leader><Tab>", ":buffer<Space><Tab>")
-- Alternate the last two files.
map("n", "<Backspace>", "<C-^>")

-------------------------------
-- Paired mappings
-------------------------------
map("n", "{", "{zz")
map("n", "}", "}zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "[c", "[czz")
map("n", "]c", "]czz")
map("n", "[j", "<C-o>zz")
map("n", "]j", "<C-i>zz")
map("n", "[s", "[szz")
map("n", "]s", "]szz")
map("n", "[z", "zH")
map("n", "]z", "zL")

-------------------------------
-- Scroll mappings
-------------------------------
map("n", "<C-Up>", "<C-e>")
map("n", "<C-Down>", "<C-y>")

-------------------------------
-- Window managment mappings
-------------------------------
map("n", "<Leader>s", "<C-w>s")
map("n", "<Leader>v", "<C-w>v")
map("n", "<Leader>-", ":botright new<CR><C-w>=", silent_opts)
map("n", "<Leader>|", ":botright vnew<CR><C-w>=", silent_opts)
map("n", "<Leader>t", ":$tabnew<CR>", silent_opts)
map("n", "<Leader>q", "<C-w>c")
map("n", "<Leader>Q", ":tabclose<CR>", silent_opts)
map("n", "<Leader>c", ":cclose<CR>:lclose<CR>:pclose<CR>", silent_opts)
map("n", "<Leader>1", "1gt")
map("n", "<Leader>2", "2gt")
map("n", "<Leader>3", "3gt")
map("n", "<Leader>4", "4gt")
map("n", "<Leader>5", "5gt")
map("n", "<Leader>6", "6gt")
map("n", "<Leader>7", "7gt")
map("n", "<Leader>8", "8gt")
map("n", "<Leader>9", "9gt")
map("n", "<Leader>=", "<C-w>=")
map("n", "<Leader>r", "<C-w>r")
map("n", "<Leader>T", ":botright new<CR><C-w>=:terminal<CR>", silent_opts)

-------------------------------
-- Function key mappings
-------------------------------
map("n", "<F1>", ":TSHighlightCapturesUnderCursor<CR>")
map("n", "'1", ":TSHighlightCapturesUnderCursor<CR>")
map("n", "<F2>", ":w<CR>")
map("n", "'2", ":w<CR>")
map("n", "<F3>", ":%retab<CR>:%s/\\s\\+$//<CR>")
map("n", "'3", ":%retab<CR>:%s/\\s\\+$//<CR>")
map("n", "<F4>", ":%s/ /_<CR>")
map("n", "'4", ":%s/ /_<CR>")
map("n", "<F5>", ":call spelling#Toggle()<CR>")
map("n", "'5", ":call spelling#Toggle()<CR>")
map("n", "<F6>", ":call diagnostics#Toggle()<CR>")
map("n", "'6", ":call diagnostics#Toggle()<CR>")
map("n", "<F7>", ":set lazyredraw!<CR>:call AutoSaveToggle()<CR>")
map("n", "'7", ":set lazyredraw!<CR>:call AutoSaveToggle()<CR>")
map("n", "<F8>", ":set wrap!<CR>")
map("n", "'8", ":set wrap!<CR>")
map("n", "<F9>", ":set hlsearch!<CR>")
map("n", "'9", ":set hlsearch!<CR>")
map("n", "<F10>", ":call listchars#Toggle()<CR>", silent_opts)
map("n", "'0", ":call listchars#Toggle()<CR>", silent_opts)

-------------------------------
-- Completion mappings
-------------------------------

--   ]     - 'tags' file completion
--   Space - context aware omni completion (via 'omnifunc' setting)
--   b     - keyword completion from the current buffer (<C-n><C-b> to extend)
--   d     - dictionary completion (via 'dictionary' setting)
--   f     - file path completion
--   l     - line completion (repeat an existing line)
map("i", "<C-]>", "<C-x><C-]>")
map("i", "<C-Space>", "<C-x><C-o>")
map("i", "<C-b>", "<C-x><C-p>")
map("i", "<C-d>", "<C-x><C-k>")
map("i", "<C-f>", "<C-x><C-f>")
map("i", "<C-l>", "<C-x><C-l>")
--   s - snippet completion
-- Refer to ~/dotfiles/nvim/lua/vsnip-config.lua:

-------------------------------
-- Increment and decrement mappings
-------------------------------
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")
map("x", "+", "g<C-a>")
map("x", "-", "g<C-x>")

-------------------------------
-- Readline-like mappings
-------------------------------

-- Ctrl-a - go to the start of line
-- Ctrl-e - go to the end of the line
map("n", "<C-a>", "0")
map("n", "<C-e>", "$")
map("i", "<C-a>", "<C-o>0")
map("i", "<C-e>", "<C-o>$")
map("c", "<C-a>", "<Home>")
map("c", "<C-e>", "<End>")
-- Alt-b  - back a word
-- Alt-f  - forward a word
-- Alt-BS - delete backward word
-- Alt-d  - delete forward word
map("i", "<A-b>", "<C-Left>")
map("i", "<A-f>", "<C-Right>")
map("i", "<A-BS>", "<C-w>")
map("i", "<A-d>", "<C-o>dw")
map("c", "<A-b>", "<C-Left>")
map("c", "<A-f>", "<C-Right>")
map("c", "<A-BS>", "<C-w>")
map("c", "<A-d>", "<C-Right><C-w>")

-------------------------------
-- Grep mappings
-------------------------------
map("n", "<Leader>/", ":silent grep<Space>")
map("n", "gs", ":silent grep <C-r><C-w><CR>")
map("x", "gs", '"sy:silent grep <C-r>s<CR>')

-------------------------------
-- Find & replace helpers
-------------------------------

-- Star search that does not move forward to the next match
map("n", "g*", ":let @/='\\<'.expand('<cword>').'\\>'<CR>", silent_opts)
map("x", "g*", '"sy:let @/=@s<CR>', silent_opts)

-- Find that does an immediate replace on the match.
map("n", "\\c", ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn")
map("x", "\\c", '"sy:let @/=@s<CR>cgn')

-- Accept/reject helpers after completing a \c cgn-based find & replace
-- operation.
--
-- Go to the next find match and highlight it.
map("n", "<CR>", "gnzz")
-- Accept the change and go to the next match and highlight it.
map("x", "<CR>", ".<Esc>gnzz", { remap = true })
-- Reject the change and go to the next match and highlight it.
map("x", "!", "<Esc>ngnzz")

-- Find and replace within the current file.
map("n", "\\s", ":%s/<C-r><C-w>//<Left>")
map("x", "\\s", '"sy:%s/<C-r>s//<Left>')

-- Project-wide find and replace using grep.
map("n", "\\S", [[
  :let @s='\\<'.expand('<cword>').'\\>'<CR>
  :let &grepprg=&grepprg . ' -w'<CR>
  :silent grep <C-r><C-w><CR>
  :let &grepprg='rg --vimgrep --smart-case'<CR>
  :cfdo %s/<C-r>s// \\| update
  <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
]])

map("x", "\\S", [[
  "sy\|
  :silent grep <C-r>s<CR>
  :cfdo %s/<C-r>s// \\| update
  <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
]])