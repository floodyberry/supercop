/*
20140917
Jan Mojzis
Public domain.
*/

#include "cleanup.h"
#include "gep256.h"
#include "crypto_scalarmult.h"

int crypto_scalarmult(unsigned char *q, const unsigned char *n, const unsigned char *p) {

    gep256 pp, qq;
    long long i;
    int ret = -1;

    if (gep256_frombytes(pp, p) != 0) goto fail;
    gep256_scalarmult(qq, pp, n);
    if (gep256_tobytes(q, qq) != 0) goto fail;
    ret = 0;
    goto cleanup;

fail:
    for (i = 0; i < 64; ++i) q[i] = 0;

cleanup:
    cleanup(pp); cleanup(qq);
    return ret;
}

int crypto_scalarmult_base(unsigned char *q, const unsigned char *n) {

    gep256 qq;
    long long i;
    int ret = -1;

    gep256_scalarmult_base(qq, n);
    if (gep256_tobytes(q, qq) == 0) ret = 0;

    cleanup(qq);
    return ret;
}
