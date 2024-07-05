-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>;", "<C-w><C-w>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-]>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-[>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t", ":tabclose #<CR>")
vim.keymap.set("n", "s", "a<BS>")
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>//g<left><left>")
