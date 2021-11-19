#!/usr/bin/env bash

echo "Setting dev environment..."

if [[ -z ${OS_TYPE} ]]; then
    echo "Identifying operating system..."

    OS_TYPE=$(uname | tr A-Z a-z)
    echo "Loading '${OS_TYPE}' configurations..."
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
    echo "Installing ${folder}"
    stow ${folder}
done
popd > /dev/null

echo "Exporting custom env variables..."
# kitty
export KITTY_OS_CONFIG="kitty.${OS_TYPE}.conf"

echo "Done."
