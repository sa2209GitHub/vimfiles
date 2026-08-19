"===============================================================================
" File: plugin/cursor.vim
" Description: Cursor positioning logic and scroll offset rules
"===============================================================================

" Jump to the last known cursor position when opening a file
augroup RestoreCursor
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                \ |   exe "normal! g`\""
                \ | endif
augroup END

set scrolloff=5
