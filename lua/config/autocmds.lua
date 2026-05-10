vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd('silent! enew')
      require('fzf-lua').files()
    end
  end,
})

vim.api.nvim_create_autocmd('SwapExists', {
  callback = function(args)
    local choice = vim.fn.confirm(
      'Swap file found for "' .. args.file .. '"',
      '&Open read-only\n&Edit anyway\n&Recover\n&Delete it\n&Quit\n&Abort',
      4
    )
    vim.v.swapchoice = ({ 'o', 'e', 'r', 'd', 'q', 'a' })[choice] or 'q'
  end,
})

vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  callback = function()
    local undo_dir = vim.fn.stdpath('state') .. '/undo/'
    local file_path = vim.fn.expand('%:p')
    local undo_file = undo_dir .. file_path:gsub('/', '%%')
    if #undo_file > 255 then
      vim.opt_local.undofile = false
    end
  end,
})
