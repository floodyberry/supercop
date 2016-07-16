Huseyin Hisil
v01, May 2014

This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use the multidigit arithmetic library CRYMPIX. 

The implementation uses 

i) the curve Jac1271 given by C: y^2 = x^5 + x^3 + 22815878948735825027404583632923055711*x^2 + 156787062186447996049629691229792057031*x + 112603218119107992661530155571863682108 over a finite field with 2^127-1 elements. This curve and Gaudry-Schost curve [1] are isomorphic over Fp(2^127-1).

ii) (the squares-only version of) the Gaudry-type Kummer surface 

    K: 4*E^2*a*b*c*d*(X*Y*Z*T) = ((X^2+Y^2+Z^2+T^2)-F*(X*T+Y*Z)-G*(X*Z+Y*T)-H*(X*Y+Z*T))^2
    
over a finite field with 2^127-1 elements where

a=11, b=-22, c=-19, d=-3,

E = (a+b+c+d)*(a+b-c-d)*(a-b+c-d)*(a-b-c+d)/(a*d-b*c)/(a*c-b*d)/(a*b-c*d)
  = 116367742519616076583650120870536308194,

F = (a^2-b^2-c^2+d^2)/(a*d-b*c)
  = 145242473685766417331928186098925456110,

G = (a^2-b^2+c^2-d^2)/(a*c-b*d)
  = 81667768061025231231209905783624370749,

H = (a^2+b^2-c^2-d^2)/(a*b-c*d)
  = 54058235547640725801037772083642107170.

This state-of-art Kummer surface is also from [1] and it correspond to the Gaudry-Schost curve.

Other internal parameters are listed as follows:

y0 = a/b = -1/2,
z0 = a/c = -11/19,
t0 = a/d = -11/3,
y0d = (a+b+c+d)/(a+b-c-d) = -3,
z0d = (a+b+c+d)/(a-b+c-d) = -33/17,
t0d = (a+b+c+d)/(a-b-c+d) = -33/49.

|Jac(C)| = 16*1809251394333065553414675955050290598923508843635941313077767297801179626051 (16 times a 250-bit prime) where C is the associated genus 2 curve.

The aim of the implementation is to show how to use Jacobian coordinates on imaginary hyperelliptic curves of genus 2 to speed up fixed-base scalar multiplications with precomputed lookup tables. The implementation includes only the performance dependent code (general divisor doublings and additions) and does not cover all cases of addition. A real-world implementation would need to streamline the many special cases that can arise (e.g. degenerate divisors). The implementation also computes the map from the above Kummer surface to Jac1271, using formulas adapted from AVIsogenies [2].

This implementation references from the paper "Jacobian Coordinates on Genus 2 Curves", a joint work with Craig Costello.


References
[1] P. Gaudry and E. Schost. Genus 2 point counting over prime fields. J. Symb. Comput., 47(4):368–400, 2012

[2] G. Bisson, R. Cosset, and D. Robert. AVIsogenies -- a library for computing isogenies between abelian varieties. November, 2012. URL: http://avisogenies.gforge.inria.fr



