Huseyin Hisil
v01, November 2012
v02, March 2013

This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use the multidigit arithmetic library CRYMPIX. 

The implementation uses the curve C: y^2 = x^5 + 318258242717201709453901384328569236653*x^3 + 75380722035796344355219475510170298006*x^2 + 129416082603460579272847694630998099237*x + 143864072772599444046778416709082679388 over a finite field with 2^128-173 elements.

|Jac(C)| = 115792089237316195429342203801033554170931615651881657307308068079702089951781 (257-bit prime).

The implementation includes only the performance dependent code (general divisor doublings and additions) and does not cover all cases of addition. A real-world implementation would need to streamline the many special cases that can arise (e.g. degenerate divsors). Nevertheless, the cycle count is not expected to be affected dramatically in the case of an optimized complete addition algorithm.

This implementation references from the paper "Two is greater than one", a joint work with Joppe Bos, Craig Costello, and Kristin Lauter.
