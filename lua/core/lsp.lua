vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostics in floating window" })
vim.keymap.set("n", "K", '<cmd>lua vim.lsp.buf.hover({border="rounded"})<CR>', { desc = "Hover" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Location list" })
vim.keymap.set('i', '<c-space>', function() vim.lsp.completion.get() end)

vim.diagnostic.config({
  virtual_text = {
    current_line = true
  }
})

vim.cmd[[set completeopt+=menuone,noselect,popup,fuzzy]]

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

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
