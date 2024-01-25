return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	lazy = false,

	config = function()
		local my_find_files = function()
			local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
			if vim.v.shell_error == 0 then
				require("telescope.builtin").find_files({ cwd = root })
			else
				require("telescope.builtin").find_files()
			end
		end

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", my_find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	end,
}
