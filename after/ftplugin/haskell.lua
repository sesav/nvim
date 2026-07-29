vim.bo.makeprg = "ghc -dynamic %"

vim.keymap.set("n", "<C-b>", "<cmd>!clear;ghc -dynamic %<CR>")
vim.keymap.set("n", "<Leader>x", "<cmd>!clear;ghc -dynamic % && ./hello<CR>")

vim.bo.textwidth = 99
