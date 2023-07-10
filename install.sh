#!/bin/bash

mkdir -p $HOME/.guix-extra-profiles
GUIX_EXTRA_PROFILES=$HOME/.guix-extra-profiles
LISP_CONFIG='(load #p"~/.config/guix/lisp-config.lisp")'

cp -f bash-profile ~/.bash_profile
cp -f xinitrc ~/.xinitrc
echo "$LISP_CONFIG" > ~/.sbclrc         # SBCL
echo "$LISP_CONFIG" > ~/.ccl-init.lisp  # CCL
echo "$LISP_CONFIG" > ~/.eclrc          # ECL
echo "$LISP_CONFIG" > ~/.clisprc.lisp   # CLISP
echo "$LISP_CONFIG" > ~/.abclrc         # ABCL
echo "$LISP_CONFIG" > ~/.clinit.cl      # Allegro

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
