return {
  "navarasu/onedark.nvim",
  lazy = false,

  config = function()
    vim.o.termguicolors = true
    require("onedark").setup({
      style = "dark",
			transparent = true,
    })
    require("onedark").load()
  end,
}
