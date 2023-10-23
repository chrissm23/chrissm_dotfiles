-- [[vars.lua]]

local g = vim.g
g.t_co = 256
g.gackground = "dark"

-- COPILOT
g.copilot_no_tab_map = true
g.copilot_filetypes = {
	["*"] = false,
	["lua"] = false,
	["c"] = true,
	["c++"] = true,
	["python"] = true,
	["latex"] = true,
	["julia"] = true,
}
