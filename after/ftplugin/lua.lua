-- Settings for Lua files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		-- Settings for Lua files
		vim.opt.wrap = false -- Disable line wrapping
		vim.opt.textwidth = 99 -- Set the maximum text width for wrapping (unused with wrap = false)
		vim.opt.smartindent = false -- Disable smart indentation

		-- vim: ts=2 sts=2 sw=2 et
		vim.opt.tabstop = 2 -- Set tab stop to 2 spaces
		vim.opt.softtabstop = 2 -- Set soft tab stop to 2 spaces
		vim.opt.shiftwidth = 2 -- Set shift width to 2 spaces
		vim.opt.expandtab = true -- Use spaces instead of tabs
	end,
})

-- Keybinding to clear the screen and run the current Lua file
vim.keymap.set("n", "<Leader>x", "<cmd>!clear;lua %:p<CR>")
