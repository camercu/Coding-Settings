# !/usr/bin/env bash

DOTFILE_DIR=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd ) # absolute path to dir
old_dir="${DOTFILE_DIR}/old"

mkdir $old_dir

mv ~/.bash_profile $old_dir
mv ~/.bashrc $old_dir
mv ~/.git-prompt.sh $old_dir
mv ~/.gitconfig $old_dir
mv ~/.gitignore_global $old_dir
mv ~/.inputrc $old_dir
mv ~/.gnupg/gpg.conf $old_dir
mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings $old_dir


ln -s "${DOTFILE_DIR}/bash_profile" ~/.bash_profile
ln -s "${DOTFILE_DIR}/bashrc" ~/.bashrc
ln -s "${DOTFILE_DIR}/git-prompt.sh" ~/.git-prompt.sh
ln -s "${DOTFILE_DIR}/gitconfig" ~/.gitconfig
ln -s "${DOTFILE_DIR}/gitignore_global" ~/.gitignore_global
ln -s "${DOTFILE_DIR}/inputrc" ~/.inputrc
ln -s "${DOTFILE_DIR}/gpg.conf" ~/.gnupg/
ln -s "${DOTFILE_DIR}/Preferences.sublime-settings" ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
