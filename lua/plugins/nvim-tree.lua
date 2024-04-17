return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,

	config = function()
		local nvimtree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
		vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

		local api = require("nvim-tree.api")
		local Event = api.events.Event
		api.events.subscribe(Event.TreeOpen, function()
			api.tree.expand_all()
		end)

		nvimtree.setup({
			diagnostics = {
				enable = true,
			},
			view = {
				width = 35,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
				expand_all = {
					exclude = { ".git", "node_modules", "bin", "build", "target", "env", "__pycache__", "assets" },
				},
			},
			git = {
				ignore = false,
			},
		})
		vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>")
		vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFileToggle<CR>")
	end,
}
