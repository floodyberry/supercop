/*
 * Kiasu= bitslice C Implementation
 *
 * Copyright 2014:
 *     Jeremy Jean <JJean@ntu.edu.sg>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 *
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include "kiasu.h"

/***************************************************************************/
/***                    COMPILER SPECIFIC DEFINITIONS                    ***/
/***************************************************************************/

/* Define standard sized integers                                          */
#if defined(_MSC_VER) && (_MSC_VER < 1600)
 typedef unsigned __int8  uint8_t;
 typedef unsigned __int32 uint32_t;
 typedef unsigned __int64 uint64_t;
 typedef          __int64 int64_t;
#else
#include <stdint.h>
#endif

/* How to force specific alignment, request inline, restrict pointers      */
#if __GNUC__
    #define GCC_VERSION (__GNUC__ * 10 + __GNUC_MINOR__)
    #define ALIGN(n) __attribute__ ((aligned(n)))
    #define inline __inline__
    #define restrict __restrict__
#elif _MSC_VER
    #define ALIGN(n) __declspec(align(n))
    #define inline __inline
    #define restrict __restrict
#elif __STDC_VERSION__ >= 199901L   /* C99: delete align, keep others      */
    #define ALIGN(n)
#else /* Not GNU/Microsoft/C99: delete alignment/inline/restrict uses.     */
    #define ALIGN(n)
    #define inline
    #define restrict
#endif

/* How to endian reverse a uint64_t                                        */
#if _MSC_VER
    #include <intrin.h>
#pragma intrinsic(_byteswap_uint64)
    #define bswap64(x) _byteswap_uint64(x)
#elif __GNUC__ && (GCC_VERSION >= 43)
    #define bswap64(x) __builtin_bswap64(x)
#else
    #define bswap32(x)                                              \
     ((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) |	\
      (((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))

 static inline uint64_t bswap64(uint64_t x) {
    union { uint64_t u64; uint32_t u32[2]; } in, out;
    in.u64 = x;
    out.u32[0] = bswap32(in.u32[1]);
    out.u32[1] = bswap32(in.u32[0]);
    return out.u64;
}
#endif

/***************************************************************************/
/* Derived configuration options - Adjust as needed                        */
/***************************************************************************/
#define USE_SSE2    ((__SSE2__ || (_M_IX86_FP>=2) || _M_X64) && !VECTORS_OFF)

/***************************************************************************/
/* Define blocks and operations -- Patch if incorrect on your compiler.    */
/***************************************************************************/

#if USE_SSE2
    #include <xmmintrin.h>              /* SSE instructions and _mm_malloc */
    #include <emmintrin.h>              /* SSE2 instructions               */
    typedef ALIGN(16) __m128i block;
    #define xor_block(x,y)        _mm_xor_si128(x,y)
    #define zero_block()          _mm_setzero_si128()
    #define store(p,x)    _mm_store_si128((__m128i *)(p), (x))

    #if __SSSE3__
        #include <tmmintrin.h>              /* SSSE3 instructions            */
    #endif


#define L0(i,tmpblock,ta,adp,b) {                                           \
    if((i)==0) {                                                            \
      (ta)[0]=zero_block();                                                 \
    } else {                                                                \
      (tmpblock)=_mm_loadu_si128((__m128i const*)&(adp)[(b)++]);            \
      _mm_store_si128((__m128i *)&(ta)[0], (tmpblock));                     \
    }                                                                       \
  }

#define L(i,count,tmpblock,ta,adp,b) {                                      \
    if((i)<(count)) {                                                       \
      (tmpblock)=_mm_loadu_si128((__m128i const*)&(adp)[(b)++]);            \
      _mm_store_si128((__m128i *)&(ta)[(i)], (tmpblock));                   \
    } else {                                                                \
      (ta)[(i)]=zero_block();                                               \
    }                                                                       \
  }


#endif

/***************************************************************************/
/***                DEFINITIONS OF TYPES USED IN KIASU=/=                ***/
/***************************************************************************/
typedef struct { ALIGN(16) uint32_t bs_key[11][32]; } AES_KEY;
typedef struct { ALIGN(16) uint32_t bs_tweak[32]; } AES_TWEAK;

/***************************************************************************/
/***                       ASSEMBLY PROTOTYPES                           ***/
/***************************************************************************/

/*
** Assembly function to generate the bitsliced subkeys
*/
void kasper_keysetup(AES_KEY *key,
                    const unsigned char *userKey);

/*
** Assembly function to generate the bitsliced tweak input
*/
void jean_tweaksetup(AES_TWEAK* allTweaks,
                     const unsigned char *tweak);

/*
** Assembly function that encrypts 8 blocks in parallel
** Original author: Emilia Kasper
** Modified by: Jeremy Jean (April 2014)
*/
void kasper_ecb_encrypt(AES_KEY* key,
                        const unsigned char* in,
                        unsigned char* out,
                        uint32_t blks,
                        AES_TWEAK* allTweaks);

/*
** Assembly function that decrypts 8 blocks in parallel
** Original author: Vinit Azad (from Emilia Kasper's work)
** Modified by: Jeremy Jean (April 2014)
*/
void jean_ecb_decrypt(AES_KEY* key,
                      const unsigned char* in,
                      unsigned char* out,
                      uint32_t blks,
                      AES_TWEAK* allTweaks);

/***************************************************************************/
/***                 C FUNCTIONS CALLING ASSEMBLY ONES                   ***/
/***************************************************************************/
void AES_set_encrypt_key(const unsigned char *userKey, AES_KEY *key) {
    kasper_keysetup(key, userKey);
}

