# Setup a new machine
.PHONY: setup
setup:
	./setup.sh

# Install only the dotfiles
.PHONY: install
install:
	./dist/install.sh

