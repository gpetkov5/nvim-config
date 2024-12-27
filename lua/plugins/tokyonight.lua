return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},

  config = function()
    vim.cmd([[colorscheme tokyonight-storm]])
    -- highlights current line
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = nil })
  end,
}
