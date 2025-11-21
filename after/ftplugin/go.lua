vim.cmd("set makeprg=go\\ build")

vim.keymap.set("n", "<C-b>", "<cmd>!clear;go build<CR>")
vim.keymap.set("n", "<Leader>x", "<cmd>!clear;go run %<CR>")

vim.o.textwidth = 99 -- Set the maximum text width for wrapping
