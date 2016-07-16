Huseyin Hisil
v01, May 2014

This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use the multidigit arithmetic library CRYMPIX. 

The implementation uses the curve GLV128c given by C: y^2 = x^5 + 7^10 over a finite field with 2^128-7689975 elements.

|Jac(C)| = (2^252 + 375576928331233691782146792677798267213584131651764404159)/5.

The aim of the implementation is to provide a base in the comparison of projective coordinates with Jacobian coordinates on imaginary hyperelliptic curves of genus 2. The implementation uses homogeneous projective cordinates and uses formulas from [1], [2]. The implementation includes only the performance dependent code (general divisor doublings and additions) and does not cover all cases of addition. A real-world implementation would need to streamline the many special cases that can arise (e.g. degenerate divisors). 

This implementation references from the paper "Jacobian Coordinates on Genus 2 Curves", a joint work with Craig Costello.

References
[1] Craig Costello and Kristin Lauter. Group Law Computations on Jacobians of Hyperelliptic Curves. In A. Miri and S. Vaudenay (Eds.), Selected Areas in Cryptography – SAC2011 (18th International Conference on Selected Areas in Cryptography, Toronto, Canada, August 11-12, 2011. Proceedings). (Lecture Notes in Computer Science, Vol 7118, pp. 92-117). Berlin: Springer.
[2] Joppe W. Bos, Craig Costello, Huseyin Hisil and Kristin Lauter. Fast Cryptography in Genus 2. In T. Johannson and P.Q. Nguyen (Eds.), Progress in Cryptology – EUROCRYPT 2013 (32nd International Conference on Cryptology in Europe, Athens, Greece, May 26-30, 2013. Proceedings). (Lecture Notes in Computer Science, Vol 7881, pp. 194-210). Berlin: Springer.
