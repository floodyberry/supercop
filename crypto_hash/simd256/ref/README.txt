SIMD reference implementation - version 1.0
===========================================

The latest version of the specification of the SIMD hash function,
supporting documentation, and reference code can be downloaded from

  http://www.di.ens.fr/~leurent/simd.html


Overview
========

This is the reference implementation of the SIMD hash function.  This
code currently includes 3 different implementations:

- a slow reference implementation.
- an optimized implementation.
- a vectorized implementation for 128-bit vectors (SIMD-256 only).

The reference and optimized versions are written in ANSI C, and supports
all functions of the SIMD family.  Note that the so-called "optimized"
implementation is written in pure C and yield poor performance because
the design of the hash function is targeted toward SIMD instruction set.

The 128-bit vector implementation is written in C with compiler-specific
extensions to use SIMD instructions.  It currently supports the SSE2
instruction set of x86 processors and the Altivec instruction set of
PowerPC.  It has been tested with gcc, icc, and msvc.  You might need to
add a command line option to the compiler to allow it to use SSE or
Altivec instructions; for GCC, try -msse2 or -maltivec.


API
===

Each implementation of the hash function is given as a C source file
that implements a simple internal API: the most main function is
SIMD_Compress that implements the compression function.  When compiled,
the object file can be linked with nist.o to implement the NIST API (and
the iteration mode of the hash function) on top of this internal API.


Known bugs
==========

The vectorized implementation requires the input buffer to be 128-bit
aligned.


TODO
====

A Future version of this code might include:

- performance improvements
- a vectorized implementation of SIMD-512
- a 64-bit vector implementation (for VIS on Sparc, and IwMMXt on ARM)
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
