return{
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff-lsp",
        "pyright",
        "omnisharp", -- C#/VB.NET LSP
      },
    },
  },

}
