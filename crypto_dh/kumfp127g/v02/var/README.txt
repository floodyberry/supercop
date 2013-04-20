Huseyin Hisil
v01, November 2012
v02, March 2013

This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use the multidigit arithmetic library CRYMPIX. 

The implementation uses (the squares-only version of) the Gaudry-type Kummer surface 

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

This state-of-art Kummer surface is from "Genus 2 point counting over prime fields" by 
Pierrick Gaudry and {\'E}ric Schost, J. Symb. Comput. 47/4, pp368-400, 2012.

Other internal parameters are listed as follows:

y0 = a/b = -1/2,
z0 = a/c = -11/19,
t0 = a/d = -11/3,
y0d = (a+b+c+d)/(a+b-c-d) = -3,
z0d = (a+b+c+d)/(a-b+c-d) = -33/17,
t0d = (a+b+c+d)/(a-b-c+d) = -33/49.

|Jac(C)| = 16*1809251394333065553414675955050290598923508843635941313077767297801179626051 (16 times a 250-bit prime) where C is the associated genus 2 curve.

The implementation does not cover all cases of pseudo-addition as the degenerate pseudo-addition formulas has not appeared in the literature yet. Nevertheless, the cycle count is not expected to be affected dramatically in the case of an optimized complete pseudo-addition algorithm.

This implementation references from the paper "Two is greater than one", a joint work with Joppe Bos, Craig Costello, and Kristin Lauter.
