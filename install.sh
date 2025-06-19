#! /usr/bin/sh

cd config

DOTFILES_UNINSTALL_SCRIPT=""

for dir in *; do
    full_dir=$(realpath $dir)
    rm -rf ~/.config/$dir
    ln -s $full_dir ~/.config
    DOTFILES_UNINSTALL_SCRIPT="$DOTFILES_UNINSTALL_SCRIPT && rm ~/.config/$dir"
done

cd ..

echo $DOTFILES_UNINSTALL_SCRIPT > uninstall.sh
chmod +x uninstall.sh
