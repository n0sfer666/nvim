local M = {}

function M.setup(capabilities)
  vim.lsp.config.eslint = {
    cmd = { 'vscode-eslint-language-server', '--stdio' },
    root_markers = { '.eslintrc', '.eslintrc.js', '.eslintrc.json', 'eslint.config.js' },
    capabilities = capabilities,
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    settings = {
      codeAction = {
        disableRuleComment = { enable = true },
        showDocumentation = { enable = true },
      },
      codeActionOnSave = { enable = true, mode = 'all' },
      format = { enable = true },
    },
  }
  vim.lsp.enable('eslint')

  vim.lsp.config.ts_ls = {
    cmd = { 'typescript-language-server', '--stdio' },
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' },
    capabilities = capabilities,
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  }
  vim.lsp.enable('ts_ls')

  vim.lsp.config.jsonls = {
    cmd = { 'vscode-json-language-server', '--stdio' },
    root_markers = { 'package.json' },
    capabilities = capabilities,
    filetypes = { 'json', 'jsonc' },
    settings = { json = { validate = { enable = true } } },
  }
  vim.lsp.enable('jsonls')

  vim.lsp.config.cssls = {
    cmd = { 'vscode-css-language-server', '--stdio' },
    root_markers = { 'package.json' },
    capabilities = capabilities,
    filetypes = { 'css', 'scss', 'less' },
    settings = {
      css = { validate = true },
      scss = { validate = true },
      less = { validate = true },
    },
  }
  vim.lsp.enable('cssls')

  if vim.fn.executable('stylelint-lsp') == 1 then
    vim.lsp.config.stylelint_lsp = {
      cmd = { 'stylelint-lsp', '--stdio' },
      filetypes = { 'css', 'scss', 'sass', 'less' },
      root_markers = {
        '.stylelintrc', '.stylelintrc.json', '.stylelintrc.js',
        'stylelint.config.js', '.stylelintrc.yml',
      },
      capabilities = capabilities,
      settings = {
        stylelintplus = {
          autoFixOnSave = true,
          autoFixOnFormat = false,
        },
      },
    }
    vim.lsp.enable('stylelint_lsp')
  end

  if vim.fn.executable('xcrun') == 1 then
    vim.lsp.config.sourcekit = {
      cmd = { 'xcrun', 'sourcekit-lsp' },
      filetypes = { 'swift' },
      root_markers = { 'Package.swift', '.git' },
      capabilities = capabilities,
    }
    vim.lsp.enable('sourcekit')
  end
end

return M
