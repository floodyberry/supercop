This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use a stack-only version of the multiprecision arithmetic library CRYMPIX. 

The elliptic curve scalar multiplication is performed using the twisted Hessian curve a*x^3 + y^3 + 1 = d*x*y with a=1 and
d=53010.

For technical details see http://www.huseyinhisil.net/hisilthesis.pdf

Please report problems to hisil.huseyin@gmail.com

Huseyin Hisil
2009-2010



