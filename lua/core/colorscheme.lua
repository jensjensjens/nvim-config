local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end

-- Make line number easier to read
vim.cmd([[hi LineNr guifg=#ffffff]])


