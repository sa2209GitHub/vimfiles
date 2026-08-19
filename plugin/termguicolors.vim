"===============================================================================
" File: plugin/termguicolors.vim
" Description: TrueColor (24-bit) & 256-color terminal fallback initialization
"===============================================================================

if exists('g:loaded_custom_termguicolors')
    finish
endif

let g:loaded_custom_termguicolors = 1

if has('termguicolors') && &term !~# 'linux'
    set termguicolors
else
    set t_Co=256
endif
