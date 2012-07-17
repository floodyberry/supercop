/* Chacha implementation by Ted Krovetz (ted@krovetz.net). Public domain.   */
/* Assumes 32-bit int, 64-bit long long.              Modified: 2012.07.05. */
#include "crypto_stream.h"
#include <string.h>

/* Chacha is an improvement on the stream cipher Salsa, described at
 * http://cr.yp.to/papers.html#chacha
 */
#define RNDS 20      /* 8=super-hi-speed. 20=ultra-conservative. 12=balance */

#if __ARM_NEON__
#define GPR_TOO  1   /* Should GPRs be used to compute a block too?         */
#define VBPI     2   /* How many parallel blocks should vectors compute?    */
#elif __ALTIVEC__
#define GPR_TOO  1
#define VBPI     3
#elif (__clang__ && __SSE2__)  /* 25% faster than GCC */
#define GPR_TOO  0
#define VBPI     4
#elif __SSE2__
#define GPR_TOO  0
#define VBPI     3
#else
#error -- Only supports machines with Neon, Altivec or SSE2
#endif

#define BPI      (VBPI + GPR_TOO)  /* Total blocks computed per iteration  */

/* Endian-neutral way to handle "expand 32-byte k" constant                */
static const int chacha_const[] = {1634760805,857760878,2036477234,1797285236};

/* Architecture-neutral way to specify vector of ints                      */
typedef unsigned           vec   __attribute__ ((vector_size (16)));
typedef unsigned long long vec64 __attribute__ ((vector_size (16)));

/* Although each of the following operations can be done generically using
 * GCC's vector operations, sometimes speed can be improved by specifying
 * and architecture-specific way.
 */
#if __ARM_NEON__
#include <arm_neon.h>
#define ROTV1(x) (vec)vextq_u32((uint32x4_t)x,(uint32x4_t)x,1)
#define ROTV2(x) (vec)vextq_u32((uint32x4_t)x,(uint32x4_t)x,2)
#define ROTV3(x) (vec)vextq_u32((uint32x4_t)x,(uint32x4_t)x,3)
#elif __ALTIVEC__
#include <altivec.h>
#define REVW_BE(x) __builtin_bswap32(x)
#define REVV_BE(x) vec_perm(x,x,((vector char){3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12}))
#define ROTV1(x)   vec_perm(x,x,((vector char){4,5,6,7,8,9,10,11,12,13,14,15,0,1,2,3}))
#define ROTV2(x)   vec_perm(x,x,((vector char){8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7}))
#define ROTV3(x)   vec_perm(x,x,((vector char){12,13,14,15,0,1,2,3,4,5,6,7,8,9,10,11}))
#define ROTW7(x)   vec_rl(x,vec_splat_u32(7))
#define ROTW8(x)   vec_rl(x,vec_splat_u32(8))
#define ROTW12(x)  vec_rl(x,vec_splat_u32(12))
#define ROTW16(x)  vec_rl(x,vec_splat_u32(-16)) /* trick to get 16 */
#elif __SSE2__
#include <emmintrin.h>
#define ROTV1(x) (vec)_mm_shuffle_epi32((__m128i)x,_MM_SHUFFLE(0,3,2,1))
#define ROTV2(x) (vec)_mm_shuffle_epi32((__m128i)x,_MM_SHUFFLE(1,0,3,2))
#define ROTV3(x) (vec)_mm_shuffle_epi32((__m128i)x,_MM_SHUFFLE(2,1,0,3))
#else
#error -- Implementation supports only machines with: neon, altivec or SSE2
#endif

#ifndef ROTW7
#define ROTW7(x)   (x << ((vec){ 7, 7, 7, 7})) ^ (x >> ((vec){25,25,25,25}))
#define ROTW8(x)   (x << ((vec){ 8, 8, 8, 8})) ^ (x >> ((vec){24,24,24,24}))
#define ROTW12(x)  (x << ((vec){12,12,12,12})) ^ (x >> ((vec){20,20,20,20}))
#define ROTW16(x)  (x << ((vec){16,16,16,16})) ^ (x >> ((vec){16,16,16,16}))
#endif

#ifndef REVV_BE
#define REVV_BE(x)  (x)
#endif

#ifndef REVW_BE
#define REVW_BE(x)  (x)
#endif

#define QROUND_VECTORS(a,b,c,d)        \
    a += b; d ^= a; d = ROTW16(d);     \
    c += d; b ^= c; b = ROTW12(b);     \
    a += b; d ^= a; d = ROTW8(d);      \
    c += d; b ^= c; b = ROTW7(b);

#define ROTATE_VECTORS(a,b,c)         \
    a = ROTV1(a);                     \
    b = ROTV2(b);                     \
    c = ROTV3(c);

#define QROUND_WORDS(a,b,c,d) \
  a = a+b; d ^= a; d = d<<16 | d>>16; \
  c = c+d; b ^= c; b = b<<12 | b>>20; \
  a = a+b; d ^= a; d = d<< 8 | d>>24; \
  c = c+d; b ^= c; b = b<< 7 | b>>25;

