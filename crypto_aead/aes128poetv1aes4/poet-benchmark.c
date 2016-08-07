/*
// @author Eik List
// @last-modified 2015-08-03
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
#include <stdint.h>
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>

#include "api.h"
#include "poet.h"

// ---------------------------------------------------------------------

#define _Is_X86_            1
#define HI_RES_CLK_OK
#define TIMER_SAMPLE_CNT    10000

#define AD                  NULL
#define ADLEN               0
#define NSEC                NULL
#define NUM_MESSAGE_LENGTHS 25
#define MAX_BUFFER_LEN      65536

static const uint32_t MESSAGE_LENGTHS[NUM_MESSAGE_LENGTHS] = {
    8, 16, 24, 32, 48, 64, 96, 128, 
    192, 256, 384, 512, 768, 1024, 1536, 2048, 
    3072, 4096, 6144, 8192, 12288, 16384, 24576, 32768, 65536
};
#define MIN_CONT_MSG_LEN    4
#define MAX_CONT_MSG_LEN    1024

#if __GNUC__
#define ALIGN(n)      __attribute__ ((aligned(n)))
#elif _MSC_VER
#define ALIGN(n)      __declspec(align(n))
#else
#define ALIGN(n)
#endif

// ---------------------------------------------------------------------

#ifdef BENCH_ENC_ONLY
    #define ENCRYPT_FN(m, c, mlen, t, ctx) encrypt_final(ctx, m, mlen, c, t)
    #define DECRYPT_FN(m, c, clen, t, ctx) decrypt_final(ctx, c, clen, t, m)
#else
    extern int crypto_aead_encrypt(unsigned char *c, unsigned long long *clen,
                                   const unsigned char *m, unsigned long long mlen,
                                   const unsigned char *ad, unsigned long long adlen,
                                   const unsigned char *nsec,
                                   const unsigned char *npub,
                                   const unsigned char *k);

    extern int crypto_aead_decrypt(unsigned char *m, unsigned long long *mlen,
                                   unsigned char *nsec,
                                   const unsigned char *c, unsigned long long clen,
                                   const unsigned char *ad, unsigned long long adlen,
                                   const unsigned char *npub,
                                   const unsigned char *k);

    #define ENCRYPT_FN(m, c, mlen, clen, npub, k) crypto_aead_encrypt(c, &clen, m, mlen, AD, ADLEN, NSEC, npub, k)
    #define DECRYPT_FN(m, c, mlen, clen, npub, k) crypto_aead_decrypt(m, &mlen, NSEC, c, clen, AD, ADLEN, npub, k)
#endif

// ---------------------------------------------------------------------

#ifdef BENCH_DECRYPT
    #define TEST_FN DECRYPT_FN
#else
    #define TEST_FN ENCRYPT_FN
#endif

// ---------------------------------------------------------------------

/**
 * Quicksort comparison
 */
static int compare_doubles(const void *aPtr, const void *bPtr)
{
    double a = *((double*) aPtr);
    double b = *((double*) bPtr);

    if (a > b) return  1;
    if (a < b) return -1;
    return 0;
}

// ---------------------------------------------------------------------

static uint64_t get_time()
{
    uint64_t x[2];
    __asm__ volatile("rdtsc" : "=a"(x[0]), "=d"(x[1]));
    return x[0];
}

// ---------------------------------------------------------------------

/**
 * Measures the overhead for measuring time.
 */
static uint64_t calibrate_timer()
{
    // big number to start
    uint64_t dtMin = 0xFFFFFFFFL; 
    uint64_t t0, t1;
    int i;

    for (i = 0; i < TIMER_SAMPLE_CNT; ++i) {
        t0 = get_time();
        t1 = get_time();

        if (dtMin > t1 - t0) {
            dtMin = t1 - t0;
        }
    }

    return dtMin;
}

// ---------------------------------------------------------------------

static int benchmark(const uint32_t num_iterations)
{
    ALIGN(16) uint8_t key[CRYPTO_KEYBYTES];
    ALIGN(16) uint8_t m[MAX_BUFFER_LEN];
    unsigned long long mlen;
    unsigned long long clen;
    memset(key, 0x00, CRYPTO_KEYBYTES);

    #ifdef BENCH_ENC_ONLY
    ALIGN(16) uint8_t c[MAX_BUFFER_LEN];
    ALIGN(16) uint8_t tag[CRYPTO_ABYTES];

    poet_ctx_t ctx;
    keysetup(&ctx, key);
    #else
    ALIGN(16) uint8_t npub[CRYPTO_NPUBBYTES];
    ALIGN(16) uint8_t c[MAX_BUFFER_LEN+CRYPTO_ABYTES];
    #endif

    const uint64_t calibration = calibrate_timer();
    uint64_t t0, t1;
    uint32_t i, j;

    puts("#mlen cpb");

    // Warm up
    for (j = 0; j < NUM_MESSAGE_LENGTHS; ++j) {
        for (i = 0; i < num_iterations / 4; ++i) {
            mlen = MESSAGE_LENGTHS[j];
            clen = MESSAGE_LENGTHS[j] + CRYPTO_ABYTES;

            #ifdef BENCH_ENC_ONLY
            TEST_FN(m, c, mlen, tag, &ctx);
            #else
            TEST_FN(m, c, mlen, clen, npub, key);
            #endif
        }
    }

    double timings[num_iterations];
    const uint32_t median = num_iterations / 2;
    // To load the timing code into the instruction cache
    get_time(); 

    #ifdef BENCH_FINE_GRAINED
    for (j = MIN_CONT_MSG_LEN; j < MAX_CONT_MSG_LEN; ++j) {
        mlen = j;
        clen = j + CRYPTO_ABYTES;

        t0 = get_time();
        t1 = get_time();

        for (i = 0; i < num_iterations; ++i) {
            t0 = get_time();
            
            #ifdef BENCH_ENC_ONLY
            TEST_FN(m, c, mlen, tag, &ctx);
            #else
            TEST_FN(m, c, mlen, clen, npub, key);
            #endif

            t1 = get_time();
            timings[i] = (double)(t1 - t0 - calibration) / j;
        }

        // Sort the measurements and print the median
        qsort(timings, num_iterations, sizeof(double), compare_doubles);
        printf("%5d %4.2lf \n", j, timings[median]);
    }
    #endif

    for (j = 0; j < NUM_MESSAGE_LENGTHS; ++j) {
        mlen = MESSAGE_LENGTHS[j];
        clen = MESSAGE_LENGTHS[j] + CRYPTO_ABYTES;

        t0 = get_time();
        t1 = get_time();

        for (i = 0; i < num_iterations; ++i) {
            t0 = get_time();
            
            #ifdef BENCH_ENC_ONLY
            TEST_FN(m, c, mlen, tag, &ctx);
            #else
            TEST_FN(m, c, mlen, clen, npub, key);
            #endif

            t1 = get_time();
            timings[i] = (double)(t1 - t0 - calibration) / MESSAGE_LENGTHS[j];
        }
        
        // Sort the measurements and print the median
        qsort(timings, num_iterations, sizeof(double), compare_doubles);
        printf("%5d %4.2lf \n", MESSAGE_LENGTHS[j], timings[median]);
    }

    return 0;
}

// ---------------------------------------------------------------------

int main()
{
    int result = benchmark(TIMER_SAMPLE_CNT);
    return result;
}
