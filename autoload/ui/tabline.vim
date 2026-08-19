"===============================================================================
" File: autoload/ui/tabline.vim
" Description: Tabline display mode switcher (Never -> Auto -> Always)
"===============================================================================

function! ui#tabline#toggle() abort
    let &showtabline = (&showtabline + 1) % 3

    let l:modes = {
                \ 0: 'Never',
                \ 1: 'Auto',
                \ 2: 'Always'
                \ }

    let l:mode = get(l:modes, &showtabline, 'Unknown')
    call core#dynamic_config#set('tabline', 'set showtabline=' . &showtabline)

    redraw
    echo 'Tabline Mode: ' . l:mode
endfunction
