#!/bin/bash

cp -f channels.scm ~/.config/guix/channels.scm
sudo cp -f nonfree-desktop.scm /etc/nonfree-desktop.scm
guix pull
guix package -m base-manifest.scm --profile=$GUIX_EXTRA_PROFILES/base-profile/base-profile
guix package -m emacs-manifest.scm --profile=$GUIX_EXTRA_PROFILES/emacs-profile/emacs-profile
guix package -m dev-manifest.scm --profile=$GUIX_EXTRA_PROFILES/dev-profile/dev-profile
guix package -m gimp-manifest.scm --profile=$GUIX_EXTRA_PROFILES/gimp-profile/gimp-profile
