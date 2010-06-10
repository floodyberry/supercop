This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use a stack-only version of the multiprecision arithmetic library CRYMPIX. 

The elliptic curve scalar multiplication is performed using the twisted Edwards curve a*x^2 + y^2 = 1 + d*x^2*y^2 with a=-1 and
d=59702978421801250797625733354188749104239349061620892363256064453045589344976.

The underlying field has 2^256-587 elements.

For technical details see 
Hisil H., Wong K. K., Carter G., Dawson E. "Twisted Edwards curves revisited", ASIACRYPT 2008, Springer Verlag, LNCS, Vol. 5350, pp. 326--343, 2008.
http://eprint.iacr.org/2008/522

and

Hisil H., Wong K. K., Carter G., Dawson E. "Jacobi quartic curves revisited", ACISP 2009, Springer Verlag, LNCS, Vol. 5594, pp. 452--468, 2009.
http://eprint.iacr.org/2009/312

and

http://www.huseyinhisil.net/hisilthesis.pdf

Please report problems to hisil.huseyin@gmail.com

Huseyin Hisil
2009-2010



