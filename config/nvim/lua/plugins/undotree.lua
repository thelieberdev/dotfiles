return {
  "mbbill/undotree",
  init = function()
    vim.g.undotree_DiffAutoOpen = 0
    vim.g.undotree_SplitWidth = 35
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
  keys = {
    { "<leader>u", vim.cmd.UndotreeToggle }
  }
}
