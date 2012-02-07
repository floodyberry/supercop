#include <stddef.h> /* size_t */
#include <string.h> /* memcpy, memset */
#include "crypto_uint8.h"
typedef crypto_uint8 uint8;
#include "crypto_uint64.h"
typedef crypto_uint64 uint64;
#include "crypto_hash.h"

#define MK_64(hi32,lo32)  ((lo32) + (((uint64) (hi32)) << 32))

#define RotL_64(x,N)    (((x) << (N)) | ((x) >> (64-(N))))

#define SKEIN_VERSION           (1)
#define SKEIN_ID_STRING_LE      (0x33414853)
#define SKEIN_SCHEMA_VER        MK_64(SKEIN_VERSION,SKEIN_ID_STRING_LE)
#define SKEIN_KS_PARITY         MK_64(0x1BD11BDA,0xA9FC1A22)

static const uint64 IV[] = {
    MK_64(0xCCD044A1,0x2FDB3E13),
    MK_64(0xE8359030,0x1A79A9EB),
    MK_64(0x55AEA061,0x4F816E6F),
    MK_64(0x2A2767A4,0xAE9B94DB),
    MK_64(0xEC06025E,0x74DD7683),
    MK_64(0xE7A436CD,0xC4746251),
    MK_64(0xC36FBAF9,0x393AD185),
    MK_64(0x3EEDBA18,0x33EDFC13)
};

static void    Skein_Get64_LSB_First(uint64 *dst,const uint8 *src,size_t wCnt) {
    size_t n;

    for (n=0;n<8*wCnt;n+=8)
        dst[n/8] = (((uint64) src[n  ])      ) +
                   (((uint64) src[n+1]) <<  8) +
                   (((uint64) src[n+2]) << 16) +
                   (((uint64) src[n+3]) << 24) +
                   (((uint64) src[n+4]) << 32) +
                   (((uint64) src[n+5]) << 40) +
                   (((uint64) src[n+6]) << 48) +
                   (((uint64) src[n+7]) << 56) ;
}

static void    Skein_Put64_LSB_First(uint8 *dst,const uint64 *src,size_t bCnt) {
    size_t n;

    for (n=0;n<bCnt;n++)
        dst[n] = (uint8) (src[n>>3] >> (8*(n&7)));
}

enum {
    R_512_0_0=46, R_512_0_1=36, R_512_0_2=19, R_512_0_3=37,
    R_512_1_0=33, R_512_1_1=27, R_512_1_2=14, R_512_1_3=42,
    R_512_2_0=17, R_512_2_1=49, R_512_2_2=36, R_512_2_3=39,
    R_512_3_0=44, R_512_3_1= 9, R_512_3_2=54, R_512_3_3=56,
    R_512_4_0=39, R_512_4_1=30, R_512_4_2=34, R_512_4_3=24,
    R_512_5_0=13, R_512_5_1=50, R_512_5_2=10, R_512_5_3=17,
    R_512_6_0=25, R_512_6_1=29, R_512_6_2=39, R_512_6_3=43,
    R_512_7_0= 8, R_512_7_1=35, R_512_7_2=56, R_512_7_3=22,
};

typedef struct {
    uint64  T[2];         /* tweak words: T[0]=byte cnt, T[1]=flags */
    uint64  X[8];        /* chaining variables */
    uint8  b[64];        /* partial block buffer (8-byte aligned) */
} Skein_512_Ctxt_t;

#define KW_TWK_BASE     (0)
#define KW_KEY_BASE     (3)
#define ks              (kw + KW_KEY_BASE)                
#define ts              (kw + KW_TWK_BASE)

