local call, nvimtree = pcall(require, "nvim-tree")
if not call then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
	view = {
		adaptive_size = true,
		centralize_selection = true,
		preserve_window_proportions = true,
		side = "right",
		number = true,
		relativenumber = true,
	},
	-- change folder arrow icons
	renderer = {
		highlight_opened_files = "all",
		indent_markers = {
			enable = true,
		},
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	filters = {
		dotfiles = false,
		custom = {
			"^\\.git$",
		},
	},
})

vim.opt.laststatus = 3
