/* 2010.07.28 djb: convert from intel syntax to asm syntax */
/* 2010.07.28 djb: define WESTMERE and BAD */

/* Modified (July 2010) by Orr Dunkelman (applying SHAvite-3 tweak) from: */

/*                     compress.h                            */

/*************************************************************
 * Source for Intel AES-NI assembly implementation/emulation *
 * of the compression function of SHAvite-3 512              *
 *                                                           *
 * Authors:  Ryad Benadjila -- Orange Labs                   *
 *           Olivier Billet -- Orange Labs                   *
 *                                                           *
 * June, 2009                                                *
 *************************************************************/


#define tos(a)    #a
#define tostr(a)  tos(a)

#define T8(x) ((x) & 0xff)

#define WESTMERE
#define BAD

#ifdef WESTMERE
#ifdef BAD
#define replace_aes(i, j, k){\
        asm("pshufb SHAVITE_ENDI, %xmm"tostr(i)"");\
        asm("pshufb SHAVITE_ENDI, %xmm"tostr(j)"");\
        asm("aesenc %xmm"tostr(j)", %xmm"tostr(i)"");\
        asm("pshufb SHAVITE_ENDI, %xmm"tostr(i)"");\
        asm("pshufb SHAVITE_ENDI, %xmm"tostr(j)"");\
}
#else
#define replace_aes(i, j, k){\
        asm("aesenc %xmm"tostr(j)", %xmm"tostr(i)"");\
}
#endif

#define replace_aes_mem(i, MEM, j, k){\
        asm("aesenc %"tostr(MEM)", %xmm"tostr(i)"");\
}
#endif

#ifdef NEHALEM
#ifdef BAD
#define replace_aes(i, j, k){\
        asm("movdqu %xmm"tostr(i)", %xmm"tostr(k)"");\
        asm("mulps %xmm"tostr(j)", %xmm"tostr(i)"");\
        asm("mulps %xmm"tostr(j)", %xmm"tostr(k)"");\
        asm("xorps %xmm"tostr(k)", %xmm"tostr(i)"");\
}
#else
#define replace_aes(i, j, k){\
        asm("pshufb SHAVITE_ENDI, %xmm"tostr(i)"");\
        asm("pshufb SHAVITE_ENDI, %xmm"tostr(j)"");\
        asm("movdqu %xmm"tostr(i)", %xmm"tostr(k)"");\
        asm("mulps %xmm"tostr(j)", %xmm"tostr(i)"");\
        asm("mulps %xmm"tostr(j)", %xmm"tostr(k)"");\
        asm("xorps %xmm"tostr(k)", %xmm"tostr(i)"");\
        asm("pshufb SHAVITE_ENDI, %xmm"tostr(i)"");\
        asm("pshufb SHAVITE_ENDI, %xmm"tostr(j)"");\
}

#endif

#define replace_aes_mem(i, MEM, j, k){\
        asm("movdqu %xmm"tostr(i)", %xmm"tostr(k)"");\
        asm("mulps %"tostr(MEM)", %xmm"tostr(i)"");\
        asm("mulps %xmm"tostr(j)", %xmm"tostr(k)"");\
        asm("xorps %xmm"tostr(k)", %xmm"tostr(i)"");\
}
#endif

/* SHAvite-3 definition */

typedef struct {
   unsigned char chaining_value[64]; /* An array containing the chaining value */
   unsigned char buffer[128];        /* A buffer storing bytes until they are  */
				   /* compressed			     */
   unsigned long long CNT;
   unsigned long long  bitcount;           /* The number of bits compressed so far   */
   unsigned char partial_byte;       /* A byte to store a fraction of a byte   */
				   /* in case the input is not fully byte    */
				   /* alligned				     */
   unsigned char salt[64];           /* The salt used in the hash function     */ 
   int DigestSize;		   /* The requested digest size              */
   int BlockSize;		   /* The message block size                 */
} hashState;


