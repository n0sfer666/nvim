# Neovim Config

Персональная конфигурация Neovim, переписанная с нуля (ранее на базе kickstart.nvim).

## Стек
- Neovim 0.11+
- lazy.nvim (менеджер плагинов)
- blink.cmp (completion)
- fzf-lua (fuzzy finder)
- oil.nvim (файл-менеджер)
- conform.nvim (форматирование)
- nvim-lint (линтинг)
- mason.nvim (установка LSP/форматтеров)

## Поддерживаемые языки
- **Lua**: lua_ls (mason) + stylua
- **JS/TS/React**: eslint + ts_ls + eslint_d (системные, npm)
- **CSS/SCSS**: cssls + stylelint + prettier (системные, npm)
- **Swift**: sourcekit-lsp (Xcode) + swift-format
- **Kotlin**: kotlin_language_server (mason) + ktlint
- **JSON**: jsonls (системный, npm)
