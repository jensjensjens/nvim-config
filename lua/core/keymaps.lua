local keymap = vim.keymap
-- [[ Search ]]
-- Set nohlsearch to disable highlighting after search
keymap.set("n", "<leader>nh", ":nohlsearch<CR><CR>", { silent = true, desc = "[N]o [H]lSearch" })

-- [[ Leader ]]
-- Make sure space is not used got anything except leader
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
