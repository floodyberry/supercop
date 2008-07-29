/*
 *  FAST IMPLEMENTATION OF STREAM CIPHER SNOW 2.0
 * 
 *  Program: snowblock2.c
 *
 * Synopsis:
 *      Hard coded implementation of SNOW 2.0 stream cipher.
 *      Each call to snow_keystream_block generates 16 words of
 *      keystream symbols.
 *        
 */ 
#include "snow2tab.h"


#define byte(n,w)   (((w)>>(n*8)) & 0xff)
#define ainv_mul(w) (((w)>>8)^(snow_alphainv_mul[w&0xff]))
#define a_mul(w)    (((w)<<8)^(snow_alpha_mul[w>>24]))


/* By compiling with option -DUSEINLINE some routines can be inlined */
#ifdef USEINLINE
#define INLINE __inline__
#else
#define INLINE
#endif

/*
 * Function:  snow_loadkey_fast
 *
 * Synopsis:
 *   Loads the key material and performs the initial mixing.
 *
 * Returns: void
 *
 * Assumptions:
 *   keysize is either 128 or 256.
 *   key is of proper length, for keysize=128, key is of lenght 16 bytes
 *      and for keysize=256, key is of length 32 bytes.
 *   key is given in big endian format, 
 *   For 128 bit key:
 *        key[0]-> msb of k_3
 *         ...
 *        key[3]-> lsb of k_3
 *         ...      
 *        key[12]-> msb of k_0
 *         ...
 *        key[15]-> lsb of k_0
 *
 *   For 256 bit key:
 *        key[0]-> msb of k_7
 *          ...
 *        key[3]-> lsb of k_7
 *          ...
 *        key[28]-> msb of k_0
 *          ...
 *        key[31]-> lsb of k_0
 */
