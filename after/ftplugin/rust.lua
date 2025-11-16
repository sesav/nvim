vim.o.textwidth = 99

-- Keybindings for Rust development
vim.keymap.set("n", "<C-b>", "<cmd>Cargo build<CR>")
vim.keymap.set("n", "<Leader>x", "<cmd>Cargo run<CR>")
vim.keymap.set("n", "<Leader>f", "<cmd>RustFmt<CR>")

-- Tests
vim.keymap.set("n", "<Leader>rt", "<cmd>RustTest<CR>")
vim.keymap.set("n", "<Leader>tt", "<cmd>DebugTest<CR>")

-- ia
vim.cmd("iabbrev dd #[derive(Debug)]")
vim.cmd("iabbrev cmt cmt<Leader>t<Left>")
