-- [[ plug.lua ]]
local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

	if not vim.loop.fs_stat(pckr_path) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/lewis6991/pckr.nvim",
			pckr_path,
		})
	end

	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require("pckr").add({

	-- General
	"nvim-tree/nvim-web-devicons",
	"nvim-tree/nvim-tree.lua",
	"DanilaMihailov/beacon.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",

	-- Theme
	"nvim-lualine/lualine.nvim",
	{ "akinsho/bufferline.nvim", version = "*" },
	"nvim-telescope/telescope-ui-select.nvim",
	"goolord/alpha-nvim",
	{ "rose-pine/neovim", as = "rose-pine" },

	-- Dev
	"dinhhuy258/git.nvim",
	"junegunn/gv.vim",
	"windwp/nvim-autopairs",
	"mbbill/undotree",
	"kylechui/nvim-surround",
	"terrortylor/nvim-comment",
	"lewis6991/gitsigns.nvim",
	"github/copilot.vim",

	-- LSP
	"neovim/nvim-lspconfig",
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"L3MON4D3/LuaSnip",
	"onsails/lspkind.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
})

-- return require("packer").startup(function(use)
-- 	use({ "wbthomason/packer.nvim" }) -- Packer
--
-- 	-- General
-- 	use({ "nvim-tree/nvim-web-devicons" }) -- Filesystem icons
-- 	use({ "nvim-tree/nvim-tree.lua" }) -- Filesystem navigation
-- 	use({ "DanilaMihailov/beacon.nvim" }) -- Cursor jump
-- 	use({ "lukas-reineke/indent-blankline.nvim" }) -- Indentation line
-- 	-- use({ "Bekaboo/deadcolumn.nvim" }) -- Shoe column limit
-- 	use({ "nvim-lua/plenary.nvim" }) -- Lua functions for neovim
-- 	use({ "nvim-telescope/telescope.nvim" }) -- Fuzzy finder
-- 	use({ "nvim-telescope/telescope-file-browser.nvim" }) -- File browser
-- 	-- Sessions
-- 	use({ "rmagatti/auto-session" }) -- Sessions for neovim
-- 	use({ "rmagatti/session-lens" }) -- Session browser
-- 	-- Theme
-- 	use({ "nvim-lualine/lualine.nvim" }) -- Status line
-- 	use({ "akinsho/bufferline.nvim", tag = "*" }) -- Buffer line with tabs
-- 	use({ "nvim-telescope/telescope-ui-select.nvim" }) -- Set vim UI to telescope
-- 	use({ "goolord/alpha-nvim" }) -- Startup screen
-- 	use({ "rose-pine/neovim", as = "rose-pine" }) -- Colorscheme
-- 	-- Dev
-- 	use({ "dinhhuy258/git.nvim" }) -- Git integration
-- 	use({ "junegunn/gv.vim" }) -- Commit history
-- 	use({ "windwp/nvim-autopairs" }) -- Auto close brackets
-- 	use({ "mbbill/undotree" }) -- Persistent undo
-- 	use({ "kylechui/nvim-surround" }) -- Surroundings
-- 	use({ "terrortylor/nvim-comment" }) -- Comment lines out
-- 	use({ "lewis6991/gitsigns.nvim" }) -- Symbols for git changes
-- 	use({ "github/copilot.vim" }) -- Github copilot
-- 	-- LSP
-- 	use({ "neovim/nvim-lspconfig" }) -- Configuration for LSP
-- 	use({
-- 		-- Language parsing
-- 		"nvim-treesitter/nvim-treesitter",
-- 		run = function()
-- 			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
-- 			ts_update()
-- 		end,
-- 	})
-- 	use({ "williamboman/mason.nvim" }) -- LSP manager
-- 	use({ "williamboman/mason-lspconfig.nvim" }) -- LSP-mason bridge
-- 	use({ "jose-elias-alvarez/null-ls.nvim" }) -- Formatters and linters
-- 	use({ "L3MON4D3/LuaSnip" }) -- Lua snippets
-- 	use({ "saadparwaiz1/cmp_luasnip" }) -- Completion with luasnip
-- 	use({ "onsails/lspkind.nvim" }) -- Pictograms for lsp
-- 	use({ "hrsh7th/nvim-cmp" }) -- Auto-completion
-- 	use({ "hrsh7th/cmp-nvim-lsp" }) -- nvim-cmp/nvim-lsp bridge
-- 	use({ "hrsh7th/cmp-buffer" }) -- Completion from buffer
-- 	use({ "hrsh7th/cmp-path" }) -- Completion from paths
-- 	use({ "hrsh7th/cmp-cmdline" }) -- Completion form cmdline
-- end)
