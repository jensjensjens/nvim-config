return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    "fang2hou/blink-copilot",
  },
  version = 'v1.1.1',
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = 'default',
    },
    fuzzy = {
      implementation = "rust",
      prebuilt_binaries = {
        force_version = "v1.1.1",
      },
    },
    sources = {
      default = {
        'cmdline',
        'omni',
        'lsp',
        'buffer',
        'snippets',
        'path'
      },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    }
  }
}
