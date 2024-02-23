vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
