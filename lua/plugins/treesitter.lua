return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "cpp", "c", "rust", "go", "lua", "javascript", "typescript", "ocaml", "haskell" },

      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
