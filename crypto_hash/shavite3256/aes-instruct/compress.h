/* Modified (July 2010) by Orr Dunkelman (applying SHAvite-3 tweak) from: */

/*                     compress.h                            */

/*************************************************************
 * Source for Intel AES-NI assembly implementation/emulation *
 * of the compression function of SHAvite-3 256              *
 *                                                           *
 * Authors:  Ryad Benadjila -- Orange Labs                   *
 *           Olivier Billet -- Orange Labs                   *
 *                                                           *
 * June, 2009                                                *
 *************************************************************/

#define tos(a)    #a
#define tostr(a)  tos(a)

#define T8(x) ((x) & 0xff)

#ifdef WESTMERE
#ifdef BAD
#define replace_aes(i, j, k){\
        asm ("pshufb xmm"tostr(i)", [SHAVITE_ENDI]");\
        asm ("pshufb xmm"tostr(j)", [SHAVITE_ENDI]");\
        asm ("aesenc  xmm"tostr(i)", xmm"tostr(j)"");\
        asm ("pshufb xmm"tostr(i)", [SHAVITE_ENDI]");\
        asm ("pshufb xmm"tostr(j)", [SHAVITE_ENDI]");\
}
#else
#define replace_aes(i, j, k){\
        asm("aesenc  xmm"tostr(i)", xmm"tostr(j)"");\
}
#endif

#define replace_aes_mem(i, MEM, j, k){\
        asm("aesenc  xmm"tostr(i)", "tostr(MEM)"");\
}
#endif

#ifdef NEHALEM
#ifdef BAD
#define replace_aes(i, j, k){\
        asm("movdqu xmm"tostr(k)", xmm"tostr(i)"");\
        asm("mulps  xmm"tostr(i)", xmm"tostr(j)"");\
        asm("mulps  xmm"tostr(k)", xmm"tostr(j)"");\
        asm("xorps  xmm"tostr(i)", xmm"tostr(k)"");\
}
#else
#define replace_aes(i, j, k){\
        asm ("pshufb xmm"tostr(i)", [SHAVITE_ENDI]");\
        asm ("pshufb xmm"tostr(j)", [SHAVITE_ENDI]");\
        asm("movdqu xmm"tostr(k)", xmm"tostr(i)"");\
        asm("mulps  xmm"tostr(i)", xmm"tostr(j)"");\
        asm("mulps  xmm"tostr(k)", xmm"tostr(j)"");\
        asm("xorps  xmm"tostr(i)", xmm"tostr(k)"");\
        asm ("pshufb xmm"tostr(i)", [SHAVITE_ENDI]");\
        asm ("pshufb xmm"tostr(j)", [SHAVITE_ENDI]");\
}

#endif

#define replace_aes_mem(i, MEM, j, k){\
        asm ("movdqu xmm"tostr(k)", xmm"tostr(i)"");\
        asm ("mulps xmm"tostr(i)",  "tostr(MEM)"");\
        asm ("mulps xmm"tostr(k)",  xmm"tostr(j)"");\
        asm ("xorps xmm"tostr(i)",  xmm"tostr(k)"");\
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

__attribute__ ((aligned (16))) unsigned int SHAVITE_MESS[16];
__attribute__ ((aligned (16))) unsigned char  SHAVITE_PTXT[8*4];
__attribute__ ((aligned (16))) unsigned int SHAVITE_CNTS[4] = {0,0,0,0}; 
__attribute__ ((aligned (16))) unsigned int SHAVITE_ENDI[4] = {0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f };
__attribute__ ((aligned (16))) unsigned int SHAVITE_XOR2[4] = {0x0, 0xFFFFFFFF, 0x0, 0x0};
__attribute__ ((aligned (16))) unsigned int SHAVITE_XOR3[4] = {0x0, 0x0, 0xFFFFFFFF, 0x0};
__attribute__ ((aligned (16))) unsigned int SHAVITE_XOR4[4] = {0x0, 0x0, 0x0, 0xFFFFFFFF};


#define mixing() do {\
   asm("movaps  xmm11, xmm15");\
   asm("movaps  xmm10, xmm14");\
   asm("movaps  xmm9,  xmm13");\
   asm("movaps  xmm8,  xmm12");\
\
   asm("movaps  xmm6,  xmm11");\
   asm("psrldq  xmm6,  4");\
   asm("pxor    xmm8,  xmm6");\
   asm("movaps  xmm6,  xmm8");\
   asm("pslldq  xmm6,  12");\
   asm("pxor    xmm8,  xmm6");\
