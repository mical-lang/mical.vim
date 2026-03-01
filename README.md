# mical.vim

Vim/Neovim plugin for the [mical](https://mical-lang.github.io/mical/) configuration language.

## Features

- Filetype detection for `.mical` files
- Syntax highlighting (comments, strings, booleans, integers, block strings, prefix blocks)
- Filetype settings (comment format, indentation)

## Installation

### lazy.nvim

```lua
{ 'mical-lang/mical.vim' }
```

### vim-plug

```vim
Plug 'mical-lang/mical.vim'
```

### Manual

Clone this repository into your Vim packages directory:

```sh
# Vim
git clone https://github.com/mical-lang/mical.vim ~/.vim/pack/plugins/start/mical.vim

# Neovim
git clone https://github.com/mical-lang/mical.vim ~/.local/share/nvim/site/pack/plugins/start/mical.vim
```

## License

MIT
