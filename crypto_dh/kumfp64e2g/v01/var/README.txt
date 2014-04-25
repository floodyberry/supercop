Huseyin Hisil,
March 2013.

This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use the multidigit arithmetic library CRYMPIX. 

The implementation uses (the squares-only version of) the Gaudry-type Kummer surface 

    K: 4*E^2*a*b*c*d*(X*Y*Z*T) = ((X^2+Y^2+Z^2+T^2)-F*(X*T+Y*Z)-G*(X*Z+Y*T)-H*(X*Y+Z*T))^2
    
over a finite field with (2^64-189)^2 elements with i^2=-1 where

a = 9870327443160009058*u + 2799150582581824979,
b = 7246658321955263640*u + 12197507424603080855,
c = 12106540269467696529*u + 7406163070075850377,
d = 1,

E = (a+b+c+d)*(a+b-c-d)*(a-b+c-d)*(a-b-c+d)/(a*d-b*c)/(a*c-b*d)/(a*b-c*d)
  = 3663888248682644552*u + 8308266437562083092,

F = (a^2-b^2-c^2+d^2)/(a*d-b*c)
  = 5130901660039278381*u + 6378763037882534459,

G = (a^2-b^2+c^2-d^2)/(a*c-b*d)
  = 1608091444136491268*u + 17326398380347202807,

H = (a^2+b^2-c^2-d^2)/(a*b-c*d)
  = 9399469748702509058*u + 14187747531033270771.

Other internal parameters are listed as follows:

x0 = 1,
y0 = a/b = 17851838743611458689*u + 15023829798723723262,
z0 = a/c = 3712148588974509690*u + 18266714903209081203,
t0 = a/d = 9870327443160009058*u + 2799150582581824979,
x0d = 1,
y0d = (a+b+c+d)/(a+b-c-d) = 9263179666633309773*u + 9595687545157768583,
z0d = (a+b+c+d)/(a-b+c-d) = 16659021503994460815*u + 7677783683721248867,
t0d = (a+b+c+d)/(a-b-c+d) = 12954490101534078965*u + 11736096864326062695.

|Jac(C)| = 2^6 * 1710024880158127742499387005384745007574557462363960828332983222797 where C is the associated genus 2 curve.

The implementation does not cover all cases of pseudo-addition as the degenerate pseudo-addition formulas has not appeared in the literature yet. Nevertheless, the cycle count is not expected to be affected dramatically in the case of an optimized complete pseudo-addition algorithm.

This implementation references from the paper "High-Performance Scalar Multiplication using 8-Dimensional GLV/GLS Decomposition", a joint work with Joppe Bos, Craig Costello, and Kristin Lauter.
