/*
 // AEZ v4.1 AES-NI version. AEZ info: http://www.cs.ucdavis.edu/~rogaway/aez
 //
 // REQUIREMENTS: - Intel or ARM CPU supporting AES instructions
 //               - Faster if all pointers are 16-byte aligned.
 //               - Max 16 byte nonce, 16 byte authenticator
 //               - Single AD (AEZ spec allows vector AD but this code doesn't)
 //               - Max 2^32-1 byte buffers allowed (due to use of unsigned int)
 //
 // Written by Ted Krovetz (ted@krovetz.net). Last modified 15 October 2015.
 //
 // This is free and unencumbered software released into the public domain.
 //
 // Anyone is free to copy, modify, publish, use, compile, sell, or
 // distribute this software, either in source code form or as a compiled
 // binary, for any purpose, commercial or non-commercial, and by any
 // means.
 //
 // In jurisdictions that recognize copyright laws, the author or authors
 // of this software dedicate any and all copyright interest in the
 // software to the public domain. We make this dedication for the benefit
 // of the public at large and to the detriment of our heirs and
 // successors. We intend this dedication to be an overt act of
 // relinquishment in perpetuity of all present and future rights to this
 // software under copyright law.
 //
 // THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 // EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 // MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 // IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 // OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 // ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 // OTHER DEALINGS IN THE SOFTWARE.
 //
 // For more information, please refer to <http://unlicense.org/>
 */

#include "crypto_aead.h"

/* ------------------------------------------------------------------------- */
#if __AES__                /* Defined by gcc/clang when compiling for AES-NI */
/* ------------------------------------------------------------------------- */

#include <stdint.h>
#include <smmintrin.h>
#include <wmmintrin.h>
#define block __m128i

/* ------------------------------------------------------------------------- */

#define zero           _mm_setzero_si128()
#define vadd(x,y)      _mm_add_epi8(x,y)
#define vand(x,y)      _mm_and_si128(x,y)
#define vandnot(x,y)   _mm_andnot_si128(x,y)  /* (~x)&y */
#define vor(x,y)       _mm_or_si128(x,y)
#define vxor(x,y)      _mm_xor_si128(x,y)

static int is_zero(block x) { return _mm_testz_si128(x,x); }      /* 0 or 1 */

static block sll4(block x) {
    return vor(_mm_srli_epi64(x, 4), _mm_slli_epi64(_mm_srli_si128(x, 8), 60));
}

static block srl4(block x) {
    return vor(_mm_slli_epi64(x, 4), _mm_srli_epi64(_mm_slli_si128(x, 8), 60));
}

static __m128i bswap16(__m128i b) {
    const __m128i t = _mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
    return _mm_shuffle_epi8(b,t);
}

static __m128i double_block(__m128i bl) {
    const __m128i mask = _mm_set_epi32(135,1,1,1);
    __m128i tmp = _mm_srai_epi32(bl, 31);
    tmp = _mm_and_si128(tmp, mask);
    tmp = _mm_shuffle_epi32(tmp, _MM_SHUFFLE(2,1,0,3));
    bl = _mm_slli_epi32(bl, 1);
    return _mm_xor_si128(bl,tmp);
}

static __m128i aes(__m128i *key, __m128i in, __m128i first_key) {
    in = vxor(in, first_key);
    in = _mm_aesenc_si128 (in,key[0]);
    in = _mm_aesenc_si128 (in,key[3]);
    in = _mm_aesenc_si128 (in,key[6]);
    in = _mm_aesenc_si128 (in,key[0]);
    in = _mm_aesenc_si128 (in,key[3]);
    in = _mm_aesenc_si128 (in,key[6]);
    in = _mm_aesenc_si128 (in,key[0]);
    in = _mm_aesenc_si128 (in,key[3]);
    in = _mm_aesenc_si128 (in,key[6]);
    return _mm_aesenc_si128 (in,key[0]);
}

static __m128i aes4(__m128i in, __m128i a, __m128i b, __m128i c, __m128i d) {
    in = _mm_aesenc_si128(in,a);
    in = _mm_aesenc_si128(in,b);
    in = _mm_aesenc_si128(in,c);
    return _mm_aesenc_si128 (in,d);
}

static __m128i loadu(const void *p) { return _mm_loadu_si128((__m128i*)p); }
static void storeu(const void *p, __m128i x) {_mm_storeu_si128((__m128i*)p,x);}

#define load loadu      /* Intel with AES-NI has fast unaligned loads/stores */
#define store storeu

/* ------------------------------------------------------------------------- */
#elif __ARM_FEATURE_CRYPTO
/* ------------------------------------------------------------------------- */

#include <arm_neon.h>
#define block uint8x16_t

#define zero           vmovq_n_u8(0)
#define vadd(x,y)      vaddq_u8(x,y)
#define vand(x,y)      vandq_u8(x,y)
#define vandnot(x,y)   vbicq_u8(y,x)  /* (~x)&y */
#define vor(x,y)       vorrq_u8(x,y)
#define vxor(x,y)      veorq_u8(x,y)

int is_zero(block x) {         /* 0 or 1 */
    uint8x8_t t = vorr_u8(vget_high_u8(x), vget_low_u8(x));
    return vget_lane_u64(vreinterpret_u64_u8(t),0) == 0;
}

block srl4(block x) {
    const block mask = {15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0};
    uint8x16_t tmp = vandq_u8(vshrq_n_s8(vextq_u8(x, x, 1),4),mask);
    return veorq_u8(tmp,vshlq_n_u8(x,4));
}

block sll4(block x) {
    const block mask = {0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15};
    uint8x16_t tmp = vshlq_n_s8(vandq_u8(vextq_u8(x, x, 15),mask),4);
    return veorq_u8(tmp,vshrq_n_u8(x,4));
}

