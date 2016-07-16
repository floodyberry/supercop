#include "crypto_hash.h"
#include "crypto_uint32.h"
#include "crypto_uint8.h"
#include "crypto_uint64.h"

#include <string.h>
#include "fugue_256_code.h"

#define append_fugue(k) \
    if (len_mod4)     \
     { round(0,k,filler_in, IMPL_TYPE); j++; \
       len_in = HO2BE_8 (inlen*8);   \
       len_in_bot = (len_in >> 32); len_in_top = len_in ; \
       round(0, ((k+1)%10), (crypto_uint32 *) &len_in_top, IMPL_TYPE); j++; \
       round(0, ((k+2)%10), (crypto_uint32 *) &len_in_bot, IMPL_TYPE); j++;} \
    else \
     { \
       len_in = HO2BE_8 (inlen*8);   \
       len_in_bot = (len_in >> 32) ; len_in_top = len_in ; \
       round(0, ((k)%10), (crypto_uint32 *) &len_in_top, IMPL_TYPE); j++; \
       round(0, ((k+1)%10), (crypto_uint32 *) &len_in_bot, IMPL_TYPE); j++;} 

int crypto_hash(
       unsigned char *out,
       const unsigned char *in,
       unsigned long long inlen
     )
{
crypto_uint32 state[30] = {0,0,0,0,0,0,0,0,
			   0,0,0,0,0,0,0,0,
			   0,0,0,0,0,0,
			   HO2BE_4(0xe01b63da), HO2BE_4(0xc48707e9), HO2BE_4(0xe9a98eec), HO2BE_4(0xa46b3915), 
			   HO2BE_4(0xa6de572c), HO2BE_4(0x3f743cbe), HO2BE_4(0x4105b317), HO2BE_4(0x4580a1c6)};


 
#ifdef CONFIG_ASM_INLINE
    crypto_uint32 b0,b1,b2,b3;
    crypto_uint32 row[4];
    crypto_uint32 col[4];
#else
    crypto_uint32 row[4];
    crypto_uint32 col[4];
#endif
#ifdef EXTRA_ROUND_OPT64
    short i;
#endif
    crypto_uint8  filler_in[4];
    crypto_uint32 tmp;
    short len_mod, len_mod4;
    crypto_uint64 len_div;
    crypto_uint64 j,j1,j2, len_in;
    crypto_uint32 len_in_top, len_in_bot;

    short ptr = 0;

    j1 = 0; 
    j=0;

    len_mod4 = inlen & 0x3;   
    len_div = (inlen >> 2);  //byte vs word
    len_mod = (len_div)%10;
    len_div = (len_div)/10;

    for (j2=0; j2<len_div;j2++)
    {
      round(j,0,in,IMPL_TYPE); j++;
      round(j,1,in,IMPL_TYPE); j++;
      round(j,2,in,IMPL_TYPE); j++;
      round(j,3,in,IMPL_TYPE); j++;
      round(j,4,in,IMPL_TYPE); j++;
      round(j,5,in,IMPL_TYPE); j++;
      round(j,6,in,IMPL_TYPE); j++;
      round(j,7,in,IMPL_TYPE); j++;
      round(j,8,in,IMPL_TYPE); j++;
      round(j,9,in,IMPL_TYPE); j++;
    }

    if (len_mod >=1)
    {
        round(j,0,in, IMPL_TYPE); j++;
        if (len_mod >=2)
        {
	  round(j,1,in, IMPL_TYPE); j++;
	  if (len_mod >=3)
            {
	      round(j,2,in, IMPL_TYPE); j++;
	      if (len_mod >=4)
                {
		  round(j,3,in, IMPL_TYPE); j++;
		  if (len_mod >=5)
		    {
		      round(j,4,in, IMPL_TYPE); j++;
		      if (len_mod >=6)
			{
			  round(j,5,in, IMPL_TYPE); j++;
			  if (len_mod >=7)
			    {
			      round(j,6,in, IMPL_TYPE); j++;
			      if (len_mod >=8)
				{
				  round(j,7,in, IMPL_TYPE); j++;
				  if (len_mod >=9)
				    {
				      round(j,8,in, IMPL_TYPE); j++;
				    }
				}
			    }
			}
		    }
		}
            }
        }
    }


    if (len_mod4) 
      {
	memcpy( filler_in, in+(j*4), len_mod4);
	memset( filler_in + len_mod4, 0 , 4 - len_mod4);
      }

    if (len_mod==0)	{append_fugue(0)}
else
    if (len_mod==1)	{append_fugue(1)}
else
    if (len_mod==2)	{append_fugue(2)}
else
    if (len_mod==3)	{append_fugue(3)}
else
    if (len_mod==4)	{append_fugue(4)}
else
    if (len_mod==5)	{append_fugue(5)}
else
    if (len_mod==6)	{append_fugue(6)}
else
    if (len_mod==7)	{append_fugue(7)}
else
    if (len_mod==8)	{append_fugue(8)}
else
  if (len_mod==9)	{append_fugue(9)};



    j1 = len_mod +2;
    if (len_mod4) j1++;
    j1 = j1 %10;
    ptr = FUGUE_SIZE - 3*j1;


    final_round1(ptr,j1,26);
    ptr = ptr - ((26*3)%FUGUE_SIZE);
    final_round2(ptr,j1,13);

    for (j=0; j<4; j++)
    {
        ((crypto_uint32 *)out)[j]   = state[off(ptr,1+j)];
        ((crypto_uint32 *)out)[4+j] = state[off(ptr,15+j)];
    }
    return 0;
}