void AES_set_tweak(const unsigned char *tweak, AES_TWEAK* allTweaks) {
    jean_tweaksetup(allTweaks, tweak);
}

/* The following encrypts ceil(nblks/8)*8 blocks */
#define AES_ecb_encrypt_blks(blks, nblks, key, allTweaks) 		\
    kasper_ecb_encrypt (key, (unsigned char *)(blks), (unsigned char *)(blks), nblks, allTweaks)

/* The following decrypts ceil(nblks/8)*8 blocks */
#define AES_ecb_decrypt_blks(blks, nblks, key, allTweaks)		\
    jean_ecb_decrypt (key, (unsigned char *)(blks), (unsigned char *)(blks), nblks, allTweaks)

#define BPI 8  /* Number of blocks in buffer per ECB call */

/***************************************************************************/
/***               CONSTANT DEFINITIONS USED IN THE MODE                 ***/
/***************************************************************************/

/* Define the three MSB of the tweak (that depend on the stage) */
#define MSB_AD               (0x2<<4)
#define MSB_AD_LAST_FULL     (0x6<<4)
#define MSB_AD_LAST_PARTIAL  (0x7<<4)
#define MSB_M_ONE_LEFT_UP    (0x0<<4)
#define MSB_M_ONE_LEFT_DOWN  (0x4<<4)
#define MSB_M_ONE_RIGHT_UP   (0x1<<4)
#define MSB_M_ONE_RIGHT_DOWN (0x5<<4)
#define MSB_M_UP             (0x0<<4)
#define MSB_M_DOWN           (0x4<<4)
#define MSB_M_LAST_AUTH      (0x1<<4)
#define MSB_M_LAST_CIPH      (0x5<<4)
#define MSB_XLS1             (0x8<<4)
#define MSB_XLS2             (0x9<<4)

/***************************************************************************/
/***                      FUNCTIONS USED IN THE MODE                     ***/
/***************************************************************************/

/*
** Modifiy the nonce part in the tweak value
*/
void set_nonce_in_tweak (uint8_t* tweak, const uint8_t* nonce) {
    tweak[0] = (tweak[0]&0xf0)     ^ (nonce[0] >> 4);
    tweak[1] = (nonce[0]&0xf) << 4 ^ (nonce[1] >> 4);
    tweak[4] = (nonce[1]&0xf) << 4 ^ (nonce[2] >> 4);
    tweak[5] = (nonce[2]&0xf) << 4 ^ (nonce[3] >> 4);
    tweak[8] = (nonce[3]&0xf) << 4 ;
}

/*
** Modifiy the block number in the tweak value
*/
void set_block_number_in_tweak (uint8_t* tweak, uint32_t block_no) {
    tweak[ 8] = ( (block_no >> 24) & 0x0f)  ^ (tweak[8] & 0xf0);
    tweak[ 9] = ( (block_no >> 16) & 0xff);
    tweak[12] = ( (block_no >>  8) & 0xff);
    tweak[13] = ( (block_no >>  0) & 0xff);
}

/*
** Modifiy the stage value in the tweak value
*/
void set_stage_in_tweak (uint8_t* tweak, uint8_t value) {
    tweak[0] = (tweak[0] & 0x0f) ^ value ;
}



/***************************************************************************/
/***                            DEBUG ONLY                               ***/
/***************************************************************************/

static void pbuf(void *p, unsigned len, const void *s) {
    unsigned i;
    if (s)
        printf("%s", (char *)s);
    for (i = 0; i < len; i++) {
        printf("%02x", (unsigned)(((unsigned char *)p)[i]));
        if(((i+1)%4)==0) printf(" ");
    }
    printf("\n");
}

void printBlock(block B) {

    ALIGN(16) char tag[16];
    *(block *)tag=B;
    pbuf(tag, 16, "");

}

/***************************************************************************/
/***                PADDING RELATED FUNCTIONS (XLS, MIX)                 ***/
/***************************************************************************/

/*
 ** Mix function used in XLS
 */
 void mix(const uint8_t* A, const uint8_t* B, const uint32_t s, uint8_t* Out1, uint8_t* Out2) {

    uint32_t i;
    uint8_t S[16];
    uint8_t rotS[16];

    for(i=0; i<s; i++) S[i] = A[i] ^ B[i];
        for(i=0; i<s; i++) {rotS[i] = S[i]<<1; rotS[i] ^= (S[(i+1)%s]>>7) & 0x1;}
            for(i=0; i<s; i++) {Out1[i] = A[i] ^ rotS[i]; Out2[i] = B[i] ^ rotS[i]; }
        }

/*
 **
 */
 size_t getUnpaddedLength(uint8_t* message) {
    int i;
    for(i=15;message[i]==0x00 && i>0;--i);
    if(message[i]==0x80) return i;
    else return -1;
}

