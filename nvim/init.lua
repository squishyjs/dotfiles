--[[
…………………………………………………………………………………………………………………………………………………………

     *                                       █████▓▓░
                                 *         ███▓░     ░░
            ░░░░░░                        ███▓░
    ░░░   ░░░░░░░░░░                      ███▓░
   ░░░░░░░░░░░░░░░░░░░    *                ██▓░░      ▓
                                             ░▓▓███▓▓░
 *                                 ░░░░
                                 ░░░░░░░░
                               ░░░░░░░░░░░░░░░░
       █████████                                        *
      ██▄█████▄██                        *
       █████████      *
…………………█ █   █ █………………………………………………………………………………………………………………



--]]

vim.opt.termguicolors = true

vim.opt.termguicolors = true

-- Control scroll set to 8
vim.o.scroll = 8

-- Enable modeline for individual files (c++ primarily)
vim.opt.modeline = true
vim.opt.modelines = 5

-- Delete a single word in insert mode
vim.api.nvim_set_keymap("i", "<M-Backspace>", "<C-w>", { noremap = true, silent = true })

-- Vertical split terminal
vim.api.nvim_set_keymap("n", "<C-v>", ":vsplit | terminal<CR>", { noremap = true, silent = true })

-- Horizontal split terminal
vim.api.nvim_set_keymap("n", "<C-s>", ":split | terminal<CR>", { noremap = true, silent = true })

-- Exit a terminal window
vim.api.nvim_set_keymap("n", "<C-Space>", ":q<CR>", { noremap = true, silent = true })

-- Open Library Functions Manual on current function
vim.keymap.set("n", "<Space>e", function()
	local word = vim.fn.expand("<cword>")
	vim.cmd("Man " .. word)
end, { noremap = true, desc = "Library Functions Manual" })

-- Optional: Customize the virtual text and underline
vim.diagnostic.config({
	virtual_text = true, -- Display diagnostics inline
	underline = false, -- Highlight errors/warnings under the text
})
-- Unbind replace keybind
-- vim.api.nvim_set_keymap("n", "r", "", { noremap = true, silent = true })

-- Keybind for 'nvim' Dashboard (goolord)
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>ene<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ee", "<cmd>Neotree<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>wr", "<cmd>SessionRestore<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "q", "<cmd>qa<CR>", { noremap = true, silent = true })

vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "red" })

-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.wo.number = false
		vim.wo.relativenumber = false
	end,
})

-- SET SPACE <space> = leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Make line numbers default
vim.opt.number = true

