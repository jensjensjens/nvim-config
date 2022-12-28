local global = vim.g
local keymap = vim.keymap

global.mapleader = ","

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- center the buffer after a cursor move
keymap.set("n", "C-u", "<C-u>zz")
keymap.set("n", "C-d", "<C-d>zz")

-- plugin keymaps
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

keymap.set("", "<C-n>", ":NvimTreeToggle<CR>") -- toggle file explorer

keymap.set(
	"n",
	"<c-p>",
	"<cmd>lua require'telescope.builtin'.find_files({find_command = {'rg', '--files', '--hidden'}})<cr>"
)
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

keymap.set("", "<leader>gb", ":Git blame<CR>")
keymap.set("", "<leader>gl", ":Git log<CR>")
keymap.set("", "<leader>gs", ":Git<CR>")
-- Disable arrow keys

-- Disable arrow keys in normal mode
keymap.set("", "<up>", "<nop>")
keymap.set("", "<down>", "<nop>")
keymap.set("", "<left>", "<nop>")
keymap.set("", "<right>", "<nop>")
--
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

-- Lsp Saga
keymap.set("n", " ", "<cmd>Lspsaga show_line_diagnostics<CR>") -- Show line diagnostics
keymap.set("n", " ", "<cmd>Lspsaga show_cursor_diagnostics<CR>") -- Show cursor diagnostic
keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })
keymap.set("n", "∂", "<cmd>Lspsaga open_floaterm<CR>", { silent = true }) -- Open floaterm
keymap.set("t", "∂", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true }) -- close floaterm

-- Lazygit
keymap.set("n", "<leader>gg", ":LazyGit<CR>")

-- Git
keymap.set("", "<leader>gb", ":Git blame<CR>")
keymap.set("", "<leader>gl", ":Git log<CR>")
keymap.set("", "<leader>gs", ":Git<CR>")

-- Undo
keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
