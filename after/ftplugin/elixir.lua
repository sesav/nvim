-- Abbreviation for Elixir: "pp" becomes "IO.puts()"
vim.cmd("iabbrev pp IO.puts()<Left>")

-- Keybinding to run Elixir file with clearing the terminal
vim.keymap.set("n", "<Leader>x", "<cmd>!clear;elixir %<CR>")