-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Show mode on bottom of screen
vim.opt.showmode = true
--  Sync OS with Clipboard | See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Keep signcolumn on by default
vim.opt.signcolumn = "no"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = " ", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Set colour for cursorline and NR (Number Relative)
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "" })
		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "" })
	end,
})

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>qd", vim.diagnostic.setloclist, { desc = "Open [Quick] [D]iagnostic" })
-- vim.keymap.set("n", "<leader>qf", "<cmd>TodoQuickFix<CR>", { desc = "Open [Q]uick [F]ix list" })
vim.keymap.set("n", "<leader>qf", "<cmd>TodoTelescope<CR>", { desc = "Open [Quick] [F]ix Telescope" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

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
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- NOTE: Plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	--
	-- Use `opts = {}` to force a plugin to be loaded.
	--

	-- Here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
	--    require('gitsigns').setup({ ... })
	--
	-- See `:help gitsigns` to understand what the configuration keys do

	-- GITSIGNS
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			current_line_blame = true, -- Inline blame for the current line
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- Show blame text at the end of the line
				delay = 100, -- Delay in milliseconds before showing blame text
				ignore_whitespace = false, -- Show blame even if only whitespace changes
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				-- Keymaps
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage hunk (visual)" })
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset hunk (visual)" })
				map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
				map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
				map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
				map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, { desc = "Blame line (full)" })
				map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
				map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, { desc = "Diff this (against ~)" })
				map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted" })

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
	},

	-- NEO TREE
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},

	-- NEO GIT
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
	},

	-- ALPHA NVIM (Dashboard)
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Set header
			dashboard.section.header.val = {
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                     ",
			}

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("SPC e", "  > New File", "<cmd>ene<CR>"),
				dashboard.button("SPC n", "  > Toggle file explorer", "<cmd>Neotree<CR>"),
				dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
				dashboard.button("SPC fw", "  > Find Word"),
				dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
				dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
			}

			-- Send config to alpha
			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		end,
	},

	{

		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")

			-- Setup which-key (keep default or customize)
			wk.setup()

			-- Add your key mappings
			wk.add({
				{ "<leader>g", group = "Git Telescope" },
				{ "<leader>G", group = "Git Actions" },
				{ "<leader>s", group = "Search" },
			})
		end,
	},

	-- WEB-DEV-ICONS
	{
		"nvim-tree/nvim-web-devicons",
		enabled = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- NVIM TREE (similar to Neotree)
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},

	--LUA LINE
	{
		--[[
+-------------------------------------------------+
| A | B | C                             X | Y | Z |
+-------------------------------------------------+
    --]]
		"nvim-lualine/lualine.nvim",
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- File icons

		config = function()
			require("lualine").setup({
				options = {
					-- theme = "gruvbox-material",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					-- icons_enabled = false,
					diagnostics_colour = { error = { fg = "#ea580c" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostic" }, -- original: { "branch", "diff", "diagnostic" }
					lualine_c = {
						"filename",
						{
							"diagnostics",
							sources = { "nvim_lsp" },
							sections = { "error", "warn", "info", "hint" },
						},
					},
					lualine_x = {
						"encoding",
						-- {
						-- 	"fileformat",
						-- 	symbols = {
						-- 		unix = "",
						-- 	},
						-- },
						"filetype",
					},
					lualine_z = { "location" },

					-- jdh lualine (below)
					-- lualine_a = { "mode" },
					-- lualine_b = { "branch", "diff", "diagnostics" },
					-- lualine_c = {
					-- 	"filename",
					-- 	function()
					-- 		return vim.fn["nvim_treesitter#statusline"](180)
					-- 	end,
					-- },
					-- lualine_x = { "encoding", "fileformat", "filetype" },
					-- lualine_y = { "progress" },
					-- lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
				},
				extensions = { "fugitive" }, -- Git integration
			})
		end,
	},

	-- NAVBUDDY
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"SmiteshP/nvim-navbuddy",
				dependencies = {
					"SmiteshP/nvim-navic",
					"MunifTanjim/nui.nvim",
				},
				opts = { lsp = { auto_attach = true } },
			},
		},
	},

	-- DROPBAR (similar to BREADCRUMBS)
	-- {
	-- 	"Bekaboo/dropbar.nvim",
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope-fzf-native.nvim",
	-- 		build = "make",
	-- 	},
	-- 	config = function()
	-- 		local dropbar_api = require("dropbar.api")

	-- 		require("dropbar").setup({
	-- 			bar = {
	-- 				hover = false,
	-- 			},
	-- 		})

	-- 		vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
	-- 		vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
	-- 		vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
	-- 	end,
	-- },

	-- -- BREADCRUMBS
	-- {
	-- 	"LunarVim/breadcrumbs.nvim",
	-- 	dependencies = {
	-- 		{ "SmiteshP/nvim-navic" },
	-- 	},
	-- 	config = function()
	-- 		require("nvim-navic").setup({
	-- 			lsp = {
	-- 				auto_attach = true,
	-- 			},
	-- 			icons = require("nvim-web-devicons").get_icons(),
	-- 		})
	-- 		require("breadcrumbs").setup()
	-- 	end,
	-- },

	-- nvim DAP UI
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},

	-- DAP (debug adapter protocol)
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui", -- ui for debugging
			"thehamsta/nvim-dap-virtual-text", -- inline virtual texta
		},

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local dapvt = require("nvim-dap-virtual-text")

			dapui.setup()
			dapvt.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- dap.adapters.lldb = {
			-- 	type = "executable",
			-- 	command = "/opt/homebrew/opt/llvm/bin/lldb-dap", -- or "/usr/bin/lldb-dap" depending on your setup
			-- 	name = "lldb",
			-- 	options = { "server" },
			-- }

			-- dap.configurations.cpp = {
			-- 	{
			-- 		name = "launch c++",
			-- 		type = "lldb",
			-- 		request = "launch",
			-- 		program = function()
			-- 			return vim.fn.input("path to executable: ", vim.fn.getcwd() .. "/", "file")
			-- 		end,
			-- 		cwd = vim.fn.getcwd(),
			-- 		stopatentry = false,
			-- 		setupcommands = {
			-- 			{
			-- 				text = "-enable-pretty-printing",
			-- 				description = "enable pretty printing",
			-- 				ignorefailures = false,
			-- 			},
			-- 		},
			-- 	},
			-- }
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					-- command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
					command = "codelldb",
					args = { "--port", "${port}" },
				},
			}

			dap.configurations.cpp = {
				{
					name = "Launch",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

			-- same config for c
			dap.configurations.c = dap.configurations.cpp
		end,
	},

	-- mason nvim-dap
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
		config = function()
			require("mason-nvim-dap").setup({
				automatic_installation = true,
				ensure_installed = { "codelldb" },
			})
		end,
	},
	-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
	--
	-- This is often very useful to both group configuration, as well as handle
	-- lazy loading plugins that don't need to be loaded immediately at startup.
	--
	-- For example, in the following configuration, we use:
	--  event = 'VimEnter'
	--
	-- which loads which-key before all the UI elements are loaded. Events can be
	-- normal autocommands events (`:help autocmd-events`).
	--
	-- Then, because we use the `config` key, the configuration only runs
	-- after the plugin has been loaded:
	--  config = function() ... end

	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		opts = {
			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = vim.g.have_nerd_font,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
				},
			},

			-- Document existing key chains
			spec = {
				{ "<leader>c", group = "[C]ode", mode = { "n", "x" } },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>t", group = "[T]oggle" },
				-- { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			},
		},
	},

	{ -- Fuzzy Finder (files, lsp, etc) i.e Telescope
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
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
		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! It's more than just a "file finder", it can search
			-- many different aspects of Neovim, your workspace, LSP, and more!
			--
			-- The easiest way to use Telescope, is to start by doing something like:
			--  :Telescope help_tags
			--
			-- After running this command, a window will open up and you're able to
			-- type in the prompt window. You'll see a list of `help_tags` options and
			-- a corresponding preview of the help.
			--
			-- Two important keymaps to use while in Telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--
			-- This opens a window that shows you all of the keymaps for the current
			-- Telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

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
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>F", builtin.find_files, { desc = "Fuzzy Find Files" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>s.", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>sr", builtin.oldfiles, { desc = "[S]earch Recent Files" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>ff", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[F]uzzy [F]ind in current buffer" })

			-- search current open files
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- search command history
			vim.keymap.set("n", "<leader>cs", function()
				builtin.colorscheme({
					prompt_title = "Choose Colorscheme",
				})
			end, { desc = "[Search] [C]olorscheme" })

			-- search command history
			vim.keymap.set("n", "<leader>sc", function()
				builtin.command_history({
					prompt_title = "cmd history",
				})
			end, { desc = "[Search] [C]ommand History" })

			vim.keymap.set("n", "<leader>shi", function()
				builtin.highlights({
					prompt_title = "show highlgihts",
				})
			end, { desc = "[Search] [H][I]ghlights" })

			-- search config files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })

			-- search git commit history files
			vim.keymap.set("n", "<leader>sG", function()
				builtin.git_commits({
					prompt_title = "Search Git Commits",
				})
			end, { desc = "[S]earch [G]it Commits" })
		end,
	},

	{
		"junegunn/fzf.vim",
		dependencies = { "junegunn/fzf" },
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
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},

	{ "Bilal2453/luvit-meta", lazy = true },

	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- Allows extra capabilities provided by nvim-cmp
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Brief aside: **What is LSP?**
			--
			-- LSP is an initialism you've probably heard, but might not understand what it is.
			--
			-- LSP stands for Language Server Protocol. It's a protocol that helps editors
			-- and language tooling communicate in a standardized fashion.
			--
			-- In general, you have a "server" which is some tool built to understand a particular
			-- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
			-- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
			-- processes that communicate with some "client" - in this case, Neovim!
			--
			-- LSP provides Neovim with features like:
			--  - Go to definition
			--  - Find references
			--  - Autocompletion
			--  - Symbol Search
			--  - and more!
			--
			-- Thus, Language Servers are external tools that must be installed separately from
			-- Neovim. This is where `mason` and related plugins come into play.
			--
			-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
			-- and elegantly composed help section, `:help lsp-vs-treesitter`

			--  This function gets run when an LSP attaches to a particular buffer.
			--    That is to say, every time a new file is opened that is associated with
			--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
			--    function will be executed to configure the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
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

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
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
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>ti", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- Change diagnostic symbols in the sign column (gutter)
			-- if vim.g.have_nerd_font then
			--   local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
			--   local diagnostic_signs = {}
			--   for type, icon in pairs(signs) do
			--     diagnostic_signs[vim.diagnostic.severity[type]] = icon
			--   end
			--   vim.diagnostic.config { signs = { text = diagnostic_signs } }
			-- end

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
			local servers =
				{
					-- Lua
					lua_ls = {
						cmd = { "--force-accept-workspace" },
						-- filetypes = { ...},
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
					-- C++
					clangd = {
						cmd = {
							"clangd",
							"--header-insertion=iwyu",
							"--fallback-style=none",
							"--completion-style=detailed",
							"--function-arg-placeholders",
							"--pretty",
							"-j=4",
							"--inlay-hints",
							"--all-scopes-completion",
							"--pch-storage=memory",
							"--background-index",
							"--completion-style=detailed",
						},
						filetypes = { "cpp", "hpp", "c", "objc", "objcpp" },
						root_dir = require("lspconfig").util.root_pattern("compile_commandsjson", ".git"),
						capabilities = capabilities,
						settings = {
							clangd = {
								cmd = {
									"clangd",
									"--header-insertion=iwyu",
									"--fallback-style=none",
									"--completion-style=detailed",
									"--function-arg-placeholders",
									"--pretty",
									"-j=4",
									"--inlay-hints",
									"--all-scopes-completion",
									"--pch-storage=memory",
									"--background-index",
									"--completion-style=detailed",
								},
								completion = { include = true },
								fallbackFlags = { "-std=c++17" },
							},
						},
					},
					-- Rust
					rust_analyzer = {
						cmd = { "rust-analyzer" },
						filetypes = { "rust" },
						capabilities = capabilities,
						settings = {
							["rust-analyzer"] = {
								cargo = {
									allFeatures = true,
								},
								checkOnSave = {
									command = "clippy",
								},
							},
						},
					},
					-- Python
					pyright = {
						cmd = { "pyright-langserver", "--stdio" },
						filetypes = { "python" },
						settings = {
							python = {
								analysis = {
									typeCheckingMode = "basic", -- check region().functionNode().split()
									autoSearchPaths = true,
									diagnosticMode = "workspace",
									useLibraryCodeForTypyes = true,
								},
							},
						},
					},
					-- HTML LSP
					html = {
						cmd = { "vscode-html-language-server", "--stdio" },
						filetypes = { "html" },
						capabilities = capabilities,
					},

					-- CSS
					cssls = {
						cmd = { "vscode-css-language-server", "--stdio" },
						filetypes = { "css", "scss", "less" },
						capabilities = capabilities,
					},

					-- JavaScript & TypeScript
					ts_ls = {
						cmd = { "typescript-language-server", "--stdio" },
						filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
						root_dir = require("lspconfig").util.root_pattern(
							"package.json",
							"tsconfig.json",
							"jsconfig.json",
							".git"
						),
						capabilities = capabilities,
					},
					jdtls = { -- Java
						cmd = {
							"/usr/bin/java", -- Need to adjust java binary path
							"-Declipse.application=org.eclipse.jdt.ls.core.id1",
							"-Dosgi.bundles.defaultStartLevel=4",
							"-Declipse.product=org.eclipse.jdt.ls.core.product",
							"-Dlog.level=ALL",
							"-noverify",
							"-Xmx1G",
							"-jar",
							"/path/to/jdtls/plugins/org.eclipse.equinox.launcher_VERSION.jar", -- need to adjust for local version
							"-configuration",
							"/path/to/jdtls/config_mac", -- Or config_mac, config_linux
							"-data",
							vim.fn.stdpath("cache") .. "/jdtls-workspace",
						},
						filetypes = { "java" },
						root_dir = require("lspconfig").util.root_pattern(
							".git",
							"mvnw",
							"gradlew",
							"pom.xml",
							"build.xml"
						),
						settings = {
							java = {
								configuration = {
									runtimes = {
										{
											name = "JavaSE-11",
											path = "/path/to/java11", -- Path to Java 11
										},
										{
											name = "JavaSE-17", -- dap protoocl
											path = "/path/to/java17", -- Path to Java 17
										},
									},
								},
							},
						},
						init_options = {
							bundles = {}, -- Add any additional bundles (e.g., for debugging)
						},
					},
				},
				-- Ensure the servers and tools above are installed
				--  To check the current status of installed tools and/or manually install
				--  other tools, you can run
				--    :Mason
				--
				--  You can press `g?` for help in this menu.
				require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
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

	-- AUTOTAG
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = { "html", "svelte", "tsx", "xml", "vue" },
			})
		end,
	},

	-- AUTOFORMAT
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>fb", -- keyboard shortcut
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
				-- python = { "isort", "black" },
				-- cpp = { "clang-format" },
				-- You can use 'stop_after_first' to run the first available formatter from the list
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},

	{
		"nvzone/typr",
		dependencies = "nvzone/volt",
		opts = {},
		cmd = { "Typr", "TyprStats" },
	},

	-- Harpoon
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

		config = function()
			local harpoon = require("harpoon")

			-- REQUIRED
			harpoon:setup()
			-- REQUIRED

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Poon Current Buffer" })
			vim.keymap.set("n", "<C-e>", function()
				harpoon:list():remove()
			end, { desc = "Remove Current Buffer from Harpoon" })

			-- OLD HARPOON UI
			-- vim.keymap.set("n", "<C-h>", function()
			-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
			-- end, { desc = "Toggle Poon Menu" })

			vim.keymap.set("n", "<C-1>", function()
				harpoon:list():select(1)
			end, { desc = "Select 1st Poon buffer" })
			vim.keymap.set("n", "<C-2>", function()
				harpoon:list():select(2)
			end, { desc = "Select 2nd Poon buffer" })
			vim.keymap.set("n", "<C-n>", function()
				harpoon:list():select(3)
			end, { desc = "Select 3rd Poon buffer" })
			vim.keymap.set("n", "<C-4>", function()
				harpoon:list():select(4)
			end, { desc = "Select 4th Poon buffer" })

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-S-P>", function()
				harpoon:list():prev()
			end, { desc = "Prev Poon Buffer" })
			vim.keymap.set("n", "<C-S-N>", function()
				harpoon:list():next()
			end, { desc = "Next Poon Buffer" })
			harpoon:setup({})

			-- basic telescope configuration
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			vim.keymap.set("n", "<C-h>", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open Harpoon Window" })
		end,
	},

	-- NVIM AUTOPAIRS
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "spectre_panel" },
				disable_in_macro = true, -- disable when recording or executing a macro
				disable_in_visualblock = false, -- disable when insert after visual block mode
				disable_in_replace_mode = true,
				ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
				enable_moveright = true,
				enable_afterquote = true, -- add bracket pairs after quote
				enable_check_bracket_line = true, --- check bracket in same line
				enable_bracket_in_quote = true, -- enable bracket inside quotes
				enable_abbr = false, -- trigger abbreviation
				break_undo = true, -- switch for basic rule break undo sequence
				check_ts = false,
				map_cr = true,
				map_bs = true, -- map the <BS> key
				map_c_h = false, -- Map the <C-h> key to delete a pair
				map_c_w = false, -- map <c-w> to delete a pair if possible
			})
		end,
	},

	-- FLASH NVIM
	{
		"folke/flash.nvim",
		event = "VeryLazy",

		---@type Flash.Config
		opts = {},
		-- stylua: ignore,
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},

	-- YAZI NVIM
	---@type LazySpec
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>-",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<c-up>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		---@type YaziConfig
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
	},

	-- COMMENT NVIM
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				-- Optional configuration settings
				padding = true, -- Add space between comment and line
				sticky = true, -- Keep cursor at the same position after commenting
				ignore = "^$", -- Don't comment empty lines
				toggler = {
					line = "<leader>c", -- key to toggle comment on a line
					block = "<leader>/", -- key to toggle comment on a block
				},
				opleader = {
					line = "<leader>c", -- key to comment on a line in visual mode
					block = "<leader>/", -- key to comment on a block in visual mode
				},
				extra = {
					above = "<leader>ca", -- key to comment above
					below = "<leader>cb", -- key to comment below
				},
				mappings = {
					basic = true, -- Enable basic mappings
					extra = true, -- Enable extra mappings
					extended = true, -- Enable extended mappings
				},
			})
		end,
	},

	{
		"cappyzawa/trim.nvim",
		config = function()
			require("trim").setup({})
		end,
	},

	-- AUTOCOMPLETION
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
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
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
			},
			"saadparwaiz1/cmp_luasnip",

			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- For an understanding of why these mappings were
				-- chosen, you will need to read `:help ins-completion`
				--
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<C-n>"] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					["<C-p>"] = cmp.mapping.select_prev_item(),

					-- Scroll the documentation window [b]ack / [f]orward
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					-- Accept ([y]es) the completion.
					--  This will auto-import if your LSP supports it.
					--  This will expand snippets if the LSP sent a snippet.
					["<C-y>"] = cmp.mapping.confirm({ select = true }),

					-- If you prefer more traditional completion keymaps,
					-- you can uncomment the following lines
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),

					-- Manually trigger a completion from nvim-cmp.
					--  Generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					["<C-Space>"] = cmp.mapping.complete({}),

					-- Think of <c-l> as moving to the right of your snippet expansion.
					--  So if you have a snippet that's like:
					--  function $name($args)
					--    $body
					--  end
					--
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
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},

	-- LIVE PREVIEW NVIM
	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			-- You can choose one of the following pickers
			"nvim-telescope/telescope.nvim",
			"ibhagwan/fzf-lua",
			"echasnovski/mini.pick",
			"folke/snacks.nvim",
		},
	},

	-- TRANSPARENT NVIM
	{
		"xiyaowong/nvim-transparent",
		config = function()
			require("transparent").setup({
				enable = true, -- Enable transparent mode
				extra_groups = { -- Add these groups to the set of transparent groups
					"Normal",
					"NormalNC",
					"Comment",
					"LineNr",
					"Folded",
					"NonText",
					"SpecialKey",
					"VertSplit",
					"SignColumn",
					"EndOfBuffer",
				},
				exclude = {
					"TelescopeNormal",
					"TelescopeBorder",
					"TelescopePromptNormal",
					"TelescopePromptBorder",
				},
			})
		end,
	},

	-- Gruvbox theme (current theme)
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000, -- Ensure this loads before other plugins
		config = function()
			require("gruvbox").setup({
				terminal_colors = false, -- Enable terminal colors
				undercurl = true,
				bold = false,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- Invert for search, diffs, statuslines, errors
				contrast = "hard", -- Set to "hard", "soft", or leave empty for default
				palette_overrides = {
					bg = "0x1d2021",
					red = "#cc241d",
					green = "#98971a",
					yellow = "#d79921",
					blue = "#458588",
					purple = "#b16286",
					aqua = "#689d6a",
					gray = "#928374",
					bg0_h = "#1d2021",
					orange = "#fe8018",
					fg = "#ebdbb2",
				}, -- Customize palette
				overrides = {
					-- Normal = { bg = "#1d2021" },
					-- NormalNC = { bg = "#1d2021" },
					-- SignColumn = { bg = "#1d2021" },
					-- EndOfBuffer = { bg = "#1d2021" },
					-- NormalFloat = { bg = "#1d2021" },
					-- FloatBorder = { bg = "#1d2021" },
				},
				dim_inactive = false, -- Do not dim inactive windows
				transparent_mode = false, -- Disable transparent background
			})
			vim.cmd("colorscheme gruvbox") -- Load the colorscheme
		end,
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
		gui_style = {
			fg = "NONE",
			bg = "NONE",
		},
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

	-- TREESITTER
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		opts = {
			ensure_installed = {
				"bash",
				"cpp",
				"css",
				"rust",
				"python",
				"javascript",
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
				additional_vim_regex_highlighting = { "ruby", "javascript", "html", "typescript" },
			},
			indent = { enable = true, disable = { "ruby", "javascript", "html", "typescript" } },
		},
		-- There are additional nvim-treesitter modules that you can use to interact
		-- with nvim-treesitter. You should go explore a few and see what interests you:
		--
		--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
		--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
		--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	},

	-- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
	-- init.lua. If you want these files, they are in the repository, so you can just download them and
	-- place them in the correct locations.

	-- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
	--
	--  Here are some example plugins that I've included in the Kickstart repository.
	--  Uncomment any of the lines below to enable them (you will need to restart nvim).
	--
	-- require 'kickstart.plugins.debug',
	-- require 'kickstart.plugins.indent_line',
	-- require("kickstart.plugins.lint"),
	-- require 'kickstart.plugins.autopairs',
	-- require("kickstart.plugins.neo-tree"),
	-- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    This is the easiest way to modularize your config.
	--
	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	-- { import = 'custom.plugins' },
	--
	-- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
	-- Or use telescope!
	-- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
	-- you can continue same window with `<space>sr` which resumes last telescope search
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- Custom (Auto) Spacing (in Neovim Buffer) for C/C++
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "cpp", "hpp", "c", "objc", "objcpp", "h" },
	callback = function()
		vim.bo.shiftwidth = 4
		vim.bo.tabstop = 4
		vim.bo.softtabstop = 4
		vim.bo.expandtab = true
	end,
})

