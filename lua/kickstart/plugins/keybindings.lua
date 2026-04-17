return {
  -- basic
  --
  vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true }),
  vim.keymap.set('i', 'jJ', '<Esc>', { noremap = true, silent = true }),
  vim.keymap.set('i', 'JJ', '<Esc>', { noremap = true, silent = true }),
  vim.keymap.set('i', 'оо', '<Esc>', { noremap = true, silent = true }),
  vim.keymap.set('i', 'оО', '<Esc>', { noremap = true, silent = true }),
  vim.keymap.set('i', 'ОО', '<Esc>', { noremap = true, silent = true }),
  vim.keymap.set('n', 'U', '<C-r>', { noremap = true, silent = true }),

  vim.keymap.set({ 'n', 'v' }, 'd', '"_d', { noremap = true }),
  vim.keymap.set({ 'n', 'v' }, 'D', '"_D', { noremap = true }),
  -- add new line and move cursor
  vim.keymap.set('n', '<CR>', 'm`o<Esc>``'),
  vim.keymap.set('n', '<S-CR>', 'm`O<Esc>``'),

  -- markdownPreview
  vim.keymap.set('n', '<leader>m', ':MarkdownPreviewToggle<CR>', { noremap = true, silent = true, desc = 'Markdown Preview' }),

  -- Buffers
  --
  -- Force Close
  vim.keymap.set('n', '<leader>ba', function()
    local current = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end, { desc = 'Delete all buffers except current' }),
  -- Force Delete from Memory
  vim.keymap.set('n', '<leader>bd', ':bw!<CR>', { noremap = true, silent = true, desc = '[D]elete Buffer' }),
  -- Copy file path
  vim.keymap.set('n', '<leader>cp', ':let @+ = expand("%")<CR>', { noremap = true, silent = true, desc = '[C]opy file [P]ath' }),

  -- Refactoring
  -- Rename
  -- LSP
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP Rename' }),
  -- move selected code downer
  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv"),
  -- move selected code upper
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv"),
  -- Показ типа переменной по <K>
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show variable info (LSP)' }),
  -- Переход к определению по <gd>
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' }),
}
