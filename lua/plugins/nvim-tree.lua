return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,

	config = function()
		local nvimtree = require("nvim-tree")
		nvimtree.setup({
			diagnostics = {
				enable = true,
			},
			filters = {
				dotfiles = true,
			},
			actions = {
				expand_all = {
					exclude = { "__pycache__" },
					max_folder_discovery = 5,
				},
			},
			git = {
				ignore = false,
			},
		})
	end,
}
