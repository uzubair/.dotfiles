#!/usr/bin/env bash

set -euo pipefail

here=$(dirname "${BASH_SOURCE[0]}")

################## Helper functions

intall_vscode_extensions() {
    echo "Installing VSCode extension ..."
    cat $here/vscode/extensions.list | xargs -L 1 code --install-extension --force
}

install_zsh_theme() {
    if [[ -z ${ZSH} ]]; then
        export ZSH="${HOME}/.oh-my-zsh"
    fi

    themes=(
        "cdimascio-lambda.zsh-theme",
        "mycustom.zsh-theme"
    )

    for theme in ${themes[@]}; do
        echo "Installing theme '${theme}' ..."
        cp $here/zsh/themes/${theme} ${ZSH}/themes/${theme}
    done
}

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

################## Entrypoint

echo "Is homebrew installed?"
if ! command -v brew > /dev/null; then
    echo "==> Installing Homebrew..."
    if [[ "${OS_FAMILY}" = darwin* ]]; then
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
        if [ "$(echo $SHELL)" == '/usr/bin/zsh' ] ; then
            echo "ZSH is set as the default shell..."
        else
            if [ "$(command -v zsh)" != '/usr/local/bin/zsh' ] ; then
                echo "==> Updating shell to ZSH..."
                update_shell
            else
                echo "==> ZSH is set as the default shell..."
            fi
        fi
        ;;
    *)
        echo "==> Updating shell to ZSH..."
        update_shell
        ;;
esac

echo "==> Installing Homebrew dependencies..."
if ! brew bundle --no-upgrade --no-lock --file=$here/Brewfile ; then
    echo "Failed to install all the Homebrew dependencies..."
fi

echo "==> Installing dotfiles..."
if ! $here/dist/install.sh ; then
    echo "Failed to install the dotfiles..."
fi

