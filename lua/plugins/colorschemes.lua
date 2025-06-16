return {
  "catppuccin/nvim",
  event = "VeryLazy",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
    })
  end,
}
