vim.bo.makeprg = "go\\ build"

vim.keymap.set("n", "<C-b>", "<cmd>!clear;go build<CR>", { buffer = true })
vim.keymap.set("n", "<Leader>x", "<cmd>!clear;go run %<CR>", { buffer = true })

vim.bo.textwidth = 99
