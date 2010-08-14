/* 2010.07.28 djb: convert from intel syntax to asm syntax */
/* 2010.07.28 djb: define WESTMERE and BAD */

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

__attribute__ ((aligned (16))) unsigned int SHAVITE_MESS[16];
__attribute__ ((aligned (16))) unsigned char  SHAVITE_PTXT[8*4];
__attribute__ ((aligned (16))) unsigned int SHAVITE_CNTS[4] = {0,0,0,0}; 
__attribute__ ((aligned (16))) unsigned int SHAVITE_ENDI[4] = {0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f };
__attribute__ ((aligned (16))) unsigned int SHAVITE_XOR2[4] = {0x0, 0xFFFFFFFF, 0x0, 0x0};
__attribute__ ((aligned (16))) unsigned int SHAVITE_XOR3[4] = {0x0, 0x0, 0xFFFFFFFF, 0x0};
__attribute__ ((aligned (16))) unsigned int SHAVITE_XOR4[4] = {0x0, 0x0, 0x0, 0xFFFFFFFF};


#define mixing() do {\
   asm("movaps %xmm15, %xmm11");\
   asm("movaps %xmm14, %xmm10");\
   asm("movaps %xmm13, %xmm9");\
   asm("movaps %xmm12, %xmm8");\
\
   asm("movaps %xmm11, %xmm6");\
   asm("psrldq $4, %xmm6");\
   asm("pxor %xmm6, %xmm8");\
   asm("movaps %xmm8, %xmm6");\
   asm("pslldq $12, %xmm6");\
   asm("pxor %xmm6, %xmm8");\
\
   asm("movaps %xmm8, %xmm7");\
   asm("psrldq $4, %xmm7");\
   asm("pxor %xmm7, %xmm9");\
   asm("movaps %xmm9, %xmm7");\
   asm("pslldq $12, %xmm7");\
   asm("pxor %xmm7, %xmm9");\
\
   asm("movaps %xmm9, %xmm6");\
   asm("psrldq $4, %xmm6");\
   asm("pxor %xmm6, %xmm10");\
   asm("movaps %xmm10, %xmm6");\
   asm("pslldq $12, %xmm6");\
   asm("pxor %xmm6, %xmm10");\
\
   asm("movaps %xmm10, %xmm7");\
   asm("psrldq $4, %xmm7");\
   asm("pxor %xmm7, %xmm11");\
   asm("movaps %xmm11, %xmm7");\
   asm("pslldq $12, %xmm7");\
   asm("pxor %xmm7, %xmm11");\
} while(0);

