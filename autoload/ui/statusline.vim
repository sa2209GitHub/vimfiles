"===============================================================================
" File: autoload/ui/statusline.vim
" Description: Statusline display mode switcher (Never -> Auto -> Always -> Global)
"===============================================================================

function! ui#statusline#toggle() abort
    let l:max_mode = has('nvim-0.7') ? 3 : 2
    let &laststatus = (&laststatus + 1) % (l:max_mode + 1)

    let l:modes = {
                \ 0: 'Never',
                \ 1: 'Auto',
                \ 2: 'Always',
                \ 3: 'Global'
                \ }

    let l:mode = get(l:modes, &laststatus, 'Unknown')
    call core#dynamic_config#set('statusline', 'set laststatus=' . &laststatus)

    redraw
    echo 'Statusline Mode: ' . l:mode
endfunction
