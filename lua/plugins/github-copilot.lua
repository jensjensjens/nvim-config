local global = vim.g
local home_dir = os.getenv("HOME")
-- we can not run a newer version than 17
global.copilot_node_command = home_dir .. "/.nvm/versions/node/v17.9.1/bin/node"
