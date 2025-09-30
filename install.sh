#! /usr/bin/env bash

UNINSTALL_SCRIPT=""

# install nixos dotfiles
if [ -f /etc/nixos/hardware-configuration.nix ]; then
  sudo mv /etc/nixos/hardware-configuration.nix nixos/hardware-configuration.nix
fi
sudo rm -rf /etc/nixos
sudo ln -s $(realpath nixos) /etc/nixos
UNINSTALL_SCRIPT="sudo rm /etc/nixos"

# install config dir
cd config
mkdir -p ~/.config
for dir in *; do
    full_dir=$(realpath $dir)
    rm -rf ~/.config/$dir
    ln -s -t ~/.config/ $full_dir
    UNINSTALL_SCRIPT="$UNINSTALL_SCRIPT; rm ~/.config/$dir"
done
cd ..

# some bash stuff to add
if [ ! -f old_bashrc ]; then
  if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
  fi
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
UNINSTALL_SCRIPT="$UNINSTALL_SCRIPT; mv old_bashrc ~/.bashrc"

UNINSTALL_SCRIPT="$UNINSTALL_SCRIPT; rm uninstall.sh"
echo $UNINSTALL_SCRIPT > uninstall.sh
chmod +x uninstall.sh
