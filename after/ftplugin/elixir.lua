-- Abbreviation for Elixir: "pp" becomes "IO.puts()"
vim.cmd("iabbrev <buffer> pp IO.puts()<Left>")

-- Keybinding to run Elixir file with clearing the terminal
vim.keymap.set("n", "<Leader>x", "<cmd>!clear;elixir %<CR>", { buffer = true })
