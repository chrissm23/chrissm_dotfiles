-- Collect configuration files for LSP and related services

require('lsp.mason')
require('lsp.handlers').setup()
require('lsp.null-ls')
