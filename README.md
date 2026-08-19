# 🚀 Cross-Platform Modular Vim Configuration

Модульная, быстрая и полностью настраиваемая конфигурация Vim, оптимизированная для работы в **Windows Terminal**, **Linux** и **WSL**.

## ✨ Особенности

- **⚡ Менеджер плагинов:** Использование `dein.vim` с асинхронной автозагрузкой TOML-файлов.
- **🎨 Цвет:** Включен 24-битный TrueColor (`termguicolors`) с бесшовным восстановлением состояния терминала при выходе.
- **🧠 Автодополнение & LSP:** `coc.nvim` с поддержкой Python (`Pyright`), Shell/Bash (`bash-language-server`), JSON, YAML, TOML и PowerShell.
- **📁 Файловый менеджер:** Асинхронный и легкий `Fern.vim` вместо громоздкого NERDTree.
- **🛠 Автоматика:** Автоматическая перезагрузка конфигов при сохранении и автопересчет кэша плагинов.
- **🌍 Кроссплатформенность:** Автоопределение ОС для правильной работы путей и системного буфера обмена (`win32yank` на Windows/WSL и нативный `xclip`/`wl-clipboard` на Linux).

## 📥 Быстрый старт

### Windows
```powershell
git clone [https://github.com/ВАШ_USERNAME/vimfiles.git](https://github.com/ВАШ_USERNAME/vimfiles.git) $HOME/vimfiles
