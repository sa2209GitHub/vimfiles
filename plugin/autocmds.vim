"===============================================================================
" File: plugin/autocmds.vim
" Description: Core autocommands for hot-reloading and environment fixes
"===============================================================================

augroup DeinAutoRecache
    autocmd!
    autocmd BufWritePost */dein/*.toml call dein#recache_runtimepath() | redraw | call core#message#display('Dein cache reloaded automatically.', 2)
augroup END

" Restore terminal state properly on exit
augroup FixTerminalLeave
    autocmd!
    autocmd VimLeave * set mouse= | echon "\<Esc>[?1049l\<Esc>[?1000l\<Esc>[0 q"
augroup END

" Live configuration reload on save (excludes cache files)
augroup VimConfigReload
    autocmd!
    autocmd BufWritePost *.vim,vimrc
                \ if expand('<afile>:p') !~# '[/\\]\.cache[/\\]' |
                \    try |
                \      source <afile> |
                \      redraw |
                \      call core#message#display('Reloaded config: ' .. fnamemodify(expand('<afile>'), ':t'), 2) |
                \    catch |
                \      call core#message#display('Failed to reload config: ' .. v:exception, 4) |
                \    endtry |
                \ endif
augroup END

augroup AutoTransparency
    autocmd!
    autocmd ColorScheme * call ui#transparency#apply()
augroup END
