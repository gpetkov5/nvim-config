return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
  config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C-Space>",
				},
			},
		})

		vim.keymap.set("n", "<leader>co", "<cmd>Copilot panel<CR>", { desc = "Open Copilot panel" })
		vim.keymap.set("n", "<leader>ct", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<cr>")
	end,
}