#define WRITE_XOR(in, op, d, v0, v1, v2, v3)                   \
*(vec *)(op + d +  0) = *(vec *)(in + d +  0) ^ REVV_BE(v0);    \
*(vec *)(op + d +  4) = *(vec *)(in + d +  4) ^ REVV_BE(v1);    \
*(vec *)(op + d +  8) = *(vec *)(in + d +  8) ^ REVV_BE(v2);    \
*(vec *)(op + d + 12) = *(vec *)(in + d + 12) ^ REVV_BE(v3);

#define WRITE(op, d, v0, v1, v2, v3)                   \
*(vec *)(op + d +  0) = REVV_BE(v0);    \
*(vec *)(op + d +  4) = REVV_BE(v1);    \
*(vec *)(op + d +  8) = REVV_BE(v2);    \
*(vec *)(op + d + 12) = REVV_BE(v3);

int crypto_stream_xor(
        unsigned char *out,
        const unsigned char *in,
        unsigned long long inlen,
        const unsigned char *n,
        const unsigned char *k
                                      )
/* Assumes all pointers are aligned properly for vector reads */
{
    unsigned iters, i;
    unsigned *op=(unsigned *)out, *ip=(unsigned *)in, *kp, *np;
    __attribute__ ((aligned (16))) unsigned key[8];
    __attribute__ ((aligned (16))) unsigned nonce[2];
    #if ( __ARM_NEON__ )
    kp = (unsigned *)k;
    np = (unsigned *)n;
    #else
    ((vec *)key)[0] = REVV_BE(((vec *)k)[0]);
    ((vec *)key)[1] = REVV_BE(((vec *)k)[1]);
    nonce[0] = REVW_BE(((unsigned *)n)[0]);
    nonce[1] = REVW_BE(((unsigned *)n)[1]);
    kp = (unsigned *)key;
    np = (unsigned *)nonce;
    #endif
    vec s0 = *(vec *)chacha_const;
    vec s1 = ((vec *)kp)[0];
    vec s2 = ((vec *)kp)[1];
    vec s3 = (vec)((vec64){0,*(unsigned long long *)np});
    for (iters = 0; iters < inlen/(BPI*64); iters++) {
        vec v0,v1,v2,v3,v4,v5,v6,v7;
        v4 = v0 = s0; v5 = v1 = s1; v6 = v2 = s2; v3 = s3;
        v7 = v3 + (vec){1,0,0,0};
        #if VBPI > 2
        vec v8,v9,v10,v11;
        v8 = v4; v9 = v5; v10 = v6;
        v11 =  v7 + (vec){1,0,0,0};
        #endif
        #if VBPI > 3
        vec v12,v13,v14,v15;
        v12 = v8; v13 = v9; v14 = v10;
        v15 = v11 + (vec){1,0,0,0};
        #endif
        #if GPR_TOO
        register unsigned x0, x1, x2, x3, x4, x5, x6, x7, x8,
                          x9, x10, x11, x12, x13, x14, x15;
        x0 = chacha_const[0]; x1 = chacha_const[1];
        x2 = chacha_const[2]; x3 = chacha_const[3];
        x4 = kp[0]; x5 = kp[1]; x6  = kp[2]; x7  = kp[3];
        x8 = kp[4]; x9 = kp[5]; x10 = kp[6]; x11 = kp[7];
        x12 = BPI*iters+(BPI-1); x13 = 0; x14 = np[0]; x15 = np[1];
        #endif
        for (i = RNDS/2; i; i--) {
            QROUND_VECTORS(v0,v1,v2,v3)
            ROTATE_VECTORS(v1,v2,v3)
            QROUND_VECTORS(v0,v1,v2,v3)
            ROTATE_VECTORS(v3,v2,v1)
            QROUND_VECTORS(v4,v5,v6,v7)
            ROTATE_VECTORS(v5,v6,v7)
            QROUND_VECTORS(v4,v5,v6,v7)
            ROTATE_VECTORS(v7,v6,v5)
            #if VBPI > 2
            QROUND_VECTORS(v8,v9,v10,v11)
            ROTATE_VECTORS(v9,v10,v11)
            QROUND_VECTORS(v8,v9,v10,v11)
            ROTATE_VECTORS(v11,v10,v9)
            #endif
            #if VBPI > 3
            QROUND_VECTORS(v12,v13,v14,v15)
            ROTATE_VECTORS(v13,v14,v15)
            QROUND_VECTORS(v12,v13,v14,v15)
            ROTATE_VECTORS(v15,v14,v13)
            #endif
            #if GPR_TOO
            QROUND_WORDS( x0, x4, x8,x12)
            QROUND_WORDS( x1, x5, x9,x13)
            QROUND_WORDS( x2, x6,x10,x14)
            QROUND_WORDS( x3, x7,x11,x15)
            QROUND_WORDS( x0, x5,x10,x15)
            QROUND_WORDS( x1, x6,x11,x12)
            QROUND_WORDS( x2, x7, x8,x13)
            QROUND_WORDS( x3, x4, x9,x14)
            #endif
        }
        WRITE_XOR(ip, op, 0, v0+s0, v1+s1, v2+s2, v3+s3)
        s3 += (vec){1,0,0,0};
        WRITE_XOR(ip, op, 16, v4+s0, v5+s1, v6+s2, v7+s3)
        s3 += (vec){1,0,0,0};
        #if VBPI > 2
        WRITE_XOR(ip, op, 32, v8+s0, v9+s1, v10+s2, v11+s3)
        s3 += (vec){1,0,0,0};
        #endif
        #if VBPI > 3
        WRITE_XOR(ip, op, 48, v12+s0, v13+s1, v14+s2, v15+s3)
        s3 += (vec){1,0,0,0};
        #endif
        ip += VBPI*16;
        op += VBPI*16;
        #if GPR_TOO
        op[0]  = REVW_BE(REVW_BE(ip[0])  ^ (x0  + chacha_const[0]));
        op[1]  = REVW_BE(REVW_BE(ip[1])  ^ (x1  + chacha_const[1]));
        op[2]  = REVW_BE(REVW_BE(ip[2])  ^ (x2  + chacha_const[2]));
        op[3]  = REVW_BE(REVW_BE(ip[3])  ^ (x3  + chacha_const[3]));
        op[4]  = REVW_BE(REVW_BE(ip[4])  ^ (x4  + kp[0]));
        op[5]  = REVW_BE(REVW_BE(ip[5])  ^ (x5  + kp[1]));
        op[6]  = REVW_BE(REVW_BE(ip[6])  ^ (x6  + kp[2]));
        op[7]  = REVW_BE(REVW_BE(ip[7])  ^ (x7  + kp[3]));
        op[8]  = REVW_BE(REVW_BE(ip[8])  ^ (x8  + kp[4]));
        op[9]  = REVW_BE(REVW_BE(ip[9])  ^ (x9  + kp[5]));
        op[10] = REVW_BE(REVW_BE(ip[10]) ^ (x10 + kp[6]));
        op[11] = REVW_BE(REVW_BE(ip[11]) ^ (x11 + kp[7]));
        op[12] = REVW_BE(REVW_BE(ip[12]) ^ (x12 + BPI*iters+(BPI-1)));
        op[13] = REVW_BE(REVW_BE(ip[13]) ^ (x13));
        op[14] = REVW_BE(REVW_BE(ip[14]) ^ (x14 + np[0]));
        op[15] = REVW_BE(REVW_BE(ip[15]) ^ (x15 + np[1]));
        s3 += (vec){1,0,0,0};
        ip += 16;
        op += 16;
        #endif
    }
    for (iters = inlen%(BPI*64)/64; iters != 0; iters--) {
        vec v0 = s0, v1 = s1, v2 = s2, v3 = s3;
        for (i = RNDS/2; i; i--) {
            QROUND_VECTORS(v0,v1,v2,v3)
            ROTATE_VECTORS(v1,v2,v3)
            QROUND_VECTORS(v0,v1,v2,v3)
            ROTATE_VECTORS(v3,v2,v1)
        }
        WRITE_XOR(ip, op, 0, v0+s0, v1+s1, v2+s2, v3+s3)
        s3 += (vec){1,0,0,0};
        ip += 16;
        op += 16;
    }
    inlen = inlen % 64;
    if (inlen) {
        __attribute__ ((aligned (16))) vec buf[4];
        vec v0,v1,v2,v3;
        v0 = s0; v1 = s1; v2 = s2; v3 = s3;
        for (i = RNDS/2; i; i--) {
            QROUND_VECTORS(v0,v1,v2,v3)
            ROTATE_VECTORS(v1,v2,v3)
            QROUND_VECTORS(v0,v1,v2,v3)
            ROTATE_VECTORS(v3,v2,v1)
        }
        if (inlen >= 16) {
            *(vec *)(op +   0) = *(vec *)(ip +   0) ^ REVV_BE(v0 + s0);
            if (inlen >= 32) {
                *(vec *)(op +  4) = *(vec *)(ip + 4) ^ REVV_BE(v1 + s1);
                if (inlen >= 48) {
                    *(vec *)(op +  8) = *(vec *)(ip +  8) ^ REVV_BE(v2 + s2);
                    buf[3] = REVV_BE(v3 + s3);
                } else { buf[2] = REVV_BE(v2 + s2); }
            } else { buf[1] = REVV_BE(v1 + s1); }
        } else buf[0] = REVV_BE(v0 + s0);
        for (i=inlen & ~15; i<inlen; i++)
            ((char *)op)[i] = ((char *)ip)[i] ^ ((char *)buf)[i];
    }
    return 0;
}

int crypto_stream(
                                  unsigned char *out,
                                  unsigned long long outlen,
                                  const unsigned char *n,
                                  const unsigned char *k
                                  )
{
    memset(out,0,outlen);
    return crypto_stream_xor(out,out,outlen,n,k);
}
