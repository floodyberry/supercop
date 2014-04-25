Huseyin Hisil,
March 2013.

This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use the multidigit arithmetic library CRYMPIX. 

The implementation uses the curve C: y^2 = x^5 + (1092171533470960661*i + 200282817898000997)*x^3 + (1010904730175095615*i + 222880891256166859)*x^2 + (2188897028088906113*i + 2121806688923765783)*x + (2023072108862458234*i + 1545665884212463459) over a finite field with (2^61-1)^2 elements with i^2=-1.

|Jac(C)| = 2^6 * 2681508737 * 164725089312508207602342831124551763828685547226980673422949427

The implementation includes only the performance dependent code (general divisor doublings and additions) and does not cover all cases of addition. A real-world implementation would need to streamline the many special cases that can arise (e.g. degenerate divsors). Nevertheless, the cycle count is not expected to be affected dramatically in the case of an optimized complete addition algorithm.

This implementation references from the paper "High-Performance Scalar Multiplication using 8-Dimensional GLV/GLS Decomposition", a joint work with Joppe Bos, Craig Costello, and Kristin Lauter.
