#include "crypto_hash.h"
#include "crypto_uint32.h"
#include "crypto_uint8.h"
#include "crypto_uint64.h"

//#include "mytypes.h"

#include <string.h>

/*

#if defined(__sse4_1__) || defined(__SSE4_1__)  || defined(_SSE4_1_) || defined(_sse4_1_) 
#include <smmintrin.h>
#include "fugue_256_sse4_code.h"
#else
#include <tmmintrin.h>
#include "fugue_256_ssse3_code.h"
#endif
*/

#include <tmmintrin.h>
#include "fugue_256_ssse3_code.h"


#define append_fugue(k) \
  if (k%2 ==0) \
    {\
    if (len_mod4)     \
     { e_round(0,k,filler_in, IMPL_TYPE); j++; \
       len_in = HO2BE_8 (inlen*8);   \
       len_in_bot = (len_in >> 32); len_in_top = len_in ; \
       o_round(0, ((k+1)%10), (crypto_uint32 *) &len_in_top, IMPL_TYPE); j++; \
       e_round(0, ((k+2)%10), (crypto_uint32 *) &len_in_bot, IMPL_TYPE); j++;} \
    else \
     { \
       len_in = HO2BE_8 (inlen*8);   \
       len_in_bot = (len_in >> 32) ; len_in_top = len_in ; \
       e_round(0, ((k)%10),   (crypto_uint32 *) &len_in_top, IMPL_TYPE); j++; \
       o_round(0, ((k+1)%10), (crypto_uint32 *) &len_in_bot, IMPL_TYPE); j++;} \
    }\
  else \
    {\
    if (len_mod4)     \
     { o_round(0,k,filler_in, IMPL_TYPE); j++; \
       len_in = HO2BE_8 (inlen*8);   \
       len_in_bot = (len_in >> 32); len_in_top = len_in ; \
       e_round(0, ((k+1)%10), (crypto_uint32 *) &len_in_top, IMPL_TYPE); j++; \
       o_round(0, ((k+2)%10), (crypto_uint32 *) &len_in_bot, IMPL_TYPE); j++;} \
    else \
     { \
       len_in = HO2BE_8 (inlen*8);   \
       len_in_bot = (len_in >> 32) ; len_in_top = len_in ; \
       o_round(0, ((k)%10),   (crypto_uint32 *) &len_in_top, IMPL_TYPE); j++; \
       e_round(0, ((k+1)%10), (crypto_uint32 *) &len_in_bot, IMPL_TYPE); j++;} \
    }


