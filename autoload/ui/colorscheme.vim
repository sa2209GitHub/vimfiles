"===============================================================================
" File: autoload/ui/colorscheme.vim
" Description: Cyclic colorscheme switcher with state auto-persistence
"===============================================================================

function! ui#colorscheme#switch(direction) abort
    let l:schemes = getcompletion('', 'color')

    if empty(l:schemes)
        return
    endif

    let l:current = get(g:, 'colors_name', 'default')
    let l:index = index(l:schemes, l:current)
    if l:index == -1 | let l:index = 0 | endif

    let l:total = len(l:schemes)
    let l:next_index = a:direction >= 0
                \ ? (l:index + 1) % l:total
                \ : (l:index - 1 + l:total) % l:total

    let l:next_scheme = l:schemes[l:next_index]

    execute 'colorscheme ' . l:next_scheme

    redraw
    echo 'Colorscheme [' . (l:next_index + 1) . '/' . l:total . ']: ' . l:next_scheme
    call core#dynamic_config#set('colorscheme', 'colorscheme ' . l:next_scheme)
endfunction
