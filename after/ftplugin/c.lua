-- Set tab and indentation settings
vim.o.tabstop = 4 -- Set tab stop to 4 spaces
vim.o.softtabstop = 4 -- Set soft tab stop to 4 spaces
vim.o.shiftwidth = 4 -- Set shift width to 4 spaces

-- Set the make program for Zig and C++ files
vim.o.makeprg = "zig c++ %"

-- Keybinding to run Zig C++ file and split the terminal to run the output
vim.keymap.set("n", "<Leader>x", "<cmd>split term://zig c++ % && ./a.out<CR>")

-- Keybinding to split the terminal and run Zig C++ file
vim.keymap.set("n", "<C-b>", "<cmd>split term://zig c++ %<CR>")

-- Set the debugger path for GDB
vim.g.vebugger_path_gdb = "gdb"

-- Additional options
vim.o.spell = false -- Disable spell checking
vim.o.wrap = false -- Disable line wrapping
vim.o.textwidth = 99 -- Set the maximum text width for wrapping
