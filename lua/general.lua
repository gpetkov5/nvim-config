-- Setting up the tabstop values
vim.languages_with_shorter_tab = {
	"typescript",
	"javascript",
	"typescriptreact",
	"javascriptreact",
	"html",
	"css",
	"json",
	"jsonc",
	"yaml",
	"lua",
	"sh",
	"make",
	"cmake",
	"ocaml",
	"pascal",
	"scala",
  "cpp",
}

vim.set_tabstop = function()
	local file_type = vim.bo.filetype
	local is_language_with_shorter_tab = false
	for _, target in ipairs(vim.languages_with_shorter_tab) do
		if file_type == target then
			is_language_with_shorter_tab = true
			break
		end
	end

	if is_language_with_shorter_tab then
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.expandtab = true
	else
		vim.opt.tabstop = 4
		vim.opt.softtabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.expandtab = true
	end
end

vim.cmd([[
  autocmd BufEnter * lua vim.set_tabstop()
]])

vim.o.history = 1000
vim.o.backspace = "indent,eol,start"
vim.o.errorbells = false
vim.wo.number = true
vim.wo.wrap = false
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.incsearch = true
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.autoread = true

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
