This is a crypto_dh application and runs only on x86-64 architectures.

Some parts of the implementation use a stack-only version of the multiprecision arithmetic library CRYMPIX. 

The elliptic curve scalar multiplication is performed using the twisted Jacobi intersection curve {b*s^2 + c^2 = 1, a*s^2 + d^2 = 1} with b=1 and
a=3764.

The underlying field has 2^256-587 elements.

For technical details see http://www.huseyinhisil.net/hisilthesis.pdf

Please report problems to hisil.huseyin@gmail.com

Huseyin Hisil
2009-2010