static void Skein_512_Process_Block(Skein_512_Ctxt_t *ctx,const uint8 *blkPtr,size_t blkCnt,size_t byteCntAdd)
{
    uint64  kw[12];                         /* key schedule words : chaining vars + tweak */
    uint64  X0,X1,X2,X3,X4,X5,X6,X7;        /* local copy of vars, for speed */
    uint64  w[8];                          /* local copy of input block */

    ts[0] = ctx->T[0];
    ts[1] = ctx->T[1];
    do {
        ts[0] += byteCntAdd;

        ks[0] = ctx->X[0];
        ks[1] = ctx->X[1];
        ks[2] = ctx->X[2];
        ks[3] = ctx->X[3];
        ks[4] = ctx->X[4];
        ks[5] = ctx->X[5];
        ks[6] = ctx->X[6];
        ks[7] = ctx->X[7];
        ks[8] = ks[0] ^ ks[1] ^ ks[2] ^ ks[3] ^ 
                ks[4] ^ ks[5] ^ ks[6] ^ ks[7] ^ SKEIN_KS_PARITY;

        ts[2] = ts[0] ^ ts[1];

        Skein_Get64_LSB_First(w,blkPtr,8);

        X0   = w[0] + ks[0];
        X1   = w[1] + ks[1];
        X2   = w[2] + ks[2];
        X3   = w[3] + ks[3];
        X4   = w[4] + ks[4];
        X5   = w[5] + ks[5] + ts[0];
        X6   = w[6] + ks[6] + ts[1];
        X7   = w[7] + ks[7];

        blkPtr += 64;

#define R512(p0,p1,p2,p3,p4,p5,p6,p7,ROT,rNum)                      \
    X##p0 += X##p1; X##p1 = RotL_64(X##p1,ROT##_0); X##p1 ^= X##p0; \
    X##p2 += X##p3; X##p3 = RotL_64(X##p3,ROT##_1); X##p3 ^= X##p2; \
    X##p4 += X##p5; X##p5 = RotL_64(X##p5,ROT##_2); X##p5 ^= X##p4; \
    X##p6 += X##p7; X##p7 = RotL_64(X##p7,ROT##_3); X##p7 ^= X##p6; \

#define I512(R)                                                     \
    X0   += ks[((R)+1) % 9];   /* inject the key schedule value */  \
    X1   += ks[((R)+2) % 9];                                        \
    X2   += ks[((R)+3) % 9];                                        \
    X3   += ks[((R)+4) % 9];                                        \
    X4   += ks[((R)+5) % 9];                                        \
    X5   += ks[((R)+6) % 9] + ts[((R)+1) % 3];                      \
    X6   += ks[((R)+7) % 9] + ts[((R)+2) % 3];                      \
    X7   += ks[((R)+8) % 9] +     (R)+1;                            \

#define R512_8_rounds(R) \
        R512(0,1,2,3,4,5,6,7,R_512_0,8*(R)+ 1);   \
        R512(2,1,4,7,6,5,0,3,R_512_1,8*(R)+ 2);   \
        R512(4,1,6,3,0,5,2,7,R_512_2,8*(R)+ 3);   \
        R512(6,1,0,7,2,5,4,3,R_512_3,8*(R)+ 4);   \
        I512(2*(R));                              \
        R512(0,1,2,3,4,5,6,7,R_512_4,8*(R)+ 5);   \
        R512(2,1,4,7,6,5,0,3,R_512_5,8*(R)+ 6);   \
        R512(4,1,6,3,0,5,2,7,R_512_6,8*(R)+ 7);   \
        R512(6,1,0,7,2,5,4,3,R_512_7,8*(R)+ 8);   \
        I512(2*(R)+1);

        R512_8_rounds( 0);
        R512_8_rounds( 1);
        R512_8_rounds( 2);
        R512_8_rounds( 3);
        R512_8_rounds( 4);
        R512_8_rounds( 5);
        R512_8_rounds( 6);
        R512_8_rounds( 7);
        R512_8_rounds( 8);

        ctx->X[0] = X0 ^ w[0];
        ctx->X[1] = X1 ^ w[1];
        ctx->X[2] = X2 ^ w[2];
        ctx->X[3] = X3 ^ w[3];
        ctx->X[4] = X4 ^ w[4];
        ctx->X[5] = X5 ^ w[5];
        ctx->X[6] = X6 ^ w[6];
        ctx->X[7] = X7 ^ w[7];

        ts[1] &= ~(((uint64)  64 ) << 56);
    } while (--blkCnt);
    ctx->T[0] = ts[0];
    ctx->T[1] = ts[1];
}


int crypto_hash
    (
    unsigned char *out,
    const unsigned char *in,
    unsigned long long inlen
    )

{
    Skein_512_Ctxt_t ctx;

    memcpy(ctx.X,IV,sizeof(ctx.X));
    ctx.T[0] = 0;
    ctx.T[1] = ((uint64) 112) << 56;

    if (inlen > 64) {
        size_t n = (inlen-1) / 64;
        Skein_512_Process_Block(&ctx,in,n,64);
        inlen -= n * 64;
        in    += n * 64;
    }

    memset(ctx.b,0,sizeof(ctx.b));
    if (inlen) memcpy(ctx.b,in,inlen);
    ctx.T[1] |= ((uint64) 128) << 56;
    Skein_512_Process_Block(&ctx,ctx.b,1,inlen);
    
    memset(ctx.b,0,sizeof(ctx.b));
    ctx.T[0] = 0;
    ctx.T[1] = ((uint64) 255) << 56;
    Skein_512_Process_Block(&ctx,ctx.b,1,sizeof(uint64));
    Skein_Put64_LSB_First(out,ctx.X,crypto_hash_BYTES);

    return 0;
}
