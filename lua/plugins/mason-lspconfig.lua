return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig", { "saghen/blink.cmp", version = "*" } },

  config = function()
    local border = {
      { "🭽", "FloatBorder" },
      { "▔", "FloatBorder" },
      { "🭾", "FloatBorder" },
      { "▕", "FloatBorder" },
      { "🭿", "FloatBorder" },
      { "▁", "FloatBorder" },
      { "🭼", "FloatBorder" },
      { "▏", "FloatBorder" },
    }

    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    require("mason-lspconfig").setup({})
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        local config = {}
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        config.handlers = handlers
        if server_name == "clangd" then
          config.offsetEncoding = { "utf-8" }
        end
        require("lspconfig")[server_name].setup(config)
      end,
    })
  end,
}