/* Encrypts the plaintext pt[] using the key message[], salt[],      */
/* and counter[], to produce the ciphertext ct[]                     */
__attribute__ ((aligned (16))) unsigned int SHAVITE512_MESS[8*14];
__attribute__ ((aligned (16))) unsigned char  SHAVITE512_PTXT[8*16];
__attribute__ ((aligned (16))) unsigned int SHAVITE512_CNTS[8] = {0,0,0,0,0,0,0,0}; 
__attribute__ ((aligned (16))) unsigned int SHAVITE_ENDI[4] = {0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f };
__attribute__ ((aligned (16))) unsigned int SHAVITE512_XOR1[4] = {0xFFFFFFFF, 0x0, 0x0, 0x0};
__attribute__ ((aligned (16))) unsigned int SHAVITE512_XOR2[4] = {0x0, 0xFFFFFFFF, 0x0, 0x0};
__attribute__ ((aligned (16))) unsigned int SHAVITE512_XOR3[4] = {0x0, 0x0, 0xFFFFFFFF, 0x0};
__attribute__ ((aligned (16))) unsigned int SHAVITE512_XOR4[4] = {0x0, 0x0, 0x0, 0xFFFFFFFF};


#define seven_plus(a,b,c) do {\
   asm("movdqu %xmm"tostr(a)", %xmm5");\
   asm("movdqu %xmm"tostr(b)", %xmm6");\
   asm("psrldq $4, %xmm5");\
   asm("pslldq $12, %xmm6");\
   asm("pxor %xmm5, %xmm"tostr(c)"");\
   asm("pxor %xmm6, %xmm"tostr(c)"");\
\
} while(0);


#define key_mixing() do {\
  seven_plus(14,15,8); \
  seven_plus(15,8, 9); \
  seven_plus(8, 9, 10); \
  seven_plus(9, 10,11); \
  seven_plus(10,11,12); \
  seven_plus(11,12,13); \
  seven_plus(12,13,14); \
  seven_plus(13,14,15); \
} while(0);

#define key_nonlin_pre() do {\
   asm("pshufd $57, %xmm8, %xmm8");\
   asm("pshufd $57, %xmm9, %xmm9");\
   asm("pshufd $57, %xmm10, %xmm10");\
   asm("pshufd $57, %xmm11, %xmm11");\
   asm("pshufd $57, %xmm12, %xmm12");\
   asm("pshufd $57, %xmm13, %xmm13");\
   asm("pshufd $57, %xmm14, %xmm14");\
   asm("pshufd $57, %xmm15, %xmm15");\
\
   replace_aes(8, 4,6);\
   replace_aes(9, 4,7);\
   replace_aes(10,4,6);\
   replace_aes(11,4,7);\
   replace_aes(12,4,6);\
   replace_aes(13,4,7);\
   replace_aes(14,4,6);\
   replace_aes(15,4,7);\
} while(0);

#define key_nonlin_post() do {\
   asm("pxor %xmm7, %xmm8"); \
   asm("pxor %xmm8, %xmm9");\
   asm("pxor %xmm9, %xmm10");\
   asm("pxor %xmm10, %xmm11");\
   asm("pxor %xmm11, %xmm12");\
   asm("pxor %xmm12, %xmm13");\
   asm("pxor %xmm13, %xmm14");\
   asm("pxor %xmm14, %xmm15");\
} while(0);

#define round(L,A,B,R) do {\
   asm("movdqu %xmm"tostr(A)", %xmm5"); \
   asm("movdqu %xmm"tostr(R)", %xmm6"); \
   asm("pxor %xmm8, %xmm"tostr(A)""); \
   asm("pxor %xmm12, %xmm"tostr(R)""); \
   replace_aes(A,9, 6); \
   replace_aes(R,13,7); \
   replace_aes(A,10,6); \
   replace_aes(R,14,7); \
   replace_aes(A,11,6); \
   replace_aes(R,15,7); \
   replace_aes(A,4, 6); \
   replace_aes(R,4, 7); \
   asm("pxor %xmm"tostr(L)", %xmm"tostr(A)""); \
   asm("pxor %xmm"tostr(B)", %xmm"tostr(R)""); \
   asm("movdqu %xmm6, %xmm"tostr(L)""); \
   asm("movdqu %xmm5, %xmm"tostr(B)""); \
} while(0);


