Huseyin Hisil
v01, November 2012
v02, March 2013

This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use the multidigit arithmetic library CRYMPIX. 

The implementation uses the curve C: y^2 = x^5 + 34744234758245218589390329770704207149*x^3 + 132713617209345335075125059444256188021*x^2 + 90907655901711006083734360528442376758*x + 6667986622173728337823560857179992816 over a finite field with 2^127-1 elements.

|Jac(C)| = 28948022309329048848169239995659025138451177973091551374101475732892580332259 (254-bit prime).

The implementation includes only the performance dependent code (general divisor doublings and additions) and does not cover all cases of addition. A real-world implementation would need to streamline the many special cases that can arise (e.g. degenerate divsors). Nevertheless, the cycle count is not expected to be affected dramatically in the case of an optimized complete addition algorithm.

This implementation references from the paper "Two is greater than one", a joint work with Joppe Bos, Craig Costello, and Kristin Lauter.
