#include "api.h"
#include "relic.h"
#include "assert.h"
#include "crypto_dh.h"

#ifndef MAIN
#include "randombytes.h"
#endif

#define SK_BYTES	crypto_dh_curve2251_relic_amd64_clmul_SECRETKEYBYTES
#define PK_BYTES	crypto_dh_curve2251_relic_amd64_clmul_PUBLICKEYBYTES
#define S_BYTES		crypto_dh_curve2251_relic_amd64_clmul_BYTES

extern eb_st gen_tab[];
extern fb_st inv_tab[10][FB_TABLE];

int crypto_dh_keypair(unsigned char *pk, unsigned char *sk) {
	bn_t k, n;
	eb_t p;
	fb_t a, b;
	int l;

	bn_new(k);
	bn_new(n);

	n->used = 4;
	n->dp[0] = 0x00BEF3B9ABB767E1;
	n->dp[1] = 0xF3E3AA131A2E1A82;
	n->dp[2] = 0xFFFFFFFFFFFFFFFF;
	n->dp[3] = 0x01FFFFFFFFFFFFFF;
	k->used = 1;
	k->dp[0] = 4;
	fb_zero(a);
	fb_set_dig(b, 0x2387);

	eb_curve_set_ordin(a, b, &(gen_tab[1]), n, k);

#ifdef MAIN
	rand_bytes(sk, SK_BYTES);
#else
	randombytes(sk, SK_BYTES);
#endif
	bn_read_bin(k, sk, SK_BYTES);
	if (bn_cmp(k, n) != CMP_LT) {
		bn_sub(k, k, n);
	}

	eb_mul_fix(p, (eb_t *)gen_tab, k);
		
	bn_read_raw(k, p->x, FB_DIGS);
	bn_write_bin(pk, PK_BYTES, k);

	bn_free(k);
	bn_free(n);

	return 0;
}

int crypto_dh(unsigned char *s, const unsigned char *pk, const unsigned char *sk) {
	bn_t x;
	eb_t p;

	bn_new(x);

	bn_read_bin(x, (unsigned char *)pk, PK_BYTES);
	bn_write_raw(p->x, FB_DIGS, x);
	fb_set_dig(p->z, 1);

	bn_read_bin(x, (unsigned char *)sk, SK_BYTES);
	eb_mul(p, p, x);

	bn_read_raw(x, p->x, FB_DIGS);
	bn_write_bin(s, S_BYTES, x);

	bn_free(x);

	return 0;
}

#ifdef MAIN
int main(int argc, char *argv[]) {
	bn_t k, n;
	eb_t p, q;
	unsigned char pk_a[PK_BYTES], pk_b[PK_BYTES], sk_a[SK_BYTES], sk_b[SK_BYTES], s1[S_BYTES] = { 0 }, s2[S_BYTES] = { 0 };

	bn_new(k);
	bn_new(n);

	core_init();

	crypto_dh_keypair(pk_a, sk_a);
	crypto_dh_keypair(pk_b, sk_b);
	crypto_dh(s1, pk_a, sk_b);
	crypto_dh(s2, pk_b, sk_a);

	assert(memcmp(s1, s2, S_BYTES) == 0);

	for (int i = 0; i < S_BYTES; i++) {
		printf("%02X ", s1[i]);
	}
	printf("\n");
	for (int i = 0; i < S_BYTES; i++) {
		printf("%02X ", s2[i]);
	}
	printf("\n");

	eb_curve_get_ord(n);
	eb_curve_get_gen(p);

	BENCH_BEGIN("eb_mul_fix") {
		bn_rand(k, BN_POS, bn_bits(n));
		if (bn_cmp(k, n) != CMP_LT) {
			bn_sub(k, k, n);
		}
		BENCH_ADD(eb_mul_fix(p, (eb_t *)gen_tab, k));
	} BENCH_END;

	BENCH_BEGIN("eb_mul") {
		bn_rand(k, BN_POS, bn_bits(n));
		if (bn_cmp(k, n) != CMP_LT) {
			bn_sub(k, k, n);
		}
		BENCH_ADD(eb_mul(q, p, k));
	} BENCH_END;

	core_clean();

	return 0;
}
#endif
