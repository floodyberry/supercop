#include<stdlib.h>
#include<string.h>
#include "crypto_stream_salsa20.h"
#include "sizes.h"
#include "matrix.h"
#include "misc.h"

MAT pk_from_string(const unsigned char * pk)
{
  return mat_ini_from_string(DIMENSION, CODIMENSION, pk);
}

// assumes la+lb multiple of 8
// and is the size of x
unsigned char *vec_concat(unsigned char* x, unsigned char* a, unsigned char* b, int la, int lb)
{
  int i;

  memcpy(x,a,la/8);
  i = BITS_TO_BYTES(la); // might be one more than la/8
  memcpy(x+i,b,lb/8);

  if (la % 8)
    {
      x[la/8] =
	(a[la/8] & ((1 << (la%8)) - 1))   // the la%8 LSB of a[la/8]
	^ ((b[lb/8] << (8 - (lb%8))) & 0xff); // the lb%8 LSB of b[lb/8] shifted 
    }

  return x;
}

// encrypt one block of BITS_TO_BYTES(DIMENSION) bytes exactly
int encryp_bloc(unsigned char *ciphertext, unsigned char *m, MAT R)//changed....datatypes added.
{
  int i;
  unsigned char c[BITS_TO_BYTES(DIMENSION)];
  unsigned long cR[BITS_TO_LONG(CODIMENSION)];
  unsigned char key[32], nonce[8];
  int e[NB_ERRORS];

  // assumes e is ordered
  pick_er(NB_ERRORS, EXT_DEGREE, e, 0);

  for (i = 0; (i < 32) && (i < NB_ERRORS); ++i)
    key[i] = e[i];
  for (; i < 32; ++i)
    key[i] = 0;
  memset(nonce, 0, 8);

  crypto_stream_salsa20_xor(c,m,BITS_TO_BYTES(DIMENSION),nonce,key);//get the function value c = f(e) + m ....

  mat_vec_mul(cR,c,R);
  //temporary sec
  vec_concat(ciphertext,c,(unsigned char *) cR,DIMENSION,CODIMENSION);

  //flip t error positions instead.
  for(i=0;i<NB_ERRORS;i++)
    ciphertext[(e[i]/8)]^=(1<<(e[i]%8));//As 8 is the length of unsigned char.

  return 1;
}

int shortciphertext(unsigned char * c, unsigned long long * clen,
		    const unsigned char * m, unsigned long long mlen,
		    const unsigned char * pk, unsigned long long pklen)
{
  MAT R;
  // not DIMENSION/8 which might be one less (if DIMENSION is not a multiple of 8)
  unsigned char m1[BITS_TO_BYTES(DIMENSION)];

  R = pk_from_string(pk);

  memcpy(m1,&mlen,LENGTH_BYTES);
  memcpy(m1+LENGTH_BYTES,m,mlen);
  memset(m1+LENGTH_BYTES+mlen,0,BITS_TO_BYTES(DIMENSION)-(LENGTH_BYTES+mlen));//add 0 to the remaining of the message array.
  encryp_bloc(c,m1,R);
  *clen = ENCRYPTION_BYTES;

  free(R);

  return 0;
}