\
   asm("movaps  xmm7,  xmm8");\
   asm("psrldq  xmm7,  4");\
   asm("pxor    xmm9,  xmm7");\
   asm("movaps  xmm7,  xmm9");\
   asm("pslldq  xmm7,  12");\
   asm("pxor    xmm9,  xmm7");\
\
   asm("movaps  xmm6,  xmm9");\
   asm("psrldq  xmm6,  4");\
   asm("pxor    xmm10, xmm6");\
   asm("movaps  xmm6,  xmm10");\
   asm("pslldq  xmm6,  12");\
   asm("pxor    xmm10, xmm6");\
\
   asm("movaps  xmm7,  xmm10");\
   asm("psrldq  xmm7,  4");\
   asm("pxor    xmm11, xmm7");\
   asm("movaps  xmm7,  xmm11");\
   asm("pslldq  xmm7,  12");\
   asm("pxor    xmm11, xmm7");\
} while(0);

void E256()
{
   asm (".intel_syntax noprefix");

   /* (L,R) = (xmm0,xmm1) */
   asm ("movaps xmm0, [SHAVITE_PTXT]");
   asm ("movaps xmm1, [SHAVITE_PTXT+16]");
   asm ("movaps xmm3, [SHAVITE_CNTS]");
   asm ("movaps xmm4, [SHAVITE_XOR2]");
   asm ("pxor   xmm2,  xmm2");

   /* init key schedule */
   asm ("movaps xmm8,  [SHAVITE_MESS]");
   asm ("movaps xmm9,  [SHAVITE_MESS+16]");
   asm ("movaps xmm10, [SHAVITE_MESS+32]");
   asm ("movaps xmm11, [SHAVITE_MESS+48]");

   /* start key schedule */
   asm ("pshufd xmm12, xmm8,  57");
   asm ("pshufd xmm13, xmm9,  57");
   asm ("pshufd xmm14, xmm10, 57");
   asm ("pshufd xmm15, xmm11, 57");

   replace_aes(12,2,6);
   replace_aes(13,2,7);
   replace_aes(14,2,6);
   replace_aes(15,2,7);
   asm ("pxor   xmm12, xmm3");
   asm ("pxor   xmm12, xmm4");
   asm ("movaps xmm4, [SHAVITE_XOR3]");
   asm ("pxor   xmm12, xmm11");
   asm ("pxor   xmm13, xmm12");
   asm ("pxor   xmm14, xmm13");
   asm ("pxor   xmm15, xmm14");

   /* F3 */
   asm ("pxor   xmm8,  xmm1");
   replace_aes(8,9, 6);
   replace_aes(8,10,7);
   replace_aes(8,2, 6);
   asm ("pxor   xmm0,  xmm8");
   /* F3 */
   asm ("pxor   xmm11, xmm0");
   replace_aes(11,12,6);
   replace_aes(11,13,7);
   replace_aes(11,2, 6);
   asm ("pxor   xmm1,  xmm11");

   /* key schedule */
   mixing();

   /* F3 */
   asm ("pxor   xmm14, xmm1");
   replace_aes(14,15,6);
   replace_aes(14,8, 7);
   replace_aes(14,2, 6);
   asm ("pxor   xmm0,  xmm14");

   /* key schedule */
   asm ("pshufd xmm3,  xmm3,135");
   asm ("pshufd xmm12, xmm8, 57");
   asm ("pshufd xmm13, xmm9, 57");
   asm ("pshufd xmm14, xmm10,57");
   asm ("pshufd xmm15, xmm11,57");

   replace_aes(12,2,6);
   replace_aes(13,2,7);
   replace_aes(14,2,6);
   replace_aes(15,2,7);
   asm ("pxor   xmm12, xmm11");
   asm ("pxor   xmm14, xmm3");
   asm ("pxor   xmm14, xmm4");
   asm ("movaps xmm4, [SHAVITE_XOR4]");
   asm ("pxor   xmm13, xmm12");
   asm ("pxor   xmm14, xmm13");
   asm ("pxor   xmm15, xmm14");

   /* F3 */
   asm ("pxor   xmm9, xmm0");
   replace_aes(9,10,6);
   replace_aes(9,11,7);
   replace_aes(9,2, 6);
   asm ("pxor   xmm1,  xmm9");

   /* key schedule */
   mixing();

   /* F3 */
   asm ("pxor   xmm12,  xmm1");
   replace_aes(12,13,6);
   replace_aes(12,14,7);
   replace_aes(12,2, 6);
   asm ("pxor   xmm0,  xmm12");
   /* F3 */
   asm ("pxor   xmm15, xmm0");
   replace_aes(15,8, 6);
   replace_aes(15,9, 7);
   replace_aes(15,2, 6);
   asm ("pxor   xmm1,  xmm15");

   /* key schedule */
   asm ("pshufd xmm3,  xmm3, 147");
   asm ("pshufd xmm12, xmm8,  57");
   asm ("pshufd xmm13, xmm9,  57");
   asm ("pshufd xmm14, xmm10, 57");
   asm ("pshufd xmm15, xmm11, 57");

   replace_aes(12,2,6);
   replace_aes(13,2,7);
   replace_aes(14,2,6);
   replace_aes(15,2,7);
   asm ("pxor   xmm12, xmm11");
   asm ("pxor   xmm13, xmm3");
   asm ("pxor   xmm13, xmm4");
   asm ("pxor   xmm13, xmm12");
   asm ("pxor   xmm14, xmm13");
   asm ("pxor   xmm15, xmm14");

   /* F3 */
   asm ("pxor   xmm10,  xmm1");
   replace_aes(10,11,6);
   replace_aes(10,12,7);
   replace_aes(10,2, 6);
   asm ("pxor   xmm0,  xmm10");

   /* key schedule */
   mixing();

   asm ("pxor   xmm13, xmm0");
   replace_aes(13,14,6);
   replace_aes(13,15,7);
   replace_aes(13,2, 6);
   asm ("pxor   xmm1,  xmm13");


   /* key schedule */
   asm ("pshufd xmm3,  xmm3, 135");
   asm ("pshufd xmm12, xmm8,  57");
   asm ("pshufd xmm13, xmm9,  57");
   asm ("pshufd xmm14, xmm10, 57");
   asm ("pshufd xmm15, xmm11, 57");

   replace_aes(12,2,6);
   replace_aes(13,2,7);
   replace_aes(14,2,6);
   replace_aes(15,2,7);
   asm ("pxor   xmm12, xmm11");
   asm ("pxor   xmm15, xmm3");
   asm ("pxor   xmm15, xmm4");
   asm ("pxor   xmm13, xmm12");
   asm ("pxor   xmm14, xmm13");
   asm ("pxor   xmm15, xmm14");

   /* F3 */
   asm ("pxor   xmm8,  xmm1");
   replace_aes(8,9, 6);
   replace_aes(8,10,7);
   replace_aes(8,2, 6);
   asm ("pxor   xmm0,  xmm8");
   /* F3 */
   asm ("pxor   xmm11, xmm0");
   replace_aes(11,12,6);
   replace_aes(11,13,7);
   replace_aes(11,2, 6);
   asm ("pxor   xmm1,  xmm11");

   /* key schedule */
   mixing();

   /* F3 */
   asm ("pxor   xmm14,  xmm1");
   replace_aes(14,15,6);
   replace_aes(14,8, 7);
   replace_aes(14,2, 6);
   asm ("pxor   xmm0,  xmm14");
   /* F3 */
   asm ("pxor   xmm9, xmm0");
   replace_aes(9,10,6);
   replace_aes(9,11,7);
   replace_aes(9,2, 6);
   asm ("pxor   xmm1,  xmm9");


   /* feedforward */
   asm ("pxor   xmm0,  [SHAVITE_PTXT]");
   asm ("pxor   xmm1,  [SHAVITE_PTXT+16]");
   asm ("movaps [SHAVITE_PTXT],    xmm0");
   asm ("movaps [SHAVITE_PTXT+16], xmm1");
   asm (".att_syntax noprefix");

   return;
}

void Compress256(const unsigned char *message_block, unsigned char *chaining_value, unsigned long long counter,
	      const unsigned char salt[32])
{    
   int i, j;
   for (i=0;i<8*4;i++)
      SHAVITE_PTXT[i]=chaining_value[i];
   
   for (i=0;i<16;i++)
      SHAVITE_MESS[i] = *((unsigned int*)(message_block+4*i));
   

   SHAVITE_CNTS[0] = (unsigned int)(counter & 0xFFFFFFFFULL);
   SHAVITE_CNTS[1] = (unsigned int)(counter>>32);
   /* encryption + Davies-Meyer transform */
   E256();

   for (i=0; i<4*8; i++)
       chaining_value[i]=SHAVITE_PTXT[i];


   return;
}
