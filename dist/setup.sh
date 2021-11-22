#!/usr/bin/env bash

set -euo pipefail

# Helper functions

update_shell() {
    local shell_path;
    shell_path="$(command -v zsh)"

    echo "==> Changing your shell to zsh ..."
    if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
        echo "==> Adding '$shell_path' to /etc/shells"
        sudo sh -c "echo $shell_path >> /etc/shells"
    fi
    sudo chsh -s "$shell_path" "$USER"
}

# Entrypoint

here=$(dirname "${BASH_SOURCE[0]}")

echo "Is homebrew installed?"
if ! command -v brew > /dev/null; then
    echo "==> Installing Homebrew..."
    if [[ "${OS_TYPE}" = darwin* ]]; then
        curl -fsS 'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
    else
        curl -fsSL 'https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh' | sh -c
    fi
else
    echo "==> Homebrew is already installed..."
fi

echo "Is ZSH the default shell?"
case "$SHELL" in
    */zsh)
        if [ "$(command -v zsh)" != '/usr/local/bin/zsh' ] ; then
            echo "==> Updating shell to ZSH..."
            update_shell
        else
            echo "==> ZSH is set as the default shell..."
        fi
        ;;
    *)
        echo "==> Updating shell to ZSH..."
        update_shell
        ;;
esac

echo "==> Installing Homebrew dependencies..."
brew bundle

echo "==> Removing dotfiles..."
$here/cleanup.sh

echo "==> Installing dotfiles..."
$here/install.sh

echo "Done."
