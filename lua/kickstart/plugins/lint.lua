return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/nvim-cmp' },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', '<leader>cn', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'LSP Code Actions' }))
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename Symbol' }))
      end

      vim.lsp.config.eslint = {
        cmd = { 'vscode-eslint-language-server', '--stdio' },
        root_markers = { '.eslintrc', '.eslintrc.js', '.eslintrc.json', 'eslint.config.js' },
        capabilities = capabilities,
        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
        settings = {
          codeAction = {
            disableRuleComment = { enable = true },
            showDocumentation = { enable = true },
          },
          codeActionOnSave = { enable = true, mode = 'all' },
          format = { enable = true },
        },
      }
      vim.lsp.enable 'eslint'

      vim.lsp.config.ts_ls = {
        cmd = { 'typescript-language-server', '--stdio' },
        root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' },
        capabilities = capabilities,
        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      }
      vim.lsp.enable 'ts_ls'

      vim.lsp.config.jsonls = {
        cmd = { 'vscode-json-language-server', '--stdio' },
        root_markers = { 'package.json' },
        capabilities = capabilities,
        filetypes = { 'json', 'jsonc' },
        settings = {
          json = {
            validate = { enable = true },
          },
        },
      }
      vim.lsp.enable 'jsonls'

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
      vim.lsp.enable 'cssls'

      if vim.fn.executable 'stylelint-lsp' == 1 then
        local stylelint_capabilities = vim.tbl_deep_extend('force', capabilities, {
          textDocument = {
            completion = {
              completionItem = {
                snippetSupport = false,
              },
            },
          },
        })

        vim.lsp.config.stylelint_lsp = {
          cmd = { 'stylelint-lsp', '--stdio' },
          filetypes = { 'css', 'scss', 'sass', 'less' },
          root_markers = { '.stylelintrc', '.stylelintrc.json', '.stylelintrc.js', 'stylelint.config.js', '.stylelintrc.yml' },
          capabilities = stylelint_capabilities,
          settings = {
            stylelintplus = {
              autoFixOnSave = true,
              autoFixOnFormat = false,
            },
          },
        }
        vim.lsp.enable 'stylelint_lsp'
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf
          local filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr })
          if filetype == 'oil' then
            return
          end
          on_attach(nil, bufnr)
        end,
      })
    end,
  },
}