static uint8x16_t bswap16(uint8x16_t b) { return b; } /* Not with uint8x16_t */

static block double_block(block b) {
    const block mask = {135,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
    block tmp = vshrq_n_s8((int8x16_t)b,7);
    tmp = vandq_u8(tmp, mask);
    tmp = vextq_u8(tmp, tmp, 1);  /* Rotate high byte to low end */
    b = vshlq_n_u8(b,1);
    return veorq_u8(tmp,b);
}

static uint8x16_t aes(uint8x16_t *key, uint8x16_t in, uint8x16_t first_key) {
    in = vaesmcq_u8(vaeseq_u8(in, first_key));
    in = vaesmcq_u8(vaeseq_u8(in, key[0]));
    in = vaesmcq_u8(vaeseq_u8(in, key[3]));
    in = vaesmcq_u8(vaeseq_u8(in, key[6]));
    in = vaesmcq_u8(vaeseq_u8(in, key[0]));
    in = vaesmcq_u8(vaeseq_u8(in, key[3]));
    in = vaesmcq_u8(vaeseq_u8(in, key[6]));
    in = vaesmcq_u8(vaeseq_u8(in, key[0]));
    in = vaesmcq_u8(vaeseq_u8(in, key[3]));
    in = vaesmcq_u8(vaeseq_u8(in, key[6]));
    return vxor(in, key[0]);
}

static uint8x16_t aes4(uint8x16_t in, uint8x16_t a, uint8x16_t b, uint8x16_t c, uint8x16_t d) {
    in = vaesmcq_u8(vaeseq_u8(in, zero));
    in = vaesmcq_u8(vaeseq_u8(in, a));
    in = vaesmcq_u8(vaeseq_u8(in, b));
    in = vaesmcq_u8(vaeseq_u8(in, c));
    return vxor(in,d);
}

static uint8x16_t load(const void *p) { return *(uint8x16_t *)p; }
static void store(void *p, uint8x16_t x) { *(uint8x16_t *)p = x; }

#define loadu load    /* ARMv8 allows unaligned loads/stores */
#define storeu store  /* ARMv8 allows unaligned stores       */

/* ------------------------------------------------------------------------- */
#else
#error - This implementation requires __AES__ or __ARM_FEATURE_CRYPTO
#endif
/* ------------------------------------------------------------------------- */

#define vxor3(x,y,z)        vxor(vxor(x,y),z)
#define vxor4(w,x,y,z)      vxor(vxor(w,x),vxor(y,z))
#define load_partial(p,n)   loadu(p)

/*
Might need a version like this if, for example, we want to load a 12-byte nonce
into a 16-byte block.

static block load_partial(const void *p, unsigned n) {
    if ((intptr_t)p % 16 == 0) return load(p);
    else {
        block tmp; unsigned i;
        for (i=0; i<n; i++) ((char*)&tmp)[i] = ((char*)p)[i];
        return tmp;
    }
}
*/

static const unsigned char pad[] = {0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
                                    0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
                                    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
                                    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
                                    0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
                                    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};

static block zero_pad(block x, unsigned zero_bytes) {
    return vand(x, loadu(pad + zero_bytes));
}

static block one_zero_pad(block x, unsigned one_zero_bytes) {
    block *p = (block*)(pad + one_zero_bytes);
    return vor(vand(x, loadu(p)), loadu(p+1));
}

block zero_set_byte(char val, unsigned idx) {
    block tmp = zero; ((char *)&tmp)[idx] = val; return tmp;
}

/* ------------------------------------------------------------------------- */

typedef struct {
    block I[3];    /* 1I,2I,4I */
    block J[3];    /* 1J,2J,4J */
    block L;
    block delta3_cache;
} aez_ctx_t;

/* ------------------------------------------------------------------------- */

static int blake2b(void *out, size_t outlen,
                   const void *key, size_t keylen,
                   const void *in, size_t inlen);

void aez_setup(unsigned char *key, unsigned keylen, aez_ctx_t *ctx) {
    block tmp;
    if (keylen==48) {
        ctx->I[0] = loadu(key);
        ctx->J[0] = loadu(key+16);
        ctx->L    = loadu(key+32);
    } else {
        blake2b(ctx, 48, 0, 0, key, keylen);    /* Puts IJL into ctx */
        ctx->J[0] = ctx->I[1];                  /* Rearrange.        */
        ctx->L    = ctx->I[2];
    }
    /* Fill ctx with J doublings */
    ctx->I[1] = bswap16(tmp = double_block(bswap16(ctx->I[0])));
    ctx->I[2] = bswap16(tmp = double_block(tmp));
    ctx->J[1] = bswap16(tmp = double_block(bswap16(ctx->J[0])));
    ctx->J[2] = bswap16(tmp = double_block(tmp));
    ctx->delta3_cache = zero;
}

/* ------------------------------------------------------------------------- */

/* !! Warning !! Only handles nbytes <= 16 and abytes <= 16 */
block aez_hash(aez_ctx_t *ctx, char *n, unsigned nbytes, char *ad,
               unsigned adbytes, unsigned abytes) {
    block o0, o1, o2, o3, o4, o5, o6, o7, sum, offset, tmp;
    block I=ctx->I[0], L=ctx->L, J=ctx->J[0];
    block Jfordoubling = double_block(bswap16(ctx->J[2]));  /* 8J */
    block J8 = bswap16(Jfordoubling);
    block L2 = bswap16(tmp = double_block(bswap16(L)));
    block L4 = bswap16(tmp = double_block(tmp));
    
    /* Process abytes and nonce */
    offset = vxor(L,J8);
    tmp = zero_set_byte((char)(8*abytes),15);
    sum = aes4(vxor(offset,tmp),J,I,L,offset);
    offset = L2;
    if (nbytes==16) offset = vxor(offset, J8);
    tmp = one_zero_pad(load_partial(n,nbytes),16-nbytes);
    sum = vxor(sum, aes4(vxor(offset,tmp),J,I,L,offset));
    
    if (adbytes==0) {
        offset = L4;
        ctx->delta3_cache = aes4(vxor(offset,loadu(pad+32)),J,I,L,offset);
    } else if (ad) {
        block delta3 = zero;
        offset = vxor(L4, J8);
        while (adbytes >= 8*16) {
            o0 = offset;
            o1 = vxor(o0,ctx->J[0]);
            o2 = vxor(o0,ctx->J[1]);
            o3 = vxor(o1,ctx->J[1]);
            o4 = vxor(o0,ctx->J[2]);
            o5 = vxor(o1,ctx->J[2]);
            o6 = vxor(o2,ctx->J[2]);
            o7 = vxor(o3,ctx->J[2]);
            offset = vxor(L4, bswap16(Jfordoubling = double_block(Jfordoubling)));
            delta3 = vxor(delta3, aes4(vxor(load(ad+  0),o0), J, I, L, o0));
            delta3 = vxor(delta3, aes4(vxor(load(ad+ 16),o1), J, I, L, o1));
            delta3 = vxor(delta3, aes4(vxor(load(ad+ 32),o2), J, I, L, o2));
            delta3 = vxor(delta3, aes4(vxor(load(ad+ 48),o3), J, I, L, o3));
            delta3 = vxor(delta3, aes4(vxor(load(ad+ 64),o4), J, I, L, o4));
            delta3 = vxor(delta3, aes4(vxor(load(ad+ 80),o5), J, I, L, o5));
            delta3 = vxor(delta3, aes4(vxor(load(ad+ 96),o6), J, I, L, o6));
            delta3 = vxor(delta3, aes4(vxor(load(ad+112),o7), J, I, L, o7));
            adbytes-=8*16; ad+=8*16;
        }
        if (adbytes >= 4*16) {
            o0 = offset;
            o1 = vxor(o0,ctx->J[0]);
            o2 = vxor(o0,ctx->J[1]);
            o3 = vxor(o1,ctx->J[1]);
            offset = vxor(o0,ctx->J[2]);
            delta3 = vxor(delta3, aes4(vxor(load(ad+  0),o0), J, I, L, o0));
            delta3 = vxor(delta3, aes4(vxor(load(ad+ 16),o1), J, I, L, o1));
            delta3 = vxor(delta3, aes4(vxor(load(ad+ 32),o2), J, I, L, o2));
            delta3 = vxor(delta3, aes4(vxor(load(ad+ 48),o3), J, I, L, o3));
            adbytes-=4*16; ad+=4*16;
        }
        if (adbytes >= 2*16) {
            o0 = offset;
            o1 = vxor(o0,ctx->J[0]);
            offset = vxor(o0,ctx->J[1]);
            delta3 = vxor(delta3, aes4(vxor(load(ad+  0),o0), J, I, L, o0));
            delta3 = vxor(delta3, aes4(vxor(load(ad+ 16),o1), J, I, L, o1));
            adbytes-=2*16; ad+=2*16;
        }
        if (adbytes >= 1*16) {
            o0 = offset;
            delta3 = vxor(delta3, aes4(vxor(load(ad+  0),o0), J, I, L, o0));
            adbytes-=1*16; ad+=1*16;
        }
        if (adbytes) {
            tmp = one_zero_pad(load(ad),16-adbytes);
            delta3 = vxor(delta3,aes4(vxor(tmp,L4), J, I, L, L4));
        }
        ctx->delta3_cache = delta3;
    }
    return vxor(sum,ctx->delta3_cache);
}

/* ------------------------------------------------------------------------- */

block pass_one(aez_ctx_t *ctx, block *src, unsigned bytes, block *dst) {
    block o0, o1, o2, o3, o4, o5, o6, o7, offset, tmp, sum=zero;
    block I=ctx->I[0], L=ctx->L, J=ctx->J[0];
    block Ifordoubling = double_block(bswap16(ctx->I[2]));  /* I8 */
    offset = bswap16(Ifordoubling);
    while (bytes >= 16*16) {
        o0 = offset;
        o1 = vxor(o0,ctx->I[0]);
        o2 = vxor(o0,ctx->I[1]);
        o3 = vxor(o1,ctx->I[1]);
        o4 = vxor(o0,ctx->I[2]);
        o5 = vxor(o1,ctx->I[2]);
        o6 = vxor(o2,ctx->I[2]);
        o7 = vxor(o3,ctx->I[2]);
        offset = bswap16(Ifordoubling = double_block(Ifordoubling));
        store(dst+ 0, aes4(vxor(load(src + 1),o0), J, I, L, load(src+ 0)));
        store(dst+ 2, aes4(vxor(load(src + 3),o1), J, I, L, load(src+ 2)));
        store(dst+ 4, aes4(vxor(load(src + 5),o2), J, I, L, load(src+ 4)));
        store(dst+ 6, aes4(vxor(load(src + 7),o3), J, I, L, load(src+ 6)));
        store(dst+ 8, aes4(vxor(load(src + 9),o4), J, I, L, load(src+ 8)));
        store(dst+10, aes4(vxor(load(src +11),o5), J, I, L, load(src+10)));
        store(dst+12, aes4(vxor(load(src +13),o6), J, I, L, load(src+12)));
        store(dst+14, aes4(vxor(load(src +15),o7), J, I, L, load(src+14)));
        tmp=aes4(load(dst+ 0),J,I,L,load(src+ 1));store(dst+ 1,tmp);sum=vxor(sum,tmp);
        tmp=aes4(load(dst+ 2),J,I,L,load(src+ 3));store(dst+ 3,tmp);sum=vxor(sum,tmp);
        tmp=aes4(load(dst+ 4),J,I,L,load(src+ 5));store(dst+ 5,tmp);sum=vxor(sum,tmp);
        tmp=aes4(load(dst+ 6),J,I,L,load(src+ 7));store(dst+ 7,tmp);sum=vxor(sum,tmp);
        tmp=aes4(load(dst+ 8),J,I,L,load(src+ 9));store(dst+ 9,tmp);sum=vxor(sum,tmp);
        tmp=aes4(load(dst+10),J,I,L,load(src+11));store(dst+11,tmp);sum=vxor(sum,tmp);
        tmp=aes4(load(dst+12),J,I,L,load(src+13));store(dst+13,tmp);sum=vxor(sum,tmp);
        tmp=aes4(load(dst+14),J,I,L,load(src+15));store(dst+15,tmp);sum=vxor(sum,tmp);
        bytes -= 16*16; dst += 16; src += 16;
    }
    if (bytes >= 8*16) {
        o0 = offset;
        o1 = vxor(o0,ctx->I[0]);
        o2 = vxor(o0,ctx->I[1]);
        o3 = vxor(o1,ctx->I[1]);
        offset = vxor(o0,ctx->I[2]);
        store(dst+ 0, aes4(vxor(load(src + 1),o0), J, I, L, load(src+ 0)));
        store(dst+ 2, aes4(vxor(load(src + 3),o1), J, I, L, load(src+ 2)));
        store(dst+ 4, aes4(vxor(load(src + 5),o2), J, I, L, load(src+ 4)));
        store(dst+ 6, aes4(vxor(load(src + 7),o3), J, I, L, load(src+ 6)));
        tmp=aes4(load(dst+ 0),J,I,L,load(src+ 1));store(dst+ 1,tmp);sum=vxor(sum,tmp);
        tmp=aes4(load(dst+ 2),J,I,L,load(src+ 3));store(dst+ 3,tmp);sum=vxor(sum,tmp);
        tmp=aes4(load(dst+ 4),J,I,L,load(src+ 5));store(dst+ 5,tmp);sum=vxor(sum,tmp);
        tmp=aes4(load(dst+ 6),J,I,L,load(src+ 7));store(dst+ 7,tmp);sum=vxor(sum,tmp);
        bytes -= 8*16; dst += 8; src += 8;
    }
    if (bytes >= 4*16) {
        o0 = offset;
        o1 = vxor(o0,ctx->I[0]);
        offset = vxor(o0,ctx->I[1]);
        store(dst+ 0, aes4(vxor(load(src + 1),o0), J, I, L, load(src+ 0)));
        store(dst+ 2, aes4(vxor(load(src + 3),o1), J, I, L, load(src+ 2)));
        tmp=aes4(load(dst+ 0),J,I,L,load(src+ 1));store(dst+ 1,tmp);sum=vxor(sum,tmp);
        tmp=aes4(load(dst+ 2),J,I,L,load(src+ 3));store(dst+ 3,tmp);sum=vxor(sum,tmp);
        bytes -= 4*16; dst += 4; src += 4;
    }
    if (bytes) {
        o0 = offset;
        store(dst+ 0, aes4(vxor(load(src + 1),o0), J, I, L, load(src+ 0)));
        tmp=aes4(load(dst+ 0),J,I,L,load(src+ 1));store(dst+ 1,tmp);sum=vxor(sum,tmp);
    }
    return sum;
}

/* ------------------------------------------------------------------------- */

block pass_two(aez_ctx_t *ctx, block s, unsigned bytes, block *dst) {
    block o0, o1, o2, o3, o4, o5, o6, o7, sum=zero, offset;
    block fs[8], tmp[8];
    block I=ctx->I[0], L=ctx->L, J=ctx->J[0];
    block Ifordoubling = double_block(bswap16(ctx->I[2]));  /* I8 */
    offset = bswap16(Ifordoubling);
    while (bytes >= 16*16) {
        o0 = offset;
        o1 = vxor(o0,ctx->I[0]);
        o2 = vxor(o0,ctx->I[1]);
        o3 = vxor(o1,ctx->I[1]);
        o4 = vxor(o0,ctx->I[2]);
        o5 = vxor(o1,ctx->I[2]);
        o6 = vxor(o2,ctx->I[2]);
        o7 = vxor(o3,ctx->I[2]);
        offset = bswap16(Ifordoubling = double_block(Ifordoubling));
        fs[0] = aes4(vxor(s,o0),L,I,J,L); fs[1] = aes4(vxor(s,o1),L,I,J,L);
        fs[2] = aes4(vxor(s,o2),L,I,J,L); fs[3] = aes4(vxor(s,o3),L,I,J,L);
        fs[4] = aes4(vxor(s,o4),L,I,J,L); fs[5] = aes4(vxor(s,o5),L,I,J,L);
        fs[6] = aes4(vxor(s,o6),L,I,J,L); fs[7] = aes4(vxor(s,o7),L,I,J,L);
        tmp[0] = vxor(load(dst+ 0),fs[0]); sum = vxor(sum,tmp[0]);
        store(dst+ 0,vxor(load(dst+ 1),fs[0]));
        tmp[1] = vxor(load(dst+ 2),fs[1]); sum = vxor(sum,tmp[1]);
        store(dst+ 2,vxor(load(dst+ 3),fs[1]));
        tmp[2] = vxor(load(dst+ 4),fs[2]); sum = vxor(sum,tmp[2]);
        store(dst+ 4,vxor(load(dst+ 5),fs[2]));
        tmp[3] = vxor(load(dst+ 6),fs[3]); sum = vxor(sum,tmp[3]);
        store(dst+ 6,vxor(load(dst+ 7),fs[3]));
        tmp[4] = vxor(load(dst+ 8),fs[4]); sum = vxor(sum,tmp[4]);
        store(dst+ 8,vxor(load(dst+ 9),fs[4]));
        tmp[5] = vxor(load(dst+10),fs[5]); sum = vxor(sum,tmp[5]);
        store(dst+10,vxor(load(dst+11),fs[5]));
        tmp[6] = vxor(load(dst+12),fs[6]); sum = vxor(sum,tmp[6]);
        store(dst+12,vxor(load(dst+13),fs[6]));
        tmp[7] = vxor(load(dst+14),fs[7]); sum = vxor(sum,tmp[7]);
        store(dst+14,vxor(load(dst+15),fs[7]));
        store(dst+ 1, aes4(load(dst+ 0), J, I, L, tmp[0]));
        store(dst+ 3, aes4(load(dst+ 2), J, I, L, tmp[1]));
        store(dst+ 5, aes4(load(dst+ 4), J, I, L, tmp[2]));
        store(dst+ 7, aes4(load(dst+ 6), J, I, L, tmp[3]));
        store(dst+ 9, aes4(load(dst+ 8), J, I, L, tmp[4]));
        store(dst+11, aes4(load(dst+10), J, I, L, tmp[5]));
        store(dst+13, aes4(load(dst+12), J, I, L, tmp[6]));
        store(dst+15, aes4(load(dst+14), J, I, L, tmp[7]));
        store(dst+ 0, aes4(vxor(load(dst+ 1),o0), J, I, L, load(dst+ 0)));
        store(dst+ 2, aes4(vxor(load(dst+ 3),o1), J, I, L, load(dst+ 2)));
        store(dst+ 4, aes4(vxor(load(dst+ 5),o2), J, I, L, load(dst+ 4)));
        store(dst+ 6, aes4(vxor(load(dst+ 7),o3), J, I, L, load(dst+ 6)));
        store(dst+ 8, aes4(vxor(load(dst+ 9),o4), J, I, L, load(dst+ 8)));
        store(dst+10, aes4(vxor(load(dst+11),o5), J, I, L, load(dst+10)));
        store(dst+12, aes4(vxor(load(dst+13),o6), J, I, L, load(dst+12)));
        store(dst+14, aes4(vxor(load(dst+15),o7), J, I, L, load(dst+14)));
        bytes -= 16*16; dst += 16;
    }
    if (bytes >= 8*16) {
        o0 = offset;
        o1 = vxor(o0,ctx->I[0]);
        o2 = vxor(o0,ctx->I[1]);
        o3 = vxor(o1,ctx->I[1]);
        offset = vxor(o0,ctx->I[2]);
        fs[0] = aes4(vxor(s,o0),L,I,J,L); fs[1] = aes4(vxor(s,o1),L,I,J,L);
        fs[2] = aes4(vxor(s,o2),L,I,J,L); fs[3] = aes4(vxor(s,o3),L,I,J,L);
        tmp[0] = vxor(load(dst+ 0),fs[0]); sum = vxor(sum,tmp[0]);
        store(dst+ 0,vxor(load(dst+ 1),fs[0]));
        tmp[1] = vxor(load(dst+ 2),fs[1]); sum = vxor(sum,tmp[1]);
        store(dst+ 2,vxor(load(dst+ 3),fs[1]));
        tmp[2] = vxor(load(dst+ 4),fs[2]); sum = vxor(sum,tmp[2]);
        store(dst+ 4,vxor(load(dst+ 5),fs[2]));
        tmp[3] = vxor(load(dst+ 6),fs[3]); sum = vxor(sum,tmp[3]);
        store(dst+ 6,vxor(load(dst+ 7),fs[3]));
        store(dst+ 1, aes4(load(dst+ 0), J, I, L, tmp[0]));
        store(dst+ 3, aes4(load(dst+ 2), J, I, L, tmp[1]));
        store(dst+ 5, aes4(load(dst+ 4), J, I, L, tmp[2]));
        store(dst+ 7, aes4(load(dst+ 6), J, I, L, tmp[3]));
        store(dst+ 0, aes4(vxor(load(dst+ 1),o0), J, I, L, load(dst+ 0)));
        store(dst+ 2, aes4(vxor(load(dst+ 3),o1), J, I, L, load(dst+ 2)));
        store(dst+ 4, aes4(vxor(load(dst+ 5),o2), J, I, L, load(dst+ 4)));
        store(dst+ 6, aes4(vxor(load(dst+ 7),o3), J, I, L, load(dst+ 6)));
        bytes -= 8*16; dst += 8;
    }
    if (bytes >= 4*16) {
        o0 = offset;
        o1 = vxor(o0,ctx->I[0]);
        offset = vxor(o0,ctx->I[1]);
        fs[0] = aes4(vxor(s,o0),L,I,J,L); fs[1] = aes4(vxor(s,o1),L,I,J,L);
        tmp[0] = vxor(load(dst+ 0),fs[0]); sum = vxor(sum,tmp[0]);
        store(dst+ 0,vxor(load(dst+ 1),fs[0]));
        tmp[1] = vxor(load(dst+ 2),fs[1]); sum = vxor(sum,tmp[1]);
        store(dst+ 2,vxor(load(dst+ 3),fs[1]));
        store(dst+ 1, aes4(load(dst+ 0), J, I, L, tmp[0]));
        store(dst+ 3, aes4(load(dst+ 2), J, I, L, tmp[1]));
        store(dst+ 0, aes4(vxor(load(dst+ 1),o0), J, I, L, load(dst+ 0)));
        store(dst+ 2, aes4(vxor(load(dst+ 3),o1), J, I, L, load(dst+ 2)));
        bytes -= 4*16; dst += 4;
    }
    if (bytes) {
        o0 = offset;
        fs[0] = aes4(vxor(s,o0),L,I,J,L);
        tmp[0] = vxor(load(dst+ 0),fs[0]); sum = vxor(sum,tmp[0]);
        store(dst+ 0,vxor(load(dst+ 1),fs[0]));
        store(dst+ 1, aes4(load(dst+ 0), J, I, L, tmp[0]));
        store(dst+ 0, aes4(vxor(load(dst+ 1),o0), J, I, L, load(dst+ 0)));
    }
    return sum;
}

/* ------------------------------------------------------------------------- */

int cipher_aez_core(aez_ctx_t *ctx, block t, int d, char *src, unsigned bytes, unsigned abytes, char *dst) {
    block s, x, y, frag0, frag1, final0, final1;
    block I=ctx->I[0], L=ctx->L, J=ctx->J[0], I4=ctx->I[2];
    unsigned i, frag_bytes, initial_bytes;
    
    if (!d) bytes += abytes;
    frag_bytes = bytes % 32;
    initial_bytes = bytes - frag_bytes - 32;
    
    /* Compute x and store intermediate results */
    x = pass_one(ctx, (block*)src, initial_bytes, (block*)dst);
    if (frag_bytes >= 16) {
        frag0 = load(src + initial_bytes);
        frag1 = one_zero_pad(load(src + initial_bytes + 16), 32-frag_bytes);
        x  = aes4(vxor(frag0, I4),     J, I, L, x);
        x  = vxor(x, aes4(vxor3(frag1, I4, I), J, I, L, zero));
    } else if (frag_bytes) {
        frag0 = one_zero_pad(load(src + initial_bytes), 16-frag_bytes);
        x = aes4(vxor(frag0, I4),     J, I, L, x);
    }
    
    /* Calculate s and final block values (y xor'd to final1 later) */
    final0 = vxor3(loadu(src + (bytes - 32)), x, t);
    if (d || !abytes) final1 = loadu(src+(bytes-32)+16);
    else              final1 = zero_pad(loadu(src+(bytes-32)+16), abytes);
    final0 = aes4(vxor(final1, ctx->I[d]), J, I, L, final0);
    final1 = vxor(final1, aes((block*)ctx, final0, ctx->J[d]));
    s = vxor(final0, final1);
    final0 = vxor(final0, aes((block*)ctx, final1, ctx->J[d^1]));
    /* Decryption: final0 should hold abytes zero bytes. If not, failure */
    if (d && !is_zero(vandnot(loadu(pad+abytes),final0))) return -1;
    final1 = aes4(vxor(final0, ctx->I[d^1]), J, I, L, final1);
    
    /* Compute y and store final results */
    y = pass_two(ctx, s, initial_bytes, (block*)dst);
    if (frag_bytes >= 16) {
        frag0 = vxor(frag0, aes((block*)ctx, s, ctx->J[2]));
        frag1 = vxor(frag1, aes((block*)ctx, s, vxor(ctx->J[2], J)));
        frag1 = one_zero_pad(frag1, 32-frag_bytes);
        y  = aes4(vxor(frag0, I4),     J, I, L, y);
        y  = vxor(y, aes4(vxor3(frag1, I4, I), J, I, L, zero));
        store(dst + initial_bytes, frag0);
        store(dst + initial_bytes + 16, frag1);
    } else if (frag_bytes) {
        frag0 = vxor(frag0, aes((block*)ctx, s, ctx->J[2]));
        frag0 = one_zero_pad(frag0, 16-frag_bytes);
        y = aes4(vxor(frag0, I4), J, I, L, y);
        store(dst + initial_bytes, frag0);
    }
    
    storeu(dst + (bytes - 32), vxor3(final1, y, t));
    if (!d || !abytes)
        storeu(dst + (bytes - 32) + 16, final0);
    else {
        for (i=0; i<16-abytes; i++)
            ((char*)dst + (bytes - 16))[i] = ((char*)&final0)[i];
    }
    return 0;
}

/* ------------------------------------------------------------------------- */

int cipher_aez_tiny(aez_ctx_t *ctx, block t, int d, char *src, unsigned bytes, unsigned abytes, char *dst) {
    block l, r, tmp, one, rcon, buf[2], mask_10, mask_ff;
    block I=ctx->I[0], L=ctx->L, J=ctx->J[0], t_orig = t;
    unsigned rnds, i;
    
    /* load src into buf, zero pad, update bytes for abytes */
    if (bytes >= 16) {
        buf[0] = load(src);
        buf[1] = zero_pad(load_partial(src+16,bytes-16),32-bytes);
    } else {
        buf[0] = zero_pad(load_partial(src,bytes),16-bytes);
        buf[1] = zero;
    }
    if (!d) bytes += abytes;
    
    /* load l/r, create 10* padding masks, shift r 4 bits if odd length */
    l = buf[0];
    r = loadu((char*)buf+bytes/2);
    mask_ff = loadu(pad+16-bytes/2);
    mask_10 = loadu(pad+32-bytes/2);
    if (bytes&1) {  /* Odd length. Deal with nibbles. */
        mask_10 = sll4(mask_10);
        ((char*)&mask_ff)[bytes/2] = (char)0xf0;
        r = bswap16(r);
        r = srl4(r);
        r = bswap16(r);
    }
    r = vor(vand(r, mask_ff), mask_10);
    
    /* Add tweak offset into t, and determine the number of rounds */
    if (bytes >= 16) {
        t = vxor3(t, ctx->I[1], ctx->I[2]);             /* (0,6) offset */
        rnds = 8;
    } else {
        t = vxor4(t, ctx->I[0], ctx->I[1], ctx->I[2]);  /* (0,7) offset */
        if (bytes>=3) rnds = 10; else if (bytes==2) rnds = 16; else rnds = 24;
    }
    
    if (!d) {
        one = zero_set_byte(1,15);
        rcon = zero;
    } else {
        one = zero_set_byte(-1,15);
        rcon = zero_set_byte((char)(rnds-1),15);
    }
    
    if ((d) && (bytes < 16)) {
        tmp = vor(l, loadu(pad+32));
        tmp = aes4(vxor4(tmp,t_orig,ctx->I[0],ctx->I[1]), J, I, L, zero);
        tmp = vand(tmp, loadu(pad+32));
        l = vxor(l, tmp);
    }
    
    /* Feistel */
    for (i=0; i<rnds; i+=2) {
        l = vor(vand(aes4(vxor3(t,r,rcon), J, I, L, l), mask_ff), mask_10);
        rcon = vadd(rcon,one);
        r = vor(vand(aes4(vxor3(t,l,rcon), J, I, L, r), mask_ff), mask_10);
        rcon = vadd(rcon,one);
    }
    buf[0] = r;
    if (bytes&1) {
        l = bswap16(l);
        l = sll4(l);
        l = bswap16(l);
        r = vand(loadu((char*)buf+bytes/2), zero_set_byte((char)0xf0,0));
        l = vor(l, r);
    }
    storeu((char*)buf+bytes/2, l);
    if (d) {
        bytes -= abytes;
        if (abytes==16) tmp = loadu((char*)buf+bytes);
        else {
            tmp = zero;
            for (i=0; i<abytes; i++) ((char*)&tmp)[i] = ((char*)buf+bytes)[i];
        }
        if (!is_zero(tmp)) return -1;
    } else if (bytes < 16) {
        tmp = vor(zero_pad(buf[0], 16-bytes), loadu(pad+32));
        tmp = aes4(vxor4(tmp,t_orig,ctx->I[0],ctx->I[1]), J, I, L, zero);
        buf[0] = vxor(buf[0], vand(tmp, loadu(pad+32)));
    }
    for (i=0; i<bytes; i++) dst[i] = ((char*)buf)[i];
    return 0;
}

/* ------------------------------------------------------------------------- */

void aez_encrypt(aez_ctx_t *ctx, char *n, unsigned nbytes,
                 char *ad, unsigned adbytes, unsigned abytes,
                 char *src, unsigned bytes, char *dst) {
    
    block t = aez_hash(ctx, n, nbytes, ad, adbytes, abytes);
    if (bytes==0) {
        unsigned i;
        t = aes((block*)ctx, t, vxor(ctx->J[0], ctx->J[1]));
        for (i=0; i<abytes; i++) dst[i] = ((char*)&t)[i];
    } else if (bytes+abytes < 32)
        cipher_aez_tiny(ctx, t, 0, src, bytes, abytes, dst);
    else
        cipher_aez_core(ctx, t, 0, src, bytes, abytes, dst);
}

/* ------------------------------------------------------------------------- */

int aez_decrypt(aez_ctx_t *ctx, char *n, unsigned nbytes,
                char *ad, unsigned adbytes, unsigned abytes,
                char *src, unsigned bytes, char *dst) {
    
    block t;
    if (bytes < abytes) return -1;
    t = aez_hash(ctx, n, nbytes, ad, adbytes, abytes);
    if (bytes==abytes) {
        block claimed = zero_pad(load_partial(src,abytes), 16-abytes);
        t = zero_pad(aes((block*)ctx, t, vxor(ctx->J[0], ctx->J[1])), 16-abytes);
        return is_zero(vandnot(t, claimed)) - 1;  /* is_zero return 0 or 1 */
    } else if (bytes < 32) {
        return cipher_aez_tiny(ctx, t, 1, src, bytes, abytes, dst);
    } else {
        return cipher_aez_core(ctx, t, 1, src, bytes, abytes, dst);
    }
}

/* ------------------------------------------------------------------------- */
/* Reference Blake2b code, here for convenience, and not for speed.          */
/* Dowloaded Sep 2015 from https://github.com/mjosaarinen/blake2_mjosref     */

#include <stdint.h>

typedef struct {
    uint8_t b[128];
    uint64_t h[8];
    uint64_t t[2];
    size_t c;
    size_t outlen;
} blake2b_ctx;

#ifndef ROTR64
#define ROTR64(x, y)  (((x) >> (y)) ^ ((x) << (64 - (y))))
#endif

#define B2B_GET64(p)                            \
(((uint64_t) ((uint8_t *) (p))[0]) ^        \
(((uint64_t) ((uint8_t *) (p))[1]) << 8) ^  \
(((uint64_t) ((uint8_t *) (p))[2]) << 16) ^ \
(((uint64_t) ((uint8_t *) (p))[3]) << 24) ^ \
(((uint64_t) ((uint8_t *) (p))[4]) << 32) ^ \
(((uint64_t) ((uint8_t *) (p))[5]) << 40) ^ \
(((uint64_t) ((uint8_t *) (p))[6]) << 48) ^ \
(((uint64_t) ((uint8_t *) (p))[7]) << 56))

#define B2B_G(a, b, c, d, x, y) {   \
v[a] = v[a] + v[b] + x;         \
v[d] = ROTR64(v[d] ^ v[a], 32); \
v[c] = v[c] + v[d];             \
v[b] = ROTR64(v[b] ^ v[c], 24); \
v[a] = v[a] + v[b] + y;         \
v[d] = ROTR64(v[d] ^ v[a], 16); \
v[c] = v[c] + v[d];             \
v[b] = ROTR64(v[b] ^ v[c], 63); }

