/* pi-cipher.c */
/*
    Copyright (C) 2014-2016 bg nerilex (bg@nerilex.org)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <string.h>
#include <stdlib.h>
#include "pi-cipher.h"

#define MAX(a,b) ((a) > (b) ? (a) : (b))
#define MIN(a,b) ((a) < (b) ? (a) : (b))

#define DEBUG 0

#ifdef LITTLE_ENDIAN
#undef LITTLE_ENDIAN
#endif

#if defined(__BYTE_ORDER__) && (__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__)
#define LITTLE_ENDIAN 1
#else
#define LITTLE_ENDIAN 0
#endif

#if (PI_WORD_SIZE == 16)
#  define load_word_little(mem) load_u16_little(mem)
#  define store_word_little(mem, val) store_u16_little((mem), (val))
#  define PRI_xw "04"PRIx16

static inline uint16_t load_u16_little(const void *mem)
{
#if LITTLE_ENDIAN
	return *(uint16_t *)mem;
#else
	uint16_t ret;
	const uint8_t *x = (const uint8_t *)mem;
	ret =   x[0] <<  0
	      | x[1] <<  8;
	return ret;
#endif
}

static inline void store_u16_little(void *mem, uint16_t val)
{
#if LITTLE_ENDIAN
	*(uint16_t *)mem = val;
#else
	uint8_t *x = (uint8_t *)mem;
	x[0] = val & 0xff; val >>= 8;
	x[1] = val & 0xff;
#endif
}

#elif (PI_WORD_SIZE == 32)
#  define load_word_little(mem) load_u32_little(mem)
#  define store_word_little(mem, val) store_u32_little((mem), (val))
#  define PRI_xw "08"PRIx32

static inline uint32_t load_u32_little(const void *mem)
{
#if LITTLE_ENDIAN
	return *(uint32_t *)mem;
#else
	uint32_t ret;
	const uint8_t *x = (const uint8_t *)mem;
	ret =   (uint32_t)x[0] <<  0
	      | (uint32_t)x[1] <<  8
	      | (uint32_t)x[2] << 16
	      | (uint32_t)x[3] << 24;
	return ret;
#endif
}

static inline void store_u32_little(void *mem, uint32_t val)
{
#if LITTLE_ENDIAN
	*(uint32_t *)mem = val;
#else
	uint8_t *x = (uint8_t *)mem;
	x[0] = val & 0xff; val >>= 8;
	x[1] = val & 0xff; val >>= 8;
	x[2] = val & 0xff; val >>= 8;
	x[3] = val & 0xff;
#endif
}

#elif (PI_WORD_SIZE == 64)
#  define load_word_little(mem) load_u64_little(mem)
#  define store_word_little(mem, val) store_u64_little((mem), (val))
#  define PRI_xw "016"PRIx64

static inline uint64_t load_u64_little(const void *mem)
{
#if LITTLE_ENDIAN
	return *(uint64_t *)mem;
#else
	uint64_t ret;
	const uint8_t *x = (const uint8_t *)mem;
	ret =   (uint64_t)x[0] <<  0
	      | (uint64_t)x[1] <<  8
	      | (uint64_t)x[2] << 16
	      | (uint64_t)x[3] << 24
	      | (uint64_t)x[4] << 32
	      | (uint64_t)x[5] << 40
	      | (uint64_t)x[6] << 48
	      | (uint64_t)x[7] << 56;
	return ret;
#endif
}

static inline void store_u64_little(void *mem, uint64_t val)
{
#if LITTLE_ENDIAN
	*(uint64_t *)mem = val;
#else
	uint8_t *x = (uint8_t *)mem;
	x[0] = val & 0xff; val >>= 8;
	x[1] = val & 0xff; val >>= 8;
	x[2] = val & 0xff; val >>= 8;
	x[3] = val & 0xff; val >>= 8;
	x[4] = val & 0xff; val >>= 8;
	x[5] = val & 0xff; val >>= 8;
	x[6] = val & 0xff; val >>= 8;
	x[7] = val & 0xff;
#endif
}

#endif


typedef word_t state_t[4][4];
const char* pi_cipher_name = XSTR(PI_CIPHER_NAME);


#if DEBUG
#include <stdio.h>
#include <inttypes.h>

size_t dbg_l;
const uint8_t *dbg_x;
uint8_t dump;


static
void hexdump_block(
		const void *data,
		size_t length,
		unsigned short indent,
		unsigned short width)
{
	unsigned short column = 0;
	char f = 0;
	while (length--) {
		if (column == 0) {
			unsigned short i;
			if (f) {
				putchar('\n');
			} else {
				f = 1;
			}
			for (i = 0; i < indent; ++i) {
				putchar(' ');
			}
			column = width;
		}
		column -= 1;
		printf("%02x ", *((unsigned char *)data));
		data = (void *)((char *)data + 1);
	}
}



static void dump_state(const word_t* a)
{
    if (dump || 1) {
        printf("\tCIS:\n");
        printf("\t%"PRI_xw" %"PRI_xw" %"PRI_xw" %"PRI_xw"\n",   a[ 0], a[ 1], a[ 2], a[ 3]);
        printf("\t%"PRI_xw" %"PRI_xw" %"PRI_xw" %"PRI_xw"\n",   a[ 4], a[ 5], a[ 6], a[ 7]);
        printf("\t%"PRI_xw" %"PRI_xw" %"PRI_xw" %"PRI_xw"\n",   a[ 8], a[ 9], a[10], a[11]);
        printf("\t%"PRI_xw" %"PRI_xw" %"PRI_xw" %"PRI_xw"\n\n", a[12], a[13], a[14], a[15]);
    }
}
#else
#define printf(...)
#endif


static inline word_t rotl(word_t x, uint8_t n)
{
    return (x << n) | (x >> ((PI_WORD_SIZE) - n));
}

static inline void mu(
        word_t dest[4],
        const word_t x[4])
{
    word_t sum;
    dest[0] = rotl(PI_MU_CONST_0 + x[0] + x[1] + x[2], PI_MU_ROT_CONST_0 );
    dest[1] = rotl(PI_MU_CONST_1 + x[0] + x[1] + x[3], PI_MU_ROT_CONST_1 );
    dest[2] = rotl(PI_MU_CONST_2 + x[0] + x[2] + x[3], PI_MU_ROT_CONST_2 );
    dest[3] = rotl(PI_MU_CONST_3 + x[1] + x[2] + x[3], PI_MU_ROT_CONST_3 );
    sum = dest[0] ^ dest[1] ^ dest[2] ^ dest[3];
    dest[0] ^= sum;
    dest[1] ^= sum;
    dest[2] ^= sum;
    dest[3] ^= sum;
}

static inline void ny(
        word_t dest[4],
        const word_t x[4])
{
    word_t sum;
    dest[0] = rotl(PI_NY_CONST_0 + x[0] + x[2] + x[3], PI_NY_ROT_CONST_0 );
    dest[1] = rotl(PI_NY_CONST_1 + x[1] + x[2] + x[3], PI_NY_ROT_CONST_1 );
    dest[2] = rotl(PI_NY_CONST_2 + x[0] + x[1] + x[2], PI_NY_ROT_CONST_2 );
    dest[3] = rotl(PI_NY_CONST_3 + x[0] + x[1] + x[3], PI_NY_ROT_CONST_3 );
    sum = dest[0] ^ dest[1] ^ dest[2] ^ dest[3];
    dest[0] ^= sum;
    dest[1] ^= sum;
    dest[2] ^= sum;
    dest[3] ^= sum;
}

static const word_t pi_const[8][4] = PI_CONST;

static inline void sigma(
        word_t dest[4],
        const word_t x1[4],
        const word_t x2[4] )
{
    dest[3] = x1[2] + x2[0];
    dest[0] = x1[3] + x2[1];
    dest[1] = x1[0] + x2[2];
    dest[2] = x1[1] + x2[3];
}

static void ast(
        word_t dest[4],
        const word_t x[4],
        const word_t y[4] )
{
    word_t a[4], b[4];
    mu(a, x);
    ny(b, y);
    sigma(dest, a, b);
}

static void e1(
        word_t *dest,
        const word_t c[4],
        const word_t *i,
        uint8_t n )
{
    {
        word_t t[4];
        memcpy(t, c, sizeof(word_t) * 4);
        ast(dest, t, i);
    }
    --n;
    do {
        i = &i[4];
        ast(&dest[4], dest, i);
        dest = &dest[4];
    } while (--n);
}

static void e2(
        word_t *dest,
        const word_t c[4],
        const word_t *i,
        uint8_t n )
{
    --n;
    {
        word_t t[4];
        memcpy(t, c, sizeof(word_t) * 4);
        ast(&dest[4 * n], &i[4 * n], t);
    }
    while (n--) {
        ast(&dest[4 * n], &i[4 * n], &dest[4 * (n + 1)]);
    }
}

static void pi(
        word_t *a )
{
    uint8_t r = PI_ROUNDS;
    word_t t[4 * 4];
    const word_t *c = (const word_t *)pi_const;
    do {
        e1(t, c, a, 4);
        c = &c[4];
        e2(a, c, t, 4);
        c = &c[4];
    } while (--r);
}

static void add_tag(
        PI_CTX *ctx,
        state_t a )
{
    uint8_t i;
    i = 3;
    do {
        ctx->tag[i + 0] += a[0][i];
        ctx->tag[i + 4] += a[2][i];
    } while(i--);
}

static void ctr_trans(
        const PI_CTX *ctx,
        state_t a,
        unsigned long ctr )
{
    uint64_t t;
    int i;
    if ((void *)ctx->cis != (void *)a) {
        memcpy(a, ctx->cis, sizeof(state_t));
    }
    t = ctx->ctr + ctr;
    for (i = 0; i * PI_WORD_SIZE < 64; ++i) {
    	a[0][i] ^= (word_t)t;
#  if PI_WORD_SIZE < 64
    	t >>= PI_WORD_SIZE;
#  endif
    }

    pi((word_t*)a);
}

static void inject_tag(
        state_t a,
        const word_t x[8] )
{
	int i;
	for (i = 0; i < 4; ++i) {
	    a[0][i] ^= x[i];
	}
	for (; i < 8; ++i) {
	    a[2][i - 4] ^= x[i];
	}
}

static void extract_block(
        void *block,
        state_t a)
{
	int i;
	for (i = 0; i < 4; ++i) {
		store_word_little(&((word_t *)block)[i], a[0][i]);
	}
	for (; i < 8; ++i) {
		store_word_little(&((word_t *)block)[i], a[2][i - 4]);
	}
}

static void inject_block(
        state_t a,
        const void *block )
{
	word_t x;
	int i;
	for (i = 0; i < 4; ++i) {
		x = load_word_little(&((const word_t *)block)[i]);
	    a[0][i] ^= x;
	}
	for (; i < 8; ++i) {
		x = load_word_little(&((const word_t *)block)[i]);
	    a[2][i - 4] ^= x;
	}
}

static void inject_last_block(
        state_t a,
        const void *block,
        size_t length_B )
{
    uint8_t t[PI_RATE_BYTES];
    if (length_B >= PI_RATE_BYTES) {
        /* error */
    	printf("ERROR <%s %s %d>\n", __FILE__, __func__, __LINE__);
        return;
    }
    memset(t, 0, sizeof(t));
    memcpy(t, block, length_B);
    t[length_B] = 1;
    inject_block(a, t);
}

