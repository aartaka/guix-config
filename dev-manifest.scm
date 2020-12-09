(use-modules (gnu packages)
             (gnu packages base)
             (gnu packages commencement)
             (gnu packages elf)
             (gnu packages gdb)
             (gnu packages guile)
             (gnu packages jupyter)
             (gnu packages llvm)
             (gnu packages mono)
             (gnu packages pkg-config)
             (gnu packages python)
             (gnu packages python-xyz)
             (gnu packages scheme)

             (guix packages))

(packages->manifest
 (list llvm clang clang-runtime clang-toolchain
       glibc gdb gcc-toolchain
       cmake pkg-config
       patchelf coreutils binutils elfutils
       ;; C#
       mono
       ;; Python & Jupyter
       python jupyter xeus
       ;; Lisps that are not CL
       guile racket))
