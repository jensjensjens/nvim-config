vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<F1>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<F2>", "copilot#Previous()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<F3>", "copilot#Next()", { silent = true, expr = true })

return {
  "github/copilot.vim",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
}