static const uint64_t blake2b_iv[8] = {
    0x6A09E667F3BCC908, 0xBB67AE8584CAA73B,
    0x3C6EF372FE94F82B, 0xA54FF53A5F1D36F1,
    0x510E527FADE682D1, 0x9B05688C2B3E6C1F,
    0x1F83D9ABFB41BD6B, 0x5BE0CD19137E2179
};

static void blake2b_compress(blake2b_ctx *ctx, int last)
{
    const uint8_t sigma[12][16] = {
        { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 },
        { 14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3 },
        { 11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3, 6, 7, 1, 9, 4 },
        { 7, 9, 3, 1, 13, 12, 11, 14, 2, 6, 5, 10, 4, 0, 15, 8 },
        { 9, 0, 5, 7, 2, 4, 10, 15, 14, 1, 11, 12, 6, 8, 3, 13 },
        { 2, 12, 6, 10, 0, 11, 8, 3, 4, 13, 7, 5, 15, 14, 1, 9 },
        { 12, 5, 1, 15, 14, 13, 4, 10, 0, 7, 6, 3, 9, 2, 8, 11 },
        { 13, 11, 7, 14, 12, 1, 3, 9, 5, 0, 15, 4, 8, 6, 2, 10 },
        { 6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7, 1, 4, 10, 5 },
        { 10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0 },
        { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 },
        { 14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3 }
    };
    int i;
    uint64_t v[16], m[16];
    
    for (i = 0; i < 8; i++) {
        v[i] = ctx->h[i];
        v[i + 8] = blake2b_iv[i];
    }
    
    v[12] ^= ctx->t[0];
    v[13] ^= ctx->t[1];
    if (last)
        v[14] = ~v[14];
    
    for (i = 0; i < 16; i++)
        m[i] = B2B_GET64(&ctx->b[8 * i]);
    
    for (i = 0; i < 12; i++) {
        B2B_G( 0, 4,  8, 12, m[sigma[i][ 0]], m[sigma[i][ 1]]);
        B2B_G( 1, 5,  9, 13, m[sigma[i][ 2]], m[sigma[i][ 3]]);
        B2B_G( 2, 6, 10, 14, m[sigma[i][ 4]], m[sigma[i][ 5]]);
        B2B_G( 3, 7, 11, 15, m[sigma[i][ 6]], m[sigma[i][ 7]]);
        B2B_G( 0, 5, 10, 15, m[sigma[i][ 8]], m[sigma[i][ 9]]);
        B2B_G( 1, 6, 11, 12, m[sigma[i][10]], m[sigma[i][11]]);
        B2B_G( 2, 7,  8, 13, m[sigma[i][12]], m[sigma[i][13]]);
        B2B_G( 3, 4,  9, 14, m[sigma[i][14]], m[sigma[i][15]]);
    }
    
    for( i = 0; i < 8; ++i )
        ctx->h[i] ^= v[i] ^ v[i + 8];
}

