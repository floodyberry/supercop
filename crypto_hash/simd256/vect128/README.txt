SIMD reference implementation - version 2.0
===========================================

This code implements version 1.1 of the specification of SIMD.

The latest version of the specification of the SIMD hash function,
supporting documentation, and reference code can be downloaded from

  http://www.di.ens.fr/~leurent/simd.html


Overview
========

This is the reference implementation of the SIMD hash function.  This
code currently includes 4 different implementations:

- a slow reference implementation.
- an optimized implementation.
- a vectorized implementation for 128-bit vectors.
- a vectorized implementation for ARM with IwMMXt (SIMD-256 only).

The reference and optimized versions are written in ANSI C, and supports
all functions of the SIMD family.  Note that the so-called "optimized"
implementation is written in pure C and yield poor performance because
the design of the hash function is targeted toward SIMD instruction set.

The 128-bit vector implementation is written in C with compiler-specific
extensions to use SIMD instructions, and can compute all functions of
the SIMD family.  It currently supports the SSE2 instruction set of x86
processors and the Altivec instruction set of PowerPC.  It has been
tested with gcc, icc, and msvc.  You might need to add a command line
option to the compiler to allow it to use SSE2 or Altivec instructions;
for GCC, try -msse2 or -maltivec.

The IwMMXt implementation is written in C with massive use of inline
assembly, because the GCC builtins that should implement IwMMXt
instructions are just plain broken.  This implementation only supports
SIMD-n with n <= 256.  Note that you need to use the ARM Embedded ABI
(EABI) in order to use IwMMXt instructions, which is incompatible with
the old ABI.  For instance, this is available in the armel port of
Debian GNU/Linux which now supersedes the old arm port.

API
===

Each implementation of the hash function is given as a C source file
that implements a simple internal API: the main function is
SIMD_Compress that implements the compression function.  When compiled,
the object file can be linked with nist.o to implement the NIST API (and
the iteration mode of the hash function) on top of this internal API.


Known bugs
==========

The optimized implementation assumes that the integers are represented
in a two's-complement arithmetic, and that the right shift operation
preserves the sign bit (which is an implementation defined behaviour).


Changelog
=========

  * 2.0
    + Implements the tweaked version of SIMD (version 1.1 of the
    specification)
    + Small optimisations that benefit to GCC 4.3.

  * 1.1
    + The 128-bit vector implementation now supports SIMD-512.

  * 1.0.4
    + Includes a vectorized version for ARM with IwMMXt

  * 1.0.3
    + Fixed an endiannes error on the vectorized PPC implementation
    + The vectorized version now compiles with GCC 3.3 on PCC

  * 1.0.2
    + Fixed a stupid typo in compat.h (only affected PCC and exotic arch)
    + The vectorized version now compiles with GCC 4.3 on PCC

  * 1.0.1
    + The vectorized version now compiles with GCC 4.3
    + better endianness check in compat.h, using endian.h
    + better alignment checks: each implementation can specify an alignment
  
  * 1.0
      Initial release
    + Fixed the typo (the constant in the inner code is 233, not 223)
  
  * 0.9
      NIST submitted implementation
    - This version contained a typo that makes it produce bad outputs


TODO
====

A Future version of this code might include:

- performance improvements
- a vectorized implementation of SIMD-512
- vectorized implementation for more architectures (e.g. VIS on Sparc)
- a version where SIMD instructions are simulated with 64-bit arithmetic


License
=======

Licensing is specified in the LICENSE.txt file. This is an MIT-like,
BSD-like open-source license. Basically, we will get the fame but not
the blame. If you reuse our code in your own projects, and distribute
the result, then you should state that you used our code and that we
always disclaimed any kind of warranty, and will continue to do so in
the foreseeable future, and beyond. You have no other obligation such as
disclosing your own source code. See the LICENSE.txt file for the
details in a lawyer-compatible language.


Copyright and patents
=====================

Following the classification of http://bench.cr.yp.to/call-hash.html, we
declare that:

  There are no known present or future claims by a copyright holder that
  the distribution of this software infringes the copyright. In
  particular, the author of the software is not making such claims and
  does not intend to make such claims.

  There are no known present or future claims by a patent holder that
  the use of this software infringes the patent. In particular, the
  author of the software is not making such claims and does not intend
  to make such claims.
