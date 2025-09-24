return {
  "ibhagwan/fzf-lua",
  opts = {
    { "telescope" },
    winopts = {
      fullscreen = true,
      preview = { hidden = true },
    },
    fzf_opts = { ["--no-scrollbar"] = true },
    fzf_colors = true,
    hls = { title_flags = "title" } -- highlight groups
  },
  keys = {
    { "<leader>sf", "<CMD>FzfLua files<CR>" },
    { "<leader>ss", "<CMD>FzfLua live_grep<CR>" },
    { "<leader>sw", "<CMD>FzfLua grep_cWORD<CR>" },
    { "<leader>sg", "<CMD>FzfLua git_files<CR>" },
  }
}
