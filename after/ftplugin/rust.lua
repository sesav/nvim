-- Set the maximum text width for wrapping
vim.opt.textwidth = 99

-- Keybindings for Rust development
vim.keymap.set("n", "<C-b>", "<cmd>Cargo build<CR>") -- Run Cargo build
vim.keymap.set("n", "<Leader>x", "<cmd>RustRun<CR>") -- Run Rust code

-- Abbreviation for Rust: "dd" becomes "#[derive(Debug)]"
vim.cmd("iabbrev dd #[derive(Debug)]")
