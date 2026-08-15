vim.bo.textwidth = 99

vim.keymap.set("n", "<C-b>", "<cmd>Cargo build<CR>", { buffer = true })
vim.keymap.set("n", "<Leader>x", "<cmd>Cargo run<CR>", { buffer = true })
vim.keymap.set("n", "<Leader>f", "<cmd>RustFmt<CR>", { buffer = true })

vim.keymap.set("n", "<Leader>rt", "<cmd>RustTest<CR>", { buffer = true })

vim.cmd("iabbrev <buffer> dd #[derive(Debug)]")
vim.cmd("iabbrev <buffer> cmt cmt<Leader>t<Left>")
