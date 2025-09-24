return {
  "navarasu/onedark.nvim",
  priority = 1000,
  config = function()
    require("onedark").setup({
      style = "warmer",
    })
    require('onedark').load()
  end,
  -- "projekt0n/github-nvim-theme",
  -- lazy = false,
  -- priority = 1000,
  -- init = function()
  --   require('github-theme').setup({
  --     options = { transparent = true },
  --     groups = {
  --       all = {
  --         StatusLine = { bg = 'bg2', fg = 'fg2' },
  --       },
  --     },
  --   })
  --   vim.cmd.colorscheme('github_light')
  -- end
}
