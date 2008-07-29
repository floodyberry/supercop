#include<stdlib.h>
#include<string.h>
#include "crypto_stream_salsa20.h"
#include "sizes.h"
#include "matrix.h"
#include "gf.h"
#include "poly.h"

poly_t g, sqrtmod[NB_ERRORS];
gf_t *L, *coeffs;

void sk_from_string(const unsigned char * sk)
{
  int i;
  // L, g, coeffs and sqrt declared as global variables:
  // gf_t *L, *coeffs;
  // poly_t g, sqrtmod[NB_ERRORS];

  L = (gf_t *) sk;
  sk += LENGTH * sizeof (gf_t);

  g = poly_alloc_from_string(NB_ERRORS, sk);
  poly_set_deg(g, NB_ERRORS);
  sk += (NB_ERRORS + 1) * sizeof (gf_t);

  coeffs = (gf_t *) sk;
  sk += LENGTH * NB_ERRORS * sizeof (gf_t);

  for (i = 0; i < NB_ERRORS; ++i) {
    sqrtmod[i] = poly_alloc_from_string(NB_ERRORS - 1, sk);
    poly_set_deg(sqrtmod[i], NB_ERRORS - 1);
    sk += NB_ERRORS * sizeof (gf_t);
  }
}

void sk_free()
{
  int i;

  free(g);
  for (i = 0; i < NB_ERRORS; ++i) {
    free(sqrtmod[i]);
  }
}

poly_t syndrome(const unsigned char * b)
{
  int i,j;
  poly_t R;

  R = poly_alloc(NB_ERRORS - 1);
  for(j=0;j<LENGTH;j++)
    {
      if ((b[j/8]>>(j%8))&1)
	for(i=0;i<NB_ERRORS;i++)
	  poly_addto_coeff(R,i,coeffs[j * NB_ERRORS + i]);
    }

  poly_calcule_deg(R);
  return R;
}

int decode(const unsigned char * b, int * e)
{
  int i,j,d;
  poly_t u,v,h,sigma,R,S,aux;
  gf_t a;

  R = syndrome(b);

  //1. Compute S(z), such that, S(z)^2=(h(z)+z)%g(z).
  //2. Compute u(z),v(z), such that, deg(u)<=t/2, deg(v)<=(t-1)/2 and u(z)=S(z).v(z)%g(z).
  //3. Compute Sigma_e(z)=u(z^2)+z(v(z)^2).->The locator polynomial of the code C.

  poly_eeaux(&h ,&aux, R, g, 1);
  a = gf_inv(poly_coeff(aux,0));
  for (i = 0; i <= poly_deg(h); ++i)
    poly_set_coeff(h,i,gf_mul_fast(a,poly_coeff(h,i)));
  poly_free(aux);

  //  compute h(z) += z
  poly_addto_coeff(h, 1, gf_unit());

  // compute S square root of h (using sqrtmod)
  S = poly_alloc(NB_ERRORS - 1);
  for(i=0;i<NB_ERRORS;i++) {
    a = gf_sqrt(poly_coeff(h,i));
    if (a != gf_zero()) {
      if (i & 1) {
	for(j=0;j<NB_ERRORS;j++)
	  poly_addto_coeff(S, j, gf_mul_fast(a, poly_coeff(sqrtmod[i],j)));
      }
      else
	poly_addto_coeff(S, i/2, a);
    }
  }
  poly_calcule_deg(S);

  // solve the key equation u(z) = v(z)*S(z) mod g(z)
  poly_eeaux(&v, &u, S, g, NB_ERRORS/2+1);

  // sigma = u^2+z*v^2
  sigma = poly_alloc(NB_ERRORS);
  for (i = 0; i <= poly_deg(u); ++i) {
    poly_set_coeff(sigma, 2*i, gf_square(poly_coeff(u,i)));
  }
  for (i = 0; i <= poly_deg(v); ++i) {
    poly_set_coeff(sigma, 2*i+1, gf_square(poly_coeff(v,i)));
  }
  
  poly_calcule_deg(sigma);

  u = poly_mul(sigma,R);
  poly_rem(u,g);

  //compute sigma - the LOCATOR polynomial........
  d = poly_deg(sigma);
  for (j = 0, i = 0; (j < LENGTH) && (i < d); ++j) {
    if (poly_eval(sigma, L[j]) == gf_zero()) {
      e[i] = j;
      ++i;
    }
  }

  poly_free(u);
  poly_free(v);
  poly_free(h);
  poly_free(sigma);
  poly_free(R);
  poly_free(S);
  
  if (i < d)
    return -1;
  else
    return i;
}

int shortplaintext(unsigned char * m, unsigned long long * mlen,
		   const unsigned char * c, unsigned long long clen,
		   const unsigned char * sk, unsigned long long sklen)
{
  int i;
  int e[NB_ERRORS];
  unsigned char key[32], nonce[8];
  unsigned char m1[BITS_TO_BYTES(DIMENSION)];

  sk_from_string(sk);

  // assumes e is ordered
  i = decode(c,e);

  for (i = 0; (i < 32) && (i < NB_ERRORS); ++i)
    key[i] = e[i];
  for (; i < 32; ++i)
    key[i] = 0;
  memset(nonce, 0, 8);

  crypto_stream_salsa20_xor(m1,c,BITS_TO_BYTES(DIMENSION),nonce,key);//get the function value m = f(e) + c ....

  //flip the error positions
  for(i=0;i<NB_ERRORS;i++){
    if (e[i] >= DIMENSION)
      break; // e[] is ordered
    else
      m1[(e[i]/8)]^=(1<<(e[i]%8));//As 8 is the length of unsigned char.
  }
  *mlen = 0;
  memcpy(mlen,m1,LENGTH_BYTES);
  memcpy(m,m1+LENGTH_BYTES,*mlen);
  sk_free();

  return 0;
}
