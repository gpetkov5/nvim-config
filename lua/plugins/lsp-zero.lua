return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"onsails/lspkind.nvim",
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
		},
		"saadparwaiz1/cmp_luasnip",

		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	lazy = false,

	config = function()
		local lsp = require("lsp-zero")
		lsp.preset("recommended")
		lsp.set_sign_icons({
			error = " ",
			warn = " ",
			hint = "󰠠 ",
			info = " ",
		})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd",
				"basedpyright",
				"rust_analyzer",
				"gopls",
			},
			handlers = {
				lsp.default_setup,
			},
			automatic_installation = true,
		})

		lsp.on_attach(function(client, bufnr)
			if vim.lsp.inlay_hint then
				vim.lsp.inlay_hint.enable(true, { 0 })
			end
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

			vim.keymap.set("n", "<leader>vD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		end)

		require("luasnip.loaders.from_vscode").lazy_load()

		local lspkind = require("lspkind")
		local cmp = require("cmp")
		local cmp_action = require("lsp-zero").cmp_action()

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert,noselect",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				format = lspkind.cmp_format({
					ellipsis_char = "...",
					maxwidth = {
						menu = 20,
						abbr = 20,
					},
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				-- ["<C-Space>"] = cmp.mapping.complete(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				-- ["<Tab>"] = cmp_action.luasnip_supertab(),
				-- ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,

					function(entry1, entry2)
						local _, entry1_under = entry1.completion_item.label:find("^_+")
						local _, entry2_under = entry2.completion_item.label:find("^_+")
						entry1_under = entry1_under or 0
						entry2_under = entry2_under or 0
						if entry1_under > entry2_under then
							return false
						elseif entry1_under < entry2_under then
							return true
						end
					end,

					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
		})

    vim.diagnostic.config({
      float = {
        source = "always",
      },
    })

		-- setup clangd encoding
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.offsetEncoding = { "utf-16" }
		require("lspconfig").clangd.setup({ capabilities = capabilities })
		lsp.setup()
	end,
}
