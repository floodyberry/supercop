Huseyin Hisil
v01, May 2014

This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use the multidigit arithmetic library CRYMPIX. 

The implementation uses the curve GLV128c given by C: y^2 = x^5 + 7^10 over a finite field with 2^128-7689975 elements.

|Jac(C)| = (2^252 + 375576928331233691782146792677798267213584131651764404159)/5.

The aim of the implementation is to show how to use Jacobian coordinates on imaginary hyperelliptic curves of genus 2. The implementation includes only the performance dependent code (general divisor doublings and additions) and does not cover all cases of addition. A real-world implementation would need to streamline the many special cases that can arise (e.g. degenerate divisors). 

This implementation references from the paper "Jacobian Coordinates on Genus 2 Curves", a joint work with Craig Costello.
