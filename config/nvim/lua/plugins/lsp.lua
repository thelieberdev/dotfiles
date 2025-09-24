return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      'clangd', 'cmake', 'gopls', 'rust_analyzer', 'pyright',
      'ts_ls', 'tailwindcss', 'superhtml'
    }
  },
  keys = {
    { "<leader>gd", vim.lsp.buf.definition },
    { "<leader>gd", "<C-]>", ft = "man" },
    { "<leader>o", vim.diagnostic.open_float },
    { "<leader>c", vim.lsp.buf.code_action },
    { "<leader>rn", vim.lsp.buf.rename },
    { "<leader>b", vim.diagnostic.setqflist }
  },
}
