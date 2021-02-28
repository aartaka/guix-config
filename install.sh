#!/bin/bash

cp -f bash-profile ~/.bash_profile
cp -f xinitrc ~/.xinitrc

profile_names=("emacs" "dev" "gimp" "nyxt" "texlive")
for NAME in ${profile_names[*]}; do
    echo "Installing $NAME profile..."
    guix package -m "$NAME-manifest.scm" --profile="$HOME/.guix-extra-profiles/$NAME-profile/$NAME-profile"
done

guix package -f "/home/aartaka/git/nyxt/build-scripts/guix-sbcl-for-nyxt.scm" --profile="$HOME/.guix-extra-profiles/nyxt-sbcl-profile/nyxt-sbcl-profile"
guix package -m "base-manifest.scm"
