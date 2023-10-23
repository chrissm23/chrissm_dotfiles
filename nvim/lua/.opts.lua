--[[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command

-- [[ Context ]]
opt.colorcolumn = '80'			-- str: Show color for max line lenght
opt.number = true		    	-- bool: Show line numbers
opt.relativenumber = true		-- bool: Show relative line numbers
opt.scrolloff = 4		    	-- int: Minimum number lines of context
opt.signcolumn = "yes"			-- str: Show the sign column

-- [[ Filetypes ]]
opt.encoding = "utf8"			-- str: String encoding to use
opt.fileencoding = "utf8"		-- str: File encoding to use

-- [[ Theme ]]
opt.syntax = "ON"		    	-- str: Allow syntax highlighting
opt.termguicolors = true		-- bool: If term supports ui color then enable
-- rose-pine setup
require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},
	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = 'rose' }
	}
})
cmd('colorscheme rose-pine')      -- cmd: Set the colorscheme

-- [[ Search ]]
opt.ignorecase = true	-- bool: Ignore case in search patterns
opt.smartcase = true	-- bool: Override ignorecase if search contains capitals
opt.incsearch = true	-- bool: Use incremental search
opt.hlsearch = false	-- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true	-- bool: Use spaces instead of tabs
opt.shiftwidth = 4	    -- num: Size of an indent
opt.softtabstop = 4     -- num: Number of spaces tabs count for in insert mode
opt.tabstop = 4         -- num: Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true	-- bool: Place new window to the right of current one
opt.splitbelow = true	-- bool: Place new window below the current one

-- [[Mouse]]
vim.cmd [[set mouse=a]]