/*
 ** XLS function used for padding, when message input has a length not a multiple of the block size
 */
 void XLS(const uint8_t isDirect,
   uint8_t message[],
   const uint32_t s,
   uint8_t* tweak,
   AES_KEY* encrypt_key,
   const uint32_t l,
   uint8_t* cipher) {

    uint8_t M1[16];
    uint8_t M2[16];
    uint8_t X1[16];
    uint8_t X1ns[16];
    uint8_t X1s[16];
    uint8_t Xp1ns[16];
    uint8_t Xp1s[16];
    uint8_t X2[16];
    uint8_t Xp1[16];
    uint8_t Y1[16];
    uint8_t Y1ns[16];
    uint8_t Y1s[16];
    uint8_t Yp1ns[16];
    uint8_t Yp1s[16];
    uint8_t Yp1[16];
    uint8_t C1[16];
    uint8_t C2[16];

    ALIGN(16) block ta[BPI];		 /* 8 blocks for parallel processing         */
    ALIGN(16) AES_TWEAK allTweaks;	 /* Contain the tweak value in bitslice form */
    ALIGN(16) const block* adp;		 /* Pointer to the blocks to process         */

    /* Prepare the inputs */
    memcpy (M1, message, 16);
    memcpy (M2, message+16, s);

    /* First round */
    set_stage_in_tweak (tweak, MSB_XLS1);
    set_block_number_in_tweak (tweak, (const uint32_t)(l&0xfffffff8));
    AES_set_tweak(tweak, &allTweaks);

    /* Prepare the input */
    adp=(block *)M1;
    ta[0] = adp[0];
    ta[1] = adp[0];
    ta[2] = adp[0];
    ta[3] = adp[0];
    ta[4] = adp[0];
    ta[5] = adp[0];
    ta[6] = adp[0];
    ta[7] = adp[0];

    /* bitslice AES on BPI=8 parallel blocks */
    if (isDirect) AES_ecb_encrypt_blks(ta, BPI, encrypt_key, &allTweaks);
    else 	      AES_ecb_decrypt_blks(ta, BPI, encrypt_key, &allTweaks);

    /* Copy the output */
    memcpy(X1, &ta[l&0x7], 16);

    memcpy (X1ns, X1  , 16-s);
    memcpy (X1s, X1+16-s, s);
    memcpy (Xp1ns, X1ns, 16-s);
    Xp1ns[16-s-1] ^= 1;
    mix (X1s, M2, s, Xp1s, X2);
    memcpy (Xp1, Xp1ns, 16-s);
    memcpy (Xp1+16-s, Xp1s, s);

    /* Second round */
    set_stage_in_tweak (tweak, MSB_XLS2);
    AES_set_tweak(tweak, &allTweaks);

    /* Prepare the input */
    adp=(block *)Xp1;
    ta[0] = adp[0];
    ta[1] = adp[0];
    ta[2] = adp[0];
    ta[3] = adp[0];
    ta[4] = adp[0];
    ta[5] = adp[0];
    ta[6] = adp[0];
    ta[7] = adp[0];

    /* bitslice AES on BPI=8 parallel blocks */
    if (isDirect) AES_ecb_encrypt_blks(ta, BPI, encrypt_key, &allTweaks);
    else 	        AES_ecb_decrypt_blks(ta, BPI, encrypt_key, &allTweaks);

    /* Copy the output */
    memcpy(Y1, &ta[l&0x7], 16);


    memcpy (Y1ns, Y1, 16-s);
    memcpy (Y1s, Y1+16-s, s);
    memcpy (Yp1ns, Y1ns, 16-s);
    Yp1ns[16-s-1] ^= 1;
    mix (Y1s, X2, s, Yp1s, C2);
    memcpy (Yp1, Yp1ns, 16-s);
    memcpy (Yp1+16-s, Yp1s, s);

    /* Third round */
    set_stage_in_tweak (tweak, MSB_XLS1);
    AES_set_tweak(tweak, &allTweaks);

    /* Prepare the input */
    adp=(block *)Yp1;
    ta[0] = adp[0];
    ta[1] = adp[0];
    ta[2] = adp[0];
    ta[3] = adp[0];
    ta[4] = adp[0];
    ta[5] = adp[0];
    ta[6] = adp[0];
    ta[7] = adp[0];

    /* bitslice AES on BPI=8 parallel blocks */
    if (isDirect) AES_ecb_encrypt_blks(ta, BPI, encrypt_key, &allTweaks);
    else 	      AES_ecb_decrypt_blks(ta, BPI, encrypt_key, &allTweaks);

    /* Copy the output */
    memcpy(C1, &ta[l&0x7], 16);

    /* Write the outputs */
    memcpy (cipher, C1, 16);
    memcpy (cipher+16, C2, s);

}

/***************************************************************************/
/***                            ENCRYPTION                               ***/
/***************************************************************************/

