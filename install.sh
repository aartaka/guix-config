#!/bin/bash

mkdir -p $HOME/.guix-extra-profiles
GUIX_EXTRA_PROFILES=$HOME/.guix-extra-profiles

cp -f bash-profile ~/.bash_profile
cp -f xinitrc ~/.xinitrc
mkdir -p ~/.config/common-lisp/source-registry.conf.d/
cp -f asdf.conf ~/.config/common-lisp/source-registry.conf.d/asdf.conf
if [ -f nonguix-signing-key.pub ];
then
   rm nonguix-signing-key.pub
fi
curl https://substitutes.nonguix.org/signing-key.pub > nonguix-signing-key.pub

profile_names="$@"

if [ 0 -eq $# ];
then
    profile_names=("emacs" "dev" "gimp" "sc" "texlive" "nyxt" "chromium" "icecat" "firefox")
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
