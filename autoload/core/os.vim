"===============================================================================
" File: autoload/core/os.vim
" Description: OS detection utility (Windows, WSL, or generic Unix)
"===============================================================================

function! core#os#detect() abort
    if has('win32') || has('win64')
        return 'windows'
    elseif has('unix') && (!empty($WSL_DISTRO_NAME) || !empty($WSL_INTEROP))
        return 'wsl'
    else
        return 'unix'
    endif
endfunction