static void blake2b_update(blake2b_ctx *ctx,
                           const void *in, size_t inlen)
{
    size_t i;
    
    for (i = 0; i < inlen; i++) {
        if (ctx->c == 128) {
            ctx->t[0] += ctx->c;
            if (ctx->t[0] < ctx->c)
                ctx->t[1]++;
            blake2b_compress(ctx, 0);
            ctx->c = 0;
        }
        ctx->b[ctx->c++] = ((const uint8_t *) in)[i];
    }
}

static void blake2b_final(blake2b_ctx *ctx, void *out)
{
    size_t i;
    
    ctx->t[0] += ctx->c;
    if (ctx->t[0] < ctx->c)
        ctx->t[1]++;
    
    while (ctx->c < 128)
        ctx->b[ctx->c++] = 0;
    blake2b_compress(ctx, 1);
    
    for (i = 0; i < ctx->outlen; i++) {
        ((uint8_t *) out)[i] =
        (ctx->h[i >> 3] >> (8 * (i & 7))) & 0xFF;
    }
}

static int blake2b_init(blake2b_ctx *ctx, size_t outlen,
                        const void *key, size_t keylen)
{
    size_t i;
    
    if (outlen == 0 || outlen > 64 || keylen > 64)
        return -1;
    
    for (i = 0; i < 8; i++)
        ctx->h[i] = blake2b_iv[i];
    ctx->h[0] ^= 0x01010000 ^ (keylen << 8) ^ outlen;
    
    ctx->t[0] = 0;
    ctx->t[1] = 0;
    ctx->c = 0;
    ctx->outlen = outlen;
    
    for (i = keylen; i < 128; i++)
        ctx->b[i] = 0;
    if (keylen > 0) {
        blake2b_update(ctx, key, keylen);
        ctx->c = 128;
    }
    
    return 0;
}

