return {
  "nvimtools/none-ls.nvim",
  lazy = false,

  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.isort,
      },
    })

    vim.keymap.set("n", "=G", vim.lsp.buf.format)
  end,
}
