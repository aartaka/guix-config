#!/bin/bash

mkdir -p $HOME/.guix-extra-profiles
GUIX_EXTRA_PROFILES=$HOME/.guix-extra-profiles

cp -f bash-profile ~/.bash_profile
cp -f xinitrc ~/.xinitrc
mkdir -p ~/.config/common-lisp/source-registry.conf.d/

profile_names="$@"

if [ 0 -eq $# ];
then
    profile_names=("emacs" "sec" "gimp" "sc" "nyxt" "icecat" "chromium" "firefox" "dev" "texlive")
fi

for NAME in ${profile_names[*]}; do
    echo "Installing $NAME profile..."
    mkdir -p "$HOME/.guix-extra-profiles/$NAME-profile/"
    guix package -m "$NAME-manifest.scm" --profile="$HOME/.guix-extra-profiles/$NAME-profile/$NAME-profile"
done

if [ $# -eq 0 ];
then
    guix package -m "base-manifest.scm"
fi
