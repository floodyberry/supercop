This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use a stack-only version of the multiprecision arithmetic library CRYMPIX. 

The elliptic curve scalar multiplication is performed using the extended Jacobi quartic curve y^2 = d*x^4 + 2*a*x^2 + 1 with a=-1/2 and d=11.

The underlying field has 2^256-587 elements.

For technical details see 
Hisil H., Wong K. K., Carter G., Dawson E. "Jacobi quartic curves revisited", ACISP 2009, Springer Verlag, LNCS, Vol. 5594, pp. 452--468, 2009.
http://eprint.iacr.org/2009/312

and

http://www.huseyinhisil.net/hisilthesis.pdf

Please report problems to hisil.huseyin@gmail.com

Huseyin Hisil
2009-2010



