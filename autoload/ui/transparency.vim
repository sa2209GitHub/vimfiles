"===============================================================================
" File: autoload/ui/transparency.vim
" Description: Background transparency overrides for dark colorschemes
"===============================================================================

function! ui#transparency#apply() abort
    if &background ==# 'dark'
        highlight Normal guibg=NONE ctermbg=NONE
        highlight NormalNC guibg=NONE ctermbg=NONE
        highlight NonText guibg=NONE ctermbg=NONE

        highlight EndOfBuffer guibg=NONE ctermbg=NONE
        highlight LineNr guibg=NONE ctermbg=NONE
        highlight CursorLineNr guibg=NONE ctermbg=NONE

        highlight SignColumn guibg=NONE ctermbg=NONE
        highlight VertSplit guibg=NONE ctermbg=NONE guifg=#4a5568 ctermfg=239 gui=NONE
        highlight WinSeparator guibg=NONE ctermbg=NONE guifg=#4a5568 ctermfg=239 gui=NONE

        highlight Pmenu guibg=#282828 guifg=#ebdbb2
        highlight PmenuSel guibg=#458588 guifg=#fbf1c7 gui=bold
        highlight PmenuSbar guibg=#3c3836
        highlight PmenuThumb guibg=#a89984

        highlight TabLine guibg=NONE ctermbg=NONE
        highlight TabLineFill guibg=NONE ctermbg=NONE
        highlight TabLineSel guibg=#458588 guifg=#fbf1c7

        highlight NormalFloat guibg=#282828 guifg=#ebdbb2
        highlight FloatBorder guibg=#282828 guifg=#458588

        " highlight CyberSpaceComment guibg=NONE
        " highlight CyberSpaceConstant guibg=NONE
        " highlight CyberSpaceIdentifier guibg=NONE
        " highlight CyberSpaceFunction guibg=NONE
        " highlight CyberSpaceStatement guibg=NONE
        " highlight CyberSpaceKeyword guibg=NONE
        " highlight CyberSpaceOperator guibg=NONE
        " highlight CyberSpacePreProc guibg=NONE
        " highlight CyberSpaceType guibg=NONE
        " highlight CyberSpaceSpecial guibg=NONE
    endif
endfunction
