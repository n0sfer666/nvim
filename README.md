# nvim

Персональная конфигурация Neovim. Переписана с нуля (ранее на базе [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)).

## Стек

- **Neovim** 0.11+
- **lazy.nvim** — менеджер плагинов
- **blink.cmp** — автодополнение
- **fzf-lua** — fuzzy finder
- **oil.nvim** — файл-менеджер
- **conform.nvim** — форматирование
- **nvim-lint** — линтинг
- **mason.nvim** — установка LSP/форматтеров
- **nvim-treesitter** — подсветка и парсинг
- **gitsigns** + **lazygit** — git-интеграция

## Поддерживаемые языки

| Язык          | LSP                           | Форматтер/линтер        |
| ------------- | ----------------------------- | ----------------------- |
| Lua           | `lua_ls` (mason)              | `stylua`                |
| JS/TS/React   | `ts_ls`, `eslint` (npm)       | `eslint_d`              |
| CSS/SCSS      | `cssls`, `stylelint` (npm)    | `prettier`, `stylelint` |
| Swift         | `sourcekit-lsp` (Xcode)       | `swift-format`          |
| Kotlin        | `kotlin_language_server`      | `ktlint`                |
| JSON          | `jsonls` (npm)                | —                       |

## Установка

```sh
git clone git@github.com:n0sfer666/nvim.git ~/.config/nvim
nvim
```

При первом запуске `lazy.nvim` подтянет плагины, `mason` — управляемые LSP-серверы.

### Зависимости

Системные пакеты (npm-глобально):

```sh
npm i -g typescript-language-server eslint_d vscode-langservers-extracted stylelint prettier
```

Swift — требуется Xcode (`sourcekit-lsp` идёт в комплекте).

## Структура

```
~/.config/nvim/
├── init.lua              # bootstrap lazy.nvim
├── lua/
│   ├── config/
│   │   ├── options.lua       # vim.opt, langmap, spell
│   │   ├── keymaps.lua       # базовые маппинги
│   │   ├── autocmds.lua      # yank highlight, VimEnter, undo
│   │   └── lsp-servers.lua   # системные LSP-серверы
│   └── plugins/
│       ├── editor.lua        # oil, surround, autopairs, autotag, vim-sleuth, todo-comments
│       ├── ui.lua            # тема, indent-blankline, which-key, fidget, render-markdown
│       ├── lsp.lua           # lspconfig, mason, conform, lazydev
│       ├── completion.lua    # blink.cmp
│       ├── lint.lua          # nvim-lint
│       ├── git.lua           # gitsigns, lazygit
│       ├── treesitter.lua    # nvim-treesitter
│       └── fuzzy.lua         # fzf-lua
└── spell/                    # словари (ru, en + кастомный)
```

## Принципы

- Каждый файл < 200 строк
- Без комментариев в коде
- **Mason** только для: `lua_ls`, `kotlin_language_server`, `stylua`, `ktlint`
- Системные серверы (npm): `eslint`, `ts_ls`, `jsonls`, `cssls`, `stylelint`
- LSP-навигация (`gd` / `gr` / `gI` / `gD`) через нативный `vim.lsp.buf`
- Symbols через `fzf-lua` (`ds` / `ws`)
- Кириллица через `vim.opt.langmap`

## Ключевые биндинги

`<leader>` = `Space`.

### Rename (кастомный)

| Маппинг           | Действие                              |
| ----------------- | ------------------------------------- |
| `<leader>rr`      | rename в буфере без подтверждения     |
| `<leader>rR`      | rename в буфере с подтверждением      |
| `<leader>rB!`     | rename по открытым буферам, без confirm |
| `<leader>rBC`     | rename по открытым буферам, с confirm |
| `<leader>rP!`     | rename по файлам, без confirm         |
| `<leader>rPC`     | rename по файлам, с confirm           |

### mini.surround

`<leader>r` → `[a]dd` / `[d]elete` / `[c]hange` → `[i]nner` / `[o]uter` → `[w]ord`.

## Spellcheck

Языки: `ru`, `en`. Пользовательский словарь — `spell/all.utf-8.add` (коммитится). Скомпилированные `.spl` / `.sug` — генерируются локально.

## Лицензия

[MIT](./LICENSE.md)
