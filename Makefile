APP           := FlyVim
INIT_VIM      := ~/.FlyVim/init.vim
VIMRC         := ~/.vimrc
NVIMRC        := ~/.config/nvim/init.vim

help:
	@echo "usage: make [OPTIONS]"
	@echo "    help        Show this message"
	@echo "    vim         Install FlyVim for Vim"
	@echo "    neovim      Install FlyVim for NeoVim"
	@echo "    update      Update FlyVim"
	@echo "    uninstall   Uninstall FlyVim"

vim:
	@echo "\033[1;34m==>\033[0m Trying to install FlyVim for Vim"; \
	[ ! -f $(VIMRC) ]        && ln -sf $(INIT_VIM) $(VIMRC)         && echo "    - Created $(VIMRC) "; \
	echo "\033[1;34m==>\033[0m Trying to download vim-plug"; \
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	echo "\033[32m[✔]\033[0m Successfully downloaded vim-plug"; \
	vim  +'PlugInstall' +qall; \
	echo "\033[32m[✔]\033[0m Successfully installed $(APP) for Vim!"

neovim:
	@echo "\033[1;34m==>\033[0m Trying to install FlyVim for NeoVim"; \
	mkdir -p ~/.config/nvim; \
	[ ! -f $(NVIMRC) ]       && ln -sf $(INIT_VIM) $(NVIMRC)        && echo "    - Created $(NVIMRC)"; \
	echo "\033[1;34m==>\033[0m Trying to download vim-plug"; \
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	echo "\033[32m[✔]\033[0m Successfully downloaded vim-plug"; \
	nvim +'PlugInstall' +qall; \
	echo "\033[32m[✔]\033[0m Successfully installed $(APP) for NeoVim!"

update:
	@echo "\033[1;34m==>\033[0m Trying to update FlyVim"; \
	git pull origin master; \
	echo "\033[32m[✔]\033[0m Successfully updated $(APP)"

uninstall:
	@echo "\033[1;34m==>\033[0m Trying to uninstall FlyVim"; \
	rm -f  $(VIMRC)            && echo "    - Removed $(VIMRC)"; \
	rm -f  $(NVIMRC)           && echo "    - Removed $(NVIMRC)"; \
	rm -rf ~/.$(APP)           && echo "    - Removed ~/.$(APP)"; \
	echo "\033[32m[✔]\033[0m Successfully uninstalled $(APP)"

.PHONY: help vim neovim update uninstall
