(use-modules (gnu packages)
             (gnu packages base)
             (gnu packages clojure)
	         (gnu packages cmake)
             (gnu packages commencement)
             (gnu packages elf)
             (gnu packages golang)
             (gnu packages gdb)
             (gnu packages guile)
             (gnu packages java)
             (gnu packages jupyter)
             (gnu packages lisp)
             (gnu packages llvm)
             (gnu packages m4)
             (gnu packages node)
             (gnu packages pkg-config)
             (gnu packages python)
             (gnu packages python-xyz)
             (gnu packages racket)
             (gnu packages scheme)
             (gnu packages ssh)

             (nongnu packages clojure)
             (nongnu packages lisp)

             (guix packages))

(packages->manifest
 (list
  openssh
  ;; C/C++
  llvm clang clang-runtime clang-toolchain
  glibc gdb gcc-toolchain
  gnu-make cmake pkg-config m4
  ;; Binaries
  patchelf coreutils binutils elfutils
  ;; JS
  node-lts
  ;; JVM & Clojure
  icedtea clojure clojure-tools leiningen
  ;; Python & Jupyter
  python jupyter
  python-flake8 python-black python-autopep8 python-jedi python-yapf
  ;; Golang
  go
  ;; CL
  ccl ecl abcl gcl clisp allegro-cl
  ;; Lisps that are not CL
  racket))
