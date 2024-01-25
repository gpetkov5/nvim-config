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
    harpoon:setup() -- Required

    require("telescope").load_extension("harpoon")

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():append()
    end)
    vim.keymap.set("n", "<leader>hm", "<cmd>Telescope harpoon marks<CR>")
    vim.keymap.set("n", "<leader>hp", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<leader>hn", function()
      harpoon:list():next()
    end)
  end,
}
