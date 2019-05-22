# Chandler's dotfiles

## nvim

- Configuration for **Neovim**.
- All Keybindings are combined in
	[vim-which-key](https://github.com/liuchengxu/vim-which-key) just like
	[SpaceVim](https://github.com/SpaceVim/SpaceVim)
- Lazy load all most of plugin, minimize startup time less than **85ms**.
- You can customize configuration in ~/.config/nvim/init-custom.vim


![neovim-start](./images/neovim-start.png)
![neovim-which-key](./images/neovim-which-key.png)

## dot_emacs.d

- Configuration for **Emacs**.
- Haven't finished.

## dot_terminfo

- A script to add support for 24 bit colour terminals

##  解决 mac tmux 下 neovim 无法复制到剪贴板的问题

```sh
# https://github.com/tmux/tmux/issues/543
brew install reattach-to-user-namespace
# then edit your .tmux.conf
set -g default-shell $SHELL
set -g default-command "reattach-to-user-namespace -l ${SHELL}"
# In .vimrc or ~/.config/nvim/init.vim (I use Neovim):
set clipboard=unnamed
# reload tmux config
tmux source-file ~/.tmux.conf<Paste>
```