static void replace_block(
        state_t a,
        const void *block )
{
	word_t x;
	int i;
	for (i = 0; i < 4; ++i) {
		x = load_word_little(&((const word_t *)block)[i]);
	    a[0][i] = x;
	}
	for (; i < 8; ++i) {
		x = load_word_little(&((const word_t *)block)[i]);
	    a[2][i - 4] = x;
	}
}

static void replace_last_block(
        state_t a,
        const void *block,
        size_t length_B  )
{
    uint8_t t[PI_RATE_BYTES];
    if (length_B >= PI_RATE_BYTES) {
        /* error */
    	printf("ERROR <%s %s %d>\n", __FILE__, __func__, __LINE__);
        return;
    }
    extract_block(t, a);
    memcpy(t, block, length_B);
    replace_block(a, t);
}


int PI_INIT(
        PI_CTX *ctx,
        const void *key,
        size_t key_length_B,
        const void *pmn,
        size_t pmn_length_B)
{
	int i;
	uint8_t setup_buf[PI_IS_BITS / 8];
    if (key_length_B + pmn_length_B + 1 >= PI_IS_BITS / 8) {
        return -1;
    }
    memset(ctx->tag, 0, sizeof(ctx->tag));
    memset(setup_buf, 0, sizeof(setup_buf));
    memcpy(setup_buf, key, key_length_B);
    memcpy(&setup_buf[key_length_B], pmn, pmn_length_B);
    setup_buf[key_length_B + pmn_length_B] = 1;
    for (i = 0; i < 16; ++i) {
        ctx->cis[i / 4][i % 4] = load_word_little(&setup_buf[i * PI_WORD_SIZE / 8]);
    }
    pi((word_t*)ctx->cis);
    ctx->ctr = 0;
    for (i = 0; i * PI_WORD_SIZE < 64; ++i) {
		ctx->ctr |= (uint64_t)ctx->cis[1][i] << (i * PI_WORD_SIZE);
	}
    return 0;
}

