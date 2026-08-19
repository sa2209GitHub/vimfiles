"===============================================================================
" File: plugin/ui.vim
" Description: UI appearance & custom highlights
"===============================================================================

set fillchars+=vert:│

highlight SignColumn guibg=NONE ctermbg=NONE
highlight VertSplit guibg=NONE ctermbg=NONE guifg=#4a5568 ctermfg=239 gui=NONE
highlight WinSeparator guibg=NONE ctermbg=NONE guifg=#4a5568 ctermfg=239 gui=NONE
highlight CursorLine guibg=#2d3748 ctermbg=236 gui=bold

call ui#transparency#apply()
