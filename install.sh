#!/bin/bash

mkdir -p $HOME/.guix-extra-profiles
GUIX_EXTRA_PROFILES=$HOME/.guix-extra-profiles

cp -f bash-profile ~/.bash_profile
cp -f xinitrc ~/.xinitrc
mkdir -p ~/.gnupg
cp -f gpg-agent-conf ~/.gnupg/gpg-agent.conf

profile_names=("emacs" "dev" "gimp" "texlive")
for NAME in ${profile_names[*]}; do
    echo "Installing $NAME profile..."
    mkdir -p "$HOME/.guix-extra-profiles/$NAME-profile/"
    guix package -m "$NAME-manifest.scm" --profile="$HOME/.guix-extra-profiles/$NAME-profile/$NAME-profile"
done

guix package -m "base-manifest.scm"
