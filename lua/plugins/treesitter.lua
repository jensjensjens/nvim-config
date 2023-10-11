return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function(opts)
    local treesitterConfigs = require("nvim-treesitter.configs")
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
