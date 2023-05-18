#!/bin/bash

mkdir -p $HOME/.guix-extra-profiles
GUIX_EXTRA_PROFILES=$HOME/.guix-extra-profiles

cp -f bash-profile ~/.bash_profile
cp -f xinitrc ~/.xinitrc
cp -f lisp-config.lisp ~/.sbclrc
cp -f lisp-config.lisp ~/.ccl-init.lisp
cp -f lisp-config.lisp ~/.eclrc
cp -f lisp-config.lisp ~/.clisprc.lisp
cp -f lisp-config.lisp ~/.abclrc

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
