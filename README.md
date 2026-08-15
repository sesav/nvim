# My neovim config

This config inspired by and partially based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).

This repository is updated from time to time..

## Installation
I'm currently running this setup, with Nix handling the installation. So I'm not installing
requirements or setting up `$PYTHON_NVIM_VENV`, I'm just using Nix flake and it's super handy.

## Standalone installation
* `git clone https://github.com/sesav/nvim.git ~/.config/nvim`
* That's it, now just run `nvim` and wait a bit. Plugins and tools are installed automatically:
plugins by [Lazy.nvim](https://github.com/folke/lazy.nvim), LSP servers and tools (`stylua`,
`ruff`, `goimports`, `marksman`, ...) by Mason.
* Pyright picks the Python per project automatically: active venv (`$VIRTUAL_ENV`) -> `./.venv` -> `uv python find` -> system Python.

## Requirements
* `git`
* `make`
* `unzip`
* `gcc`
* `ripgrep`
* `fzf`
* `npm`
* [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
(`vim.g.have_nerd_font` in `init.lua`).
* `python`
* `go`
* `ruff` linter and code formatter for python: installed automatically via Mason
* and any language you need.

I believe that is all.
