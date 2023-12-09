return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "cpp",
        "fortran",
        "gitignore",
        "julia",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "ssh_config",
        "toml",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- Recongnize MDX as markdown
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
