augroup CustomEvents
    " Note, 'autocmd!' is used to clear out any existing definitions in
    " this auto-group. This prevents duplicate entries upon a live ~/vimrc
    " reload.
    autocmd!

    " Style customizations.
    autocmd WinEnter * call window_traits#Activity(v:true)
    autocmd WinLeave * call window_traits#Activity(v:false)
    autocmd VimEnter * call diff#Styling()

    " Restore default Enter/Return behaviour for the command line window.
    autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>

    " Automatically equalize window splits.
    autocmd VimResized * wincmd =

    " Syntax highlight a minimum of 2,000 lines. This greatly helps scroll
    " performance.
    autocmd Syntax * syntax sync minlines=2000

    " Set filetypes for certain filenames.
    autocmd BufEnter gitconfig       set filetype=gitconfig
    autocmd BufEnter *.html.erb      set filetype=eruby
    autocmd BufEnter *.json.jbuilder set filetype=ruby
    autocmd BufEnter fonts.conf      set filetype=xml

    " Automatically open the quickfix window after executing a grep operation.
    autocmd QuickFixCmdPost grep cwindow

    " Auto-read external file changes, compliments the vim-auto-save plugin.
    autocmd CursorHold * silent! checktime

    " Auto-load session if it exists.
    autocmd VimEnter * nested
      \ if argc() == 0 && filereadable('Session.vim')|
      \     source Session.vim|
      \ endif
augroup END
