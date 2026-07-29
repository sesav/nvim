vim.bo.textwidth = 99

vim.keymap.set("n", "<C-b>", "<cmd>Cargo build<CR>")
vim.keymap.set("n", "<Leader>x", "<cmd>Cargo run<CR>")
vim.keymap.set("n", "<Leader>f", "<cmd>RustFmt<CR>")

vim.keymap.set("n", "<Leader>rt", "<cmd>RustTest<CR>")
vim.keymap.set("n", "<Leader>tt", "<cmd>DebugTest<CR>")

vim.cmd("iabbrev dd #[derive(Debug)]")
vim.cmd("iabbrev cmt cmt<Leader>t<Left>")
