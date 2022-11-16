-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end
-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

-- configure telescope
telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--sort-files',
      '--hidden',
      '--line-number',
      '--glob=!{.git,venv,.venv,obj,bin}',
      '--column',
      '--smart-case'
    },
    file_ignore_patterns = {
      '.git/',
      'node_modules/',
      'venv/',
      '.venv/',
      '__pycache__/'
    },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
  },
})

vim.g.fzf_buffers_jump = 1
-- telescope.load_extension("fzf")
