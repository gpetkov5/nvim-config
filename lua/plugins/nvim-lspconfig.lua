return {
  "neovim/nvim-lspconfig",
  config = function()
    local signs = {
      Error = " ",
      Warn = " ",
      Hint = "󰠠 ",
      Info = " ",
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
    if vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true, { 0 })
    end
    vim.diagnostic.config({
      float = {
        source = "always",
        border = "single",
      },
    })
  end,
}
