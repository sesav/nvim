-- aerial
-- https://github.com/stevearc/aerial.nvim

return {
	"stevearc/aerial.nvim",
	config = function()
		require("aerial").setup({
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		})
	end,

	-- Set keymap to toggle aerial
	vim.keymap.set("n", "<F8>", "<cmd>AerialToggle!<CR>"),
}

-- vim: ts=2 sts=2 sw=2 et
