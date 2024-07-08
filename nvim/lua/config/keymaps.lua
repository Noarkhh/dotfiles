-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-]>", "<C-w>l", { noremap = true })
vim.keymap.set("t", "<C-]>", "<C-\\><C-n><C-w>l", { noremap = true })

vim.keymap.set("n", "<C-[>", "<C-w>h", { noremap = true })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n><C-w>h", { noremap = true })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

vim.keymap.set("n", "s", "a<BS>", { noremap = true })

vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>//g<left><left>", { noremap = true })
