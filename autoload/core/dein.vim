"===============================================================================
" File: autoload/core/dein.vim
" Description: Dein.vim plugin manager initialization and TOML configuration loader
"===============================================================================

function! core#dein#init() abort
    let l:paths = core#path#get()

    call core#message#display('Using cache path: ' .. l:paths['cache'], 0)

    try
        if !isdirectory(l:paths['cache'])
            call mkdir(l:paths['cache'], 'p')
        endif

        if &runtimepath !~# '/dein.vim'
            if !isdirectory(l:paths['dein_repo'])
                call core#message#display('Downloading the dein.vim plugin manager...', 1)
                execute '!git clone https://github.com/Shougo/dein.vim' shellescape(tr(l:paths['dein_repo'], '\', '/'))
            endif

            let l:clean_dein_path = substitute(fnamemodify(l:paths['dein_repo'], ':p'), '[/\\]$', '', '')
            execute 'set runtimepath^=' .. fnameescape(tr(l:clean_dein_path, '\', '/'))
        endif

        execute 'set runtimepath+=' .. fnameescape(tr(l:paths['dein_repo'], '\', '/'))

        if dein#load_state(l:paths['dein_base'])
            if !isdirectory(l:paths['plugins_start']) | call mkdir(l:paths['plugins_start'], 'p') | endif
            if !isdirectory(l:paths['plugins_lazy'])  | call mkdir(l:paths['plugins_lazy'], 'p')  | endif

            call dein#begin(l:paths['dein_base'])

            for l:toml in glob(l:paths['plugins_start'] .. '/*.toml', 0, 1)
                call dein#load_toml(l:toml, {'lazy': 0})
            endfor

            for l:toml in glob(l:paths['plugins_lazy'] .. '/*.toml', 0, 1)
                call dein#load_toml(l:toml, {'lazy': 1})
            endfor

            call dein#end()
            call dein#save_state()
        endif

        filetype indent plugin on

        if has('syntax')
            syntax on
        endif

        if dein#check_install()
            call core#message#display('Installing missing plugins...', 1)
            call dein#install()
        endif

        call core#message#display('Plugin manager successfully initialized.', 0)
    catch
        redraw!
        let l:error_desc = 'Plugin initialization failed! Error: ' .. v:exception
        call core#message#display(l:error_desc, 4)
    endtry
endfunction
