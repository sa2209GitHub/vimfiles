"===============================================================================
" File: ftplugin/python.vim
" Description: Specific settings and mappings for Python files
"===============================================================================

if exists('b:did_ftplugin_python')
    finish
endif
let b:did_ftplugin_python = 1

" Соблюдение стандартов PEP 8 (4 пробела на табуляцию)
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab

" Ограничение длины строки (PEP 8) и визуальная колонка
setlocal textwidth=88
setlocal colorcolumn=89

" Настройка комментариев
setlocal formatoptions-=t formatoptions+=croql

" Сохранение b:undo_ftplugin для корректной очистки при смене типа файла
let b:undo_ftplugin = 'setlocal ts< sts< sw< et< tw< cc< fo<'

" Быстрый запуск текущего Python-скрипта по <leader>r
nnoremap <buffer> <leader>r :w<CR>:exec '!python' shellescape(@%, 1)<CR>

" Автоматически удаляем неиспользуемые импорты и исправляем правила Ruff перед сохранением
augroup RuffFixOnSave
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> silent! call CocAction('organizeImport')
augroup END
