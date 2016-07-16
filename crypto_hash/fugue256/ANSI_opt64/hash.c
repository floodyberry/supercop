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
       round(0, ((k+1)%5), (crypto_uint32 *) &len_in_top, IMPL_TYPE); j++; \
       round(0, ((k+2)%5), (crypto_uint32 *) &len_in_bot, IMPL_TYPE); j++;} \
    else \
     { \
       len_in = HO2BE_8 (inlen*8);   \
       len_in_bot = (len_in >> 32) ; len_in_top = len_in ; \
       round(0, ((k)%5), (crypto_uint32 *) &len_in_top, IMPL_TYPE); j++; \
       round(0, ((k+1)%5), (crypto_uint32 *) &len_in_bot, IMPL_TYPE); j++;} 

int crypto_hash(
       unsigned char *out,
       const unsigned char *in,
       unsigned long long inlen
     )
{
crypto_uint32 state[30] = {0,0,0,0,0,0,0,0,
			   0,0,0,0,0,0,0,0,
			   0,0,0,0,0,0,
			   HO2BE_4(0xe952bdde),HO2BE_4(0x6671135f),HO2BE_4(0xe0d4f668),HO2BE_4(0xd2b0b594),
			   HO2BE_4(0xf96c621d),HO2BE_4(0xfbf929de),HO2BE_4(0x9149e899),HO2BE_4(0x34f8c248)};
				  
#ifdef CONFIG_ASM_INLINE
    crypto_uint32 b0,b1,b2,b3;
    crypto_uint32 row[4];
    crypto_uint32 col[4];
#else
    crypto_uint64 row[4];
    crypto_uint64 col[4];
    crypto_uint64 col0,col1,col2,col3,col0col2,col1col3;
    crypto_uint64 tmp, tmp_in;
    crypto_uint32 tmp_zero;
#endif
#ifdef EXTRA_ROUND_OPT64
    short i;
#endif
    crypto_uint8  filler_in[4];
    short len_mod, len_mod4;
    crypto_uint64 len_div;
    crypto_uint64 j,j1,j2, len_in;
    crypto_uint32 len_in_top, len_in_bot;

    short ptr = 0;

    j1 = 0; 
    j=0;
    tmp_zero = state[0];

    len_mod4 = inlen & 0x3;   
    len_div = (inlen >> 2);  //byte vs word
    len_mod = (len_div)%10;
    len_div = (len_div)/10;

    for (j2=0; j2<len_div;j2++)
    {
        hround(j,0,IMPL_TYPE); j++;
        ground(j,1,IMPL_TYPE); j++;
        hround(j,2,IMPL_TYPE); j++;
        ground(j,3,IMPL_TYPE); j++;
        hround(j,4,IMPL_TYPE); j++;
        ground(j,0,IMPL_TYPE); j++;
        hround(j,1,IMPL_TYPE); j++;
        ground(j,2,IMPL_TYPE); j++;
        hround(j,3,IMPL_TYPE); j++;
        ground(j,4,IMPL_TYPE); j++;
    }

    if (len_mod>=5)
      {
        hround(j,0,IMPL_TYPE); j++;
	ground(j,1,IMPL_TYPE); j++;
        hround(j,2,IMPL_TYPE); j++;
        ground(j,3,IMPL_TYPE); j++;
        round(j,4,in,IMPL_TYPE); j++; 
	len_mod = len_mod -5;
      }

    if (len_mod >=1)
    {
      round(j,0,in,IMPL_TYPE); j++;

        if (len_mod >=2)
        {
	  round(j,1,in,IMPL_TYPE); j++;

            if (len_mod >=3)
            {
	      round(j,2,in,IMPL_TYPE); j++;

                if (len_mod >=4)
                {
		  round(j,3,in,IMPL_TYPE); j++;

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
    if (len_mod==4)	{append_fugue(4)};


    j1 = len_mod +2;
    if (len_mod4) j1++;
    j1 = j1 %5;
    ptr = FUGUE_SIZE - 6*j1;

    state[off(ptr,0)] = tmp_zero;

    final_round1(ptr,j1,5);
    final_round2(ptr,j1,13);

    for (j=0; j<4; j++)
    {
        ((crypto_uint32 *)out)[j]   = state[off(ptr,1+j)];
        ((crypto_uint32 *)out)[4+j] = state[off(ptr,15+j)];
    }
    return 0;
}
