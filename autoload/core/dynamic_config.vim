"===============================================================================
" File: autoload/core/dynamic_config.vim
" Description: Stateless dynamic configuration manager (persists user UI toggles)
"===============================================================================

function! core#dynamic_config#set(key, vimscript_cmd) abort
    let l:dynamic_config_file = core#path#get()['cache'] .. '/dynamic_config.vim'
    let l:lines = core#file#read(l:dynamic_config_file)

    let l:prefix = '" ' . a:key . ': '
    let l:new_line = l:prefix . a:vimscript_cmd
    let l:updated_lines = []
    let l:found = 0

    for l:line in l:lines
        if l:line =~# '^' . escape(l:prefix, '.~*[]\^$')
            call add(l:updated_lines, l:new_line)
            let l:found = 1
        else
            call add(l:updated_lines, l:line)
        endif
    endfor

    if !l:found
        call add(l:updated_lines, l:new_line)
    endif

    silent call core#file#write(l:dynamic_config_file, l:updated_lines)
endfunction

function! core#dynamic_config#load() abort
    let l:dynamic_config_file = core#path#get()['cache'] .. '/dynamic_config.vim'
    let l:lines = core#file#read(l:dynamic_config_file)

    if empty(l:lines)
        return
    endif

    for l:line in l:lines
        if l:line =~# '^" [^:]\+: '
            let l:cmd = substitute(l:line, '^" [^:]\+: ', '', '')
            try
                execute l:cmd
            catch
                call core#message#display('Failed to apply config: ' . l:cmd, 4)
            endtry
        endif
    endfor

    if exists('*ui#transparency#apply')
        call ui#transparency#apply()
    endif
endfunction