/*
 ** Kiasu Encryption function
 */
 void kiasu_aead_encrypt(const uint8_t *ad, size_t ad_len,
    const uint8_t *m, size_t m_len,
    const uint8_t *key,
    const uint8_t *nonce,
    uint8_t *c, size_t *c_len)
 {

    size_t i;
    size_t k;
    size_t b;                        /* number of blocks */
    size_t count;                    /* Counter of the number of significative blocks to process */
    uint8_t *p;                      /* Used for padding */
    ALIGN(16) AES_TWEAK allTweaks;   /* Contain the tweak value in bitslice form */
    ALIGN(16) AES_KEY encrypt_key;   /* Contain all the subkeys in bitslice form */
    ALIGN(16) block Auth;            /* Auth value during the mode */
    ALIGN(16) block Checksum;        /* Checksum on the plaintext blocks */
    ALIGN(16) block Final;           /* Intermediate value in the computations */
    ALIGN(16) block PaddedBlock;     /* Padded blocks if needed, otherwise the zero bock */
    ALIGN(16) block ta[BPI];         /* 8 blocks for parallel processing */
    ALIGN(16) const block* adp;      /* Pointer to the blocks to process */
    uint8_t tweak[16];	             /* The tweak value */
    uint8_t hasBeenPadded;           /* boolean flag which indicates whether the input has been padded */
    ALIGN(16) __m128i tmpblock;

    /*************************************************
     *
     *               Initialization
     *
     *************************************************/

    /* The initial block is at address ad */
    adp = (block *)ad;

    /* Initialize the tweak value */
    memset(tweak, 0, 16);

    /* Initialize the Auth value to zero */
    Auth=zero_block();

    /* Convert the master key into bitslice after KS */
    AES_set_encrypt_key(key, &encrypt_key);

    /* Put the nonce in the tweak */
    set_nonce_in_tweak(tweak, nonce);

    /* Boolean flag to decide whether the AD has been padded */
    hasBeenPadded=0;

    /*************************************************
    *
    *               Associated data
    *
    *************************************************/

    /* Put the stage in the tweak */
    set_stage_in_tweak(tweak, MSB_AD);

    /*
     * Handle associated data, at a rate of 8 blocks at a time.
     */
    for (i=0, b=0; 16*b+16 < ad_len; i+=BPI*16) {

        /* Count the number of effective blocks to encrypt in parallel */
        count=(ad_len-i-1)/16;
        count++;
        if(count>=BPI) count=BPI;

        set_block_number_in_tweak(tweak, i/16);
        AES_set_tweak(tweak, &allTweaks);

        L0(i     ,tmpblock,ta,adp,b);
        L(1,count,tmpblock,ta,adp,b);
        L(2,count,tmpblock,ta,adp,b);
        L(3,count,tmpblock,ta,adp,b);
        L(4,count,tmpblock,ta,adp,b);
        L(5,count,tmpblock,ta,adp,b);
        L(6,count,tmpblock,ta,adp,b);
        L(7,count,tmpblock,ta,adp,b);

        /* bitslice AES on BPI=8 parallel blocks */
        AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /* Accumulate the XOR in Auth */
        for (k=0; k<count; ++k) {
            Auth=xor_block(Auth, ta[k]);
        }

    } /* i,b */

    /* Last block if full and not empty */
    if (ad_len==16*(b+1)) {

        /* We have a new full block */
        b++;

        PaddedBlock=zero_block();
        memcpy(&PaddedBlock, ad+ad_len-16, 16);

        /* Update Auth value */
        Auth=xor_block(Auth, PaddedBlock);

    } else { /* If the last bytes have not been processed, because not a full block */

        /* Set the flag to indicate that we pad the associated data */
        hasBeenPadded=1;

        PaddedBlock=zero_block();
        memcpy(&PaddedBlock, ad+16*(ad_len/16), ad_len&0xf);

        p=(unsigned char*)&PaddedBlock;
        p+=ad_len&0xf;
        *p=0x80;

        /* Update Auth value */
        Auth=xor_block(Auth, PaddedBlock);
    }

    /*
     * We have encrypted at least 8 blocks with the above, and we have encrypted
     * a dummy zero block, that needs to be compensated in the Auth value
     */
    if(i) {

       /* Encrypt a dummy block of all zero to start counter from 1 in PMAC */
       set_stage_in_tweak(tweak, MSB_AD);
       set_block_number_in_tweak(tweak, 0);
       AES_set_tweak(tweak, &allTweaks);

       /* Zero the input blocks */
       ta[0]=zero_block();
       ta[1]=zero_block();
       ta[2]=zero_block();
       ta[3]=zero_block();
       ta[4]=zero_block();
       ta[5]=zero_block();
       ta[6]=zero_block();
       ta[7]=zero_block();
       AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

       /* XOR back to cancel */
       Auth=xor_block(Auth, ta[0]);
    }

    /*
     * Final BC call in the MAC computation on the Associated Data
     */
    if(hasBeenPadded) set_stage_in_tweak(tweak, MSB_AD_LAST_PARTIAL);
    else              set_stage_in_tweak(tweak, MSB_AD_LAST_FULL);

    set_block_number_in_tweak(tweak, (const uint32_t)(b&0xfffffff8));
    AES_set_tweak(tweak, &allTweaks);

    /* Perform encryption of the (padded) last block */
    ta[0] = Auth;
    ta[1] = Auth;
    ta[2] = Auth;
    ta[3] = Auth;
    ta[4] = Auth;
    ta[5] = Auth;
    ta[6] = Auth;
    ta[7] = Auth;

    /* bitslice AES on BPI=8 parallel blocks */
    AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

    /* Pick the correct encrypted block */
    Auth=ta[b&0x7];

    /*************************************************
     *
     *                   Message
     *
     *************************************************/

    /* The initial block is at address m */
    adp = (block *)m;

    /* Case where the message length is less than one full block */
    if (m_len < 16) {

        uint8_t tmp[16];

        /* Create the padded block with the bytes from the partial plaintext block */
        PaddedBlock=zero_block();
        memcpy(&PaddedBlock, m+16*(m_len/16), m_len&0xf);
        p=(unsigned char*)&PaddedBlock;
        p+=m_len&0xf;
        *p=0x80;

        /* Apply the first layer of AES on the block */
        ta[0] = PaddedBlock;
        ta[1] = PaddedBlock;
        ta[2] = PaddedBlock;
        ta[3] = PaddedBlock;
        ta[4] = PaddedBlock;
        ta[5] = PaddedBlock;
        ta[6] = PaddedBlock;
        ta[7] = PaddedBlock;

        /* Update the tweak value */
        set_block_number_in_tweak (tweak, 0);
        set_stage_in_tweak (tweak, MSB_M_UP);
        AES_set_tweak(tweak, &allTweaks);

        /* bitslice AES on the block */
        AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /* Update the Auth value */
        Auth=xor_block(Auth, ta[0]);

        /* Perform the second layer of encryption */
        ta[0] = Auth;
        ta[1] = Auth;
        ta[2] = Auth;
        ta[3] = Auth;
        ta[4] = Auth;
        ta[5] = Auth;
        ta[6] = Auth;
        ta[7] = Auth;

        /* Update the tweak value */
        set_stage_in_tweak (tweak, MSB_M_DOWN);
        AES_set_tweak(tweak, &allTweaks);

        /* bitslice AES on the block */
        AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /* Store the value, containing the partial ciphertext */
        Final=ta[0];

        /* We now encrypt the checksum, which equals the PaddedBlock */
        ta[0] = PaddedBlock;
        ta[1] = PaddedBlock;
        ta[2] = PaddedBlock;
        ta[3] = PaddedBlock;
        ta[4] = PaddedBlock;
        ta[5] = PaddedBlock;
        ta[6] = PaddedBlock;
        ta[7] = PaddedBlock;

        /* Update the tweak value */
        set_stage_in_tweak (tweak, MSB_M_ONE_RIGHT_UP);
        AES_set_tweak(tweak, &allTweaks);

        /* bitslice AES on the block */
        AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /* Update the Auth value */
        Auth=xor_block(Auth, ta[0]);

        /* Perform the second layer of encryption of the checksum */
        ta[0] = Auth;
        ta[1] = Auth;
        ta[2] = Auth;
        ta[3] = Auth;
        ta[4] = Auth;
        ta[5] = Auth;
        ta[6] = Auth;
        ta[7] = Auth;

        /* Update the tweak value */
        set_stage_in_tweak (tweak, MSB_M_ONE_RIGHT_DOWN);
        AES_set_tweak(tweak, &allTweaks);

        /* bitslice AES on the block */
        AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /* Use the tag splitting technique to get a lenght-preserving ciphertext */
        *(block *)tmp=Final;
        memcpy (c, tmp, m_len);
        memcpy (c+m_len, tmp+m_len, 16-m_len);

        *(block *)tmp=ta[0];
        memcpy (c+m_len+16-m_len, tmp, m_len);


        /* Update the size of the ciphertext (incl. tag) */
        *c_len=16+m_len;

        /* Quit the function */
        return ;
    }

    /* Initialize the Auth value at the beginning of PMAC */
    Checksum=zero_block();

    /*
     * Handle blocks of message, at a rate of 8 blocks at a time.
     */
    for (i=0, b=0; i <= m_len; i+=BPI*16) {

        /* Count the number of effective blocks that remains to encrypt in parallel */
        count=(m_len-i)/16;
        count++;
        if(count>=BPI) count=BPI;

        /* Update the tweak */
        set_stage_in_tweak(tweak, MSB_M_UP);
        set_block_number_in_tweak(tweak, i/16);
        AES_set_tweak(tweak, &allTweaks);

        L0(i     ,tmpblock,ta,adp,b);
        L(1,count,tmpblock,ta,adp,b);
        L(2,count,tmpblock,ta,adp,b);
        L(3,count,tmpblock,ta,adp,b);
        L(4,count,tmpblock,ta,adp,b);
        L(5,count,tmpblock,ta,adp,b);
        L(6,count,tmpblock,ta,adp,b);
        L(7,count,tmpblock,ta,adp,b);

        /* Accumulate the XOR of input blocks in the Checksum  */
        for (k=0; k<count; ++k) {
            Checksum=xor_block(Checksum, ta[k]);
        }

        /* bitslice AES on BPI=8 parallel blocks */
        AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /*
         * Now apply the second row of encryption
         */

        /* Put the stage in the tweak */
        set_stage_in_tweak(tweak, MSB_M_DOWN);
        AES_set_tweak(tweak, &allTweaks);

        /* Prepare the input blocks */
        if(i==0) ta[0] = zero_block();
        else     ta[0] = Auth = xor_block(Auth, ta[0]);
        ta[1] = (1<count)?(Auth=xor_block(Auth, ta[1])):zero_block();
        ta[2] = (2<count)?(Auth=xor_block(Auth, ta[2])):zero_block();
        ta[3] = (3<count)?(Auth=xor_block(Auth, ta[3])):zero_block();
        ta[4] = (4<count)?(Auth=xor_block(Auth, ta[4])):zero_block();
        ta[5] = (5<count)?(Auth=xor_block(Auth, ta[5])):zero_block();
        ta[6] = (6<count)?(Auth=xor_block(Auth, ta[6])):zero_block();
        ta[7] = (7<count)?(Auth=xor_block(Auth, ta[7])):zero_block();

        /* bitslice AES on BPI=8 parallel blocks */
        AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /* Write the ciphertext blocks */
        if(i==0) 	for (k=1; k<count; ++k) store(c+i+16*(k-1), ta[k]);
        else		for (k=0; k<count; ++k) store(c+16*k+i-16, ta[k]);

    } /* i,j,b */

    /*************************************************
     *
     *                Produce the tag
     *
     *************************************************/

    ta[0] = Checksum;
    ta[1] = Checksum;
    ta[2] = Checksum;
    ta[3] = Checksum;
    ta[4] = Checksum;
    ta[5] = Checksum;
    ta[6] = Checksum;
    ta[7] = Checksum;

    /* Compute the encryption for all possible 3 lsb tweak values */
    set_stage_in_tweak(tweak, MSB_M_ONE_RIGHT_UP);
    set_block_number_in_tweak(tweak, (const uint32_t)(b&0xfffffff8));
    AES_set_tweak(tweak, &allTweaks);

    /* bitslice AES on the Checksum */
    AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

    /* Select the correct tweak value from the 3 LSBs */
    Checksum=xor_block(ta[b&0x7], Auth);

    /* Apply the second layer of AES on the checksum to reach the tag value */
    ta[0] = Checksum;
    ta[1] = Checksum;
    ta[2] = Checksum;
    ta[3] = Checksum;
    ta[4] = Checksum;
    ta[5] = Checksum;
    ta[6] = Checksum;
    ta[7] = Checksum;

    /* Compute the encryption for all possible 3 lsb tweak values */
    set_stage_in_tweak(tweak, MSB_M_ONE_RIGHT_DOWN);
    AES_set_tweak(tweak, &allTweaks);

    /* bitslice AES on the Checksum */
    AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

    /* Select the correct tweak value from the 3 LSBs to get the Final value */
    Final=ta[b&0x7];

    /* If the last message block is incomplete, we call XLS */
    if (m_len>16*b) {

        uint32_t s;
        uint8_t XLSin[32];
        uint8_t XLSout[32];

        /* s denotes the number of bytes in the last partial block */
        s=m_len-16*b;

        /* Prepare the input to XLS */
        memcpy(XLSin, m+16*b, s);
        memcpy(XLSin+s, &Final, 16);

        /* Call XLS */
        XLS (1, XLSin, s, tweak, &encrypt_key, b, XLSout);

        /* Write the ciphertext */
        memcpy (c+16*b, XLSout, s);

        /* and append the tag to it */
        memcpy (c+m_len, XLSout+s, 16);


    } else {

        /* If the last block is full, simply append the Final value (tag) to the ciphertext */
        memcpy(c+m_len, &Final, 16);

    } /* full blocks, or XLS padding */

    /* Update the ciphertext length (16-byte tag appended at the end of the actual ciphertext) */
    *c_len=16+m_len;

} /* kiasu encryption */


