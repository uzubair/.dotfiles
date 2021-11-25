#!/usr/bin/env bash

echo "Setting dev environment..."

if [[ -z ${OS_FAMILY} ]]; then
    echo "Identifying operating system..."

    OS_FAMILY=$(uname | tr A-Z a-z)
    echo "Loading '${OS_FAMILY}' configurations..."
fi

if [[ -z ${STOW_FOLDERS} ]]; then
    STOW_FOLDERS="bin,git,nvim,tmux,zsh,kitty"
fi

if [[ -z ${DOTFILES} ]]; then
    DOTFILES=${HOME}/.dotfiles
fi

pushd ${DOTFILES} > /dev/null
for folder in $(echo ${STOW_FOLDERS} | sed "s/,/ /g")
do
    echo "Removing ${folder}..."
    stow -D ${folder}

    echo "Installing ${folder}..."
    stow ${folder}
done
popd > /dev/null

echo "Done."
