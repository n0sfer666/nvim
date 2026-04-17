vim.env.PATH = '/opt/homebrew/bin:' .. vim.env.PATH

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

vim.opt.spell = true
vim.opt.spelllang = { 'ru', 'en' }
vim.opt.spellfile = vim.fn.expand('~/.config/nvim/spell/all.utf-8.add')
vim.opt.spelloptions = 'camel'

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = '↪ '
vim.opt.breakindent = true
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.langmap = table.concat({
  'йцукенгшщзфывапролдячсмить;qwertyuiopasdfghjklzxcvbnm',
  'ЙЦУКЕНГШЩЗФЫВАПРОЛДЯЧСМИТЬ;QWERTYUIOPASDFGHJKLZXCVBNM',
  'х[', 'ъ]', 'Х{', 'Ъ}',
  'ж\\;', "э'", 'Ж:', 'Э"',
  'б\\,', 'ю.', 'Б<', 'Ю>',
}, ',')
