return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'kotlin', 'lua', 'typescript', 'tsx', 'javascript',
        'html', 'css', 'scss', 'json', 'yaml', 'markdown', 'markdown_inline',
        'vim', 'vimdoc', 'regex', 'bash',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = false },
    },
  },
}
