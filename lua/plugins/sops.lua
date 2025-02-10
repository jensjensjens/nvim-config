return {
  "lucidph3nx/nvim-sops",
  event = { "BufEnter" },
  version = "cb2209562d00ef8c6c88bdec836d9edb8fbb96ef",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    { "<leader>ef", vim.cmd.SopsEncrypt, desc = "[E]ncrypt [F]ile" },
    { "<leader>df", vim.cmd.SopsDecrypt, desc = "[D]ecrypt [F]ile" },
  },
}
