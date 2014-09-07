/**
 * The implementation of the omdsha512 mode
 *
 * Notes to implementation:
 *
 * 1) OMD parameters
 *   In the specification of OMD, following parameters are defined:
 *       - key length k
 *       - nonce length |N|
 *       - tag length tau
 *       - length of the message block m
 *       - length of the chaining block n
 *
 *   In the specification, all of these parameters indicate lengths of
 *   corresponding components of OMD in *bits*.
 *   The CAESAR api is Byte-oriented, i.e. all the inputs and ouptuts of
 *   encryption and decryption algorithms have bit-length, that is always
 *   a multiple of 8.
 *   Therefore, in this implementation of OMD, the parameters mentioned
 *   above indicate length of corresponding components of OMD in *Bytes*.
 *   Comming hand to hand with this, this implementation only handles
 *   inputs with bitlength that is always a multiple of 8!
 *
 *   Sticking with bit-lengths instead of Byte-lengths would add sensless
 *   computational overhead (in software) and worsen readability of code.
 *
 * 2) Treatment of bit-indexing
 *   In the specification of OMD, the output and input blocks of
 *   compression functions
 *   are treated as atomic, e.g. the chaining block H in sha512
 *   compression function
 *   is considered to be a block of 512 bits. However, when implementing
 *   the scheme,
 *   these big blocks have to be represented by arrays of smaller units
 *   (e.g. Bytes).
 *   In this implementation, we treat the representations of such arrays
 *   in following
 *   manner:
 * <center>
 * <table>
 *  <tr>
 *   <th>Bits in block</th>
 *   <td>255</td>
 *   <td>254</td>
 *   <td>253</td>
 *   <td>252</td>
 *   <td>251</td>
 *   <td>250</td>
 *   <td>249</td>
 *   <td>248</td>
 *   <td>247</td>
 *   <td>...</td>
 *   <td>7</td>
 *   <td>6</td>
 *   <td>5</td>
 *   <td>4</td>
 *   <td>3</td>
 *   <td>2</td>
 *   <td>1</td>
 *   <td>0</td>
 *  </tr>
 *  <tr>
 *   <th>Bits in bytes</th>
 *   <td>7</td>
 *   <td>6</td>
 *   <td>5</td>
 *   <td>4</td>
 *   <td>3</td>
 *   <td>2</td>
 *   <td>1</td>
 *   <td>0</td>
 *   <td colspan=2>7 ...</td>
 *   <td>7</td>
 *   <td>6</td>
 *   <td>5</td>
 *   <td>4</td>
 *   <td>3</td>
 *   <td>2</td>
 *   <td>1</td>
 *   <td>0</td>
 *  </tr>
 *  <tr>
 *   <th> Byte index</th>
 *   <td colspan=8><center>0</center></td>
 *   <td colspan=2><center>1...</center></td>
 *   <td colspan=8><center>31</center></td>
 *  </tr>
 * </table>
 * </center>
 *
 * 3) Computing the L values
 *   The specification of OMD states, that the values L*, L[i] i=0,1..
 *   can either be
 *   precomputed and stored, or computed on the fly. In this implementation,
 *   the L values are *computed on the fly*.
 *
 * @file omdsha512.h
 * @author Simon Cogliani <simon.cogliani@gmail.com>
 * @author Damian Vizar <damian.vizar@epfl.ch>
 */
#ifndef __SHA512OMD_H__
#define __SHA512OMD_H__

#include "omd_api.h"
#include <string.h>
#include <inttypes.h>

#define SHA512_DIGEST_LENGTH 64 
typedef uint8_t hashblock[SHA512_DIGEST_LENGTH]; 
typedef uint8_t messageblock[128]; // 2*SHA512_DIGEST_LENGTH = 128 
                             
#define CHAR2UINT64(hash, digest) \
    memset(digest+0, 0, SHA512_DIGEST_LENGTH); \
    int c = 0; \
    for(; c < 64; c +=8){ \
        digest[c/8] |= (uint64_t)(hash[c]) << 56; \
        digest[c/8] |= (uint64_t)(hash[c+1]) << 48; \
        digest[c/8] |= (uint64_t)(hash[c+2]) << 40; \
        digest[c/8] |= (uint64_t)(hash[c+3]) << 32; \
        digest[c/8] |= (uint64_t)(hash[c+4]) << 24; \
        digest[c/8] |= (uint64_t)(hash[c+5]) << 16; \
        digest[c/8] |= (uint64_t)(hash[c+6]) << 8; \
        digest[c/8] |= (uint64_t)(hash[c+7]); \
    } 
                             
