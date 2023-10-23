-- [[ keys.lua ]]
local map = vim.keymap.set

-- Remap the key used to leave insert mode
map("i", "jk", "<ESC>", {}) -- Exit insert mode
map("n", "tn", [[:tabn<CR>]], {}) -- Go to next buffer
map("n", "tp", [[:tabp<CR>]], {}) -- Go to previous buffer
map("n", "td", [[:tabc<CR>]], {}) -- Delete buffer
-- map("n", "bn", [[:bn<CR>]], {}) -- Go to next buffer
-- map("n", "bp", [[:bp<CR>]], {}) -- Go to previous buffer
-- map("n", "bd", [[:bd<CR>]], {}) -- Delete buffer

-- Copilot
map(
	"i",
	"<leader>co",
	'copilot#Accept("<CR>")',
	{ noremap = true, silent = true, expr = true, replace_keycodes = false }
)

-- Toggle plugins
map("n", "<leader>nt", [[:NvimTreeToggle<CR>]], {}) -- File explorer
-- map("n", "<leader>l", [[:IndentLinesToggle<CR>]], {}) -- Indent lines
map("n", "<F5>", [[:UndotreeToggle<CR>]], {}) -- Undo tree

-- Auto-session keymaps
map("n", "<leader>ss", [[:SessionSave<CR>]], {}) -- Save session
map("n", "<leader>sl", [[:SessionRestore<CR>]], {}) -- Restore session
map("n", "<leader>sf", [[:Telescope session-lens search_history<CR>]], {}) -- Search for session

-- Telescope keymaps
map("n", "<leader>ff", [[:Telescope find_files<CR>]], {}) -- telescope
map("n", "<leader>fb", [[:Telescope file_browser<CR>]], { noremap = true }) --  telescope file-browser
map("n", "<leader>fh", [[:Telescope oldfiles<CR>]], {}) -- open file history
map("n", "<leader>lg", [[:Telescope live_grep<CR>]], {}) -- search for word
map("n", "<leader>bf", [[:Telescope buffers<CR>]], {}) -- check open tabs
map("n", "<leader>ch", [[:Telescope command_history<CR>]], {}) -- see command history
map("n", "<leader>sh", [[:Telescope search_history<CR>]], {}) -- see search history
map("n", "<leader>rg", [[:Telescope registers<CR>]], {}) -- check contents of registers
map("n", "<leader>km", [[:Telescope keymaps<CR>]], {}) -- see keymappings
map("n", "<leader>lr", [[:Telescope lsp_references<CR>]], {}) -- see lsp references

-- LSP diagnostics

-- Global mappings
map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<space>q", vim.diagnostic.setloclist)
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings
		local opts = { buffer = ev.buf }
		map("n", "gD", vim.lsp.buf.declaration, opts)
		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "K", vim.lsp.buf.hover, opts)
		map("n", "gi", vim.lsp.buf.implementation, opts)
		map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		map("n", "<leader>sy", [[:Telescope lsp_document_symbols<CR>]])
		map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		map("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		map("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		map("n", "<leader>rn", vim.lsp.buf.rename, opts)
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		map("n", "gr", vim.lsp.buf.references, opts)
		map("n", "<leader>fm", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
