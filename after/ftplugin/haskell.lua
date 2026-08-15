vim.bo.makeprg = "ghc -dynamic %"

vim.keymap.set("n", "<C-b>", "<cmd>!clear;ghc -dynamic %<CR>", { buffer = true })
vim.keymap.set("n", "<Leader>x", "<cmd>!clear;ghc -dynamic % && ./hello<CR>", { buffer = true })

vim.bo.textwidth = 99
