#!/bin/bash

cp -f channels.scm ~/.config/guix/channels.scm
sudo cp -f nonfree-desktop.scm /etc/nonfree-desktop.scm
guix pull

profile_names=("base" "emacs" "dev" "gimp" "nyxt" "texlive")
for NAME in ${profile_names[*]}; do
    echo "Installing $NAME profile..."
    guix package -m "$NAME-manifest.scm" --profile="$GUIX_EXTRA_PROFILES/$NAME-profile/$NAME-profile"
done
