/**
 * Groestl implementation.
 *
 * ==========================(LICENSE BEGIN)============================
 *
 * Copyright (c) 2007-2010  Projet RNRT SAPHIR
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * ===========================(LICENSE END)=============================
 *
 * @file     groestl.c
 * @author   Wolfgang Wieser <w.wieser@student.tugraz.at>
 *
 * This code is based on works of Thomas Pornin and Projet RNRT SAPHIR
 * and was adapted to tweaks of GROESTL for third round of SHA-3 competition.
 * It is part of a collection of header files, which implements GROESTL's
 * functions in C and assembler, optimized for 32-Bit ARM processors.
 */

#include <stddef.h>
#include <string.h>
#include <stdio.h>

#include "groestl.h"

#ifdef _MSC_VER
#pragma warning (disable: 4146)
#endif

/*
 * The internal representation may use either big-endian or
 * little-endian. Using the platform default representation speeds up
 * encoding and decoding between bytes and the matrix columns.
 */

#if SPH_LITTLE_ENDIAN

    #define C32e(x)     ((SPH_C32(x) >> 24) \
                        | ((SPH_C32(x) >>  8) & SPH_C32(0x0000FF00)) \
                        | ((SPH_C32(x) <<  8) & SPH_C32(0x00FF0000)) \
                        | ((SPH_C32(x) << 24) & SPH_C32(0xFF000000)))
    #define dec32e_aligned   sph_dec32le_aligned
    #define enc32e           sph_enc32le
    #define B32_0(x)    ((x) & 0xFF)
    #define B32_1(x)    (((x) >> 8) & 0xFF)
    #define B32_2(x)    (((x) >> 16) & 0xFF)
    #define B32_3(x)    ((x) >> 24)

    #define R32u(u, d)   SPH_T32(((u) << 16) | ((d) >> 16))
    #define R32d(u, d)   SPH_T32(((u) >> 16) | ((d) << 16))

#else

    #define C32e(x)     SPH_C32(x)
    #define dec32e_aligned   sph_dec32be_aligned
    #define enc32e           sph_enc32be
    #define B32_0(x)    ((x) >> 24)
    #define B32_1(x)    (((x) >> 16) & 0xFF)
    #define B32_2(x)    (((x) >> 8) & 0xFF)
    #define B32_3(x)    ((x) & 0xFF)

    #define R32u(u, d)   SPH_T32(((u) >> 16) | ((d) << 16))
    #define R32d(u, d)   SPH_T32(((u) << 16) | ((d) >> 16))

#endif

//=============================================================================

#define ARM

#ifdef ARM	

    #include "groestl_tables_c.h"
    #include "groestl_tables_asm.h"
    #include "groestl_core_asm_p.h"
    #include "groestl_core_asm_q.h"
    #include "groestl_core_asm_f.h"
	
	#define INIT(a) {                                   \
        asm volatile(                                   \
            "\n str sp, [%[a_], #256]                  "\
            "\n mov sp,  %[a_]                         "\
            : : [a_] "r" (a) );                       \
        }

	sph_u32 g[65];  //doubled size for alternating memory
	sph_u32 m[65];  //doubled size for alternating memory
	sph_u32 t[32];  //still needed for PERM_BIG_F
		
#else

    #include "groestl_tables_c.h"
    #include "groestl_core_c.h"
	
	sph_u32 g[32];
	sph_u32 m[32];
	sph_u32 t[32];

#endif

//=============================================================================


	
#define DECL_STATE_SMALL \
    sph_u32 H[16];

#define READ_STATE_SMALL(sc)   do { \
        memcpy(H, (sc)->state.narrow, sizeof H); \
    } while (0)

#define WRITE_STATE_SMALL(sc)   do { \
        memcpy((sc)->state.narrow, H, sizeof H); \
    } while (0)

#define COMPRESS_SMALL   do { \
        size_t u; \
        for (u = 0; u < 16; u ++) { \
            m[u] = dec32e_aligned(buf + (u << 2)); \
            g[u] = m[u] ^ H[u]; \
        } \
        PERM_SMALL_P(g); \
        PERM_SMALL_Q(m); \
        for (u = 0; u < 16; u ++) \
            H[u] ^= g[u] ^ m[u]; \
    } while (0)

#define FINAL_SMALL   do { \
        size_t u; \
        memcpy(g, H, 64); \
        PERM_SMALL_F(g); \
        for (u = 0; u < 16; u ++) \
            H[u] ^= g[u]; \
    } while (0)

#define DECL_STATE_BIG \
    sph_u32 H[32];

#define READ_STATE_BIG(sc)   do { \
        memcpy(H, (sc)->state.narrow, sizeof H); \
    } while (0)

#define WRITE_STATE_BIG(sc)   do { \
        memcpy((sc)->state.narrow, H, sizeof H); \
    } while (0)

