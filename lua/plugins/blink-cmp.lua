return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = "rafamadriz/friendly-snippets",

  opts = {
    keymap = {
      preset = "none",
      ["<C-space>"] = { "fallback" },
      ["<C-h>"] = { "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },

    completion = {
      keyword = {
        range = "prefix",
      },
      list = {
        selection = function(ctx)
          return ctx.mode == "cmdline" and "auto_insert" or "preselect"
        end,
      },
      menu = {
        border = "single",
        draw = {
          columns = {
            { "label",     "label_description", gap = 1 },
            { "kind_icon", "kind",              "source_name", gap = 1 },
          },
        },
      },
      documentation = { window = { border = "single" } },
      trigger = {
        show_on_trigger_character = true,
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    signature = { window = { border = "single" } },
  },

  opts_extend = { "sources.default" },
}
