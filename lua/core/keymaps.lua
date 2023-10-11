local keymap = vim.keymap
-- [[ Search ]]
-- Set nohlsearch to disable highlighting after search
keymap.set("n", "<leader>nh", ":nohlsearch<CR><CR>", { silent = true, desc = "[N]o [H]lSearch" })

-- [[ Leader ]]
-- Make sure space is not used got anything except leader
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

keymap.set("n", "<leader>cp", 'let @" = expand("%")', { silent = true, desc = "[C]opy [P]ath" })
keymap.set("n", "<leader>cP", 'let @" = expand("%:p")', { silent = true, desc = "[C]opy full [P]ath" })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- [[ Buffer navigation ]]
keymap.set("n", "[b", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "]b", ":bnext<CR>", { desc = "Next buffer" })

-- [[ Window navigation ]]
-- center the buffer after a cursor move
keymap.set("n", "C-u", "<C-u>zz")
keymap.set("n", "C-d", "<C-d>zz")

-- [[ Terminal mode ]]
-- Escape from insert mode in terminal mapping that works better on swedish keyboards
keymap.set("t", "<C-W><C-N>", "<C-\\><C-N>", { desc = "Escape to normal mode from terminal" })

-- [[ Training wheels off ]]
-- Disable arrow keys in normal mode
keymap.set("", "<up>", "<nop>")
keymap.set("", "<down>", "<nop>")
keymap.set("", "<left>", "<nop>")
keymap.set("", "<right>", "<nop>")

-- Disable arrow keys in command mode
keymap.set("c", "<Down>", "<Nop>")
keymap.set("c", "<Left>", "<Nop>")
keymap.set("c", "<Right>", "<Nop>")
keymap.set("c", "<Up>", "<Nop>")

-- Disable arrow keys in insert mode
keymap.set("i", "<Down>", "<Nop>")
keymap.set("i", "<Left>", "<Nop>")
keymap.set("i", "<Right>", "<Nop>")
keymap.set("i", "<Up>", "<Nop>")

--- Disable arrow keys in visual mode
keymap.set("v", "<Down>", "<Nop>")
keymap.set("v", "<Left>", "<Nop>")
keymap.set("v", "<Right>", "<Nop>")
keymap.set("v", "<Up>", "<Nop>")

keymap.set("i", "D-c", "<Nop>")
keymap.set("i", "D-v", "<Nop>")