#define COMPRESS_BIG   do { \
        size_t u; \
        for (u = 0; u < 32; u ++) { \
            m[u] = dec32e_aligned(buf + (u << 2)); \
            g[u] = m[u] ^ H[u]; \
        } \
        PERM_BIG_P(g); \
        PERM_BIG_Q(m); \
        for (u = 0; u < 32; u ++) \
            H[u] ^= g[u] ^ m[u]; \
    } while (0)

#define FINAL_BIG   do { \
        size_t u; \
        memcpy(g, H, 128); \
        PERM_BIG_F(g); \
        for (u = 0; u < 32; u ++) \
            H[u] ^= g[u]; \
    } while (0)

//=============================================================================
	
static void
groestl_small_init(sph_groestl_small_context *sc, unsigned out_size)
{
    size_t u;

#ifdef ARM	
//    DEFINE_TABLES;
#endif
	
    sc->ptr = 0;
    for (u = 0; u < 15; u ++)
        sc->state.narrow[u] = 0;
#if SPH_LITTLE_ENDIAN
    sc->state.narrow[15] = ((sph_u32)(out_size & 0xFF) << 24)
        | ((sph_u32)(out_size & 0xFF00) << 8);
#else
    sc->state.narrow[15] = (sph_u32)out_size;
#endif
    sc->count_high = 0;
    sc->count_low = 0;
}

static void
groestl_small_core(sph_groestl_small_context *sc, const void *data, size_t len)
{
    unsigned char *buf;
    size_t ptr;
    DECL_STATE_SMALL

    buf = sc->buf;
    ptr = sc->ptr;
    if (len < (sizeof sc->buf) - ptr) {
        memcpy(buf + ptr, data, len);
        ptr += len;
        sc->ptr = ptr;
        return;
    }

    READ_STATE_SMALL(sc);
    while (len > 0) {
        size_t clen;

        clen = (sizeof sc->buf) - ptr;
        if (clen > len)
            clen = len;
        memcpy(buf + ptr, data, clen);
        ptr += clen;
        data = (const unsigned char *)data + clen;
        len -= clen;
        if (ptr == sizeof sc->buf) {
            COMPRESS_SMALL;
            if ((sc->count_low = SPH_T32(sc->count_low + 1)) == 0)
                sc->count_high = SPH_T32(sc->count_high + 1);
            ptr = 0;
        }
    }
    WRITE_STATE_SMALL(sc);
    sc->ptr = ptr;
}

static void
groestl_small_close(sph_groestl_small_context *sc,
    unsigned ub, unsigned n, void *dst, size_t out_len)
{
    unsigned char *buf;
    unsigned char pad[72];
    size_t u, ptr, pad_len;
    sph_u32 count_high, count_low;
    unsigned z;
    DECL_STATE_SMALL

    buf = sc->buf;
    ptr = sc->ptr;
    z = 0x80 >> n;
    pad[0] = ((ub & -z) | z) & 0xFF;
    if (ptr < 56) {
        pad_len = 64 - ptr;
        count_low = SPH_T32(sc->count_low + 1);
        count_high = SPH_T32(sc->count_high);
        if (count_low == 0)
            count_high = SPH_T32(count_high + 1);
    } else {
        pad_len = 128 - ptr;
        count_low = SPH_T32(sc->count_low + 2);
        count_high = SPH_T32(sc->count_high);
        if (count_low <= 1)
            count_high = SPH_T32(count_high + 1);
    }
    memset(pad + 1, 0, pad_len - 9);
    sph_enc32be(pad + pad_len - 8, count_high);
    sph_enc32be(pad + pad_len - 4, count_low);
    groestl_small_core(sc, pad, pad_len);
    READ_STATE_SMALL(sc);
    FINAL_SMALL;
    for (u = 0; u < 8; u ++)
        enc32e(pad + (u << 2), H[u + 8]);
    memcpy(dst, pad + 32 - out_len, out_len);
    groestl_small_init(sc, (unsigned)out_len << 3);
}


static void
groestl_big_init(sph_groestl_big_context *sc, unsigned out_size)
{
    size_t u;

#ifdef ARM	
    DEFINE_TABLES;
#endif	
	
    sc->ptr = 0;
    for (u = 0; u < 31; u ++)
        sc->state.narrow[u] = 0;
#if SPH_LITTLE_ENDIAN
    sc->state.narrow[31] = ((sph_u32)(out_size & 0xFF) << 24)
        | ((sph_u32)(out_size & 0xFF00) << 8);
#else
    sc->state.narrow[31] = (sph_u32)out_size;
#endif
    sc->count_high = 0;
    sc->count_low = 0;
}

