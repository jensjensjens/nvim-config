local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

key_mapper('', '<leader>gb', ':Git blame<CR>')
key_mapper('', '<leader>gl', ':Git log<CR>')
key_mapper('', '<leader>gs', ':Git<CR>')
