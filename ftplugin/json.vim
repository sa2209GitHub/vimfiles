"===============================================================================
" File: ftplugin/json.vim
" Description: Local settings for JSON files
"===============================================================================

if exists('b:did_ftplugin_json')
    finish
endif
let b:did_ftplugin_json = 1

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

let b:undo_ftplugin = 'setlocal ts< sts< sw< et<'
