ESSENCE

Submission for eBASH

AUTHOR: Jason Worth Martin <jason.worth.martin@gmail.com>

DESCRIPTION
===========

This implementation of ESSENCE uses gcc style vector attributes to
attempt to get the compiler to autovectorize.  I have only had partial
success with it.  With gcc versions 4.3.2 and above, it seems to work
reasonably well provided that the appropriate architecture flags are
given.  For example, one needs to pass -march=core2 -mtune=core2 into
gcc to get it to use the SSE instructions on a Core 2 processor.  I
hope that it works as well on other architectures, but I haven't had
an opportunity to test it out.

PLEASE NOTE: eBASH and SUPERCOP only test small hash input sizes.  As
such, they don't even trigger the best vectorization for essence224
and essence256.  One needs to have hash input sizes of over 2MB before
the "essence_compress_256_dual" function gets triggered.  Hence, for
larger files or bulk hashing, you can expect much better performance
than what is reported by eBASH for essence224 or essence256 on
platforms with 128bit vector registers.

Likewise, for real performance one must use the parallel mode of
operation for ESSENCE which requires modifying essence_api.h to enable
parallelization and compiling with OpenMP.

This version also incorporates the logic minimization ideas described
by Joan Boyar and Rene Peralta's paper "New logic minimization
techniques with applications to cryptology."

Here's the BibTeX citation for the paper:

@misc{cryptoeprint:2009:191,
   author = {Joan Boyar and Rene Peralta},
   title = {New logic minimization techniques with applications to cryptology.},
   howpublished = {Cryptology ePrint Archive, Report 2009/191},
   year = {2009},
   note = {\url{http://eprint.iacr.org/}},
 }
