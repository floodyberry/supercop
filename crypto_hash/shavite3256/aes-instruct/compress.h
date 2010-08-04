/* Modified (July 2010) by Eli Biham and Orr Dunkelman       * 
 * (applying the SHAvite-3 tweak) from:                      */

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

#define replace_aes(i, j, k){\
        asm ("pshufb xmm"tostr(i)", [SHAVITE_ENDI]");\
        asm ("pshufb xmm"tostr(j)", [SHAVITE_ENDI]");\
        asm ("aesenc  xmm"tostr(i)", xmm"tostr(j)"");\
        asm ("pshufb xmm"tostr(i)", [SHAVITE_ENDI]");\
        asm ("pshufb xmm"tostr(j)", [SHAVITE_ENDI]");\
}

#define swap_reg(j){\
        asm ("pshufb xmm"tostr(j)", [SHAVITE_ENDI]");\
}
#define swap_reg_and_reverse_0321(j){\
        asm ("pshufb xmm"tostr(j)", [SHAVITE_ENDIandREVERSE]");\
}
#define replace_aes_no_swaps(i, j){\
        asm ("aesenc xmm"tostr(i)", xmm"tostr(j)"");\
}

#define replace_aes_mem(i, MEM, j, k){\
        asm("aesenc  xmm"tostr(i)", "tostr(MEM)"");\
}

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
__attribute__ ((aligned (16))) unsigned char SHAVITE_PTXT[8*4];
__attribute__ ((aligned (16))) unsigned int SHAVITE_CNTS[4] = {0,0,0,0}; 
__attribute__ ((aligned (16))) unsigned int SHAVITE_ENDI[4] = {0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f };
__attribute__ ((aligned (16))) unsigned int SHAVITE_ENDIandREVERSE[4] = {0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x00010203 };
__attribute__ ((aligned (16))) unsigned int SHAVITE256_XOR2[4] = {0x0, 0xFFFFFFFF, 0x0, 0x0};
__attribute__ ((aligned (16))) unsigned int SHAVITE256_XOR3[4] = {0x0, 0x0, 0xFFFFFFFF, 0x0};
__attribute__ ((aligned (16))) unsigned int SHAVITE256_XOR4[4] = {0x0, 0x0, 0x0, 0xFFFFFFFF};
__attribute__ ((aligned (16))) unsigned char reg1[16]={0};
__attribute__ ((aligned (16))) unsigned char regs[16][16]={0};


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
   asm ("movaps xmm4, [SHAVITE256_XOR2]");
   asm ("pxor   xmm2,  xmm2");

   /* init key schedule */
   asm ("movaps xmm8,  [SHAVITE_MESS]");
   asm ("movaps xmm9,  [SHAVITE_MESS+16]");
   asm ("movaps xmm10, [SHAVITE_MESS+32]");
   asm ("movaps xmm11, [SHAVITE_MESS+48]");

   /* start key schedule */
   asm ("movaps xmm12, xmm8");
   asm ("movaps xmm13, xmm9");
   asm ("movaps xmm14, xmm10");
   asm ("movaps xmm15, xmm11");

   swap_reg_and_reverse_0321(12);
   swap_reg_and_reverse_0321(13);
   swap_reg_and_reverse_0321(14);
   swap_reg_and_reverse_0321(15);
   replace_aes_no_swaps(12, 2);
   swap_reg(12);
   replace_aes_no_swaps(13, 2);
   swap_reg(13);
   replace_aes_no_swaps(14, 2);
   swap_reg(14);
   replace_aes_no_swaps(15, 2);
   swap_reg(15);

   asm ("pxor   xmm12, xmm3");
   asm ("pxor   xmm12, xmm4");
   asm ("movaps xmm4, [SHAVITE256_XOR3]");
   asm ("pxor   xmm12, xmm11");
   asm ("pxor   xmm13, xmm12");
   asm ("pxor   xmm14, xmm13");
   asm ("pxor   xmm15, xmm14");

   /* F3 */
   asm ("movaps xmm6,  xmm8");
   asm ("pxor   xmm8,  xmm1");
   swap_reg(8);
   swap_reg(9);
   replace_aes_no_swaps(8, 9);
   swap_reg(9);
   swap_reg(10);
   replace_aes_no_swaps(8, 10);
   swap_reg(10);
   replace_aes_no_swaps(8, 2);
   swap_reg(8);
   asm ("pxor   xmm0,  xmm8");
   asm ("movaps xmm8,  xmm6");
   
   /* F3 */
   asm ("movaps xmm6,  xmm11");
   asm ("pxor   xmm11, xmm0");
   swap_reg(11);
   swap_reg(12);
   replace_aes_no_swaps(11, 12);
   swap_reg(12);
   swap_reg(13);
   replace_aes_no_swaps(11, 13);
   swap_reg(13);
   replace_aes_no_swaps(11, 2);
   swap_reg(11);
   asm ("pxor   xmm1,  xmm11");
   asm ("movaps xmm11,  xmm6");

   /* key schedule */
   mixing();

   /* F3 */
   asm ("movaps xmm6, xmm14");
   asm ("pxor   xmm14, xmm1");
   swap_reg(14);
   swap_reg(15);
   replace_aes_no_swaps(14, 15);
   swap_reg(15);
   swap_reg(8);
   replace_aes_no_swaps(14, 8);
   swap_reg(8);
   replace_aes_no_swaps(14, 2);
   swap_reg(14);
   asm ("pxor   xmm0,  xmm14");
   asm ("movaps xmm14,  xmm6");

   /* key schedule */
   asm ("pshufd xmm3,  xmm3,135");

   asm ("movaps xmm12, xmm8");
   asm ("movaps xmm13, xmm9");
   asm ("movaps xmm14, xmm10");
   asm ("movaps xmm15, xmm11");
   swap_reg_and_reverse_0321(12);
   swap_reg_and_reverse_0321(13);
   swap_reg_and_reverse_0321(14);
   swap_reg_and_reverse_0321(15);
   replace_aes_no_swaps(12, 2);
   swap_reg(12);
   replace_aes_no_swaps(13, 2);
   swap_reg(13);
   replace_aes_no_swaps(14, 2);
   swap_reg(14);
   replace_aes_no_swaps(15, 2);
   swap_reg(15);
   
   asm ("pxor   xmm12, xmm11");
   asm ("pxor   xmm14, xmm3");
   asm ("pxor   xmm14, xmm4");
   asm ("movaps xmm4, [SHAVITE256_XOR4]");
   asm ("pxor   xmm13, xmm12");
   asm ("pxor   xmm14, xmm13");
   asm ("pxor   xmm15, xmm14");

   /* F3 */
   asm ("movaps xmm6, xmm9");
   asm ("pxor   xmm9, xmm0");
   swap_reg(9);
   swap_reg(10);
   replace_aes_no_swaps(9, 10);
   swap_reg(10);
   swap_reg(11);
   replace_aes_no_swaps(9, 11);
   swap_reg(11);
   replace_aes_no_swaps(9, 2);
   swap_reg(9);
   asm ("pxor   xmm1,  xmm9");
   asm ("movaps xmm9,  xmm6");

   /* key schedule */
   mixing();

   /* F3 */
   asm ("movaps xmm6,  xmm12");
   asm ("pxor   xmm12,  xmm1");
   swap_reg(12);
   swap_reg(13);
   replace_aes_no_swaps(12, 13);
   swap_reg(13);
   swap_reg(14);
   replace_aes_no_swaps(12, 14);
   swap_reg(14);
   replace_aes_no_swaps(12, 2);
   swap_reg(12);
   asm ("pxor   xmm0,  xmm12");
   asm ("movaps xmm12,  xmm6");
   
   /* F3 */
   asm ("movaps xmm6,  xmm15");
   asm ("pxor   xmm15, xmm0");
   swap_reg(15);
   swap_reg(8);
   replace_aes_no_swaps(15, 8);
   swap_reg(8);
   swap_reg(9);
   replace_aes_no_swaps(15, 9);
   swap_reg(9);
   replace_aes_no_swaps(15, 2);
   swap_reg(15);
   asm ("pxor   xmm1,  xmm15");
   asm ("movaps xmm15,  xmm6");

   /* key schedule */
   asm ("pshufd xmm3,  xmm3, 147");

   asm ("movaps xmm12, xmm8");
   asm ("movaps xmm13, xmm9");
   asm ("movaps xmm14, xmm10");
   asm ("movaps xmm15, xmm11");
   swap_reg_and_reverse_0321(12);
   swap_reg_and_reverse_0321(13);
   swap_reg_and_reverse_0321(14);
   swap_reg_and_reverse_0321(15);
   replace_aes_no_swaps(12, 2);
   swap_reg(12);
   replace_aes_no_swaps(13, 2);
   swap_reg(13);
   replace_aes_no_swaps(14, 2);
   swap_reg(14);
   replace_aes_no_swaps(15, 2);
   swap_reg(15);
   asm ("pxor   xmm12, xmm11");
   asm ("pxor   xmm13, xmm3");
   asm ("pxor   xmm13, xmm4");
   asm ("pxor   xmm13, xmm12");
   asm ("pxor   xmm14, xmm13");
   asm ("pxor   xmm15, xmm14");

   /* F3 */
   asm ("movaps xmm6,  xmm10");
   asm ("pxor   xmm10,  xmm1");
   swap_reg(10);
   swap_reg(11);
   replace_aes_no_swaps(10, 11);
   swap_reg(11);
   swap_reg(12);
   replace_aes_no_swaps(10, 12);
   swap_reg(12);
   replace_aes_no_swaps(10, 2);
   swap_reg(10);
   asm ("pxor   xmm0,  xmm10");
   asm ("movaps xmm10,  xmm6");

   /* key schedule */
   mixing();

   asm ("movaps xmm6, xmm13");
   asm ("pxor   xmm13, xmm0");
   swap_reg(13);
   swap_reg(14);
   replace_aes_no_swaps(13, 14);
   swap_reg(14);
   swap_reg(15);
   replace_aes_no_swaps(13, 15);
   swap_reg(15);
   replace_aes_no_swaps(13, 2);
   swap_reg(13);
   asm ("pxor   xmm1,  xmm13");
   asm ("movaps xmm13,  xmm6");


   /* key schedule */
   asm ("pshufd xmm3,  xmm3, 135");

   asm ("movaps xmm12, xmm8");
   asm ("movaps xmm13, xmm9");
   asm ("movaps xmm14, xmm10");
   asm ("movaps xmm15, xmm11");
   swap_reg_and_reverse_0321(12);
   swap_reg_and_reverse_0321(13);
   swap_reg_and_reverse_0321(14);
   swap_reg_and_reverse_0321(15);
   replace_aes_no_swaps(12, 2);
   swap_reg(12);
   replace_aes_no_swaps(13, 2);
   swap_reg(13);
   replace_aes_no_swaps(14, 2);
   swap_reg(14);
   replace_aes_no_swaps(15, 2);
   swap_reg(15);
   asm ("pxor   xmm12, xmm11");
   asm ("pxor   xmm15, xmm3");
   asm ("pxor   xmm15, xmm4");
   asm ("pxor   xmm13, xmm12");
   asm ("pxor   xmm14, xmm13");
   asm ("pxor   xmm15, xmm14");

   /* F3 */
   asm ("movaps xmm6,  xmm8");
   asm ("pxor   xmm8,  xmm1");
   swap_reg(8);
   swap_reg(9);
   replace_aes_no_swaps(8, 9);
   swap_reg(9);
   swap_reg(10);
   replace_aes_no_swaps(8, 10);
   swap_reg(10);
   replace_aes_no_swaps(8, 2);
   swap_reg(8);
   asm ("pxor   xmm0,  xmm8");
   asm ("movaps xmm8,  xmm6");
   /* F3 */
   asm ("movaps xmm6,  xmm11");
   asm ("pxor   xmm11, xmm0");
   swap_reg(11);
   swap_reg(12);
   replace_aes_no_swaps(11, 12);
   swap_reg(12);
   swap_reg(13);
   replace_aes_no_swaps(11, 13);
   swap_reg(13);
   replace_aes_no_swaps(11, 2);
   swap_reg(11);
   asm ("pxor   xmm1,  xmm11");
   asm ("movaps xmm11,  xmm6");

   /* key schedule */
   mixing();

   /* F3 */
   asm ("movaps xmm6,  xmm14");
   asm ("pxor   xmm14,  xmm1");
   swap_reg(14);
   swap_reg(15);
   replace_aes_no_swaps(14, 15);
   swap_reg(15);
   swap_reg(8);
   replace_aes_no_swaps(14, 8);
   swap_reg(8);
   replace_aes_no_swaps(14, 2);
   swap_reg(14);
   asm ("pxor   xmm0,  xmm14");
   asm ("movaps xmm14,  xmm6");

   /* F3 */
   asm ("movaps xmm6,  xmm9");
   asm ("pxor   xmm9, xmm0");
   swap_reg(9);
   swap_reg(10);
   replace_aes_no_swaps(9, 10);
   swap_reg(10);
   swap_reg(11);
   replace_aes_no_swaps(9, 11);
   swap_reg(11);
   replace_aes_no_swaps(9, 2);
   swap_reg(9);
   asm ("pxor   xmm1,  xmm9");
   asm ("movaps xmm9,  xmm6");


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
