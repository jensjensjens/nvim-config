vim.lsp.enable({
  'bash',
  'docker',
  'ghactions',
  'go',
  'helm',
  'json',
  'lua',
  'powershell',
  'terraform',
  'yaml',
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone','noinsert','fuzzy','popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end
    -- -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    --
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = ev.buf, desc = "[F]ormat" })
  end,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
  }
)

vim.diagnostic.config({
  virtual_text = {
    current_line = true
  }
})
