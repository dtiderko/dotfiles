#! /usr/bin/env bash

UNINSTALL_SCRIPT="echo 'Uninistalling dotfiles files'"

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

# install emacs dir
rm -rf ~/.emacs.d
ln -s "$(realpath emacs.d)" ~/.emacs.d
UNINSTALL_SCRIPT="$UNINSTALL_SCRIPT; rm ~/.emacs.d"

# some bash stuff to add
if [ ! -f old_bashrc ]; then
  if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
  fi
  cp ~/.bashrc old_bashrc
fi
cat << 'EOF' >> ~/.bashrc
# import nix commands if they exist
if [ -f $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# init bash style and direnv
eval "$(starship init bash)"
eval "$(direnv hook bash)"

# add some aliases
alias vi="nvim ."
alias ll="eza -l"
alias la="eza -la"
alias ls="eza"
alias ..="cd .."

# config bash
export EDITOR="nvim"
export HISTCONTROL="ignoredups"

# add local binaries
mkdir -p $HOME/.local/bin
PATH=$PATH:$HOME/.local/bin
EOF
UNINSTALL_SCRIPT="$UNINSTALL_SCRIPT; mv old_bashrc ~/.bashrc"

UNINSTALL_SCRIPT="$UNINSTALL_SCRIPT; rm uninstall.sh"
echo "$UNINSTALL_SCRIPT" > uninstall.sh
chmod +x uninstall.sh
