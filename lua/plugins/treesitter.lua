local ensure_installed = {
  'kotlin', 'lua', 'typescript', 'tsx', 'javascript',
  'html', 'css', 'scss', 'json', 'yaml', 'markdown', 'markdown_inline',
  'vim', 'vimdoc', 'regex', 'bash',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local ts = require('nvim-treesitter')
      if type(ts.install) == 'function' then
        ts.install(ensure_installed)
      end
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local ok_lang, lang = pcall(vim.treesitter.language.get_lang, args.match)
          if not ok_lang or not lang then return end
          pcall(vim.treesitter.start, args.buf, lang)
        end,
      })
    end,
  },
}