int crypto_hash(
       unsigned char *out,
       const unsigned char *in,
       unsigned long long inlen
     )
{
  __attribute__((aligned(16))) crypto_uint32 state[32] = {0,0,0,0,0,0,0,0,
			   0,0,0,0,0,0,0,0,
			   0,0,0,0,0,0,
			   HO2BE_4(0xe952bdde),HO2BE_4(0x6671135f),HO2BE_4(0xe0d4f668),HO2BE_4(0xd2b0b594),
			   HO2BE_4(0xf96c621d),HO2BE_4(0xfbf929de),HO2BE_4(0x9149e899),HO2BE_4(0x34f8c248),
			   0,0};
  __attribute__((aligned(16))) crypto_uint32 hs_state[32];
    
    __attribute__((aligned(16)))     crypto_uint32 row[4];
    __attribute__((aligned(16)))     crypto_uint32 col[4];
    __m128i  row_shuffle_mask;
    __m128i  mask_0to0;
    __m128i  mask_123to123;
    __m128i  zero_xmm;
    __m128i  row128;
    __m128i  xmm_out, xmm_in, xmm_out1, xmm_out2;
    __m128i  t0,t1,t2,t3, tmp_state, xfr;
    __m128i ct0,ct1,ct2,ct3;
    __m128i  xmm_state[8];


    crypto_uint8  filler_in[4];


    short len_mod, len_mod4;
    crypto_uint64 j,j1,j2, len_in;
    crypto_uint32 len_in_top, len_in_bot;
    crypto_uint64 len_div;
    short ptr = 0;
    //    short ptr = hs->Base;
    crypto_uint32 tmp;
    //    crypto_uint64 tmp_addr;

    short i, i1, itmp;


    row_shuffle_mask = _mm_set_epi8(15,11,7,3, 
				     14,10,6,2,
 				     13,9,5,1,
 				     12,8,4,0);

    mask_0to0     =  _mm_set_epi32(0,0,0, 0xffffffff);
    mask_123to123 =  _mm_set_epi32( 0xffffffff,0xffffffff,0xffffffff, 0);

    xmm_out = _mm_setzero_si128();

    for (i=0; i<8; i++)
      xmm_state[i] = _mm_load_si128((__m128i const *) &(state[i*4]));


    j1 = 0; 
    j=0;

    len_mod4 = inlen & 0x3;   
    len_div = (inlen >> 2);  //byte vs word
    len_mod = (len_div)%10;
    len_div = (len_div)/10;

    for (j2=0; j2<len_div;j2++)
    {
      e_round(j,0,in,IMPL_TYPE); j++;
      o_round(j,1,in,IMPL_TYPE); j++;
      e_round(j,2,in,IMPL_TYPE); j++;
      o_round(j,3,in,IMPL_TYPE); j++;
      e_round(j,4,in,IMPL_TYPE); j++;

      o_round(j,5,in,IMPL_TYPE); j++;
      e_round(j,6,in,IMPL_TYPE); j++;
      o_round(j,7,in,IMPL_TYPE); j++;
      e_round(j,8,in,IMPL_TYPE); j++;
      o_round(j,9,in,IMPL_TYPE); j++;

      //      hyb_round(j,0,in,IMPL_TYPE); j++;
      //      hyb_round(j,1,in,IMPL_TYPE); j++;
      //      hyb_round(j,2,in,IMPL_TYPE); j++;
      //      hyb_round(j,3,in,IMPL_TYPE); j++;
      //      hyb_round(j,4,in,IMPL_TYPE); j++;
    }


    if (len_mod >=1)
    {
      e_round(j,0,in,IMPL_TYPE); j++;
        if (len_mod >=2)
        {
	  o_round(j,1,in,IMPL_TYPE); j++;
            if (len_mod >=3)
            {
	      e_round(j,2,in,IMPL_TYPE); j++;
                if (len_mod >=4)
                {
		  o_round(j,3,in,IMPL_TYPE); j++;
                  if (len_mod >=5)
		    {
		      e_round(j,4,in,IMPL_TYPE); j++;
		      if (len_mod >=6)
			{
			  o_round(j,5,in,IMPL_TYPE); j++;
			  if (len_mod >=7)
			    {
			      e_round(j,6,in,IMPL_TYPE); j++;
			      if (len_mod >=8)
				{
				  o_round(j,7,in,IMPL_TYPE); j++;
				  if (len_mod >=9)
				    {
				      e_round(j,8,in,IMPL_TYPE); j++;
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


    append_fugue(len_mod);


    j1 = len_mod +2;
    if (len_mod4) j1++;
    j1 = j1 % 10;
    ptr = (4*FUGUE_SIZE - 6*j1) %60;

    for (i=0; i<8; i++)
       _mm_store_si128((__m128i *) &(hs_state[i*4]), xmm_state[i]);

    if ((j1 %2) ==0)
      { 
	i1 = -6*j1 + 60;
	for (i=0; i<4 ; i++) state[ (i1++) %30 ]  = ((crypto_uint32 *) & xmm_out)[i];
        for (   ; i<30; i++) state[ (i1++) %30 ]  = hs_state[(i1 % 60) %32 ];
      }
    else
      {
	i1 = -6*j1 + 60;
	for (i=0; i<4 ; i++) state[ (i1++) %30 ]  = ((crypto_uint32 *) & xmm_out)[i];
	state[ (i1++) %30 ] = ((crypto_uint32 *) & tmp_state)[0];
	state[ (i1++) %30 ] = ((crypto_uint32 *) & tmp_state)[1];
	i +=2;
        for (   ; i<30; i++) state[ (i1++) %30 ]  = hs_state[(i1 % 60) % 32 ];
      }


    final_round1(ptr,j1,5);
    final_round2(ptr,j1,13);

    for (j=0; j<4; j++)
    {
        ((crypto_uint32 *)out)[j]   = state[off(ptr,1+j)];
        ((crypto_uint32 *)out)[4+j] = state[off(ptr,15+j)];
    }
    return 0;
}