void PI_PROCESS_AD_BLOCK(
        PI_CTX *ctx,
        const void *ad,
        unsigned long ad_num )
{
    state_t a;
    ctr_trans(ctx, a, ad_num);
    inject_block(a, ad);
    pi((word_t*)a);
    add_tag(ctx, a);
}

void PI_PROCESS_AD_LAST_BLOCK(
        PI_CTX *ctx,
        const void *ad,
        size_t ad_length_B,
        unsigned long ad_num )
{
    state_t a;
    while (ad_length_B >= PI_AD_BLOCK_LENGTH_BYTES) {
        PI_PROCESS_AD_BLOCK(ctx, ad, ad_num);
        ad_num++;
        ad_length_B -= PI_AD_BLOCK_LENGTH_BYTES;
        ad = &((uint8_t*)ad)[PI_AD_BLOCK_LENGTH_BYTES];
    }

    ctr_trans(ctx, a, ad_num);
    inject_last_block(a, ad, ad_length_B);
    pi((word_t*)a);
    add_tag(ctx, a);
    ctx->ctr += ad_num;
    inject_tag(ctx->cis, ctx->tag);
    pi((word_t*)ctx->cis);
}

void PI_ENCRYPT_SMN(
        PI_CTX *ctx,
        void *c0,
        const void *smn)
{
    ctx->ctr++;
    ctr_trans(ctx, ctx->cis, 0);
    inject_block(ctx->cis, smn);
    if (c0) {
        extract_block(c0, ctx->cis);
    }
    pi((word_t*)ctx->cis);
    add_tag(ctx, ctx->cis);
}

