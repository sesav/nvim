-- Set the make program for GHC (Glasgow Haskell Compiler)
vim.o.makeprg = "ghc -dynamic %"

-- Keybinding to compile Haskell file with GHC and clear terminal
vim.keymap.set("n", "<C-b>", "<cmd>!clear;ghc -dynamic %<CR>")

-- Keybinding to compile Haskell file, run the output, and clear terminal
vim.keymap.set("n", "<Leader>x", "<cmd>!clear;ghc -dynamic % && ./hello<CR>")

vim.o.textwidth = 99 -- Set the maximum text width for wrapping
