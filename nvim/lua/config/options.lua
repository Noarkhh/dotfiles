-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local on_buf_enter_cb = function()
  if vim.bo.filetype == "python" then
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
    vim.opt_local.textwidth = 79
  end
end
local group = vim.api.nvim_create_augroup("OnBufEnter", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", { group = group, pattern = "*", callback = on_buf_enter_cb })
