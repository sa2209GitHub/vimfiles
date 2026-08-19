"===============================================================================
" File: plugin/mouse.vim
" Description: Mouse integration and terminal scroll support
"===============================================================================

set mouse=a

noremap <ScrollWheelUp>   3<C-e>
noremap <ScrollWheelDown> 3<C-y>
inoremap <ScrollWheelUp>   <C-o>3<C-e>
inoremap <ScrollWheelDown> <C-o>3<C-y>

function! ToggleMouse()
    if &mouse ==# 'a'
        set mouse=
        echo "Mouse disabled (Terminal Mode)"
    else
        set mouse=a
        echo "Mouse enabled (Vim Mode)"
    endif
endfunction

nnoremap <silent> <F12> :call ToggleMouse()<CR>