void snow_loadkey_fast(ECRYPT_ctx* ctx,u32 IV3,u32 IV2,u32 IV1,u32 IV0)
{
 int i;
 
  if (ctx->keysize==128) {
    ctx->s15=(((u32)*(ctx->key+0))<<24) | (((u32)*(ctx->key+1))<<16) |
      (((u32)*(ctx->key+2))<<8) | (((u32)*(ctx->key+3)));
    ctx->s14=(((u32)*(ctx->key+4))<<24) | (((u32)*(ctx->key+5))<<16) |
      (((u32)*(ctx->key+6))<<8) | (((u32)*(ctx->key+7)));
    ctx->s13=(((u32)*(ctx->key+8))<<24) | (((u32)*(ctx->key+9))<<16) |
      (((u32)*(ctx->key+10))<<8) | (((u32)*(ctx->key+11)));
    ctx->s12=(((u32)*(ctx->key+12))<<24) | (((u32)*(ctx->key+13))<<16) |
      (((u32)*(ctx->key+14))<<8) | (((u32)*(ctx->key+15)));
    ctx->s11 =~ctx->s15; /* bitwise inverse */
    ctx->s10 =~ctx->s14;
    ctx->s9  =~ctx->s13;
    ctx->s8  =~ctx->s12;
    ctx->s7  = ctx->s15; /* just copy */ 
    ctx->s6  = ctx->s14;
    ctx->s5  = ctx->s13;
    ctx->s4  = ctx->s12;
    ctx->s3  =~ctx->s15; /* bitwise inverse */
    ctx->s2  =~ctx->s14;
    ctx->s1  =~ctx->s13;
    ctx->s0  =~ctx->s12;
    }
  else {  /* assume keysize=256 */
     ctx->s15=(((u32)*(ctx->key+0))<<24) | (((u32)*(ctx->key+1))<<16) |
      (((u32)*(ctx->key+2))<<8) | (((u32)*(ctx->key+3)));
    ctx->s14=(((u32)*(ctx->key+4))<<24) | (((u32)*(ctx->key+5))<<16) |
      (((u32)*(ctx->key+6))<<8) | (((u32)*(ctx->key+7)));
    ctx->s13=(((u32)*(ctx->key+8))<<24) | (((u32)*(ctx->key+9))<<16) |
      (((u32)*(ctx->key+10))<<8) | (((u32)*(ctx->key+11)));
    ctx->s12=(((u32)*(ctx->key+12))<<24) | (((u32)*(ctx->key+13))<<16) |
      (((u32)*(ctx->key+14))<<8) | (((u32)*(ctx->key+15)));
    ctx->s11=(((u32)*(ctx->key+16))<<24) | (((u32)*(ctx->key+17))<<16) |
      (((u32)*(ctx->key+18))<<8) | (((u32)*(ctx->key+19)));
    ctx->s10=(((u32)*(ctx->key+20))<<24) | (((u32)*(ctx->key+21))<<16) |
      (((u32)*(ctx->key+22))<<8) | (((u32)*(ctx->key+23)));
    ctx->s9=(((u32)*(ctx->key+24))<<24) | (((u32)*(ctx->key+25))<<16) |
      (((u32)*(ctx->key+26))<<8) | (((u32)*(ctx->key+27)));
    ctx->s8=(((u32)*(ctx->key+28))<<24) | (((u32)*(ctx->key+29))<<16) |
      (((u32)*(ctx->key+30))<<8) | (((u32)*(ctx->key+31)));
    ctx->s7 =~ctx->s15; /* bitwise inverse */ 
    ctx->s6 =~ctx->s14;
    ctx->s5 =~ctx->s13;
    ctx->s4 =~ctx->s12;
    ctx->s3 =~ctx->s11; 
    ctx->s2 =~ctx->s10;
    ctx->s1 =~ctx->s9;
    ctx->s0 =~ctx->s8;
    }
 
  /* XOR IV values */
    ctx->s15^=IV0;
    ctx->s12^=IV1;
    ctx->s10^=IV2;
    ctx->s9^=IV3;
 

  ctx->r1=0;
  ctx->r2=0;

  /* Do 32 initial clockings */
 for(i=0;i<2;i++)
    {
      u32 outfrom_fsm, fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s15 )^ctx->r2;
      ctx->s0 =a_mul(ctx->s0 )^ ctx->s2 ^ainv_mul(ctx->s11 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s5 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s0 )^ctx->r2;
      ctx->s1 =a_mul(ctx->s1 )^ ctx->s3 ^ainv_mul(ctx->s12 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s6 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s1 )^ctx->r2;
      ctx->s2 =a_mul(ctx->s2 )^ ctx->s4 ^ainv_mul(ctx->s13 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s7 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s2 )^ctx->r2;
      ctx->s3 =a_mul(ctx->s3 )^ ctx->s5 ^ainv_mul(ctx->s14 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s8 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s3 )^ctx->r2;
      ctx->s4 =a_mul(ctx->s4 )^ ctx->s6 ^ainv_mul(ctx->s15 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s9 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s4 )^ctx->r2;
      ctx->s5 =a_mul(ctx->s5 )^ ctx->s7 ^ainv_mul(ctx->s0 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s10 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s5 )^ctx->r2;
      ctx->s6 =a_mul(ctx->s6 )^ ctx->s8 ^ainv_mul(ctx->s1 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s11 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s6 )^ctx->r2;
      ctx->s7 =a_mul(ctx->s7 )^ ctx->s9 ^ainv_mul(ctx->s2 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s12 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s7 )^ctx->r2;
      ctx->s8 =a_mul(ctx->s8 )^ ctx->s10 ^ainv_mul(ctx->s3 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s13 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s8 )^ctx->r2;
      ctx->s9 =a_mul(ctx->s9 )^ ctx->s11 ^ainv_mul(ctx->s4 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s14 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s9 )^ctx->r2;
      ctx->s10 =a_mul(ctx->s10 )^ ctx->s12 ^ainv_mul(ctx->s5 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s15 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s10 )^ctx->r2;
      ctx->s11 =a_mul(ctx->s11 )^ ctx->s13 ^ainv_mul(ctx->s6 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s0 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s11 )^ctx->r2;
      ctx->s12 =a_mul(ctx->s12 )^ ctx->s14 ^ainv_mul(ctx->s7 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s1 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s12 )^ctx->r2;
      ctx->s13 =a_mul(ctx->s13 )^ ctx->s15 ^ainv_mul(ctx->s8 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s2 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s13 )^ctx->r2;
      ctx->s14 =a_mul(ctx->s14 )^ ctx->s0 ^ainv_mul(ctx->s9 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s3 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;

      outfrom_fsm=(ctx->r1+ ctx->s14 )^ctx->r2;
      ctx->s15 =a_mul(ctx->s15 )^ ctx->s1 ^ainv_mul(ctx->s10 )^outfrom_fsm;
      fsmtmp=ctx->r2+ ctx->s4 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;
    }
}

/*
 * Function: snow_keystream_fast
 * 
 * Synopsis:
 *   Clocks the cipher 16 times and returns 16 words of keystream symbols
 *   in keystream_block.
 * 
 * Returns: void
 * 
 */

