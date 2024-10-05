-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-]>", "<C-w>l", { noremap = true })
vim.keymap.set("t", "<C-]>", "<C-\\><C-n><C-w>l", { noremap = true })

vim.keymap.set("n", "<C-[>", "<C-w>h", { noremap = true })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n><C-w>h", { noremap = true })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<C-Esc>", "<Esc>", { noremap = true })

vim.keymap.set("n", "s", "a<BS>", { noremap = true })

vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>//g<left><left><C-r><C-w>", { noremap = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "gd", "gdzz")
vim.keymap.set("n", "gr", "grzz")

vim.keymap.set("n", "d'", "dt_")
vim.keymap.set("n", 'd"', "df_")

vim.keymap.set("n", "c'", "ct_")
vim.keymap.set("n", 'c"', "cf_")

vim.keymap.set("n", "yil", "^y$")
vim.keymap.set("n", "cil", "^c$")
vim.keymap.set("n", "dil", "^d$")

vim.keymap.set("n", "<leader>ci", 'a |> IO.inspect(label: "")<left><left>')
