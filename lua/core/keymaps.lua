local keymap = vim.keymap
-- [[ Search ]]
-- Set nohlsearch to disable highlighting after search
keymap.set("n", "<leader>nh", ":nohlsearch<CR><CR>", { silent = true, desc = "[N]o [H]lSearch" })
keymap.set("n", "<leader>ts", ':r!date "+%Y%m%d%H%M.%S"<CR>', { silent = true, desc = "[T]ime[S]tamp" })
-- [[ Leader ]]
-- Make sure space is not used got anything except leader
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

keymap.set("n", "<Space>cp", ':let @+ = expand("%")<CR>', { silent = true, desc = "[C]opy [P]ath" })
keymap.set("n", "<Space>cP", ':let @+ = expand("%:p")<CR>', { silent = true, desc = "[C]opy full [P]ath" })
keymap.set("n", "<Space>cD", ':let @+ = expand("%:h")<CR>', { silent = true, desc = "[C]opy [D]irectory path" })

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

