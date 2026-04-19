vim.lsp.enable({
  'bash',
  'cfn-lsp-extra',
  'docker',
  'ghactions',
  'go',
  'helm',
  'json',
  'lua',
  'powershell',
  'python',
  'terraform',
  'yaml',
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = ev.buf, desc = "[F]ormat" })
  end,
})

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics,
--   {
--     virtual_text = false,
--     signs = true,
--     update_in_insert = false,
--     underline = true,
--   }
-- )

vim.diagnostic.config({
  virtual_text = {
    current_line = true
  }
})
