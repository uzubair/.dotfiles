#!/usr/bin/env bash

echo "Resetting dev environment..."

if [[ -z ${STOW_FOLDERS} ]]; then
    STOW_FOLDERS="bin,git,nvim,tmux,zsh,kitty"
fi

if [[ -z ${DOTFILES} ]]; then
    DOTFILES=${HOME}/.dotfiles
fi

pushd ${DOTFILES} > /dev/null
for folder in $(echo ${STOW_FOLDERS} | sed "s/,/ /g")
do
    echo "Removing ${folder}"
    stow -D ${folder}
done
popd > /dev/null

echo "Done."
