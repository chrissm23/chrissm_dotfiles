-- [[ keys.lua ]]
local map = vim.keymap.set

-- Remap the key used to leave inser mode
map('i', 'jk', '<ESC>', {}) -- exit insert mode
map('n', 'tn', [[:bn<CR>]], {}) -- go to next buffer
map('n', 'tp', [[:bp<CR>]], {}) -- go to next buffer
map('n', 'td', [[:bd<CR>]], {}) -- go to next buffer

-- Copilot
map('i', '<leader>co', 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true, replace_keycodes = false })

-- Toggle plugins
map('n', '<leader>n', [[:NvimTreeToggle<CR>]], {}) -- nvim-tree
map('n', '<leader>l', [[:IndentLinesToggle<CR>]], {}) -- indentLine
map('n', '<leader>t', [[:TagbarToggle<CR>]], {}) -- tagbar
map('n', '<F5>', [[:UndotreeToggle<CR>]], {}) -- undotree

-- Auto-session keymaps
map('n', '<leader>ss', [[:SaveSession<CR>]], {}) -- Save session
map('n', '<leader>sl', [[:RestoreSession<CR>]], {}) -- Restore session
map('n', '<leader>sf', [[:Telescope session-lens search_history<CR>]], {}) -- Search for session

-- Telescope keymaps
map('n', '<leader>ff', [[:Telescope find_files<CR>]], {}) -- telescope
map('n', '<leader>fb', [[:Telescope file_browser<CR>]], { noremap = true }) --  telescope file-browser
map('n', '<leader>fh', [[:Telescope oldfiles<CR>]], {}) -- open file history
map('n', '<leader>lg', [[:Telescope live_grep<CR>]], {}) -- search for word
map('n', '<leader>bf', [[:Telescope buffers<CR>]], {}) -- check open tabs
map('n', '<leader>ch', [[:Telescope command_history<CR>]], {}) -- see command history
map('n', '<leader>sh', [[:Telescope search_history<CR>]], {}) -- see search history
map('n', '<leader>rg', [[:Telescope registers<CR>]], {}) -- check contents of registers
map('n', '<leader>km', [[:Telescope keymaps<CR>]], {}) -- see keymappings
map('n', '<leader>lr', [[:Telescope lsp_references<CR>]], {}) -- see lsp references

-- LSP
local opts = { noremap = true, silent = true }
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)

-- LSPSaga
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
map({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
map("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
map("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
map("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
map("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
map("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
map("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
map("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
map("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
