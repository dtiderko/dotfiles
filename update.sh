#! /usr/bin/env sh

sudo echo "> Starting full update"
echo

echo "> Updating inputs..."
echo
nix flake update

echo
echo "> Updating system"
echo
./switch-nixos.sh

echo
echo "> Updating home"
echo
./switch-home.sh
