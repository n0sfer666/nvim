# Спецификация: Полная перезапись конфига Neovim

## Контекст
Текущий конфиг основан на kickstart.nvim — содержит ~60% boilerplate-комментариев, дублирование конфигурации (gitsigns в двух местах, ibl в двух местах), мёртвый код (neo-tree отключён, debug.lua не используется, freemarker неактуален). Нужно добавить поддержку мобильной разработки (Swift/Kotlin) и модернизировать стек плагинов.

## Требования

### Функциональные

#### Языковая поддержка
- **Swift/iOS**: treesitter + sourcekit-lsp (системный, из Xcode) + swift-format через conform.nvim
- **Kotlin/Android**: treesitter + kotlin-language-server (через mason) + ktlint через conform.nvim
- **Веб-стек (основной)**: сохранить текущую поддержку JS/TS/React/CSS/SCSS с eslint, tsserver, jsonls, cssls, stylelint

#### Completion
- Заменить nvim-cmp на blink.cmp
- Убрать Codeium (AI completion)
- Сохранить LSP completion + path completion

#### Fuzzy finder
- Заменить Telescope на fzf-lua
- Маппинги: `sf` (files), `sg` (grep), `sh` (help), `sk` (keymaps), `s/` (buffer search), `s.` (recent), `sd` (diagnostics), `sb` (buffers)
- VimEnter: fzf-lua files при старте без файла

#### LSP навигация
- Нативный vim.lsp.buf для gd/gr/gI/gD (без fzf-lua/telescope)
- Маппинги: `<leader>rn` (rename), `<leader>ca` (code action), `<leader>D` (type definition), `<leader>ds` (document symbols), `<leader>ws` (workspace symbols)
- Сохранить document highlight (CursorHold) и inlay hints toggle

#### Файл-менеджер
- Только oil.nvim (убрать neo-tree)

#### Форматирование (conform.nvim)
- Lua: stylua
- JS/TS/JSX/TSX: eslint_d
- CSS/SCSS: prettier + stylelint
- Swift: swift-format
- Kotlin: ktlint
- Format-on-save для всех

#### Линтинг
- nvim-lint: stylelint для CSS/SCSS
- LSP-серверы в отдельном файле (nvim-lint.lua подход — настройка напрямую без mason)

#### UI
- Colorscheme: alabaster с кастомными хайлайтами (градиент номеров строк, прозрачность, диагностика)
- Убрать noice.nvim — оставить fidget.nvim для LSP-прогресса
- indent-blankline с rainbow-подсветкой (перенести из init.lua в ui.lua)
- which-key для подсказок
- render-markdown.nvim для рендера markdown в буфере

#### Редактирование
- mini.surround с кастомным JSX-оборачиванием
- nvim-autopairs + nvim-ts-autotag
- vim-sleuth (auto tabstop)
- todo-comments.nvim

#### Git
- gitsigns.nvim (с текущими маппингами: ]c/[c, hs/hr/hp/hb/hd)
- lazygit.nvim (`<leader>gg`)

#### Кириллица
- vim.opt.langmap для полной поддержки кириллицы в normal mode
- Убрать ручные оо/оО/ОО маппинги (langmap покроет)

#### Спеллчек
- Глобальный ru+en, camelCase, кастомный spellfile (как сейчас)

### Нефункциональные
- Максимум 200 строк на файл
- Без комментариев (кроме критичных)
- Без boilerplate
- Быстрый старт (lazy loading где возможно)

## Архитектура

### Структура файлов
```
~/.config/nvim/
├── init.lua              -- bootstrap lazy.nvim, require config/*
├── lua/
│   ├── config/
│   │   ├── options.lua   -- vim.opt, vim.g, langmap, spell
│   │   ├── keymaps.lua   -- базовые маппинги (Esc, splits, jj, visual move, буферы)
│   │   └── autocmds.lua  -- yank highlight, VimEnter fzf, undo path limit
│   └── plugins/
│       ├── editor.lua    -- oil, surround, autopairs, autotag, vim-sleuth, todo-comments
│       ├── ui.lua        -- alabaster, indent-blankline, which-key, fidget, render-markdown
│       ├── lsp.lua       -- lspconfig, mason, mason-lspconfig, mason-tool-installer, conform, lazydev
│       ├── lsp-servers.lua -- прямая настройка LSP-серверов (eslint, tsserver, jsonls, cssls, stylelint)
│       ├── completion.lua -- blink.cmp
│       ├── lint.lua      -- nvim-lint (stylelint)
│       ├── git.lua       -- gitsigns, lazygit
│       ├── treesitter.lua -- nvim-treesitter (auto_install, ensure: swift, kotlin, tsx, typescript, lua, etc.)
│       └── fuzzy.lua     -- fzf-lua
```