static int blake2b(void *out, size_t outlen,
                   const void *key, size_t keylen,
                   const void *in, size_t inlen)
{
    blake2b_ctx ctx;
    
    if (blake2b_init(&ctx, outlen, key, keylen))
        return -1;
    blake2b_update(&ctx, in, inlen);
    blake2b_final(&ctx, out);
    
    return 0;
}

/* ------------------------------------------------------------------------- */
/* aez mapping for CAESAR competition                                        */

int crypto_aead_encrypt(
    unsigned char *c,unsigned long long *clen,
    const unsigned char *m,unsigned long long mlen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *nsec,
    const unsigned char *npub,
    const unsigned char *k
)
{
    aez_ctx_t ctx;
    (void)nsec;
    if (clen) *clen = mlen+16;
    aez_setup((unsigned char *)k, 48, &ctx);
    aez_encrypt(&ctx, (char *)npub, 12,
                 (char *)ad, (unsigned)adlen, 16,
                 (char *)m, (unsigned)mlen, (char *)c);
    return 0;
}

int crypto_aead_decrypt(
    unsigned char *m,unsigned long long *mlen,
    unsigned char *nsec,
    const unsigned char *c,unsigned long long clen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k
)
{
    aez_ctx_t ctx;
    (void)nsec;
    if (mlen) *mlen = clen-16;
    aez_setup((unsigned char *)k, 48, &ctx);
    return aez_decrypt(&ctx, (char *)npub, 12,
                 (char *)ad, (unsigned)adlen, 16,
                 (char *)c, (unsigned)clen, (char *)m);
}
