-- Keybinding to run the current Python file
vim.keymap.set("n", "<Leader>x", "<cmd>!python3 %<CR>")

-- Disable line wrapping
vim.o.wrap = false

-- Additional options
vim.o.textwidth = 99 -- Set the maximum text width for wrapping
