return {
  "kelly-lin/ranger.nvim",
  opts = function()
    local ranger_nvim = require("ranger-nvim")
    return {
      replace_netrw = true,
      keybinds = {
        ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
        ["oh"] = ranger_nvim.OPEN_MODE.split,
        ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
        ["or"] = ranger_nvim.OPEN_MODE.rifle,
      },
    }
  end,
  config = function(opts)
    require("ranger-nvim").setup(opts)
    vim.api.nvim_set_keymap("n", "<leader>ef", "", {
      noremap = true,
      callback = function()
        require("ranger-nvim").open(true)
      end,
    })
  end,
}
