return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = 'main',
  build = ":TSUpdate",
  dependencies = { "windwp/nvim-ts-autotag" },
  init = function()
    require('nvim-ts-autotag').setup()

    local ensureInstalled = {
      "go", "gomod", "gosum",
      "c", "cpp", "cmake", "make", "rust",
      "html", "html_tags", "css", "javascript", "jsx", "typescript", "tsx",
      "toml", "yaml", "xml", "json",
      "latex", "markdown", "markdown_inline", "r",
      "comment ","bash", "lua", "sql", "dockerfile"
    }
    local alreadyInstalled = require("nvim-treesitter.config").get_installed()
    local parsersToInstall = vim.iter(ensureInstalled)
        :filter(function(parser) return not vim.tbl_contains(alreadyInstalled, parser) end)
        :totable()
    require("nvim-treesitter").install(parsersToInstall)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = ensureInstalled,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
