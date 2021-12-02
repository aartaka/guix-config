(use-modules (gnu packages)
             (gnu packages base)
	         (gnu packages cmake)
             (gnu packages commencement)
             (gnu packages elf)
             (gnu packages golang)
             (gnu packages gdb)
             (gnu packages guile)
             (gnu packages jupyter)
             (gnu packages lisp)
             (gnu packages llvm)
             (gnu packages m4)
             (gnu packages mono)
             (gnu packages node)
             (gnu packages pkg-config)
             (gnu packages python)
             (gnu packages python-xyz)
             (gnu packages racket)
             (gnu packages scheme)

             (nongnu packages dotnet)

             (guix packages))

(packages->manifest
 (list
  ;; C/C++
  llvm clang clang-runtime clang-toolchain
  glibc gdb gcc-toolchain
  gnu-make cmake pkg-config m4
  ;; Binaries
  patchelf coreutils binutils elfutils
  ;; JS
  node
  ;; .NET stack
  mono dotnet
  ;; Python & Jupyter
  python jupyter xeus
  ;; Golang
  go
  ;; CL
  ccl ecl
  ;; Lisps that are not CL
  racket))
