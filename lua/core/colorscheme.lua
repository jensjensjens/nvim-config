local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
	return
end

-- Make line number easier to read
vim.cmd([[hi LineNr guifg=#ffffff]])
