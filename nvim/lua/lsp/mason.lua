-- Call mason to declare the servers

local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end
local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local servers = {
	"lua_ls",
	"pyright",
	"clangd",
	"texlab",
	"bashls",
	"julials",
}

-- Settings and ensure sever installation
local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

-- Call lspconfig to pass server to native neovim lspconfig
local opts = {}

-- Loop through servers
for _, server in pairs(servers) do
	opts = {
		-- Get "on_attach" and capabilities from handlers
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}
	-- Get server name
	server = vim.split(server, "@")[1]

	-- Pass them to lspconfig
	lspconfig[server].setup(opts)
end