#define UINT642CHAR(hash, digest) \
    c = 0; \
    for(; c < 64; c +=8){ \
        hash[c] = digest[c/8] >> 56; \
        hash[c+1] = digest[c/8] >> 48; \
        hash[c+2] = digest[c/8] >> 40; \
        hash[c+3] = digest[c/8] >> 32; \
        hash[c+4] = digest[c/8] >> 24; \
        hash[c+5] = digest[c/8] >> 16; \
        hash[c+6] = digest[c/8] >> 8; \
        hash[c+7] = digest[c/8]; \
    } 
 
#include <stdint.h> 
#include "sha512_avx1.h" 
extern void sha512_avx(const void* M, void* D, uint64_t L); 
                             
union Hash { 
    uint64_t digest[8]; 
    hashblock hash; 
} Hash; 
                             
#define OMD_COMP(res, hash, glue)({\
    CHAR2UINT64(hash, Hash.digest) \
    sha512_avx((void*)glue, Hash.digest, 1); \
    UINT642CHAR(res, Hash.digest) \
}) 


#define OMD_n SHA512_DIGEST_LENGTH /**< Byte-length of the chaining block */
#define OMD_m SHA512_DIGEST_LENGTH /**< Byte-length of the message block  */

#define OMD_tau CRYPTO_ABYTES           /**< Byte-length of the tag   */
#define OMD_k CRYPTO_KEYBYTES           /**< Byte-length of the key   */
#define OMD_lnonce CRYPTO_NPUBBYTES     /**< Byte-length of the nonce */

/**
 * Constant zero message block - used multiple times
 */
static const messageblock block0s = {
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0
};

/**
 * key
 */
__attribute__((unused)) static hashblock key_initial = {0x00};

/**
 * size of precomputed L values
 */
__attribute__((unused)) static uint32_t OMD_L_size = 0;

/**
 * lstar - with initial values for key = {0x00}
 */
__attribute__((unused)) static hashblock lstar[3] =
{
    {0xad,0x3a,0x5d,0xa8,0x38,0xeb,0xf8,0x30,0x5d,0x71,0x42,0xff,0x85,0xfc,0xbe,0xdb,
        0x7f,0xa8,0xbf,0x86,0xd6,0xf7,0xca,0x99,0x1c,0x6b,0x15,0xb0,0x39,0xd7,0x0b,0xbf,
        0x29,0xf6,0x51,0x52,0x89,0x92,0x35,0x18,0x6f,0xd7,0x10,0x1d,0x5f,0x2e,0x8f,0x3a,
        0x1c,0x35,0x8d,0x24,0x76,0x53,0x14,0x50,0x56,0x8c,0x0d,0x99,0xd7,0x56,0xdc,0x3c},
    {0x5a,0x74,0xbb,0x50,0x71,0xd7,0xf0,0x60,0xba,0xe2,0x85,0xff,0x0b,0xf9,0x7d,0xb6,
        0xff,0x51,0x7f,0x0d,0xad,0xef,0x95,0x32,0x38,0xd6,0x2b,0x60,0x73,0xae,0x17,0x7e,
        0x53,0xec,0xa2,0xa5,0x13,0x24,0x6a,0x30,0xdf,0xae,0x20,0x3a,0xbe,0x5d,0x1e,0x74,
        0x38,0x6b,0x1a,0x48,0xec,0xa6,0x28,0xa0,0xad,0x18,0x1b,0x33,0xae,0xad,0xb9,0x5d},
    {0xf7,0x4e,0xe6,0xf8,0x49,0x3c,0x08,0x50,0xe7,0x93,0xc7,0x00,0x8e,0x05,0xc3,0x6d,
        0x80,0xf9,0xc0,0x8b,0x7b,0x18,0x5f,0xab,0x24,0xbd,0x3e,0xd0,0x4a,0x79,0x1c,0xc1,
        0x7a,0x1a,0xf3,0xf7,0x9a,0xb6,0x5f,0x28,0xb0,0x79,0x30,0x27,0xe1,0x73,0x91,0x4e,
        0x24,0x5e,0x97,0x6c,0x9a,0xf5,0x3c,0xf0,0xfb,0x94,0x16,0xaa,0x79,0xfb,0x65,0x61}
};

/**
 * L
 */
__attribute__((unused)) static hashblock L[64] =
{
    {0xb4,0xe9,0x76,0xa0,0xe3,0xaf,0xe0,0xc1,0x75,0xc5,0x0b,0xfe,0x17,0xf2,0xfb,0x6d,
        0xfe,0xa2,0xfe,0x1b,0x5b,0xdf,0x2a,0x64,0x71,0xac,0x56,0xc0,0xe7,0x5c,0x2e,0xfc,
        0xa7,0xd9,0x45,0x4a,0x26,0x48,0xd4,0x61,0xbf,0x5c,0x40,0x75,0x7c,0xba,0x3c,0xe8,
        0x70,0xd6,0x34,0x91,0xd9,0x4c,0x51,0x41,0x5a,0x30,0x36,0x67,0x5d,0x5b,0x72,0xba},
    {0x00}
};

