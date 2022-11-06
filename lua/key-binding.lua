local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

key_mapper('', '<up>', '<nop>')
key_mapper('', '<down>', '<nop>')
key_mapper('', '<left>', '<nop>')
key_mapper('', '<right>', '<nop>')
key_mapper('i', 'jk', '<ESC>')
key_mapper('i', 'JK', '<ESC>')
key_mapper('i', 'jK', '<ESC>')
key_mapper('v', 'jk', '<ESC>')
key_mapper('v', 'JK', '<ESC>')
key_mapper('v', 'jK', '<ESC>')
key_mapper('n', '<leader>ev', ':vsplit $MYVIMRC<CR>')

key_mapper('', '<leader>gb', ':Git blame<CR>')
key_mapper('', '<leader>gl', ':Git log<CR>')
key_mapper('', '<leader>gs', ':Git<CR>')

-- Disable arrow keys in command mode
key_mapper('c', '<Down>', '<Nop>')
key_mapper('c', '<Left>', '<Nop>')
key_mapper('c', '<Right>', '<Nop>')
key_mapper('c', '<Up>', '<Nop>')

-- Disable newbie crutches in Insert Mode
key_mapper('i', '<Down>', '<Nop>')
key_mapper('i', '<Left>', '<Nop>')
key_mapper('i', '<Right>', '<Nop>')
key_mapper('i', '<Up>', '<Nop>')

--- Disable arrow keys in visual mode
key_mapper('v', '<Down>', '<Nop>')
key_mapper('v', '<Left>', '<Nop>')
key_mapper('v', '<Right>', '<Nop>')
key_mapper('v', '<Up>', '<Nop>')

key_mapper('', '<C-n>', ':NvimTreeToggle<CR>')

-- Make terminal use easier to escape from
key_mapper('t', '<C-W><C-N>', '<C-\\><C-N>')

-- Telescope key bindings
key_mapper('n', '<c-p>', "<cmd>lua require'telescope.builtin'.find_files({find_command = {'rg', '--files', '--hidden'}})<cr>")
key_mapper('n', '<leader>fr', "<cmd>lua require'telescope.builtin'.buffers({ show_all_buffers = true })<cr>")
key_mapper('n', '<leader>fg', "<cmd>lua require'telescope.builtin'.git_status()<cr>")
key_mapper('n', '<leader>/', ":silent grep ")
key_mapper('n', '<leader>rg', "<cmd>lua require'telescope.builtin'.live_grep()<cr>")

-- Tmux navigator
key_mapper('', '<C-h>', ':TmuxNavigateLeft<CR>')
key_mapper('', '<C-j>', ':TmuxNavigateDown<CR>')
key_mapper('', '<C-k>', ':TmuxNavigateUp<CR>')
key_mapper('', '<C-l>', ':TmuxNavigateRight<CR>')

