vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
      lsp_rename_autosave = false,
      experimental_watch_for_changes = true,
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
