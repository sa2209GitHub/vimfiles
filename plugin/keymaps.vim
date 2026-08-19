"===============================================================================
" File: plugin/keymaps.vim
" Description: Global keybindings & navigation shortcuts
"===============================================================================

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Window management
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>
nnoremap <leader>sc :close<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window resizing
nnoremap <A-h> :vertical resize -2<CR>
nnoremap <A-l> :vertical resize +2<CR>
nnoremap <A-k> :resize +2<CR>
nnoremap <A-j> :resize -2<CR>

" Buffer navigation
nnoremap <Tab>   :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Search & line editing
nnoremap <silent> <ESC> :noh<CR>

" Move visual selection up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep cursor centered during half-page scrolls
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Paste over visual selection without losing register contents
xnoremap <leader>p "_dP

" Custom UI toggles
nnoremap <silent> <F8> :call ui#colorscheme#switch(1)<CR>
nnoremap <silent> <S-F8> :call ui#colorscheme#switch(-1)<CR>
nnoremap <silent> <leader>tn :call ui#number#toggle()<CR>
nnoremap <silent> <leader>tt :call ui#tabline#toggle()<CR>
noremap <silent> <leader>ts :call ui#statusline#toggle()<CR>
