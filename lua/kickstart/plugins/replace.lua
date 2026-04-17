return {
  {
    'MagicDuck/grug-far.nvim',
    opts = {
      auto_center = true,
      preview = true,
    },
    keys = {
      { '<leader>rr', '<cmd>GrugFar toggle<cr>', desc = 'Toggle Grug Far' },
      {
        '<leader>R',
        function()
          vim.cmd 'GrugFar'
          vim.defer_fn(function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<leader>r', true, false, true), 'n', false)
          end, 50)
        end,
        desc = 'Apply ALL replacements NOW',
      },
    },
  },
}
