-- [[ opts.lua ]]
local opt = vim.opt

-- [[ Context ]]
opt.colorcolumn = "80" -- Show color for max line length
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.scrolloff = 4 -- Minimum number of lines of context
opt.signcolumn = "yes" -- Show the sign column

-- [[ Filetypes ]]
opt.encoding = "utf-8" -- String encoding to use
opt.fileencoding = "utf-8" -- File encoding to use

-- [[ Theme ]]
opt.syntax = "ON" -- Allow syntax highlighting
opt.termguicolors = true -- If term supports UI color, enable

-- [[ Search ]]
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Override ignorecase if search contains capitals
opt.incsearch = true -- Use incremental search
opt.hlsearch = false -- Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Size of an indent
opt.softtabstop = 4 -- Number of spaces tabs count for insert mode
opt.tabstop = 4 -- Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true -- Place new window to the right of current one
opt.splitbelow = true -- Place new window below the current one

-- [[ Mouse ]]
vim.cmd([[set mouse=a]]) -- Activate mouse mode
opt.mousemev = true -- Enable mouse movement events
