return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  ---@type snacks.Config
  opts = {
    bigfile = {},
    gh = {},
    indent = {},
    picker = {
      sources = {
        gh_pr = {}
      }
    },
    scroll = {},
    scope = {},
    words = {},
    dim = {},
  },
  config = true,
  keys = {
    { "<leader>gp", function() Snacks.picker.gh_pr() end,                  desc = "[G]itHub [P]ull Requests (open)" },
    { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "[G]itHub [P]ull Requests (all)" },
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
  },
}
