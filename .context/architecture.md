# Архитектура

## Структура файлов

```
~/.config/nvim/
├── init.lua              -- bootstrap lazy.nvim, require config/*
├── lua/
│   ├── config/
│   │   ├── options.lua       -- vim.opt, vim.g, langmap, spell
│   │   ├── keymaps.lua       -- базовые маппинги
│   │   ├── autocmds.lua      -- yank highlight, VimEnter fzf, undo path limit
│   │   └── lsp-servers.lua   -- системные LSP-серверы (eslint, ts_ls, cssls, jsonls, sourcekit, stylelint)
│   └── plugins/
│       ├── editor.lua        -- oil, surround, autopairs, autotag, vim-sleuth, todo-comments
│       ├── ui.lua            -- alabaster, indent-blankline, which-key, fidget, render-markdown
│       ├── lsp.lua           -- lspconfig, mason, conform, lazydev + LspAttach keymaps
│       ├── completion.lua    -- blink.cmp
│       ├── lint.lua          -- nvim-lint (stylelint)
│       ├── git.lua           -- gitsigns, lazygit
│       ├── treesitter.lua    -- nvim-treesitter
│       └── fuzzy.lua         -- fzf-lua
└── spell/                    -- словари (ru, en, кастомный)
```

## Принципы
- Каждый файл < 200 строк
- Без комментариев (кроме критичных)
- Mason только для: lua_ls, kotlin_language_server, stylua, ktlint
- Системные серверы (npm): eslint, ts_ls, jsonls, cssls, stylelint_lsp
- Системный сервер (Xcode): sourcekit-lsp
- LSP навигация (gd/gr/gI/gD) через нативный vim.lsp.buf
- Symbols через fzf-lua (ds/ws)
- Кириллица через vim.opt.langmap
