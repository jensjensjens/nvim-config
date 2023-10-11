local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}
local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

local function update_mode_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  if current_mode == "n" then
    return "%#Normal#"
  elseif current_mode == "i" or current_mode == "ic" then
    return "%#ToolbarButton#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
    return "%#TsError#"
  elseif current_mode == "R" then
    return "%#StatuslineReplaceAccent#"
  elseif current_mode == "c" then
    return "%#StatuslineCmdLineAccent#"
  elseif current_mode == "t" then
    return "%#StatuslineTerminalAccent#"
  end
  return "%#StatusLineAccent#"
end

Statusline = {}

Statusline.active = function()
  return table.concat({
    "%#Statusline#",
    update_mode_colors(),
    mode(),
    "%#Normal# ",
  })
end

vim.opt.statusline = "%!v:lua.Statusline.active()"