-- Keymap to split a terminal in the current buffer with Ctrl + S
vim.api.nvim_set_keymap(
	"n", -- Normal mode
	"<C-s>", -- Ctrl + S
	":split | terminal<CR>", -- Command to open a horizontal terminal split
	{ noremap = true, silent = true } -- Options: no remap, silent execution
)

-- Toggle Lazy Nvim
vim.api.nvim_set_keymap("n", "<leader>l", ":Lazy<CR>", { noremap = true, silent = true })

-- Toggle Mason
vim.api.nvim_set_keymap("n", "<leader>m", ":Mason<CR>", { noremap = true, silent = true })

-- Toggle neotree
vim.api.nvim_set_keymap(
	"n",
	"<leader>n",
	":Neotree filesystem reveal right toggle<CR>",
	{ noremap = true, silent = true }
)

-- Toggle navbuddy
vim.api.nvim_set_keymap("n", "<leader>N", ":Navbuddy<CR>", { noremap = true, silent = true })

-- Toggle Neogit
vim.api.nvim_set_keymap("n", "<leader>Gn", ":Neogit<CR>", { noremap = true, silent = true })

-- Toggle AST
vim.api.nvim_set_keymap("n", "<leader>i", ":InspectTree<CR>", { noremap = true, silent = true })

