return {
  "echasnovski/mini.comment",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("mini.cursorword").setup()
    require("mini.indentscope").setup()
  end,
  dependencies = {
    "echasnovski/mini.nvim",
  },
}
