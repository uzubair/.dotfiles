#!/usr/bin/env bash

set -euo pipefail

if [[ -z ${ZSH} ]]; then
    export ZSH="${HOME}/.oh-my-zsh"
fi

basedir=$(dirname $1)

themes=(
    "cdimascio-lambda.zsh-theme"
)

for theme in ${themes[@]}; do
    echo "Installing theme '${theme}' ..."
    cp ${basedir}/themes/${theme} ${ZSH}/themes/${theme}
done

echo "Copying aliases..."
cp ${basedir}/aliases ${ZSH}/custom/aliases