/**
 * L
 */
__attribute__((unused)) static int64_t log2l[64][2] =
{
    { 0,                   1}, { 1,                   2}, { 2,                   4}, { 3,                   8},
    { 4,                  16}, { 5,                  32}, { 6,                  64}, { 7,                 128},
    { 8,                 256}, { 9,                 512}, {10,                1024}, {11,                2048},
    {12,                4096}, {13,                8192}, {14,               16384}, {15,               32768},
    {16,               65536}, {17,              131072}, {18,              262144}, {19,              524288},
    {20,             1048576}, {21,             2097152}, {22,             4194304}, {23,             8388608},
    {24,            16777216}, {25,            33554432}, {26,            67108864}, {27,           134217728},
    {28,           268435456}, {29,           536870912}, {30,          1073741824}, {31,          2147483648},
    {32,          4294967296}, {33,          8589934592}, {34,         17179869184}, {35,         34359738368},
    {36,         68719476736}, {37,        137438953472}, {38,        274877906944}, {39,        549755813888},
    {40,       1099511627776}, {41,       2199023255552}, {42,       4398046511104}, {43,       8796093022208},
    {44,      17592186044416}, {45,      35184372088832}, {46,      70368744177664}, {47,     140737488355328},
    {48,     281474976710656}, {49,     562949953421312}, {50,    1125899906842624}, {51,    2251799813685248},
    {52,    4503599627370496}, {53,    9007199254740992}, {54,   18014398509481984}, {55,   36028797018963968},
    {56,   72057594037927936}, {57,  144115188075855872}, {58,  288230376151711744}, {59,  576460752303423488},
    {60, 1152921504606846976}, {61, 2305843009213693952}, {62, 4611686018427387904}, {63, 0}
};

/**
 * Flags to identify sort of cryptographic process
 */
enum mode
{
   OMD_ENCRYPT, /**< Encrypting process */
   OMD_DECRYPT  /**< Decrypting process */
};

/**
 * The XOR operation
 * @param res The result of the computation
 * @param in1 The left operand
 * @param in2 The right operand
 */
void
xor_block (hashblock res, const hashblock in1, const hashblock in2);

/**
 * Computes in \f$GF(2^{512})[X]/(X^{512} + X^8 + X^5 + X^2 + 1)\f$ a.X
 * where a is in the finite field
 * @param res The result of the computation
 * @param in a polynomial in \f$GF(2^{512})[X]/(X^{512} + X^8 + X^5 + X^2
 *        + 1)\f$
 */
void
double_block (hashblock res, const hashblock in);

/**
 * Computes in \f$GF(2^{512})[X]/(X^{512} + X^8 + X^5 + X^2 + 1)\f$
 * a.(X+1) where a is in the finite field
 * @param res The result of the computation
 * @param in a polynomial in \f$GF(2^{512})[X]/(X^{512} + X^8 + X^5 + X^2
 *        + 1)\f$
 */
void
triple_block (hashblock res, const hashblock in);

/**
 * We define \f$F_{K}(H, M) = F(H, K || M)\f$
 * @param res The output
 * @param hash The chaining input
 * @param key The key
 * @param message The message input
 */
void
key_func (hashblock res, const hashblock hash, const hashblock key,
	  const hashblock message);

/**
 * Computes the number of trailing zeros
 * @param i The input whose ntz we want
 */
extern int
ntz (int i);

/**
 * Hash function for processing associated data
 * @param taga The output tag
 * @param key The secret key
 * @param ad A pointer to associated data
 * @param adlen Length of associated data in Bytes
 */
void
hash (hashblock taga, const hashblock key, const uint8_t *ad,
      uint64_t adlen);

/**
 * The SHA-512-OMD encrypt/decrypt function
 * @param data A pointer to output buffer
 * @param key The secret key
 * @param k Key length in Bytes
 * @param data_process A pointer to the data that is to be processed
 *        - the interpretation depends on the encrypting flag
 * @param data_processlen Length of input data in Bytes
 * @param ad A pointer to associated data
 * @param adlen Length of associated data in Bytes
 * @param nonce A pointer to the nonce
 * @param lnonce Nonce length in Bytes
 * @param tau Tag length in Bytes
 * @param encrypting A flag to select encryption/decryption
 */
int
omdsha512_process(uint8_t *data, const uint8_t* key,
		  const uint8_t *data_process,
		  uint64_t data_processlen,
		  const uint8_t *ad, uint64_t adlen,
		  const uint8_t *nonce,
		  const enum mode encrypting);

#endif /* not __SHA512OMD_H__ */
