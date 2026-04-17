return {
  -- Автопары: () [] {} '' "" `` и т.п.
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      check_ts = true,
      fast_wrap = {},
    },
    config = function(_, opts)
      local npairs = require 'nvim-autopairs'
      npairs.setup(opts)

      -- Примеры кастомизации, если захочешь (по умолчанию уже хорошо):
      -- local Rule   = require("nvim-autopairs.rule")
      -- npairs.add_rule(Rule("'", "'", {"javascript", "typescript", "typescriptreact", "javascriptreact"}))
    end,
  },

  -- Автоматическое закрытие/переименование HTML/JSX/TSX тегов
  {
    'windwp/nvim-ts-autotag',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    },
    config = function(_, opts)
      require('nvim-ts-autotag').setup(opts)
    end,
  },
}
