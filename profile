#!/bin/sh

export GUIX_EXTRA_PROFILES="$HOME"/.guix-extra-profiles

# Activate all the profiles
for i in $GUIX_EXTRA_PROFILES/*; do
    profile=$i/$(basename "$i")
    if [ -f "$profile"/etc/profile ]; then
  		GUIX_PROFILE="$profile" ; . "$profile"/etc/profile
 		export MANPATH="$profile"/share/man:$MANPATH
 		export INFOPATH="$profile"/share/info:$INFOPATH
        export XDG_DATA_DIRS="$profile"/share:$XDG_DATA_DIRS
 		export XDG_CONFIG_DIRS="$profile"/etc/xdg:$XDG_CONFIG_DIRS
  	fi
    unset profile
done

# Set the proper SBCL_HOME
export SBCL_HOME="$(dirname -- $(dirname -- $(readlink -f $(which sbcl))))/lib/sbcl/"
# Fix for the scrolling problems of StumpWM and Nyxt
export GDK_CORE_DEVICE_EVENTS=1
