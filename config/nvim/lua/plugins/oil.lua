return {
  'stevearc/oil.nvim',
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = { view_options = { show_hidden = true } },
  keys = {
    { "<leader>-", "<CMD>Oil<CR>" }
  },
}
