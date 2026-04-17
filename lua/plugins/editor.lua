return {
  {
    'nvim-tree/nvim-web-devicons',
    opts = {},
  },

  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {
      default_file_explorer = true,
      view_options = { show_hidden = false },
      skip_confirm_for_simple_edits = false,
    },
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    },
  },

  {
    'echasnovski/mini.surround',
    version = false,
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = '<leader>ra',
          delete = '<leader>rd',
          replace = '<leader>rc',
        },
        custom_surroundings = {
          ['x'] = {
            input = '^<([%w]+)(.-)>()$',
            output = function()
              local tag_input = vim.fn.input('Enter JSX tag (e.g. div className="..."): <')
              if tag_input == '' then
                return nil
              end
              local tag_name, attrs = tag_input:match('([%w]+)(.*)')
              if not tag_name then
                return nil
              end
              return {
                left = '<' .. tag_name .. attrs .. '>',
                right = '</' .. tag_name .. '>',
              }
            end,
          },
        },
      })
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      check_ts = true,
      fast_wrap = {},
    },
  },

  {
    'windwp/nvim-ts-autotag',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    },
  },

  'tpope/vim-sleuth',

  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
