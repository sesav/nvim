-- Set the make program for Zig
vim.opt.makeprg = "zig build"

-- Disable automatic saving for Zig formatting
vim.g.zig_fmt_autosave = 0

-- Keybinding to split the terminal and run Zig build and run
vim.keymap.set("n", "<Leader>x", "<cmd>split term://zig build run<CR>")
