vim.keymap.set("n", "<leader>cc", "<CMD>CopilotChat<CR>", { desc = "Open [C]opilot [C]hat" })
vim.keymap.set("n", "<leader>ccq", "<CMD>CopilotChatReset<CR>", { desc = "[C]opilot [C]hat [Q]uit (reset)" })
vim.keymap.set("n", "<leader>ccr", "<CMD>CopilotChatReview<CR>", { desc = "[C]opilot [C]hat [R]review" })
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'copilot-*',
  callback = function()
    -- Set buffer-local options
    vim.opt_local.relativenumber = true
    vim.opt_local.number = true
    vim.opt_local.conceallevel = 0
  end
})

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  config = function()
    local copilotchat = require("CopilotChat")
    local select = require("CopilotChat.select")
    copilotchat.setup({
      highlight_headers = false,
      separator = '---',
      error_header = '> [!ERROR] Error',
      model = "claude-3.7-sonnet-thought",
      show_diff = {
        full_diff = true
      },
      selection = select.buffer,
    })
  end,
}
