Huseyin Hisil,
March 2013.

This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use the multidigit arithmetic library CRYMPIX. 

The implementation uses the curve C: y^2 = x^5 + (12544884702866578275*i + 6148275953345011740)*x^3 + (4257865936154958333*i + 12155577556379749393)*x^2 + (16519109982018842029*i + 3600247297987423813)*x + (6416264942088602071*i + 7008878166144108916) over a finite field with (2^64-189)^2 elements with i^2=-1.

|Jac(C)| = 2^6 * 16879 * 62683 * 1710024880158127742499387005384745007574557462363960828332983222797

The implementation includes only the performance dependent code (general divisor doublings and additions) and does not cover all cases of addition. A real-world implementation would need to streamline the many special cases that can arise (e.g. degenerate divsors). Nevertheless, the cycle count is not expected to be affected dramatically in the case of an optimized complete addition algorithm.

This implementation references from the paper "High-Performance Scalar Multiplication using 8-Dimensional GLV/GLS Decomposition", a joint work with Joppe Bos, Craig Costello, and Kristin Lauter.
