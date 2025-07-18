-- Set I use '\' as the leader key, but you can change it.
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- Enable mode keys in RU layout
vim.o.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

-- Enable line numbers
vim.o.number = true

-- Disable mouse mode, I don't use it.
vim.o.mouse = ""

-- Enable cursorline and cursorcolumn
vim.o.cursorline = true
-- vim.o.cursorcolumn = true

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Copy/Paste to the system clipboard
--  Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Resize windows with Alt + Arrow keys
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Down>", "<cmd>resize -4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Up>", "<cmd>resize +4<CR>", { noremap = true, silent = true })

-- Navigate 4x faster when holding down Ctrl in normal mode
vim.keymap.set("n", "<C-j>", "4j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "4k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "4l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "4h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "4<Down>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Up>", "4<Up>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "b", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "e", { noremap = true, silent = true })

-- For visual mode: x[nore]map
vim.keymap.set("x", "<C-j>", "4j", { noremap = true, silent = true })
vim.keymap.set("x", "<C-k>", "4k", { noremap = true, silent = true })
vim.keymap.set("x", "<C-h>", "4h", { noremap = true, silent = true })
vim.keymap.set("x", "<C-l>", "4l", { noremap = true, silent = true })
vim.keymap.set("x", "<C-Down>", "4<Down>", { noremap = true, silent = true })
vim.keymap.set("x", "<C-Up>", "4<Up>", { noremap = true, silent = true })
vim.keymap.set("x", "<C-Left>", "b", { noremap = true, silent = true })
vim.keymap.set("x", "<C-Right>", "e", { noremap = true, silent = true })

-- Switch between tabs with alt+num
for i = 1, 9 do
	vim.keymap.set("n", "<M-" .. i .. ">", i .. "gt", { noremap = true, silent = true })
end

-- Custom tabline
vim.o.tabline = "%!v:lua.TabLine()"

-- Maximum length for a single tab entry
local MAX_TAB_LENGTH = 40

function _G.TabLine()
	local s = ""
	local current_tab = vim.fn.tabpagenr()
	local total_tabs = vim.fn.tabpagenr("$")

	for i = 1, total_tabs do
		-- Set style for active and inactive tabs
		local hl_group = (i == current_tab) and "%#TabLineSel#" or "%#TabLine#"

		-- Get the buffer for the current tab
		local win = vim.fn.tabpagewinnr(i)
		local bufnr = vim.fn.tabpagebuflist(i)[win]

		-- Get the full file path
		local filepath = vim.fn.bufname(bufnr)

		-- Show "[No Name]" for unsaved buffers
		if filepath == "" then
			filepath = "[No Name]"
		else
			-- Get the relative path
			filepath = vim.fn.fnamemodify(filepath, ":.")
			filepath = filepath:gsub("^%./", "")

			-- Shorten the path if it is too long
			if #filepath > MAX_TAB_LENGTH then
				local parts = {}
				for part in filepath:gmatch("[^/]+") do
					-- Use the first 3 characters for folder name
					table.insert(parts, part:sub(1, 3))
				end

				-- Reassemble the path
				filepath = table.concat(parts, "/")

				-- If the path is still too long, truncate it
				if #filepath > MAX_TAB_LENGTH then
					filepath = "…" .. filepath:sub(-MAX_TAB_LENGTH)
				end
			end
		end

		-- Add the tab index and the file path
		s = s .. hl_group .. " " .. i .. ":" .. filepath .. " "
	end

	-- Add filler to align tabs properly
	s = s .. "%#TabLineFill#"

	return s
end

vim.keymap.set("n", "<leader><F1>", "<cmd>set nu!<CR>", { noremap = true, silent = true })

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
-- This is useful if you want this column to be always available and not take
-- up space when it is displayed dynamically.
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 200

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 500

-- Configure how new splits should be opened
--  This setting specifies that when you split a window vertically (using the
--  :vsplit command or Ctrl-w v), the new window will be opened to the right of
--  the current window. By default, Neovim may open a new window to the left.
vim.o.splitright = true

-- This setting controls where the new window will open when you split the
-- screen horizontally (using the :split command or Ctrl-w s).
-- If set to true, the new window will open below the current one. Without this
-- setting, by default, the new window will open above the current window,
-- which might not always be convenient. Setting splitbelow to true allows you
-- to create a new horizontal split below the current window.
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Search with cursor stay in the middle
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })

-- Find and replace with the word under the cursor
vim.keymap.set("n", "S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, silent = false })

-- Python
local python_venv_path = os.getenv("PYTHON_NVIM_VENV")
vim.g.python3_host_prog = python_venv_path
vim.g.black_linelength = 120

-- Better Netrw configuration
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 15

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
--
-- Clear highlights on search when pressing <Space> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Space>", "<cmd>nohlsearch<CR>")

-- Explore
vim.keymap.set("n", "<leader>e", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>s", "<cmd>Vexplore<CR>")
vim.keymap.set("n", "<leader>S", "<cmd>Hexplore<CR>")
vim.keymap.set("n", "<leader>T", "<cmd>Texplore<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	"NMAC427/guess-indent.nvim", -- Detect tabstop and shiftwidth automatically

	-- See `:help gitsigns` to understand what the configuration keys do
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			current_line_blame_opts = {
				delay = 200,
			},
		},
		vim.keymap.set("n", "gb", "<cmd>Gitsigns blame<CR>"),
		vim.keymap.set("n", "gc", "<cmd>Gitsigns toggle_current_line_blame<CR>"),
		vim.keymap.set("n", "]c", "<cmd>Gitsigns next_hunk<CR>"),
		vim.keymap.set("n", "[c", "<cmd>Gitsigns prev_hunk<CR>"),
	},

	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		defaults = {
			file_ignore_patterns = {
				"venv/.*",
				".vnev/.*",
				"yarn%.lock",
				"package%-lock%.json",
				"pnpm%-lock%.yaml",
				"node_modules/.*",
				"%.git/.*",
				"%.webp",
				"%.avif",
				"%.heic",
				"%.mp3",
				"%.mp4",
				"%.mkv",
				"%.mov",
				"%.wav",
				"%.avi",
				"%.webm",
				"%.ttf",
				"%.otf",
				"%.woff",
				"%.woff2",
				"%.svg",
				"%.png",
				"%.jpeg",
				"%.jpg",
				"%.ico",
				".env.*",
				"%.db",
				".env.*",
				".yarn/.*",
				"go%.sum",
			},
			scroll_strategy = "cycle",
			sorting_strategy = "ascending",
		},
		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! It's more than just a "file finder", it can search
			-- many different aspects of Neovim, your workspace, LSP, and more!
			--
			-- The easiest way to use Telescope, is to start by doing something like:
			--  :Telescope help_tags

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({
				-- You can put your default mappings / updates / etc. in here
				--  All the info you're looking for is in `:help telescope.setup()`
				--
				-- defaults = {
				--   mappings = {
				--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				--   },
				-- },
				-- pickers = {}
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})
			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")

			-- Ctrl+key
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<C-f>", builtin.live_grep, { desc = "[S]earch by [G]rep" })

			-- Space+key
			vim.keymap.set("n", "<space>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<space>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<space>di", vim.diagnostic.disable, { desc = "[D]iagnostics d[i]sable" })
			vim.keymap.set("n", "<space>vd", vim.diagnostic.open_float, { desc = "[V]iew [D]iagnostic" })
			vim.keymap.set("n", "<space>de", vim.diagnostic.enable, { desc = "[D]iagnostics [E]nable" })
			vim.keymap.set("n", "<space>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<space>sf", builtin.lsp_document_symbols, { noremap = true, silent = true })
			vim.keymap.set("n", "<space>st", "<cmd>TodoTelescope<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<space>sm", builtin.marks, { noremap = true, silent = true })
			vim.keymap.set("n", "<space><space>", builtin.buffers, { desc = "[\\] Find existing buffers" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<space>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })
		end,
	},

	-- LSP Plugins
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			-- Mason must be loaded before its dependents so we need to set it up here.
			-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			{ "j-hui/fidget.nvim", opts = {} },

			-- Allows extra capabilities provided by nvim-cmp
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			--  This function gets run when an LSP attaches to a particular buffer.
			--    That is to say, every time a new file is opened that is associated with
			--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
			--    function will be executed to configure the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("ks-lsp-attach", { clear = true }),
				callback = function(event)
					-- NOTE: Remember that Lua is a real programming language, and as such it is possible
					-- to define small helper and utility functions so you don't have to repeat yourself.
					--
					-- In this case, we create a function that lets us more easily define mappings specific
					-- for LSP related items. It sets the mode, buffer and description for us each time.
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-t>.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					-- Find references for the word under your cursor.
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

					-- Fuzzy find all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)

					-- Rename the variable under your cursor.
					--  Most Language Servers support renaming across files, etc.
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header.
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer some lsp support methods only in specific files
					---@return boolean
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client_supports_method(
							client,
							vim.lsp.protocol.Methods.textDocument_documentHighlight,
							event.buf
						)
					then
						local highlight_augroup = vim.api.nvim_create_augroup("ks-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("ks-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "ks-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if
						client
						and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
					then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- Diagnostic Config
			-- See :help vim.diagnostic.Opts
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP specification.
			--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Enable the following language servers
			--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
			--
			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
			local servers = {
				-- clangd = {},
				-- gopls = {},
				-- pyright = {},
				-- rust_analyzer = {},
				-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
				--
				-- Some languages (like typescript) have entire language plugins that can be useful:
				--    https://github.com/pmizio/typescript-tools.nvim
				--
				-- But for many setups, the LSP (`ts_ls`) will work just fine
				-- ts_ls = {},
				--

				lua_ls = {
					-- cmd = { ... },
					-- filetypes = { ... },
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}

			-- Tell Neovim to recognize DockerfileCI as dockerfile filetype
			vim.filetype.add({
				filename = {
					["DockerfileCI"] = "dockerfile",
				},
			})

			-- Ensure the servers and tools above are installed
			--
			-- To check the current status of installed tools and/or manually install
			-- other tools, you can run
			--    :Mason
			--
			-- You can press `g?` for help in this menu.
			--
			-- `mason` had to be setup earlier: to configure its options see the
			-- `dependencies` table for `nvim-lspconfig` above.
			--
			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {
					"rust_analyzer",
					"gopls",
					"clangd",
					"pyright",
					"cmake",
					"marksman",
				}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for ts_ls)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				local lsp_format_opt
				if disable_filetypes[vim.bo[bufnr].filetype] then
					lsp_format_opt = "never"
				else
					lsp_format_opt = "fallback"
				end
				return {
					timeout_ms = 500,
					lsp_format = lsp_format_opt,
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				python = {
					"ruff_fix", -- To fix lint errors.
					"ruff_format", -- To run the formatter.
				},
			},
		},
	},

	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),

				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					"rafamadriz/friendly-snippets",
				},
			},
			"saadparwaiz1/cmp_luasnip",

			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({
				-- Enable autotriggered snippets
				enable_autosnippets = true,
				-- Use Tab (or some other key if you prefer) to trigger visual selection
				store_selection_keys = "<Tab>",
			})

			-- Load snippets from friendly-snippets (VSCode format)
			local vscode_status_ok, vscode_loader = pcall(require, "luasnip.loaders.from_vscode")
			if vscode_status_ok then
				vscode_loader.lazy_load()
			else
				print("Warning: Could not load VSCode snippets")
			end

			-- Load snippets from local snippets folder (SnipMate format)
			local snipmate_status_ok, snipmate_loader = pcall(require, "luasnip.loaders.from_snipmate")
			if snipmate_status_ok then
				snipmate_loader.lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
			else
				print("Warning: Could not load SnipMate snippets")
			end

			-- Create a command to reload snippets
			vim.api.nvim_create_user_command("LuaSnipReload", function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_snipmate").lazy_load({
					paths = { vim.fn.stdpath("config") .. "/snippets" },
				})
				print("Snippets reloaded!")
			end, {})

			-- Create a command to list available snippets for current filetype
			vim.api.nvim_create_user_command("LuaSnipList", function()
				local luasnip_status_ok, luasnip = pcall(require, "luasnip")
				if not luasnip_status_ok then
					print("LuaSnip not available")
					return
				end

				local ft = vim.bo.filetype
				local snippets = luasnip.get_snippets(ft)

				if not snippets or #snippets == 0 then
					print("No snippets found for filetype: " .. ft)
					return
				end

				print("Available snippets for " .. ft .. ":")
				for _, snippet in ipairs(snippets) do
					print("  " .. snippet.trigger .. " - " .. (snippet.name or ""))
				end
			end, {})

			-- Create a command to test snippet expansion
			vim.api.nvim_create_user_command("LuaSnipTest", function()
				local luasnip_status_ok, luasnip = pcall(require, "luasnip")
				if not luasnip_status_ok then
					print("LuaSnip not available")
					return
				end

				print("LuaSnip is working!")
				print("Available loaders:")
				local loaders = {
					"from_vscode",
					"from_snipmate",
					"from_lua",
				}

				for _, loader_name in ipairs(loaders) do
					local loader_status_ok, loader = pcall(require, "luasnip.loaders." .. loader_name)
					if loader_status_ok then
						print("  ✓ " .. loader_name)
					else
						print("  ✗ " .. loader_name)
					end
				end

				print("\nКак использовать снипеты:")
				print("1. Напечатайте триггер снипета (например, 'main' в Python)")
				print("2. Нажмите Tab для выбора снипета из автодополнения")
				print("3. Или нажмите Leader + t для прямого расширения снипета")
				print("4. Используйте Ctrl+L для перехода к следующему placeholder")
				print("5. Используйте Ctrl+H для перехода к предыдущему placeholder")
			end, {})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- Configure formatting for better snippet visibility
				formatting = {
					format = function(entry, item)
						-- Add icons for different sources
						local icons = {
							nvim_lsp = "🔧",
							luasnip = "📝",
							path = "📁",
							nvim_lsp_signature_help = "📋",
						}

						local source_name = entry.source.name
						item.menu = icons[source_name] or "❓"

						-- Highlight snippets differently
						if source_name == "luasnip" then
							item.kind = "Snippet"
						end

						return item
					end,
				},

				-- For an understanding of why these mappings were
				-- chosen, you will need to read `:help ins-completion`
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<C-n>"] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					["<C-p>"] = cmp.mapping.select_prev_item(),

					-- Scroll the documentation window [b]ack / [f]orward
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					-- Traditional completion keymaps with snippet support
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expandable() then
							luasnip.expand()
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),

					-- Manually trigger a completion from nvim-cmp.
					--  Generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					["<C-Space>"] = cmp.mapping.complete({}),

					-- <c-l> will move you to the right of each of the expansion locations.
					-- <c-h> is similar, except moving you backwards.
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),

					-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
					--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
				}),
				sources = {
					{
						name = "lazydev",
						-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
						group_index = 0,
					},
					{ name = "nvim_lsp", priority = 1000 },
					{ name = "luasnip", priority = 750 },
					{ name = "path", priority = 500 },
					{ name = "nvim_lsp_signature_help", priority = 250 },
				},
			})

			-- Add Leader + t mapping for snippet expansion
			vim.keymap.set("i", "<leader>t", function()
				if luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				end
			end, { desc = "Expand snippet or jump to next placeholder" })

			-- Also add it for normal mode to trigger snippet expansion
			vim.keymap.set("n", "<leader>t", function()
				if luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				end
			end, { desc = "Expand snippet or jump to next placeholder" })
		end,
	},

	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},

	{ -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"ellisonleao/gruvbox.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("gruvbox").setup({
				styles = {
					comments = { italic = false }, -- Disable italics in comments
				},
			})

			-- Color scheme
			vim.o.background = "dark" -- or "light" for dark mode
			vim.cmd.colorscheme("gruvbox")
		end,
	},

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },

		-- Set keymap for quick asscess
		vim.keymap.set("n", "<F10>", "<cmd>TodoTelescope<CR>"),
	},

	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			},
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		-- There are additional nvim-treesitter modules that you can use to interact
		-- with nvim-treesitter. You should go explore a few and see what interests you:
		--
		--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
		--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
		--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	},
	require("well.plugins.debug"),
	require("well.plugins.autopairs"),
	require("well.plugins.aerial"),
	require("well.plugins.harpoon"),
	require("well.plugins.dadbod"),
})

-- For dadbod-completion
local cmp = require("cmp")
cmp.setup.filetype({ "sql" }, {
	sources = {
		{ name = "vim-dadbod-completion" },
		{ name = "biffer" },
	},
})

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup({})

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-t>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-h>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-n>", function()
	harpoon:list():select(3)
end)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
