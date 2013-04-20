/*
 * File:   lattisigns512-20130329/crypto_sign.h
 * Author: Gim Güneysu, Tobias Oder, Thomas Pöppelmann, Peter Schwabe
 * Public Domain
 */

#include "api.h"

extern int crypto_sign_keypair(
    unsigned char *,
    unsigned char *
    );

extern int crypto_sign(
    unsigned char *,unsigned long long *,
    const unsigned char *,unsigned long long,
    const unsigned char *
    );

extern int crypto_sign_open(
    unsigned char *,unsigned long long *,
    const unsigned char *,unsigned long long,
    const unsigned char *
    );

int crypto_sign_open_batch(
    unsigned char* const m[],unsigned long long mlen[],
    unsigned char* const sm[],const unsigned long long smlen[],
    unsigned char* const pk[], 
    unsigned long long batchsize
    );

#define crypto_sign_SECRETKEYBYTES CRYPTO_SECRETKEYBYTES
#define crypto_sign_PUBLICKEYBYTES CRYPTO_PUBLICKEYBYTES
#define crypto_sign_BYTES CRYPTO_BYTES
