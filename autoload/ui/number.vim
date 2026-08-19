"===============================================================================
" File: autoload/ui/number.vim
" Description: Line number display mode switcher (Relative -> None -> Absolute)
"===============================================================================

function! ui#number#toggle() abort
    if &number && !&relativenumber
        set relativenumber
        let l:mode = 'Relative'
        let l:cmd = 'set number relativenumber'
    elseif &relativenumber
        set nonumber norelativenumber
        let l:mode = 'Disabled'
        let l:cmd = 'set nonumber norelativenumber'
    else
        set number norelativenumber
        let l:mode = 'Absolute'
        let l:cmd = 'set number norelativenumber'
    endif

    call core#dynamic_config#set('number', l:cmd)

    redraw
    echo 'Line Numbering: ' . l:mode
endfunction
