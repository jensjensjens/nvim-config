vim.keymap.set("n", "<leader>sr", "<CMD>GrugFar<CR>", { desc = "[S]earch and [R]eplace" })

return {
  'MagicDuck/grug-far.nvim',
  config = function()
    require('grug-far').setup({
      helpLine = {
        enabled = false,
      },
      showCompactInputs = true,
      showInputsTopPadding = false,
      showInputsBottomPadding = false,
    });
  end
}
