return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function(opts)
    local treesitterConfigs = require("nvim-treesitter.configs")
    local vim = vim
    local opt = vim.opt

    opt.foldmethod = "expr"
    opt.foldlevel = 3
    opt.foldexpr = "nvim_treesitter#foldexpr()"
    treesitterConfigs.setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      sync_install = true,
      auto_install = true,
    })
  end,
}
