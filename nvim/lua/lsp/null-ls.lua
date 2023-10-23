-- Local variables for easier formatters and diagnostics

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover

local conditional = function(fn)
	local utils = require("null-ls.utils").make_conditional_utils()
end

null_ls.setup({
	debug = false,

	-- Sources
	sources = {
		diagnostics.proselint,
		formatting.black,
		formatting.clang_format,
		formatting.stylua,
		formatting.latexindent,
		formatting.beautysh,
		formatting.bibclean,
		hover.dictionary,
	},
})