void E256()
{
   /* (L,R) = (xmm0,xmm1) */
   asm("movaps SHAVITE_PTXT, %xmm0");
   asm("movaps SHAVITE_PTXT+16, %xmm1");
   asm("movaps SHAVITE_CNTS, %xmm3");
   asm("movaps SHAVITE_XOR2, %xmm4");
   asm("pxor %xmm2, %xmm2");

   /* init key schedule */
   asm("movaps SHAVITE_MESS, %xmm8");
   asm("movaps SHAVITE_MESS+16, %xmm9");
   asm("movaps SHAVITE_MESS+32, %xmm10");
   asm("movaps SHAVITE_MESS+48, %xmm11");

   /* start key schedule */
   asm("pshufd $57, %xmm8, %xmm12");
   asm("pshufd $57, %xmm9, %xmm13");
   asm("pshufd $57, %xmm10, %xmm14");
   asm("pshufd $57, %xmm11, %xmm15");

   replace_aes(12,2,6);
   replace_aes(13,2,7);
   replace_aes(14,2,6);
   replace_aes(15,2,7);
   asm("pxor %xmm3, %xmm12");
   asm("pxor %xmm4, %xmm12");
   asm("movaps SHAVITE_XOR3, %xmm4");
   asm("pxor %xmm11, %xmm12");
   asm("pxor %xmm12, %xmm13");
   asm("pxor %xmm13, %xmm14");
   asm("pxor %xmm14, %xmm15");

   /* F3 */
   asm("pxor %xmm1, %xmm8");
   replace_aes(8,9, 6);
   replace_aes(8,10,7);
   replace_aes(8,2, 6);
   asm("pxor %xmm8, %xmm0");
   /* F3 */
   asm("pxor %xmm0, %xmm11");
   replace_aes(11,12,6);
   replace_aes(11,13,7);
   replace_aes(11,2, 6);
   asm("pxor %xmm11, %xmm1");

   /* key schedule */
   mixing();

   /* F3 */
   asm("pxor %xmm1, %xmm14");
   replace_aes(14,15,6);
   replace_aes(14,8, 7);
   replace_aes(14,2, 6);
   asm("pxor %xmm14, %xmm0");

   /* key schedule */
   asm("pshufd $135, %xmm3, %xmm3");
   asm("pshufd $57, %xmm8, %xmm12");
   asm("pshufd $57, %xmm9, %xmm13");
   asm("pshufd $57, %xmm10, %xmm14");
   asm("pshufd $57, %xmm11, %xmm15");

   replace_aes(12,2,6);
   replace_aes(13,2,7);
   replace_aes(14,2,6);
   replace_aes(15,2,7);
   asm("pxor %xmm11, %xmm12");
   asm("pxor %xmm3, %xmm14");
   asm("pxor %xmm4, %xmm14");
   asm("movaps SHAVITE_XOR4, %xmm4");
   asm("pxor %xmm12, %xmm13");
   asm("pxor %xmm13, %xmm14");
   asm("pxor %xmm14, %xmm15");

   /* F3 */
   asm("pxor %xmm0, %xmm9");
   replace_aes(9,10,6);
   replace_aes(9,11,7);
   replace_aes(9,2, 6);
   asm("pxor %xmm9, %xmm1");

   /* key schedule */
   mixing();

   /* F3 */
   asm("pxor %xmm1, %xmm12");
   replace_aes(12,13,6);
   replace_aes(12,14,7);
   replace_aes(12,2, 6);
   asm("pxor %xmm12, %xmm0");
   /* F3 */
   asm("pxor %xmm0, %xmm15");
   replace_aes(15,8, 6);
   replace_aes(15,9, 7);
   replace_aes(15,2, 6);
   asm("pxor %xmm15, %xmm1");

   /* key schedule */
   asm("pshufd $147, %xmm3, %xmm3");
   asm("pshufd $57, %xmm8, %xmm12");
   asm("pshufd $57, %xmm9, %xmm13");
   asm("pshufd $57, %xmm10, %xmm14");
   asm("pshufd $57, %xmm11, %xmm15");

   replace_aes(12,2,6);
   replace_aes(13,2,7);
   replace_aes(14,2,6);
   replace_aes(15,2,7);
   asm("pxor %xmm11, %xmm12");
   asm("pxor %xmm3, %xmm13");
   asm("pxor %xmm4, %xmm13");
   asm("pxor %xmm12, %xmm13");
   asm("pxor %xmm13, %xmm14");
   asm("pxor %xmm14, %xmm15");

   /* F3 */
   asm("pxor %xmm1, %xmm10");
   replace_aes(10,11,6);
   replace_aes(10,12,7);
   replace_aes(10,2, 6);
   asm("pxor %xmm10, %xmm0");

   /* key schedule */
   mixing();

   asm("pxor %xmm0, %xmm13");
   replace_aes(13,14,6);
   replace_aes(13,15,7);
   replace_aes(13,2, 6);
   asm("pxor %xmm13, %xmm1");


   /* key schedule */
   asm("pshufd $135, %xmm3, %xmm3");
   asm("pshufd $57, %xmm8, %xmm12");
   asm("pshufd $57, %xmm9, %xmm13");
   asm("pshufd $57, %xmm10, %xmm14");
   asm("pshufd $57, %xmm11, %xmm15");

   replace_aes(12,2,6);
   replace_aes(13,2,7);
   replace_aes(14,2,6);
   replace_aes(15,2,7);
   asm("pxor %xmm11, %xmm12");
   asm("pxor %xmm3, %xmm15");
   asm("pxor %xmm4, %xmm15");
   asm("pxor %xmm12, %xmm13");
   asm("pxor %xmm13, %xmm14");
   asm("pxor %xmm14, %xmm15");

   /* F3 */
   asm("pxor %xmm1, %xmm8");
   replace_aes(8,9, 6);
   replace_aes(8,10,7);
   replace_aes(8,2, 6);
   asm("pxor %xmm8, %xmm0");
   /* F3 */
   asm("pxor %xmm0, %xmm11");
   replace_aes(11,12,6);
   replace_aes(11,13,7);
   replace_aes(11,2, 6);
   asm("pxor %xmm11, %xmm1");

   /* key schedule */
   mixing();

   /* F3 */
   asm("pxor %xmm1, %xmm14");
   replace_aes(14,15,6);
   replace_aes(14,8, 7);
   replace_aes(14,2, 6);
   asm("pxor %xmm14, %xmm0");
   /* F3 */
   asm("pxor %xmm0, %xmm9");
   replace_aes(9,10,6);
   replace_aes(9,11,7);
   replace_aes(9,2, 6);
   asm("pxor %xmm9, %xmm1");


   /* feedforward */
   asm("pxor SHAVITE_PTXT, %xmm0");
   asm("pxor SHAVITE_PTXT+16, %xmm1");
   asm("movaps %xmm0, SHAVITE_PTXT");
   asm("movaps %xmm1, SHAVITE_PTXT+16");

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
