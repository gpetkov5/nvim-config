# nvim-config
My neovim configuration. Uses [Lazy](https://github.com/folke/lazy.nvim), [Mason](https://github.com/williamboman/mason.nvim), [blink.cmp](https://github.com/Saghen/blink.cmp).

Written entirely in Lua.

# Installation
Simply clone this repo into `~/.config/`. The first time you start editing a file, Lazy will be automatically installed.

In addition, several plugins are using [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons), which requires a [Nerd-Font](https://www.nerdfonts.com/font-downloads) installed.

# LSP
You can install LSP servers, linters and formatters using [Mason](https://github.com/williamboman/mason.nvim).

To configure a linter/formatter you will need to also add it to `lua/plugins/none-ls.lua`. Check out [none-ls](https://github.com/nvimtools/none-ls.nvim) for more info.

# Customization
To install a new plugin you simply need to add it to the `lua/plugins/` directory. That's it.
`lua/general.lua` contains general settings and `lua/keymaps.lua` contains the keymaps I am currently using. You can easily edit both files to accommodate your preferences.

# Tmux
Currently using [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) to navigate between neovim and tmux splits with ease.  
If you want that, then you will also need to add the following to your `~/.tmux.conf`:  
`set -g @plugin 'christoomey/vim-tmux-navigator'`, assuming you are using [tpm](https://github.com/tmux-plugins/tpm)



