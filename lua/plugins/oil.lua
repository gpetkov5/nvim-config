return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require("oil").setup({
      default_file_explorer = false,
      columns = {
        "icon",
        "permissions",
      },
    })
    -- highlight current line
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      callback = function()
        vim.opt_local.cursorline = true
      end,
    })
  end,
}
