local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic quickfix' })
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Focus left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Focus right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Focus lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Focus upper window' })

map('i', 'jj', '<Esc>', { noremap = true, silent = true })
map('i', 'jJ', '<Esc>', { noremap = true, silent = true })
map('i', 'JJ', '<Esc>', { noremap = true, silent = true })

map('n', 'U', '<C-r>', { noremap = true, silent = true })

map({ 'n', 'v' }, 'd', '"_d', { noremap = true })
map({ 'n', 'v' }, 'D', '"_D', { noremap = true })

map('n', '<CR>', 'm`o<Esc>``')
map('n', '<S-CR>', 'm`O<Esc>``')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', '<leader>ba', function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { desc = 'Delete all buffers except current' })

map('n', '<leader>bd', ':bw!<CR>', { noremap = true, silent = true, desc = 'Delete buffer' })
map('n', '<leader>cp', ':let @+ = expand("%")<CR>', { noremap = true, silent = true, desc = 'Copy file path' })
