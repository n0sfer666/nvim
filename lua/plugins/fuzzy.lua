return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>sf', function() require('fzf-lua').files() end, desc = 'Find files' },
      { '<leader>sg', function() require('fzf-lua').live_grep() end, desc = 'Live grep' },
      { '<leader>sh', function() require('fzf-lua').helptags() end, desc = 'Help tags' },
      { '<leader>sk', function() require('fzf-lua').keymaps() end, desc = 'Keymaps' },
      { '<leader>s/', function() require('fzf-lua').lgrep_curbuf() end, desc = 'Buffer search' },
      { '<leader>s.', function() require('fzf-lua').oldfiles() end, desc = 'Recent files' },
      { '<leader>sd', function() require('fzf-lua').diagnostics_document() end, desc = 'Diagnostics' },
      { '<leader><space>', function() require('fzf-lua').buffers() end, desc = 'Buffers' },
    },
    opts = {},
  },
}
