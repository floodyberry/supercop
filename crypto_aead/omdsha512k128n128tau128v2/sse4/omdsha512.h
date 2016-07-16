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
#include "sha512_sse4.h" 
extern void sha512_sse4(const void* M, void* D, uint64_t L); 
                             
union Hash { 
    uint64_t digest[8]; 
    hashblock hash; 
} Hash; 
                             
#define OMD_COMP(res, hash, glue)({\
    CHAR2UINT64(hash, Hash.digest) \
    sha512_sse4((void*)glue, Hash.digest, 1); \
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


#ifndef OMD_PRECOMP 
#define OMD_PRECOMP

#define LCOUNT 25

/* Delta updating macros */
#define  NEXTDEL(Delta,i) xor_block(Delta,Delta,L[ntz(i)]);

#define LASTDELA(Delta)   xor_block(Delta,Delta,Lstar);

#define LASTDELM1(Delta)   double_block(Lstar_tmp,Lstar);\
						  xor_block(Delta,Delta,Lstar_tmp);

#define LASTDELM2(Delta)   triple_block(Lstar_tmp,Lstar);\
						  xor_block(Delta,Delta,Lstar_tmp);


__attribute__((unused)) static messageblock keyblk;
__attribute__((unused)) static hashblock Lstar;
__attribute__((unused)) static hashblock Lstar_tmp;
__attribute__((unused)) static hashblock L[LCOUNT];

/* taglength encoded in a hashblock */
TAU_BLK_MACRO

/**
 * Precomputation of L-values
 * @param key the secret key
 */
extern void
precompute (const uint8_t* key, int k_len);
#endif /* OMD_PRECOMP */


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
key_func (hashblock res, const hashblock hash, const hashblock message);

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
hash (hashblock taga, const uint8_t *ad, uint64_t adlen);

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
