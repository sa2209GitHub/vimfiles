"===============================================================================
" File: autoload/core/path.vim
" Description: Directory structure provider for cache and plugin paths
"===============================================================================

function! core#path#get() abort
    let l:os = core#os#detect()
    let l:paths = {}

    if l:os ==# 'windows'
        let l:user_home = empty($HOME) ? $USERPROFILE : $HOME
        let l:paths['home'] = simplify(l:user_home .. '/vimfiles')
    else
        let l:paths['home'] = simplify($HOME .. '/.vim')
    endif

    if l:os ==# 'windows'
        let l:paths['cache'] = l:paths['home'] .. '/.cache'
    else
        let l:cache_base = empty($XDG_CACHE_HOME) ? $HOME .. '/.cache' : $XDG_CACHE_HOME
        let l:paths['cache'] = simplify(l:cache_base .. '/vim')
    endif

    let l:paths['dein_base'] = l:paths['cache'] .. '/dein'
    let l:paths['dein_repo'] = l:paths['dein_base'] .. '/repos/github.com/Shougo/dein.vim'
    let l:paths['plugins_start'] = l:paths['home'] .. '/dein/start'
    let l:paths['plugins_lazy'] = l:paths['home'] .. '/dein/lazy'

    return l:paths
endfunction
