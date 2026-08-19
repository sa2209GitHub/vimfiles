"===============================================================================
" File: autoload/core/message.vim
" Description: Formatted notification printer with log severity levels
"===============================================================================

function! core#message#display(message, level) abort
    if a:level == 0
        return
    endif

    echohl None

    if a:level == 1
        echomsg "[Info] " .. a:message
    elseif a:level == 2
        echohl MoreMsg
        echomsg '[Success] ' .. a:message
    elseif a:level == 3
        echohl WarningMsg
        echomsg '[Warning] ' .. a:message
    elseif a:level == 4
        echohl ErrorMsg
        echomsg '[Error] ' .. a:message
    else
        echohl ErrorMsg
        echomsg '[CRITICAL] ' .. a:message
        throw 'VIM_CRITICAL_INIT_ERROR'
        echohl None
    endif

    echohl None
endfunction
