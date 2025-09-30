#! /usr/bin/env bash

UNINSTALL_SCRIPT="#! /usr/bin/env bash
rm /etc/nixos"

# install nixos dotfiles
sudo rm -rf /etc/nixos
sudo ln -s nixos /etc/nixos

# install config dir
cd config
for dir in *; do
    full_dir=$(realpath $dir)
    rm -rf ~/.config/$dir
    ln -s $full_dir ~/.config
    UNINSTALL_SCRIPT="$UNINSTALL_SCRIPT && rm ~/.config/$dir"
done
cd ..

# some bash stuff to add
if [ ! -f old_bashrc ]; then
  cp ~/.bashrc old_bashrc
fi
echo 'eval "$(starship init bash)"' >> ~/.bashrc
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
echo 'alias vi="nvim ."' >> ~/.bashrc
echo 'alias ll="eza -l"' >> ~/.bashrc
echo 'alias la="eza -la"' >> ~/.bashrc
echo 'alias ls="eza"' >> ~/.bashrc
echo 'alias ..="cd .."' >> ~/.bashrc
echo 'export EDITOR="nvim"' >> ~/.bashrc
echo 'export HISTCONTROL="ignoredups"' >> ~/.bashrc
echo 'mkdir -p $HOME/.local/bin' >> ~/.bashrc
echo 'PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
UNINSTALL_SCRIPT="$UNINSTALL_SCRIPT && mv old_bashrc ~/.bashrc"

echo $UNINSTALL_SCRIPT > uninstall.sh
chmod +x uninstall.sh
