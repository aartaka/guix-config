#!/bin/bash

cp -f profile ~/.profile
cp -f xinitrc ~/.xinitrc

profile_names=("emacs" "dev" "gimp" "nyxt" "texlive")
for NAME in ${profile_names[*]}; do
    echo "Installing $NAME profile..."
    guix package -m "$NAME-manifest.scm" --profile="~/.guix-extra-profiles/$NAME-profile/$NAME-profile"
done

guix package -m "base-manifest.scm"
