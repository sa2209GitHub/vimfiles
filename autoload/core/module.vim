"===============================================================================
" File: autoload/core/module.vim
" Description: Helper module for sourcing external VimScript components
"===============================================================================

function! core#module#load(file_path, success_level, error_level) abort
    let l:normalized_path = simplify(a:file_path)
    let l:file_name = fnamemodify(l:normalized_path, ':t')

    try
        execute 'source ' .. fnameescape(l:normalized_path)
        call core#message#display('Module loaded: ' .. l:file_name, a:success_level)
    catch
        let l:error_desc = 'Failed to load module ' .. l:file_name .. '. System error: ' .. v:exception
        call core#message#display(l:error_desc, a:error_level)
    endtry
endfunction