### Удаляемые файлы/плагины
- `lua/kickstart/` — весь каталог
- `lua/custom/` — весь каталог
- Плагины: telescope, plenary, nvim-cmp, luasnip, cmp-*, codeium, noice, nvim-dap, dap-ui, neo-tree, markdown-preview, freemarker
- `lua/kickstart/plugins/dump_keys.lua`

### Миграция
- lazy-lock.json: сгенерируется заново после `:Lazy sync`
- spell/all.utf-8.add: сохранить (кастомный словарь)
- doc/: можно удалить (сгенерируется)

### LSP-серверы через mason
| Сервер | Язык | Mason |
|--------|------|-------|
| lua_ls | Lua | ✅ |
| kotlin_language_server | Kotlin | ✅ |
| stylua | Lua (formatter) | ✅ |
| ktlint | Kotlin (formatter) | ✅ |

### LSP-серверы системные (без mason)
| Сервер | Язык | Установка |
|--------|------|-----------|
| sourcekit-lsp | Swift | Xcode (xcrun sourcekit-lsp) |
| eslint | JS/TS | npm |
| ts_ls | TS | npm |
| jsonls | JSON | npm |
| cssls | CSS | npm |
| stylelint_lsp | CSS linting | npm |

### Treesitter parsers (ensure_installed)
swift, kotlin, lua, typescript, tsx, javascript, html, css, scss, json, yaml, markdown, markdown_inline, vim, vimdoc, regex, bash

## UI/UX

### Сохраняемые хоткеи
| Хоткей | Действие |
|--------|----------|
| `jj` / `jJ` / `JJ` | Exit insert mode |
| `U` | Redo (Ctrl-r) |
| `-` | Oil (parent dir) |
| `<leader>gg` | LazyGit |
| `<leader>f` | Format buffer |
| `<leader>q` | Diagnostic quickfix |
| `<leader>rn` | LSP rename |
| `<leader>ca` | LSP code action |
| `<leader>th` | Toggle inlay hints |
| `<leader>rr` | Find & replace (убран, grug-far удалён) |
| `<leader>sf/sg/sh/sk/s./sd/sb/s/` | fzf-lua поиск |
| `<leader>hs/hr/hp/hb/hd/hD` | Git hunk operations |
| `]c` / `[c` | Navigate git hunks |
| `J` / `K` (visual) | Move lines |
| `<leader>bd` | Delete buffer |
| `<C-h/j/k/l>` | Window navigation |
| `gd/gr/gI/gD` | LSP navigation (нативный) |

### Удаляемые хоткеи
| Хоткей | Причина |
|--------|---------|
| `<leader>rr`, `<leader>R` | grug-far удалён |
| `<leader>mp` | markdown-preview удалён |
| `<leader>ss`, `<leader>sw`, `<leader>sr`, `<leader>sn`, `<leader>sS` | Не используются |
| `оо`, `оО`, `ОО` | Заменены на langmap |
| `F1-F7`, `<leader>b` (breakpoint) | DAP удалён |

## Edge Cases
- sourcekit-lsp требует Xcode CLI tools — если не установлен, mason-lspconfig не должен пытаться его поставить
- kotlin-language-server может быть медленным на больших Gradle-проектах — lazy load по ft
- langmap может конфликтовать с некоторыми плагинами (which-key) — проверить совместимость
- blink.cmp может не иметь codeium source (но AI убрано, неактуально)
- swift-format и ktlint могут быть не установлены — conform fallback на LSP

## Риски и митигации
| Риск | Вероятность | Митигация |
|------|-------------|-----------|
| langmap конфликты с which-key | Средняя | Тестирование, fallback на ручные маппинги |
| blink.cmp нестабильность | Низкая | Плагин зрелый, активно поддерживается |
| sourcekit-lsp не найден | Низкая | Проверка `xcrun --find sourcekit-lsp` в config |
| fzf-lua не покрывает все telescope use-cases | Низкая | Оставлены только используемые маппинги |
| Потеря функциональности при переписывании | Средняя | Backup текущего конфига, поэтапная миграция |

## Тестовая стратегия
- `:checkhealth` после миграции
- Проверить LSP attach для каждого языка: lua, ts, swift, kotlin, css, json
- Проверить format-on-save для каждого языка
- Проверить все хоткеи из таблицы «Сохраняемые хоткеи»
- Проверить langmap: hjkl, dd, yy, p в кириллической раскладке
- Проверить blink.cmp: LSP completion, path completion, snippet expansion
- Проверить startup time: `nvim --startuptime /tmp/nvim-startup.log`

## Открытые вопросы
- Нет
