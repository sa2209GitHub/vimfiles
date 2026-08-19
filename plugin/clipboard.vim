"===============================================================================
" File: plugin/clipboard.vim
" Description: Dynamic cross-platform system clipboard integration
"===============================================================================

if exists('g:loaded_custom_clipboard')
    finish
endif

let g:loaded_custom_clipboard = 1

set clipboard=unnamed,unnamedplus

let s:os = core#os#detect()

if s:os ==# 'windows' || s:os ==# 'wsl'
    if executable('win32yank.exe')
        let g:clipboard = {
                    \   'name': 'win32yank',
                    \   'copy': {
                    \     '+': 'win32yank.exe -i --crlf',
                    \     '*': 'win32yank.exe -i --crlf',
                    \   },
                    \   'paste': {
                    \     '+': 'win32yank.exe -o --lf',
                    \     '*': 'win32yank.exe -o --lf',
                    \   },
                    \   'cache_enabled': 0,
                    \ }
    endif
elseif s:os ==# 'unix'
    if has('macunix') || has('mac')
        let g:clipboard = {
                    \   'name': 'pbcopy',
                    \   'copy': {
                    \     '+': 'pbcopy',
                    \     '*': 'pbcopy',
                    \   },
                    \   'paste': {
                    \     '+': 'pbpaste',
                    \     '*': 'pbpaste',
                    \   },
                    \   'cache_enabled': 0,
                    \ }
    elseif !empty($WAYLAND_DISPLAY) && executable('wl-copy')
        let g:clipboard = {
                    \   'name': 'wl-clipboard',
                    \   'copy': {
                    \     '+': 'wl-copy --type text/plain --primary',
                    \     '*': 'wl-copy --type text/plain',
                    \   },
                    \   'paste': {
                    \     '+': 'wl-paste --no-newline --primary',
                    \     '*': 'wl-paste --no-newline',
                    \   },
                    \   'cache_enabled': 1,
                    \ }
    elseif executable('xclip')
        let g:clipboard = {
                    \   'name': 'xclip',
                    \   'copy': {
                    \     '+': 'xclip -quiet -selection clipboard',
                    \     '*': 'xclip -quiet -selection primary',
                    \   },
                    \   'paste': {
                    \     '+': 'xclip -quiet -selection clipboard -o',
                    \     '*': 'xclip -quiet -selection primary -o',
                    \   },
                    \   'cache_enabled': 1,
                    \ }
    endif
endif
