return {
  { "rcarriga/nvim-dap-ui", event = "VeryLazy", dependencies = { "mfussenegger/nvim-dap" } },
  {
    "leoluz/nvim-dap-go",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    opts = {
      delve = {
        path = "dlv",
        initialize_timeout_sec = 20,
        port = "${port}",
        args = {},
        build_flags = "",
      },
    },
  },
}
