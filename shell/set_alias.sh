#!/bin/zsh

ALIAS_PATTERN="^alias .* # \$$"

sed -i.bak "\|$ALIAS_PATTERN|d" ~/.zshrc
echo "alias $1='dart $2' # $" >> ~/.zshrc
echo "Alias '$1' has been added to ~/.zshrc"
