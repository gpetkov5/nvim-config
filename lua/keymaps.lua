vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<Esc>", function()
  if vim.v.hlsearch == 1 then
    vim.cmd("nohlsearch")
  else
    return "<Esc>"
  end
end, { expr = true, noremap = true })

vim.keymap.set({ "n", "x" }, "<D-d>", "<C-d>")
vim.keymap.set({ "n", "x" }, "<D-u>", "<C-u>")

vim.keymap.set("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "<leader>vD", "<cmd>Telescope diagnostics bufnr=0<cr>")

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    vim.keymap.set({ "n", "x" }, "=G", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", opts)
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition() <cr>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)

    vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.keymap.set("n", "<leader>ic", "<cmd>Telescope lsp_incoming_calls<cr>", opts)
    vim.keymap.set("n", "<leader>oc", "<cmd>Telescope lsp_outgoing_calls<cr>", opts)
  end,
})

vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>to", "<cmd>Oil<cr>")
vim.keymap.set("n", "<leader>ng", "<cmd>Neogit<cr>")