-- Toggle gitsigns
vim.api.nvim_set_keymap("n", "<leader>Gs", ":Gitsigns<CR>", { noremap = true, silent = true })

-- Telescope live grep
vim.api.nvim_set_keymap(
	"n",
	"<leader>fw",
	"<cmd>Telescope live_grep<CR>",
	{ noremap = true, silent = true, desc = "Fuzzy find word across files" }
)

-- Some telescope git stuff
-- Open tracked files in the current Git repository
vim.api.nvim_set_keymap(
	"n",
	"<leader>gf",
	":Telescope git_files<CR>",
	{ desc = "Git files (tracked)", noremap = true, silent = true }
)

-- Show Git status (changed, staged, untracked files)
vim.api.nvim_set_keymap(
	"n",
	"<leader>gs",
	":Telescope git_status<CR>",
	{ desc = "Git status", noremap = true, silent = true }
)

-- Browse commit history for the entire repository
vim.api.nvim_set_keymap(
	"n",
	"<leader>gc",
	":Telescope git_commits<CR>",
	{ desc = "Git commit history", noremap = true, silent = true }
)

-- Browse commit history for the current file (buffer)
vim.api.nvim_set_keymap(
	"n",
	"<leader>gb",
	":Telescope git_bcommits<CR>",
	{ desc = "Git commits (buffer)", noremap = true, silent = true }
)

