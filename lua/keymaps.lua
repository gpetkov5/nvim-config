vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.api.nvim_set_keymap('n', '<D-d>', '<C-d>', {noremap = true})
vim.api.nvim_set_keymap('v', '<D-d>', '<C-d>', {noremap = true})
