-- [[vars.lua]]

local g = vim.g
g.t_co = 256
g.background = "dark"
-- Copilot
g.copilot_no_tab_map = true
g.copilot_filetypes = {
    ["*"] = false,
    ["lua"] = false,
    ["c"] = true,
    ["c++"] = true,
    ["python"] = true,
    ["latex"] = true,
}

-- Update the packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path
