Huseyin Hisil,
March 2013.

This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use the multidigit arithmetic library CRYMPIX. 

The implementation uses the curve C: y^2 = x^5 + (17275736705428938862*i + 9597225893510653377) over a finite field with (2^64-2285)^2 elements with i^2=-1.

|Jac(C)| = 421 * 1181 * 10601 * 21968482676544214814720042345948911463859528450701256799597520244461

The implementation includes only the performance dependent code (general divisor doublings and additions) and does not cover all cases of addition. A real-world implementation would need to streamline the many special cases that can arise (e.g. degenerate divsors). Nevertheless, the cycle count is not expected to be affected dramatically in the case of an optimized complete addition algorithm.

This implementation references from the paper "High-Performance Scalar Multiplication using 8-Dimensional GLV/GLS Decomposition", a joint work with Joppe Bos, Craig Costello, and Kristin Lauter.
