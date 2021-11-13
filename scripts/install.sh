#!/usr/bin/env bash

if [[ -z ${STOW_FOLDERS} ]]; then
    STOW_FOLDERS="bin,git,nvim,tmux,zsh"
fi

if [[ -z ${DOTFILES} ]]; then
    DOTFILES=${HOME}/.dotfiles
fi

pushd ${DOTFILES}
for folder in $(echo ${STOW_FOLDERS} | sed "s/,/ /g")
do
    echo "Installing ${folder}"
    stow ${folder}
done
popd