/***************************************************************************/
/***                             DECRYPTION                              ***/
/***************************************************************************/


/*
 ** Kiasu Decryption function
 */

 int  kiasu_aead_decrypt(const uint8_t *ad, size_t ad_len,
    uint8_t *m, size_t *m_len,
    const uint8_t *key,
    const uint8_t *nonce,
    const uint8_t *c, size_t c_len)
 {


    size_t i;
    size_t k;
    size_t b;                        /* number of blocks */
    size_t count;                    /* Counter of the number of significative blocks to process */
    uint8_t *p;                      /* Used for padding */
    ALIGN(16) AES_TWEAK allTweaks;   /* Contain the tweak value in bitslice form */
    ALIGN(16) AES_KEY encrypt_key;   /* Contain all the subkeys in bitslice form */
    ALIGN(16) block Auth;            /* Auth value during the mode */
    ALIGN(16) block Checksum;        /* Checksum on the plaintext blocks */
    ALIGN(16) block Final;           /* Intermediate value in the computations */
    ALIGN(16) block PaddedBlock;     /* Padded blocks if needed, otherwise the zero bock */
    ALIGN(16) block Temp;            /* Temp block used for decryption */
    ALIGN(16) block ta[BPI];         /* 8 blocks for parallel processing */
    ALIGN(16) const block* adp;      /* Pointer to the blocks to process */
    uint8_t tweak[16];               /* The tweak value */
    uint8_t hasBeenPadded;           /* boolean flag which indicates whether the input has been padded */
    ALIGN(16) __m128i tmpblock;

    /*************************************************
    *
    *               Initialization
    *
    *************************************************/

    /* The initial block is at address ad */
    adp = (block *)ad;

    /* Initialize the tweak value */
    memset(tweak, 0, 16);

    /* Initialize the Auth value to zero */
    Auth=zero_block();

    /* Convert the master key into bitslice after KS */
    AES_set_encrypt_key(key, &encrypt_key);

    /* Put the nonce in the tweak */
    set_nonce_in_tweak(tweak, nonce);

    /* Boolean flag to decide whether the AD has been padded */
    hasBeenPadded=0;

    /*************************************************
    *
    *               Associated data
    *
    *************************************************/

    /* Put the stage in the tweak */
    set_stage_in_tweak(tweak, MSB_AD);

    /*
     * Handle associated data, at a rate of 8 blocks at a time.
     */
    for (i=0, b=0; 16*b+16 < ad_len; i+=BPI*16) {

        /* Count the number of effective blocks to encrypt in parallel */
        count=(ad_len-i-1)/16;
        count++;
        if(count>=BPI) count=BPI;

        set_block_number_in_tweak(tweak, i/16);
        AES_set_tweak(tweak, &allTweaks);

        L0(i     ,tmpblock,ta,adp,b);
        L(1,count,tmpblock,ta,adp,b);
        L(2,count,tmpblock,ta,adp,b);
        L(3,count,tmpblock,ta,adp,b);
        L(4,count,tmpblock,ta,adp,b);
        L(5,count,tmpblock,ta,adp,b);
        L(6,count,tmpblock,ta,adp,b);
        L(7,count,tmpblock,ta,adp,b);

        /* bitslice AES on BPI=8 parallel blocks */
        AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /* Accumulate the XOR in Auth */
        for (k=0; k<count; ++k) {
            Auth=xor_block(Auth, ta[k]);
        }

    } /* i,b */

    /* Last block if full and not empty */
    if (ad_len==16*(b+1)) {

        /* We have a new full block */
        b++;

        PaddedBlock=zero_block();
        memcpy(&PaddedBlock, ad+ad_len-16, 16);

        /* Update Auth value */
        Auth=xor_block(Auth, PaddedBlock);

    } else { /* If the last bytes have not been processed, because not a full block */

        /* Set the flag to indicate that we pad the associated data */
        hasBeenPadded=1;

        PaddedBlock=zero_block();
        memcpy(&PaddedBlock, ad+16*(ad_len/16), ad_len&0xf);

        p=(unsigned char*)&PaddedBlock;
        p+=ad_len&0xf;
        *p=0x80;

        /* Update Auth value */
        Auth=xor_block(Auth, PaddedBlock);
    }


    /*
     * We have encrypted at least 8 blocks with the above, and we have encrypted
     * a dummy zero block, that needs to be compensated in the Auth value
     */
    if(i) {

       /* Encrypt a dummy block of all zero to start counter from 1 in PMAC */
       set_stage_in_tweak(tweak, MSB_AD);
       set_block_number_in_tweak(tweak, 0);
       AES_set_tweak(tweak, &allTweaks);

       /* Zero the input blocks */
       ta[0]=zero_block();
       ta[1]=zero_block();
       ta[2]=zero_block();
       ta[3]=zero_block();
       ta[4]=zero_block();
       ta[5]=zero_block();
       ta[6]=zero_block();
       ta[7]=zero_block();
       AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

       /* XOR back to cancel */
       Auth=xor_block(Auth, ta[0]);
    }

    /*
     * Final BC call in the MAC computation on the Associated Data
     */
    if(hasBeenPadded) set_stage_in_tweak(tweak, MSB_AD_LAST_PARTIAL);
    else              set_stage_in_tweak(tweak, MSB_AD_LAST_FULL);

    set_block_number_in_tweak(tweak, (const uint32_t)(b&0xfffffff8));
    AES_set_tweak(tweak, &allTweaks);

    /* Perform encryption of the (padded) last block */
    ta[0] = Auth;
    ta[1] = Auth;
    ta[2] = Auth;
    ta[3] = Auth;
    ta[4] = Auth;
    ta[5] = Auth;
    ta[6] = Auth;
    ta[7] = Auth;

    /* bitslice AES on BPI=8 parallel blocks */
    AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

    /* Pick the correct encrypted block */
    Auth=ta[b&0x7];

    /*************************************************
     *
     *                  Ciphertext
     *
     *************************************************/

    /* The initial block is at address c */
    adp = (block *)c;

    /* Case where the actual ciphertext length is less than one full block */
    if (c_len-16 < 16) {

        /* Decrypt the block */
        set_block_number_in_tweak (tweak, 0);
        set_stage_in_tweak (tweak, MSB_M_ONE_LEFT_DOWN);
        AES_set_tweak(tweak, &allTweaks);

        /* Apply the first layer of AES on the block */
        tmpblock=_mm_loadu_si128((__m128i const*)&adp[0]);
        _mm_store_si128((__m128i *)&ta[0], tmpblock);
        ta[0] = adp[0];
        ta[1] = ta[0];
        ta[2] = ta[0];
        ta[3] = ta[0];
        ta[4] = ta[0];
        ta[5] = ta[0];
        ta[6] = ta[0];
        ta[7] = ta[0];

        /* bitslice AES on the block */
        AES_ecb_decrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /* Update the Auth value */
        Temp=xor_block(Auth, ta[0]);
        Auth=ta[0];

        /* Decrypt again to get the message block */
        set_stage_in_tweak (tweak, MSB_M_ONE_LEFT_UP);
        AES_set_tweak(tweak, &allTweaks);

        /* Prepare the input data */
        ta[0] = Temp;
        ta[1] = Temp;
        ta[2] = Temp;
        ta[3] = Temp;
        ta[4] = Temp;
        ta[5] = Temp;
        ta[6] = Temp;
        ta[7] = Temp;

        /* bitslice AES on the block */
        AES_ecb_decrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /* First check on the n-bit tag condition: the plaintext must be c_len-16 bytes long */
        if((c_len-16) != getUnpaddedLength((uint8_t*)&ta[0])) return -1;

        /* Write the plaintext */
        memcpy(m, &ta[0], c_len-16);

        /* Update the plaintext length by removing the size of tag from c_len */
        *m_len=c_len-16; 

        /* Encrypt the checksum */
        set_stage_in_tweak (tweak, MSB_M_ONE_RIGHT_UP);
        AES_set_tweak(tweak, &allTweaks);

        /* Prepare the input data */
        ta[0] = ta[0];
        ta[1] = ta[0];
        ta[2] = ta[0];
        ta[3] = ta[0];
        ta[4] = ta[0];
        ta[5] = ta[0];
        ta[6] = ta[0];
        ta[7] = ta[0];
        
        /* bitslice AES on the block */
        AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /* Update the Auth value */
        Auth=xor_block(Auth, ta[0]);

        /* Check the remaining of the tag */
        set_stage_in_tweak (tweak, MSB_M_ONE_RIGHT_DOWN);
        AES_set_tweak(tweak, &allTweaks);

        /* Prepare the input data */
        ta[0] = Auth;
        ta[1] = Auth;
        ta[2] = Auth;
        ta[3] = Auth;
        ta[4] = Auth;
        ta[5] = Auth;
        ta[6] = Auth;
        ta[7] = Auth;

        /* bitslice AES on the block */
        AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /* Check the remaining of the tag */
        if(0 != memcmp(c+16, &ta[0], *m_len)) return -1;

        /* If the tag is valid, then quit the function, and the plaintext is returned */
        return 0;

    }

    /* Any length */

    /* Update the size of the plaintext */
    *m_len=c_len-16;


    /* Initialize the Auth value at the beginning of PMAC */
    Checksum=zero_block();

    /*
     * Handle blocks of message, at a rate of 8 blocks at a time.
     */
    for (i=0, b=0; i <= *m_len; i+=BPI*16) {

        /* Count the number of effective blocks that remains to encrypt in parallel */
        count=(*m_len-i)/16;
        count++;
        if(count>=BPI) count=BPI;

        /* Update the tweak */
        set_stage_in_tweak(tweak, MSB_M_DOWN);
        set_block_number_in_tweak(tweak, i/16);
        AES_set_tweak(tweak, &allTweaks);

        L0(i     ,tmpblock,ta,adp,b);
        L(1,count,tmpblock,ta,adp,b);
        L(2,count,tmpblock,ta,adp,b);
        L(3,count,tmpblock,ta,adp,b);
        L(4,count,tmpblock,ta,adp,b);
        L(5,count,tmpblock,ta,adp,b);
        L(6,count,tmpblock,ta,adp,b);
        L(7,count,tmpblock,ta,adp,b);

        /* bitslice AES on BPI=8 parallel blocks */
        AES_ecb_decrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /*
         * Now apply the second row of encryption
         */

        /* Put the stage in the tweak */
        set_stage_in_tweak(tweak, MSB_M_UP);
        AES_set_tweak(tweak, &allTweaks);

        /* Prepare the input blocks */
        if(i==0) {
            ta[0] = zero_block();
        } else {
            ta[0]=xor_block(Auth, ta[0]);
            Auth =xor_block(Auth, ta[0]);
        }

        if (1<count) {
            ta[1]=xor_block(Auth, ta[1]);
            Auth =xor_block(Auth, ta[1]);
        } else {
            ta[1]=zero_block();
        }

        if (2<count) {
            ta[2]=xor_block(Auth, ta[2]);
            Auth =xor_block(Auth, ta[2]);
        } else {
            ta[2]=zero_block();
        }

        if (3<count) {
            ta[3]=xor_block(Auth, ta[3]);
            Auth =xor_block(Auth, ta[3]);
        } else {
            ta[3]=zero_block();
        }

        if (4<count) {
            ta[4]=xor_block(Auth, ta[4]);
            Auth =xor_block(Auth, ta[4]);
        } else {
            ta[4]=zero_block();
        }

        if (5<count) {
            ta[5]=xor_block(Auth, ta[5]);
            Auth =xor_block(Auth, ta[5]);
        } else {
            ta[5]=zero_block();
        }

        if (6<count) {
            ta[6]=xor_block(Auth, ta[6]);
            Auth =xor_block(Auth, ta[6]);
        } else {
            ta[6]=zero_block();
        }

        if (7<count) {
            ta[7]=xor_block(Auth, ta[7]);
            Auth =xor_block(Auth, ta[7]);
        } else {
            ta[7]=zero_block();
        }

        /* bitslice AES on BPI=8 parallel blocks */
        AES_ecb_decrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

        /* Accumulate the XOR of input blocks in the Checksum,  */
        /* and write the ciphertext blocks                      */
        if(i==0){
            for (k=1; k<count; ++k) {
                store(m+i+16*(k-1), ta[k]);
                Checksum=xor_block(Checksum, ta[k]);
            }
        } else{
            for (k=0; k<count; ++k) {
                store(m+i+16*k-16, ta[k]);
                Checksum=xor_block(Checksum, ta[k]);
            }
        }

    } /* i,j,b */


    
    /*************************************************
    *
    *               Check the tag
    *
    *************************************************/


    /* Prepare the input data */
    ta[0] = Checksum;
    ta[1] = Checksum;
    ta[2] = Checksum;
    ta[3] = Checksum;
    ta[4] = Checksum;
    ta[5] = Checksum;
    ta[6] = Checksum;
    ta[7] = Checksum;

    /* Encryption for all possible 3 lsb tweak values */
    set_stage_in_tweak(tweak, MSB_M_ONE_RIGHT_UP);
    set_block_number_in_tweak(tweak, (const uint32_t)(b&0xfffffff8));
    AES_set_tweak(tweak, &allTweaks);

    /* bitslice AES on the Checksum */
    AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

    /* Select the correct tweak value from the 3 LSBs */
    Checksum=xor_block(ta[b&0x7], Auth);

    /* Apply the second layer of AES on the checksum to reach the tag value */
    ta[0] = Checksum;
    ta[1] = Checksum;
    ta[2] = Checksum;
    ta[3] = Checksum;
    ta[4] = Checksum;
    ta[5] = Checksum;
    ta[6] = Checksum;
    ta[7] = Checksum;

    /* Compute the encryption for all possible 3 lsb tweak values */
    set_stage_in_tweak(tweak, MSB_M_ONE_RIGHT_DOWN);
    AES_set_tweak(tweak, &allTweaks);

    /* bitslice AES on the Checksum */
    AES_ecb_encrypt_blks(ta, BPI, &encrypt_key, &allTweaks);

    /* Select the correct tweak value from the 3 LSBs to get the Final value */
    Final=ta[b&0x7];

    /* If the last message block is incomplete, we call XLS */
    if (*m_len>16*b) {

        uint32_t s;
        uint8_t XLSin[32];
        uint8_t XLSout[32];

        /* s denotes the number of bytes in the last partial block */
        s=*m_len-16*b;

        /* Prepare the input to XLS */
        memcpy(XLSin, c+16*b, s); /* copy the s-byte partial block */
        memcpy(XLSin+c_len-16-16*b, c+c_len-16, 16); /* append tag */

        /* Call the inverse of XLS */
        XLS (0, XLSin, s, tweak, &encrypt_key, b, XLSout);

        /* Check the Final value */
        if(0!=memcmp(&Final, XLSout+s, 16)) return -1;

        /* Write the ciphertext */
        memcpy (m+*m_len-s, XLSout, s);

    } else {

        /* If the tag does not match, return error */
        if(0!=memcmp(&Final, c+*m_len, 16)) return -1;

    } /* full blocks, or XLS padding */

    return 0;
}