void E512()
{
   /* (L,A,B,R) = (xmm0,xmm1,xmm2,xmm3) */
   asm("movaps SHAVITE512_PTXT, %xmm0");
   asm("movaps SHAVITE512_PTXT+16, %xmm1");
   asm("movaps SHAVITE512_PTXT+32, %xmm2");
   asm("movaps SHAVITE512_PTXT+48, %xmm3");

   /* init key schedule */
   asm("movaps SHAVITE512_MESS, %xmm8");
   asm("movaps SHAVITE512_MESS+16, %xmm9");
   asm("movaps SHAVITE512_MESS+32, %xmm10");
   asm("movaps SHAVITE512_MESS+48, %xmm11");
   asm("movaps SHAVITE512_MESS+64, %xmm12");
   asm("movaps SHAVITE512_MESS+80, %xmm13");
   asm("movaps SHAVITE512_MESS+96, %xmm14");
   asm("movaps SHAVITE512_MESS+112, %xmm15");
   asm("movaps SHAVITE512_MESS+112, %xmm7");

   /* load counter and zero key for AES */
   asm("pxor %xmm4, %xmm4");

   round(0,1,2,3); // 1
   key_nonlin_pre();
   asm("pxor SHAVITE512_CNTS, %xmm8");
   asm("pxor SHAVITE512_XOR4, %xmm8");
   key_nonlin_post();
   round(0,1,2,3); // 2
   key_mixing();

   asm("movdqu %xmm15, %xmm7");
   round(0,1,2,3); // 3
   key_nonlin_pre();
   key_nonlin_post();
   round(0,1,2,3); // 4
   key_mixing();

   asm("movdqu %xmm15, %xmm7");
   round(0,1,2,3); // 5
   key_nonlin_pre();
   asm("pshufd $27, SHAVITE512_CNTS, %xmm5");
   asm("pxor SHAVITE512_XOR4, %xmm9");
   asm("pxor %xmm5, %xmm9");
   key_nonlin_post();
   round(0,1,2,3); // 6
   key_mixing();

   asm("movdqu %xmm15, %xmm7");
   round(0,1,2,3); // 7
   key_nonlin_pre();
   key_nonlin_post();
   round(0,1,2,3); // 8
   key_mixing();

   asm("movdqu %xmm15, %xmm7");
   round(0,1,2,3); // 9
   key_nonlin_pre();
   asm("pshufd $78, SHAVITE512_CNTS, %xmm5");
   asm("pxor SHAVITE512_XOR4, %xmm15");
   asm("pxor %xmm5, %xmm15");
   key_nonlin_post();
   round(0,1,2,3); // a
   key_mixing();

   asm("movdqu %xmm15, %xmm7");
   round(0,1,2,3); // b
   key_nonlin_pre();
   key_nonlin_post();
   round(0,1,2,3); // c
   key_mixing();

   asm("movdqu %xmm15, %xmm7");
   round(0,1,2,3); // d
   key_nonlin_pre();
   asm("pshufd $113, SHAVITE512_CNTS, %xmm5");
   asm("pxor SHAVITE512_XOR4, %xmm14");
   asm("pxor %xmm5, %xmm14");
   key_nonlin_post();
   round(0,1,2,3); // e

   /* feedforward */
   asm("pxor SHAVITE512_PTXT, %xmm0");
   asm("pxor SHAVITE512_PTXT+16, %xmm1");
   asm("pxor SHAVITE512_PTXT+32, %xmm2");
   asm("pxor SHAVITE512_PTXT+48, %xmm3");
   asm("movaps %xmm0, SHAVITE512_PTXT");
   asm("movaps %xmm1, SHAVITE512_PTXT+16");
   asm("movaps %xmm2, SHAVITE512_PTXT+32");
   asm("movaps %xmm3, SHAVITE512_PTXT+48");

   return;
}



void Compress512(const unsigned char *message_block, unsigned char *chaining_value, unsigned long long counter, const unsigned char salt[64])
{    
   int i;

   for (i=0;i<16*4;i++)
      SHAVITE512_PTXT[i]=chaining_value[i];

   for (i=0;i<32;i++)
      SHAVITE512_MESS[i]= *((unsigned int*)(message_block+4*i));

   SHAVITE512_CNTS[0]=(unsigned int)(counter & 0xFFFFFFFFULL);
   SHAVITE512_CNTS[1]=(unsigned int)(counter>>32);

   E512();

   for(i=0; i<16*4; i++)
       chaining_value[i]=SHAVITE512_PTXT[i]; 

   return;
}
