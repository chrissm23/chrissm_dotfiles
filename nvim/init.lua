-- [[ init.lua ]]
-- by Christian Sustay

-- LEADER
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
-- Lua files in the lua directory
require("vars") -- Variables
require("opts") -- Options
require("keys") -- Keybindings
require("plug") -- Plugins with packer.nvim

-- PLUGINS
require("startup") -- Configuration for startup

require("nvim-tree").setup() -- Directory tree
require("ibl").setup() -- Indentation guides
require("telescope").setup() -- Fuzzy finder
require("telescope").load_extension("file_browser") -- File browser
require("lualine").setup({
	-- Status line
	options = {
		theme = "rose-pine",
	},
})
require("bufferline").setup({
	options = {
		-- mode = "tabs",
		style_preset = require("bufferline").style_preset.minimal,
		indicator = {
			style = "underline",
		},
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,
		separator_style = "thick",
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
	},
}) -- Buffer line with tabs
require("rose-pine").setup() -- Colorscheme
vim.cmd("colorscheme rose-pine")
require("git").setup() -- Git integration
require("nvim-autopairs").setup() -- Auto close brackets
require("nvim-surround").setup() -- Surround selection
require("nvim_comment").setup() -- Comment out lines
require("gitsigns").setup({}) -- Symbols for git changes
require("nvim-treesitter.configs").setup({
	-- Language parser
	ensure_installed = { "c", "cpp", "lua", "python", "latex", "bash", "julia" },
	auto_install = true,
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
	},
})

-- LSP and completions
require("lsp")
-- require('lsp.mason')
-- require('lsp.handlers').setup()
-- require('lsp.null-ls')
require("cmp_config")
