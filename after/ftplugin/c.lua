vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

-- Compile the current file with gcc; binary is placed next to the source
vim.bo.makeprg = "gcc % -o %:r -g -Wall"

-- Run: compile and execute
vim.keymap.set("n", "<Leader>x", "<cmd>split term://gcc % -o %:r -g -Wall && ./%:r<CR>", { buffer = true })

-- Compile only
vim.keymap.set("n", "<C-b>", "<cmd>split term://gcc % -o %:r -g -Wall<CR>", { buffer = true })

vim.g.vebugger_path_gdb = "gdb"

vim.wo.spell = false
vim.wo.wrap = false
vim.bo.textwidth = 99
