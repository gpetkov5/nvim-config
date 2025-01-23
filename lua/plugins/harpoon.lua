return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  lazy = false,

  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<leader>hm", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
  end,
}
