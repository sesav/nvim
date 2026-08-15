vim.bo.makeprg = "zig build"

vim.g.zig_fmt_autosave = 0

vim.keymap.set("n", "<Leader>x", "<cmd>split term://zig build run<CR>", { buffer = true })
