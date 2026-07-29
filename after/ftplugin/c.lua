vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

vim.bo.makeprg = "zig c++ %"

vim.keymap.set("n", "<Leader>x", "<cmd>split term://zig c++ % && ./a.out<CR>")

vim.keymap.set("n", "<C-b>", "<cmd>split term://zig c++ %<CR>")

vim.g.vebugger_path_gdb = "gdb"

vim.wo.spell = false
vim.wo.wrap = false
vim.bo.textwidth = 99
