vim.keymap.set("n", "<leader>?", "<cmd>Telescope oldfiles<cr>", { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", "<cmd>Telescope buffers<cr>", { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "[U]ndo tree" })

vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Search [G]it [B]ranches" })
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Search [G]it [C]ommits" })

vim.keymap.set("n", "<leader>ss", "<cmd>Telescope spell_suggest<cr>", { desc = "[S]pell [S]uggest" })

vim.keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "[S]earch [H]elp" })

vim.keymap.set("n", "<leader>sm", "<cmd>Telescope keymaps<cr>", { desc = "[S]earch [M]aps" })

vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics<cr>", { desc = "Show [L]sp [D]iagnostics" })
vim.keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<cr>", { desc = "Show [L]sp [I]mplementations" })
vim.keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", { desc = "Show [L]sp [R]eferences" })

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
  },
  opts = {
    defaults = {
      layout_strategy = "vertical",
      layout_config = {
        vertical = { width = 0.5 },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--sort-files",
        "--hidden",
        "--line-number",
        "--glob=!{.git,venv,.venv,obj,bin}",
        "--column",
        "--smart-case",
      },
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
      },
    },
    extensions = {
      undo = {
        side_by_side = true,
        layout_strategy = "vertical",
        layout_config = {
          preview_height = 0.8,
        },
      },
    },
  },
  config = function(opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("undo")
  end,
}
