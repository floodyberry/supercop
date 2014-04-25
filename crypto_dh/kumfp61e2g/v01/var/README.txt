Huseyin Hisil,
March 2013.

This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use the multidigit arithmetic library CRYMPIX. 

The implementation uses (the squares-only version of) the Gaudry-type Kummer surface 

    K: 4*E^2*a*b*c*d*(X*Y*Z*T) = ((X^2+Y^2+Z^2+T^2)-F*(X*T+Y*Z)-G*(X*Z+Y*T)-H*(X*Y+Z*T))^2
    
over a finite field with (2^61-1)^2 elements with i^2=-1 where

a=745372888035769831*i + 1224423871041948215, 
b=1367512798496848593*i + 205751596502368199, 
c=380963396243132001*i + 1667013960577236915, 
d=1,


E = (a+b+c+d)*(a+b-c-d)*(a-b+c-d)*(a-b-c+d)/(a*d-b*c)/(a*c-b*d)/(a*b-c*d)
  = 1497411632288522138*i + 292427205074455097,

F = (a^2-b^2-c^2+d^2)/(a*d-b*c)
  = 2182231190395397901*i + 1046607026783845849,

G = (a^2-b^2+c^2-d^2)/(a*c-b*d)
  = 1949345643105151894*i + 420871672382413506,

H = (a^2+b^2-c^2-d^2)/(a*b-c*d)
  = 949840083031512991*i + 1462105493516569052.

Other internal parameters are listed as follows:

x0 = 1,
y0 = a/b = 1029261290498581154*i + 311793874926753877,
z0 = a/c = 1493399454181844546*i + 826128908176746349,
t0 = a/d = 745372888035769831*i + 1224423871041948215,
x0d = 1,
y0d = (a+b+c+d)/(a+b-c-d) = 101129798680115391*i + 1528283253823898981,
z0d = (a+b+c+d)/(a-b+c-d) = 1772799997020710895*i + 702814902498789855,
t0d = (a+b+c+d)/(a-b-c+d) = 1517959706593695190*i + 1147203450078199721.

|Jac(C)| = 2^6 * 2681508737 * 164725089312508207602342831124551763828685547226980673422949427 where C is the associated genus 2 curve.

The implementation does not cover all cases of pseudo-addition as the degenerate pseudo-addition formulas has not appeared in the literature yet. Nevertheless, the cycle count is not expected to be affected dramatically in the case of an optimized complete pseudo-addition algorithm.

This implementation references from the paper "High-Performance Scalar Multiplication using 8-Dimensional GLV/GLS Decomposition", a joint work with Joppe Bos, Craig Costello, and Kristin Lauter.