-- List, switch, and manage Git branches
vim.api.nvim_set_keymap(
	"n",
	"<leader>gB",
	":Telescope git_branches<CR>",
	{ desc = "Git branches", noremap = true, silent = true }
)

-- View and apply Git stashes
vim.api.nvim_set_keymap(
	"n",
	"<leader>gS",
	":Telescope git_stash<CR>",
	{ desc = "Git stash", noremap = true, silent = true }
)

-- View Git blame information (line-by-line history)
vim.api.nvim_set_keymap(
	"n",
	"<leader>gl",
	":Telescope git_blame<CR>",
	{ desc = "Git blame", noremap = true, silent = true }
)

-- -- Toggle FZF
-- vim.api.nvim_set_keymap("n", "<leader>F", ":FZF<CR>", { noremap = true, silent = true })

-- Toggle (Whitespace) Trim
vim.api.nvim_set_keymap("n", ";t", ":Trim<CR>", { noremap = true, silent = true, desc = "Trim Trailing Whitespace" })

-- Custom Relative Number Cursor Line
vim.cmd("highlight CursorLineNr guifg=#fabb49 gui=bold")
-- Custom Neovim String Foreground
vim.cmd("highlight String guifg=#ffd6b3")

vim.keymap.set("n", "<Leader>dc", function()
	require("dap").continue()
end, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<Leader>do", function()
	require("dap").step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<Leader>di", function()
	require("dap").step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<Leader>dO", function()
	require("dap").step_out()
end, { desc = "Step Out" })
vim.keymap.set("n", "<Leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Set Conditional Breakpoint" })
vim.keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end, { desc = "Open Debug Console" })
vim.keymap.set("n", "<Leader>du", function()
	require("dapui").toggle()
end, { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<Leader>dt", function()
	require("dap").terminate()
end, { desc = "Terminate DAP Program" })

-- TODO Function Shortcuts
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords

vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
end, { desc = "Next error/warning todo comment" })

