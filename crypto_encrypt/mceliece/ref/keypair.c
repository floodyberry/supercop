#include<stdlib.h>
#include<string.h>
#include "sizes.h"
#include "gf.h"
#include "poly.h"
#include "matrix.h"
#include "misc.h"

/*********************************************************************************************/
////////////////////////////////////KEY-GENERATION Function////////////////////////////////////
/*********************************************************************************************/

//The support for key-gen

void gop_supr(int n,gf_t *L) 
{
  unsigned int i, j;
  gf_t tmp;

  for (i = 0; i < n; ++i) 
    {
      j = i + ((unsigned int) (u8rnd() ^ (u8rnd()<<8) ^ (u8rnd()<<16) ^ (u8rnd()<<24))) % (n - i);

      tmp = L[j];
      L[j] = L[i];
      L[i] = tmp;
    }
}


MAT key_genmat(gf_t *L, poly_t g)
{
  //L- Support
  //t- Number of errors, i.e.=30.
  //n- Length of the Goppa code, i.e.=2^11
  //m- The extension degree of the GF, i.e. =11
  //g- The generator polynomial.
  gf_t x,y;
  MAT H,R; 
  int i,j,k,r,n;
  int * perm, Laux[LENGTH];

  n=LENGTH;//2^11=2048
  r=NB_ERRORS*gf_extd();//32 x 11=352

  H=mat_ini(r,n);//initialize matrix with actual no. of bits.
  mat_set_to_zero(H); //set the matrix with all 0's.

  for(i=0;i< n;i++)
    {
      x = poly_eval(g,L[i]);//evaluate the polynomial at the point L[i].
      x = gf_inv(x);
      y = x;
      for(j=0;j<NB_ERRORS;j++)
	{
	  for(k=0;k<gf_extd();k++)
	    {
	      if(y & (1<<k))//if((y>>k) & 1)
		mat_set_coeff_to_one(H,j*gf_extd()+k,i);//the co-eff. are set in 2^0,...,2^11 ; 2^0,...,2^11 format along the rows/cols?
	    }
	  y = gf_mul(y,L[i]);
	}
    }//The H matrix is fed.
  
  perm = mat_rref(H);
  if (perm == NULL) {
    mat_free(H);
    return NULL;
  }
  
  R = mat_ini(n-r,r);
  mat_set_to_zero(R); //set the matrix with all 0's.
  for (i = 0; i < R->rown; ++i)
    for (j = 0; j < R->coln; ++j)
      if (mat_coeff(H,j,perm[i]))
	mat_change_coeff(R,i,j);

  for (i = 0; i < LENGTH; ++i)
    Laux[i] = L[perm[i]];
  for (i = 0; i < LENGTH; ++i)
    L[i] = Laux[i];

  mat_free(H);
  free(perm);

  return (R);
}

int crypto_encrypt_keypair(unsigned char * pk, unsigned char * sk)
{
  int i;
  gf_t *L;
  poly_t g,*sqrtmod,*F;
  MAT R;

  gf_init(EXT_DEGREE);

  //pick the support.........
  L = malloc(gf_card()*sizeof(gf_t));
  for(i=0;i<gf_card();i++)
    L[i]=i;
  gop_supr(gf_card(),L);

  do {
    //pick the irreducible polynomial.....
    g = poly_randgen_irred(NB_ERRORS, u8rnd);
    R = key_genmat(L,g);
    if (R == NULL)
      poly_free(g);
  } while (R == NULL);

  sqrtmod = poly_sqrtmod_init(g);
  F = poly_syndrome_init(g, L, LENGTH);

  memcpy(sk, L, LENGTH * sizeof (gf_t));
  sk += LENGTH * sizeof (gf_t);
  free(L);

  memcpy(sk, g->coeff, (NB_ERRORS + 1) * sizeof (gf_t));
  sk += (NB_ERRORS + 1) * sizeof (gf_t);
  poly_free(g);

  for (i = 0; i < LENGTH; ++i) {
    memcpy(sk, F[i]->coeff, NB_ERRORS * sizeof (gf_t));
    sk += NB_ERRORS * sizeof (gf_t);
    poly_free(F[i]);
  }
  free(F);

  for (i = 0; i < NB_ERRORS; ++i) {
    memcpy(sk, sqrtmod[i]->coeff, NB_ERRORS * sizeof (gf_t));
    sk += NB_ERRORS * sizeof (gf_t);
    poly_free(sqrtmod[i]);
  }
  free(sqrtmod);

  memcpy(pk, R->elem, R->alloc_size);
  mat_free(R);

  return 0;
}
