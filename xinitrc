#!/bin/sh
export _JAVA_AWT_WM_NONREPARENTING=1
export GDK_CORE_DEVICE_EVENTS=1

exec emacs -f exwm-enable
