-- Remove trailing whitespace on save (https://vi.stackexchange.com/questions/37421/how-to-remove-neovim-trailing-white-space)
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = {"*"},
  callback = function()
    local cursor_pos = vim.fn.getpos(".")
    pcall(function() vim.cmd [[%s/\s\+$//e]] end)
    vim.fn.setpos(".", cursor_pos)
  end,
})

-- Remove trailing newlines and merge multiple newlines on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    local cursor_pos = vim.fn.getpos(".")
    -- Merge newlines
    pcall(function() vim.cmd [[%s/\n\{3,}/\r\r/e]] end)
    -- Remove trailing newlines at the end of the file
    pcall(function() vim.cmd [[%s/\_s\+\%$//e]] end)
    vim.fn.setpos(".", cursor_pos)
  end,
})