static void
groestl_big_core(sph_groestl_big_context *sc, const void *data, size_t len)
{
    unsigned char *buf;
    size_t ptr;
    DECL_STATE_BIG

    buf = sc->buf;
    ptr = sc->ptr;
    if (len < (sizeof sc->buf) - ptr) {
        memcpy(buf + ptr, data, len);
        ptr += len;
        sc->ptr = ptr;
        return;
    }

    READ_STATE_BIG(sc);
    while (len > 0) {
        size_t clen;

        clen = (sizeof sc->buf) - ptr;
        if (clen > len)
            clen = len;
        memcpy(buf + ptr, data, clen);
        ptr += clen;
        data = (const unsigned char *)data + clen;
        len -= clen;
        if (ptr == sizeof sc->buf) {
            COMPRESS_BIG;
            if ((sc->count_low = SPH_T32(sc->count_low + 1)) == 0)
                sc->count_high = SPH_T32(sc->count_high + 1);
            ptr = 0;
        }
    }
    WRITE_STATE_BIG(sc);
    sc->ptr = ptr;
}

static void
groestl_big_close(sph_groestl_big_context *sc,
    unsigned ub, unsigned n, void *dst, size_t out_len)
{
    unsigned char *buf;
    unsigned char pad[136];
    size_t ptr, pad_len, u;
    sph_u32 count_high, count_low;
    unsigned z;
    DECL_STATE_BIG

    buf = sc->buf;
    ptr = sc->ptr;
    z = 0x80 >> n;
    pad[0] = ((ub & -z) | z) & 0xFF;
    if (ptr < 120) {
        pad_len = 128 - ptr;
        count_low = SPH_T32(sc->count_low + 1);
        count_high = SPH_T32(sc->count_high);
        if (count_low == 0)
            count_high = SPH_T32(count_high + 1);
    } else {
        pad_len = 256 - ptr;
        count_low = SPH_T32(sc->count_low + 2);
        count_high = SPH_T32(sc->count_high);
        if (count_low <= 1)
            count_high = SPH_T32(count_high + 1);
    }
    memset(pad + 1, 0, pad_len - 9);
    sph_enc32be(pad + pad_len - 8, count_high);
    sph_enc32be(pad + pad_len - 4, count_low);
    groestl_big_core(sc, pad, pad_len);
    READ_STATE_BIG(sc);
    FINAL_BIG;
    for (u = 0; u < 16; u ++)
        enc32e(pad + (u << 2), H[u + 16]);
    memcpy(dst, pad + 64 - out_len, out_len);
    groestl_big_init(sc, (unsigned)out_len << 3);
}


/* see sph_groestl.h */
void
sph_groestl224_init(void *cc)
{
	groestl_small_init(cc, 224);
}

/* see sph_groestl.h */
void
sph_groestl224(void *cc, const void *data, size_t len)
{
	groestl_small_core(cc, data, len);
}

/* see sph_groestl.h */
void
sph_groestl224_close(void *cc, void *dst)
{
	groestl_small_close(cc, 0, 0, dst, 28);
}

/* see sph_groestl.h */
void
sph_groestl224_addbits_and_close(void *cc, unsigned ub, unsigned n, void *dst)
{
	groestl_small_close(cc, ub, n, dst, 28);
}

/* see sph_groestl.h */
void
sph_groestl256_init(void *cc)
{
	groestl_small_init(cc, 256);
}

/* see sph_groestl.h */
void
sph_groestl256(void *cc, const void *data, size_t len)
{
	groestl_small_core(cc, data, len);
}

/* see sph_groestl.h */
void
sph_groestl256_close(void *cc, void *dst)
{
	groestl_small_close(cc, 0, 0, dst, 32);
}

/* see sph_groestl.h */
void
sph_groestl256_addbits_and_close(void *cc, unsigned ub, unsigned n, void *dst)
{
	groestl_small_close(cc, ub, n, dst, 32);
}

/* see sph_groestl.h */
void
sph_groestl384_init(void *cc)
{
	groestl_big_init(cc, 384);
}

/* see sph_groestl.h */
void
sph_groestl384(void *cc, const void *data, size_t len)
{
	groestl_big_core(cc, data, len);
}

/* see sph_groestl.h */
void
sph_groestl384_close(void *cc, void *dst)
{
	groestl_big_close(cc, 0, 0, dst, 48);
}

/* see sph_groestl.h */
void
sph_groestl384_addbits_and_close(void *cc, unsigned ub, unsigned n, void *dst)
{
	groestl_big_close(cc, ub, n, dst, 48);
}

/* see sph_groestl.h */
void
sph_groestl512_init(void *cc)
{
	groestl_big_init(cc, 512);
}

/* see sph_groestl.h */
void
sph_groestl512(void *cc, const void *data, size_t len)
{
	groestl_big_core(cc, data, len);
}

/* see sph_groestl.h */
void
sph_groestl512_close(void *cc, void *dst)
{
	groestl_big_close(cc, 0, 0, dst, 64);
}

/* see sph_groestl.h */
void
sph_groestl512_addbits_and_close(void *cc, unsigned ub, unsigned n, void *dst)
{
	groestl_big_close(cc, ub, n, dst, 64);
}