void PI_DECRYPT_SMN(
        PI_CTX *ctx,
        void *smn,
        const void *c0)
{
    ctx->ctr++;
    ctr_trans(ctx, ctx->cis, 0);
    inject_block(ctx->cis, c0);
    if (smn) {
        extract_block(smn, ctx->cis);
    }
    replace_block(ctx->cis, c0);
    pi((word_t*)ctx->cis);
    add_tag(ctx, ctx->cis);
}

void PI_ENCRYPT_BLOCK(
        PI_CTX *ctx,
        void *dest,
        const void *src,
        unsigned long num )
{
    state_t a;
    ctr_trans(ctx, a, num);
    inject_block(a, src);
    if (dest) {
        extract_block(dest, a);
    }
    pi((word_t*)a);
    add_tag(ctx, a);
}

void PI_ENCRYPT_LAST_BLOCK(
        PI_CTX *ctx,
        void *dest,
        const void *src,
        size_t length_B,
        unsigned long num )
{
    state_t a;
    while (length_B >= PI_PT_BLOCK_LENGTH_BYTES) {
        PI_ENCRYPT_BLOCK(ctx, dest, src, num);
        num++;
        length_B -= PI_PT_BLOCK_LENGTH_BYTES;
        src = &((uint8_t*)src)[PI_PT_BLOCK_LENGTH_BYTES];
        if (dest) {
            dest = &((uint8_t*)dest)[PI_CT_BLOCK_LENGTH_BYTES];
        }
    }
    ctr_trans(ctx, a, num);
    inject_last_block(a, src, length_B);
    if (dest) {
        uint8_t tmp[PI_PT_BLOCK_LENGTH_BYTES];
        extract_block(tmp, a);
        memcpy(dest, tmp, length_B);
    }
    pi((word_t*)a);
    add_tag(ctx, a);
}

