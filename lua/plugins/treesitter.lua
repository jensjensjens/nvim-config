local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	ensure_installed = {
		"c_sharp",
		"cmake",
		"dockerfile",
		"gitignore",
		"javascript",
		"hcl",
		"json",
		"lua",
		"make",
		"markdown",
		"python",
		"vim",
		"yaml",
	},
	auto_install = true,
	-- enable indentation
	indent = {
		enable = true,
	},
})
