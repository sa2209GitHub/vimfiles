"===============================================================================
" File: autoload/core/file.vim
" Description: Safe file read and write utility functions
"===============================================================================

function! core#file#write(file_path, data) abort
    let l:normalized_path = tr(simplify(a:file_path), '/', '\')
    let l:dir = fnamemodify(l:normalized_path, ':h')

    if !isdirectory(l:dir)
        try
            call mkdir(l:dir, 'p')
            call core#message#display('Created directory: ' .. l:dir, 1)
        catch
            call core#message#display('Failed to create directory: ' .. l:dir .. '. System error: ' .. v:exception, 4)
            return 0
        endtry
    endif

    let l:lines = type(a:data) == v:t_list ? a:data : [string(a:data)]

    try
        call writefile(l:lines, l:normalized_path)
        let l:file_name = fnamemodify(l:normalized_path, ':t')
        call core#message#display('Successfully wrote data to: ' .. l:file_name, 2)
        return 1
    catch
        call core#message#display('Failed to write file: ' .. l:normalized_path .. '. System error: ' .. v:exception, 4)
        return 0
    endtry
endfunction

function! core#file#read(file_path) abort
    let l:normalized_path = tr(simplify(a:file_path), '/', '\')

    if !filereadable(l:normalized_path)
        return []
    endif

    try
        return readfile(l:normalized_path)
    catch
        call core#message#display('Failed to read file: ' .. l:normalized_path .. '. System error: ' .. v:exception, 4)
        return []
    endtry
endfunction
