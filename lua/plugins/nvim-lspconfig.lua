return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    'saghen/blink.cmp',
  },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local lspconfig = require('lspconfig')
    -- Specify how the border looks like
    local border = {
      { '┌', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '┐', 'FloatBorder' },
      { '│', 'FloatBorder' },
      { '┘', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '└', 'FloatBorder' },
      { '│', 'FloatBorder' },
    }

    -- Add the border on hover and on signature help popup window
    local handlers = {
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }
    lspconfig.yamlls.setup({
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        yaml = {
          format = {
            enable = true,
          },
          -- schemaStore = {
          --   enable = true
          -- },
          validate = {
            enable = true
          },
          schemas = {
            kubernetes = "*.yaml",
            ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*",
            ["https://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
            ["https://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
            "*docker-compose*.{yml,yaml}",
          },
        },
      },
    })
    lspconfig.helm_ls.setup({
      capabilities = capabilities,
      handlers = handlers,
      setting = {
        ["helm-ls"] = {
          yamlls = {
            path = "yaml-language-server",
          },
        },
      },
    })
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
    lspconfig.powershell_es.setup({
      capabilities = capabilities,
      handlers = handlers,
      bundle_path = '~/code/other/powershell-editor-services',
      filetypes = { "ps1", "psm1", "psd1" },
      settings = { powershell = { codeFormatting = { Preset = 'OTBS' } } },
      init_options = {
        enableProfileLoading = false,
      }
    })
    lspconfig.dockerls.setup({
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        single_file_support = true,
        docker = {
          languageserver = {
            formatter = {
              ignoreMultilineInstructions = true,
            },
          },
        }
      }
    })
    lspconfig.bashls.setup({
      capabilities = capabilities,
      handlers = handlers,
    })
    lspconfig.terraformls.setup({
      capabilities = capabilities,
      handlers = handlers,
    })
    lspconfig.gh_actions_ls.setup({
      capabilities = capabilities,
      handlers = handlers,
    })
    lspconfig.gopls.setup({
      capabilities = capabilities,
      handlers = handlers,
    })
  end
}
