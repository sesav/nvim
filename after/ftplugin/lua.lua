-- Settings for Lua files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		-- Settings for Lua files
		vim.o.wrap = false -- Disable line wrapping
		vim.o.textwidth = 99 -- Set the maximum text width for wrapping (unused with wrap = false)
		vim.o.smartindent = false -- Disable smart indentation

		-- vim: ts=2 sts=2 sw=2 et
		vim.o.tabstop = 2 -- Set tab stop to 2 spaces
		vim.o.softtabstop = 2 -- Set soft tab stop to 2 spaces
		vim.o.shiftwidth = 2 -- Set shift width to 2 spaces
		vim.o.expandtab = true -- Use spaces instead of tabs
	end,
})

-- Keybinding to clear the screen and run the current Lua file
vim.keymap.set("n", "<Leader>x", "<cmd>!clear;lua %:p<CR>")
