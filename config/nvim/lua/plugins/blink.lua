return {
  'saghen/blink.cmp',
  lazy = false,
  version = '1.*',
  dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-p>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-n>'] = { 'scroll_documentation_down', 'fallback' }
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      list = { selection = { preselect = false } },
      menu = { draw = { columns = {
        { 'label', 'label_description', gap = 1 },
        { 'kind' }
      }}},
    },
    snippets = { preset = 'luasnip' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { "sources.default" },
  init = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local i = ls.insert_node
    local t = ls.text_node
    local f = ls.function_node

    local function sanitize(str)
      return string.upper(str:gsub("[^a-zA-Z0-9]", "_"))
    end

    local create_guard_name = function()
      local filepath = vim.api.nvim_buf_get_name(0)
      local dirpath = vim.fn.fnamemodify(filepath, ":h")
      return string.format("%s_%s_%s_INCLUDED",
        string.upper(sanitize(vim.fn.fnamemodify(dirpath, ":t"))),
        string.upper(sanitize(vim.fn.fnamemodify(filepath, ":t:r"))),
        string.upper(sanitize(vim.fn.fnamemodify(filepath, ":e"))))
    end

    ls.add_snippets("cpp", {
      s("section", { t("//=== "), i(1), t(" ===//") }),
      s("guards", {
        t("#ifndef "), f(create_guard_name), t({"", ""}),
        t("#define "), f(create_guard_name), t({"", "", ""}),
        i(1),
        t({"", "", ""}), t("#endif // "), f(create_guard_name)
      })
    })
  end
}
