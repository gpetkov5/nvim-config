return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  lazy = true,
  config = function()
    local amend_func_root = function(func)
      local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
      if vim.v.shell_error == 0 then
        local wrapper = function()
          return func({ cwd = root })
        end
        return wrapper
      else
        return func
      end
    end

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", amend_func_root(builtin.find_files), { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", amend_func_root(builtin.live_grep), { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", amend_func_root(builtin.buffers), { desc = "Telescope buffer" })
    vim.keymap.set("n", "<leader>fh", amend_func_root(builtin.help_tags), { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>fs", amend_func_root(builtin.grep_string), { desc = "Telescope help tags" })
  end,
}
