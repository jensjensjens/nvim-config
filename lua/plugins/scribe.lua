local scribe = require("scribe")

local home = os.getenv("HOME")
local notes_dir = home .. "/Documents/notes/"
scribe.setup({
	directory = notes_dir,
	file_ext = ".md",
	default_file = "notes.md",
})