-- vim.cmd("TransparentEnable")

-- Ensure Transparent Neovim matches Terminal Hex with Telescope UI
-- vim.cmd([[
--   highlight TelescopeNormal guibg=#252525
--   highlight TelescopeBorder guibg=#252525
--   highlight TelescopePromptNormal guibg=#252525
--   highlight TelescopePromptBorder guibg=#252525
--   highlight TelescopeResultsNormal guibg=#252525
--   highlight TelescopeResultsBorder guibg=#252525
--   highlight TelescopePreviewNormal guibg=#252525
--   highlight TelescopePreviewBorder guibg=#252525
--   highlight TelescopeSelection guibg=#252525
--   highlight TelescopeSelectionCaret guifg=#FFFFFF guibg=#252525
--   highlight TelescopeMultiSelection guibg=#252525
-- ]])

-- Change Diagnostic Virtual Text Error To Red
vim.cmd("hi DiagnosticVirtualTextError guifg=red") -- Red text
vim.cmd("hi DiagnosticHint guifg=#00FFFF guibg=#E0FFFF") -- Cyan text on light cyan background
vim.cmd("hi DiagnosticInfo guifg=#008080 guibg=#E0FFFF") -- Teal text on light cyan background

vim.keymap.set("n", "<C-j>", "<C-d>", { noremap = true, silent = true })

