# My neovim config
![](https://img.shields.io/github/repo-size/ssilaev/nvim)
![](https://img.shields.io/github/last-commit/ssilaev/nvim)
![](https://img.shields.io/github/languages/top/ssilaev/nvim)


This config inspired by and partially based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).

This repository is updated from time to time..

## How to install
* `git clone https://github.com/ssilaev/nvim.git ~/.config/nvim`
* To keep the libraries wheel, setuptools, pip, and neovim up to date, I use
[uv](https://github.com/astral-sh/uv) and a separate environment.

  You need to set the full path in the `$PYTHON_NVIM_VENV` variable to your
  interpreter that will be used by neovim.

  For example, I use my `~/.zshrc` and put the variable there:

  ```shell
  export PYTHON_NVIM_VENV="/home/user/.local/share/nvim/py-plugs/.venv/bin/python"
  ```

* That's it, now just run `nvim` and wait a bit.

[Lazy.nvim](https://github.com/folke/lazy.nvim) is used as a dependency manager.

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
* `ruff` linter and code formatter for python ([installation](https://github.com/astral-sh/ruff?tab=readme-ov-file#installation)) 
* and any language you need.

I believe that is all.
