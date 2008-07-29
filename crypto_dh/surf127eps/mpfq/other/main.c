#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <assert.h>
#include "sizes.h"

#define HAS_microseconds

typedef unsigned char uchar;
typedef unsigned long long ullong;

// proto of exported functions:
extern int keypair(uchar *sk, ullong *sklen,
        uchar *pk, ullong *pklen);

static inline uint64_t microseconds()
{
    struct rusage res[1];
    getrusage(RUSAGE_SELF,res);
    uint64_t r;
    r  = (uint64_t) res->ru_utime.tv_sec;
    r *= (uint64_t) 1000000UL;
    r += (uint64_t) res->ru_utime.tv_usec;
    return r;
}

/* Read the number of megahertz on a linux computer */
double mhz()
{
    char line[512];
    FILE * f = fopen("/proc/cpuinfo","r");
    double res = 0;
    if (f == NULL)
        return 0;
    while (fgets(line, sizeof(line), f) != NULL) {
        if (sscanf(line, "cpu MHz         : %lf", &res) == 1) {
            break;
        }
    }
    fclose(f);
    return res;
}

#define NREPS   10000

int main()
{
    unsigned char skey1[SECRETKEY_BYTES];
    unsigned char pkey1[PUBLICKEY_BYTES];
    ullong sklen1, pklen1;
    unsigned char skey2[SECRETKEY_BYTES];
    unsigned char pkey2[PUBLICKEY_BYTES];
    ullong sklen2, pklen2;
    uchar key1[SHAREDSECRET_BYTES];
    uchar key2[SHAREDSECRET_BYTES];
    ullong klen1, klen2;

    uint64_t r0,r1;
    int i;

    double mhz0, mhz1;
    double delta;

    for(i = 0 ; i < 20 ; i++) {
        keypair(skey1, &sklen1, pkey1, &pklen1);
        keypair(skey2, &sklen2, pkey2, &pklen2);

        sharedsecret(key1, &klen1, skey1, sklen1, pkey2, pklen2);
        sharedsecret(key2, &klen2, skey2, sklen2, pkey1, pklen1);

        if (klen1 != klen2) abort();
        if (memcmp(key1, key2, klen1) != 0) abort();
    }
    printf("%d tests ok \n", i);
restart:
    r0 = microseconds();
    mhz0 = mhz();
    if (mhz0 > 0) {
        printf("CPU freq : %.2f MHz\n", mhz0);
    }
    for(i = 0 ; i < NREPS ; i++) {
        keypair(skey1, &sklen1, pkey1, &pklen1);
    }
    r1 = microseconds();
    mhz1 = mhz();

    if (mhz0 != mhz1) {
        printf("CPU freq changed, restarting\n");
        goto restart;
    }

    delta = (double) (r1-r0)/1000;

    printf("%d in %.2f ms\n", i, delta);
    if (mhz1 != 0) {
        printf("%d cycles on average\n", (int) (delta * mhz0 * 1000 / i));
    }

    return 0;
}