-- Custom VISUAL highlights
vim.cmd([[highlight Visual guibg=#f9d9b4 guifg=none, cterm=reverse]])

-- Custom NOTE highlights
vim.cmd([[highlight TodoBgNOTE gui=bold guifg=#1d2021 guibg=#81c793]])
vim.cmd([[highlight TodoFgNOTE guifg=#81c793]])

-- Custom TODO highlights
vim.cmd([[highlight TodoBgTODO gui=bold guifg=#f9d9b4 guibg=#008080]])

---------------------------------------------------------------------
-- Red Text Whitespace Highlighting
vim.api.nvim_create_augroup("WhitespaceInsertHighlight", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	group = "WhitespaceInsertHighlight",
	callback = function()
		vim.cmd([[highlight Whitespace guibg=red guifg=red]])
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	group = "WhitespaceInsertHighlight",
	callback = function()
		vim.cmd([[highlight clear Whitespace]])
	end,
})
---------------------------------------------------------------------
-- Custom Lualine Diagnostics Colour
local custom_gruvbox = require("lualine.themes.gruvbox_dark")
require("lualine").setup({
	options = { theme = custom_gruvbox },
	sections = {
		lualine_c = {
			"filename",
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				diagnostics_color = {
					error = { fg = "#ff0000" }, -- 👈 set error color here
					-- warn = { fg = "#facc15" }, -- optional: warning color
					-- info = { fg = "#05a381" }, -- optional: info color
					hint = { fg = "#05a381" }, -- optional: hint color
				},
			},
		},
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
