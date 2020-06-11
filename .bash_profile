if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -e /Users/david/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/david/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
if [ -e /home/david/.nix-profile/etc/profile.d/nix.sh ]; then . /home/david/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
