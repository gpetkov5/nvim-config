vim.opt.history = 1000
vim.opt.backspace = "indent,eol,start"
vim.opt.errorbells = false
vim.opt.number = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.autoread = true

-- highlight the current line number or the whole line if in oil buffer
vim.opt.cursorline = true
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		local filetype = vim.bo.filetype
		if filetype ~= "oil" and filetype ~= "NvimTree" then
			vim.opt_local.cursorlineopt = "number"
		end
	end,
})
