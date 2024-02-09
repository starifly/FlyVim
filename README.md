<div align="center">
<h1> FlyVim </h1>

<p align="center">
<a href=""><img alt="Linux" src="https://img.shields.io/badge/Linux-%23.svg?style=flat-square&logo=linux&color=FCC624&logoColor=black"></a>
<a href=""><img alt="macOS" src="https://img.shields.io/badge/macOS-%23.svg?style=flat-square&logo=apple&color=000000&logoColor=white"></a>
<a href=""><img alt="Windows" src="https://img.shields.io/badge/Windows-%23.svg?style=flat-square&logo=windows&color=0078D6&logoColor=white"></a>
<a href="https://github.com/starifly/FlyVim/actions"><img alt="Build Status" src="https://github.com/starifly/FlyVim/workflows/ci/badge.svg"></a>
<a href="https://github.com/vim/vim"><img alt="GitHub" src="https://img.shields.io/badge/vim-8.1+-blue.svg"></a>
<a href="https://github.com/starifly/FlyVim/blob/master/LICENSE"><img alt="GitHub" src="https://img.shields.io/github/license/mashape/apistatus.svg"></a>
</p>

<a href="https://github.com/starifly/FlyVim/#Installation">📦 Installation</a>
</div>

## Screenshots

<p align="center">
<img src="https://raw.githubusercontent.com/starifly/FlyVim/master/assets/nerd-tagbar.png" alt="Nerdtree & Tagbar">
<em>Nerdtree & Tagbar</em>
</p>

<p align="center">
<img src="https://raw.githubusercontent.com/starifly/FlyVim/master/assets/preview.png" alt="Preview">
<em>Preview</em>
</p>

<p align="center">
<img src="https://raw.githubusercontent.com/starifly/FlyVim/master/assets/auto-complete.png" alt="Auto Complete">
<em>Auto Complete</em>
</p>

<p align="center">
<img src="https://raw.githubusercontent.com/starifly/FlyVim/master/assets/syntax-check.png" alt="Syntax Check">
<em>Syntax Check</em>
</p>

<p align="center">
<img src="https://raw.githubusercontent.com/starifly/FlyVim/master/assets/float-term.png" alt="Float Term">
<em>Float Term</em>
</p>

<p align="center">
<img src="https://raw.githubusercontent.com/starifly/FlyVim/master/assets/window-choose.png" alt="Window Choose">
<em>Window Choose</em>
</p>

<p align="center">
<img src="https://raw.githubusercontent.com/starifly/FlyVim/master/assets/F2-search.png" alt="F2 Search">
<em>F2 Search</em>
</p>

<p align="center">
<img src="https://raw.githubusercontent.com/starifly/FlyVim/master/assets/file-search.png" alt="File Search">
<em>File Search</em>
</p>

## Installation

### Prerequisites

- Vim >= 8.1
- python3
- `apt install clang-format gcc cppcheck shfmt shellcheck global universal-ctags ripgrep` 
- `pip install ruff yapf`

### Quick Install

```bash
$ bash <(curl -fsSL https://git.io/fAl8K)
```
### Manual

```bash
$ git clone git@github.com:starifly/FlyVim.git ~/.FlyVim
$ cd ~/.FlyVim
$ make vim     # install FlyVim for Vim
$ make neovim  # install FlyVim for NeoVim
```

## Update

```bash
$ cd .FlyVim
$ make update
```

## Full Installation Guide

<https://github.com/starifly/FlyVim/wiki/Full-Installation-Guide>

## Thanks

This config is based on [vim-init](https://github.com/skywind3000/vim-init), thanks very much!