void PI_EXTRACT_TAG(
        PI_CTX *ctx,
        void *dest )
{
	uint8_t buf[8 * PI_WORD_SIZE / 8];
	int i;
	for (i = 0; i < 8; ++i) {
		store_word_little(&buf[i * PI_WORD_SIZE / 8], ctx->tag[i]);
	}
    memcpy(dest, buf, PI_TAG_BYTES);
}

void PI_DECRYPT_BLOCK(
        PI_CTX *ctx,
        void *dest,
        const void *src,
        unsigned long num )
{
    state_t a;
    ctr_trans(ctx, a, num);
    inject_block(a, src);
    if (dest) {
        extract_block(dest, a);
    }
    replace_block(a, src);
    pi((word_t*)a);
    add_tag(ctx, a);
}

#define GET_BIT(buf, addr) ((((uint8_t*)(buf))[(addr) / 8] >> (addr & 7)) & 1)

void PI_DECRYPT_LAST_BLOCK(
        PI_CTX *ctx,
        void *dest,
        const void *src,
        size_t length_B,
        unsigned long num )
{
    state_t a;
    ctr_trans(ctx, a, num);
    inject_last_block(a, src, length_B);
    if (dest) {
    	uint8_t tmp[PI_PT_BLOCK_LENGTH_BYTES];
        extract_block(tmp, a);
        memcpy(dest, tmp, length_B);
    }
    replace_last_block(a, src, length_B);
    pi((word_t*)a);
    add_tag(ctx, a);
}

void PI_ENCRYPT_SIMPLE(
        void *cipher,
        size_t *cipher_len_B,
        const void *msg,
        size_t msg_len_B,
        const void *ad,
        size_t ad_len_B,
        const void *nonce_secret,
        const void *nonce_public,
        size_t nonce_public_len_B,
        const void *key,
        size_t key_len_B
        )
{
    unsigned i;
    PI_CTX ctx;
    if (PI_INIT(&ctx, key, key_len_B, nonce_public, nonce_public_len_B)) {
        printf("ERROR! <%s %s %d>\n", __FILE__, __func__, __LINE__);
        return;
    }
    i = 1;
    while (ad_len_B >= PI_AD_BLOCK_LENGTH_BYTES) {
        PI_PROCESS_AD_BLOCK(&ctx, ad, i++);
        ad_len_B -= PI_AD_BLOCK_LENGTH_BYTES;
        ad = &((const uint8_t*)ad)[PI_AD_BLOCK_LENGTH_BYTES];
    }
    PI_PROCESS_AD_LAST_BLOCK(&ctx, ad, ad_len_B, i);
    *cipher_len_B = 0;
    if (nonce_secret) {
        PI_ENCRYPT_SMN(&ctx, cipher, nonce_secret);
        *cipher_len_B += PI_CT_BLOCK_LENGTH_BYTES;
        cipher = &((uint8_t*)cipher)[PI_CT_BLOCK_LENGTH_BYTES];
    }
    i = 1;
    while (msg_len_B >= PI_PT_BLOCK_LENGTH_BYTES) {
        PI_ENCRYPT_BLOCK(&ctx, cipher, msg, i++);
        msg = &((const uint8_t*)msg)[PI_PT_BLOCK_LENGTH_BYTES];
        cipher = &((uint8_t*)cipher)[PI_CT_BLOCK_LENGTH_BYTES];
        *cipher_len_B += PI_CT_BLOCK_LENGTH_BYTES;
        msg_len_B -= PI_PT_BLOCK_LENGTH_BYTES;
    }
    PI_ENCRYPT_LAST_BLOCK(&ctx, cipher, msg, msg_len_B, i);
    *cipher_len_B += msg_len_B;
    cipher = &((uint8_t*)cipher)[msg_len_B];
    PI_EXTRACT_TAG(&ctx, cipher);
    *cipher_len_B += PI_TAG_BYTES;
}

