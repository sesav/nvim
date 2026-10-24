-- Same indentation settings as C
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

vim.bo.textwidth = 99

-- Compile the current file with g++; binary is placed next to the source
vim.bo.makeprg = "g++ % -o %:r -g -Wall"

-- Run: compile and execute
vim.keymap.set("n", "<Leader>x", "<cmd>split term://g++ % -o %:r -g -Wall && ./%:r<CR>", { buffer = true })

-- Compile only
vim.keymap.set("n", "<C-b>", "<cmd>split term://g++ % -o %:r -g -Wall<CR>", { buffer = true })

vim.wo.spell = false
vim.wo.wrap = false
