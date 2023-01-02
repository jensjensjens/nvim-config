-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
local actions_setup, actions = pcall(require, "telescope.actions")
if not telescope_setup or not actions_setup then
	return
end
print(actionsk)

-- configure telescope
telescope.setup({
	defaults = {
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
		file_ignore_patterns = {
			".git/",
			"node_modules/",
			"venv/",
			".venv/",
			"__pycache__/",
		},
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
	extensions = {
		undo = {
			-- side_by_side = true,
			-- layout_strategy = "vertical",
			-- layout_config = {
			-- 	preview_height = 0.8,
			-- },
			mappings = { -- this whole table is the default
				i = {
					-- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
					-- you want to use the following actions. This means installing as a dependency of
					-- telescope in it's `requirements` and loading this extension from there instead of
					-- having the separate plugin definition as outlined above. See issue #6.
					["<cr>"] = actions.yank_additions,
					["<S-cr>"] = actions.yank_deletions,
					["<C-cr>"] = actions.restore,
				},
			},
		},
	},
})
telescope.load_extension("undo")

vim.g.fzf_buffers_jump = 1