int PI_DECRYPT_SIMPLE(
        void *msg,
        size_t *msg_len_B,
		void *nonce_secret,
		const void *cipher,
        size_t cipher_len_B,
        const void *ad,
        size_t ad_len_B,
        const void *nonce_public,
        size_t nonce_public_len_B,
        const void *key,
        size_t key_len_B
        )
{
    unsigned i;
    PI_CTX ctx;

    unsigned long clen = cipher_len_B, alen = ad_len_B;
    uint8_t bck_c[clen], bck_ad[alen];
    memcpy(bck_c, cipher, clen);
    memcpy(bck_ad, ad, alen);

    uint8_t tmp_tag[PI_TAG_BYTES];
    if (nonce_secret && (cipher_len_B < PI_CT_BLOCK_LENGTH_BYTES + PI_TAG_BYTES)) {
    	return -3;
    }
    if (PI_INIT(&ctx, key, key_len_B, nonce_public, nonce_public_len_B)) {
        printf("ERROR! <%s %s %d>\n", __FILE__, __func__, __LINE__);
        return -2;
    }
    i = 1;
    while (ad_len_B >= PI_AD_BLOCK_LENGTH_BYTES) {
        PI_PROCESS_AD_BLOCK(&ctx, ad, i++);
        ad_len_B -= PI_AD_BLOCK_LENGTH_BYTES;
        ad = &((const uint8_t*)ad)[PI_AD_BLOCK_LENGTH_BYTES];
    }
    PI_PROCESS_AD_LAST_BLOCK(&ctx, ad, ad_len_B, i);
    *msg_len_B = 0;
    if (nonce_secret) {
        PI_DECRYPT_SMN(&ctx, nonce_secret, cipher);
        cipher_len_B -= PI_CT_BLOCK_LENGTH_BYTES;
        cipher = &((uint8_t*)cipher)[PI_CT_BLOCK_LENGTH_BYTES];
    }
    i = 1;
    while (cipher_len_B - PI_TAG_BYTES >= PI_PT_BLOCK_LENGTH_BYTES) {
        PI_DECRYPT_BLOCK(&ctx, msg, cipher, i++);
        msg = &((uint8_t*)msg)[PI_PT_BLOCK_LENGTH_BYTES];
        cipher = &((uint8_t*)cipher)[PI_CT_BLOCK_LENGTH_BYTES];
        cipher_len_B -= PI_CT_BLOCK_LENGTH_BYTES;
        *msg_len_B += PI_PT_BLOCK_LENGTH_BYTES;
    }
    PI_DECRYPT_LAST_BLOCK(&ctx, msg, cipher, cipher_len_B - PI_TAG_BYTES, i);
    *msg_len_B += cipher_len_B - PI_TAG_BYTES;
    cipher = &((uint8_t*)cipher)[cipher_len_B - PI_TAG_BYTES];
    PI_EXTRACT_TAG(&ctx, tmp_tag);
    if (memcmp(tmp_tag, cipher, PI_TAG_BYTES)) {
#if DEBUG
    	printf("DBG: verification failed: clen = %lu; alen = %lu\n", clen, alen);
    	printf("Key:\n");
    	hexdump_block(key, key_len_B, 4, 16);
    	printf("\nNonce:\n");
    	hexdump_block(nonce_public, nonce_public_len_B, 4, 16);
    	printf("\nAD:\n");
    	hexdump_block(bck_ad, alen, 4, 16);
    	printf("\nCiphertext:\n");
    	hexdump_block(bck_c, clen, 4, 16);
    	printf("\nShould-Tag:\n");
		hexdump_block(cipher, PI_TAG_BYTES, 4, 16);
		printf("\nIS-Tag:\n");
		hexdump_block(tmp_tag, PI_TAG_BYTES, 4, 16);
		puts("");
#endif /* DEBUG */
    	return -1;
    }
    return 0;
}
