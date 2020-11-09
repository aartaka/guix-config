#!/bin/bash

cp -f channels.scm ~/.config/guix/channels.scm
sudo cp -f nonfree-desktop.scm /etc/nonfree-desktop.scm
guix pull
echo "Installing base profile..."
guix package -m base-manifest.scm --profile=$GUIX_EXTRA_PROFILES/base-profile/base-profile
echo "Installing emacs profile..."
guix package -m emacs-manifest.scm --profile=$GUIX_EXTRA_PROFILES/emacs-profile/emacs-profile
echo "Installing dev profile..."
guix package -m dev-manifest.scm --profile=$GUIX_EXTRA_PROFILES/dev-profile/dev-profile
echo "Installing gimp profile..."
guix package -m gimp-manifest.scm --profile=$GUIX_EXTRA_PROFILES/gimp-profile/gimp-profile
echo "Installing nyxt profile..."
guix package -m nyxt-manifest.scm --profile=$GUIX_EXTRA_PROFILES/nyxt-profile/nyxt-profile
echo "Installing texlive profile..."
guix package -m texlive-manifest.scm --profile=$GUIX_EXTRA_PROFILES/texlive-profile/texlive-profile
