return {
  -- Ensure languages are installed
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "julia-lsp",
        "fortls",
        "taplo",
        "grammarly-languageserver",
        "marksman",
        "black",
        "bash-language-server",
        "clangd",
        "json-lsp",
        "lua-language-server",
        "markdownlint",
        "prettier",
        "pyright",
        "ruff-lsp",
        "shfmt",
        "stylua",
        "texlab",
      })
    end,
  },
}
