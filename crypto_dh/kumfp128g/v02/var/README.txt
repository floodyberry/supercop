Huseyin Hisil
v01, November 2012
v02, March 2013

This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use the multidigit arithmetic library CRYMPIX. 

The implementation uses (the squares-only version of) the Gaudry-type Kummer surface

    K: 4*E^2*a*b*c*d*(X*Y*Z*T) = ((X^2+Y^2+Z^2+T^2)-F*(X*T+Y*Z)-G*(X*Z+Y*T)-H*(X*Y+Z*T))^2
    
over a finite field with 2^128-237 elements where

a = 334682247240506570722615664472921175266,
b = 157051198022072498195567750325313857769,
c = 6850138514876938687389483815392168339,
d = 1,

E = (a+b+c+d)*(a+b-c-d)*(a-b+c-d)*(a-b-c+d)/(a*d-b*c)/(a*c-b*d)/(a*b-c*d)
  = 64244075311484182697950175915145447227,

F = (a^2-b^2-c^2+d^2)/(a*d-b*c)
  = 141845481795702787368974732278045583210,

G = (a^2-b^2+c^2-d^2)/(a*c-b*d)
  = 303677228473721413608678676000212557240,

H = (a^2+b^2-c^2-d^2)/(a*b-c*d)
  = 4682897517782183620458217909927814566.

Other internal parameters are listed as follows:

y0 = a/b = 185270410925498099159132107275538199384,
z0 = a/c = 230590115945381165931385513510313468712,
t0 = a/d = 334682247240506570722615664472921175266,
y0d = (a+b+c+d)/(a+b-c-d) = 113311972338251699308397458596272037957,
z0d = (a+b+c+d)/(a-b+c-d) = 286167023082766352378241452336418530352,
t0d = (a+b+c+d)/(a-b-c+d) = 96583367677371003876807134266233062896.

|Jac(C)| = 16*7237005577332262214072797209406249707568321823640356418684124053756801466361 (16 times a 253-bit prime) where C is the associated genus 2 curve.

The implementation does not cover all cases of pseudo-addition as the degenerate pseudo-addition formulas has not appeared in the literature yet. Nevertheless, the cycle count is not expected to be affected dramatically in the case of an optimized complete pseudo-addition algorithm.

This implementation references from the paper "Two is greater than one", a joint work with Joppe Bos, Craig Costello, and Kristin Lauter.
