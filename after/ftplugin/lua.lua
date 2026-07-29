vim.wo.wrap = false
vim.bo.textwidth = 99
vim.bo.smartindent = false

vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true

vim.keymap.set("n", "<Leader>x", "<cmd>!clear;lua %:p<CR>")