INLINE void snow_keystream_fast(ECRYPT_ctx* ctx, u32 *keystream_block) 
{
      u32 fsmtmp;

      ctx->s0 =a_mul(ctx->s0 )^ ctx->s2 ^ainv_mul(ctx->s11 );
      fsmtmp=ctx->r2+ ctx->s5 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;
      keystream_block[0]=(ctx->r1+ ctx->s0 )^ctx->r2^ ctx->s1 ;

      ctx->s1 =a_mul(ctx->s1 )^ ctx->s3 ^ainv_mul(ctx->s12 );
      fsmtmp=ctx->r2+ ctx->s6 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;
      keystream_block[1]=(ctx->r1+ ctx->s1 )^ctx->r2^ ctx->s2 ;

      ctx->s2 =a_mul(ctx->s2 )^ ctx->s4 ^ainv_mul(ctx->s13 );
      fsmtmp=ctx->r2+ ctx->s7 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;
      keystream_block[2]=(ctx->r1+ ctx->s2 )^ctx->r2^ ctx->s3 ;

      ctx->s3 =a_mul(ctx->s3 )^ ctx->s5 ^ainv_mul(ctx->s14 );
      fsmtmp=ctx->r2+ ctx->s8 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;
      keystream_block[3]=(ctx->r1+ ctx->s3 )^ctx->r2^ ctx->s4 ;

      ctx->s4 =a_mul(ctx->s4 )^ ctx->s6 ^ainv_mul(ctx->s15 );
      fsmtmp=ctx->r2+ ctx->s9 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;
      keystream_block[4]=(ctx->r1+ ctx->s4 )^ctx->r2^ ctx->s5 ;

      ctx->s5 =a_mul(ctx->s5 )^ ctx->s7 ^ainv_mul(ctx->s0 );
      fsmtmp=ctx->r2+ ctx->s10 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;
      keystream_block[5]=(ctx->r1+ ctx->s5 )^ctx->r2^ ctx->s6 ;

      ctx->s6 =a_mul(ctx->s6 )^ ctx->s8 ^ainv_mul(ctx->s1 );
      fsmtmp=ctx->r2+ ctx->s11 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;
      keystream_block[6]=(ctx->r1+ ctx->s6 )^ctx->r2^ ctx->s7 ;

      ctx->s7 =a_mul(ctx->s7 )^ ctx->s9 ^ainv_mul(ctx->s2 );
      fsmtmp=ctx->r2+ ctx->s12 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;
      keystream_block[7]=(ctx->r1+ ctx->s7 )^ctx->r2^ ctx->s8 ;

      ctx->s8 =a_mul(ctx->s8 )^ ctx->s10 ^ainv_mul(ctx->s3 );
      fsmtmp=ctx->r2+ ctx->s13 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp; 
      keystream_block[8]=(ctx->r1+ ctx->s8 )^ctx->r2^ ctx->s9 ;

      ctx->s9 =a_mul(ctx->s9 )^ ctx->s11 ^ainv_mul(ctx->s4 );
      fsmtmp=ctx->r2+ ctx->s14 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;
      keystream_block[9]=(ctx->r1+ ctx->s9 )^ctx->r2^ ctx->s10 ;

      ctx->s10 =a_mul(ctx->s10 )^ ctx->s12 ^ainv_mul(ctx->s5 );
      fsmtmp=ctx->r2+ ctx->s15 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;
      keystream_block[10]=(ctx->r1+ ctx->s10 )^ctx->r2^ ctx->s11 ;

      ctx->s11 =a_mul(ctx->s11 )^ ctx->s13 ^ainv_mul(ctx->s6 );
      fsmtmp=ctx->r2+ ctx->s0 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;    
      keystream_block[11]=(ctx->r1+ ctx->s11 )^ctx->r2^ ctx->s12 ;

      ctx->s12 =a_mul(ctx->s12 )^ ctx->s14 ^ainv_mul(ctx->s7 );
      fsmtmp=ctx->r2+ ctx->s1 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;
      keystream_block[12]=(ctx->r1+ ctx->s12 )^ctx->r2^ ctx->s13 ;

      ctx->s13 =a_mul(ctx->s13 )^ ctx->s15 ^ainv_mul(ctx->s8 );
      fsmtmp=ctx->r2+ ctx->s2 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;   
      keystream_block[13]=(ctx->r1+ ctx->s13 )^ctx->r2^ ctx->s14 ;

      ctx->s14 =a_mul(ctx->s14 )^ ctx->s0 ^ainv_mul(ctx->s9 );
      fsmtmp=ctx->r2+ ctx->s3 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp; 
      keystream_block[14]=(ctx->r1+ ctx->s14 )^ctx->r2^ ctx->s15 ;

      ctx->s15 =a_mul(ctx->s15 )^ ctx->s1 ^ainv_mul(ctx->s10 );
      fsmtmp=ctx->r2+ ctx->s4 ;
      ctx->r2=snow_T0[byte(0,ctx->r1)]^snow_T1[byte(1,ctx->r1)]^snow_T2[byte(2,ctx->r1)]^snow_T3[byte(3,ctx->r1)];
      ctx->r1=fsmtmp;    
      keystream_block[15]=(ctx->r1+ ctx->s15 )^ctx->r2^ ctx->s0 ;
}


