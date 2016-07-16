/**
 * The implementation of the omdsha256 mode
 *
**/
#ifndef __SHA256OMD_H__
#define __SHA256OMD_H__

#include "omd_api.h"
#include <string.h>
#include <inttypes.h>

#define SHA256_DIGEST_LENGTH 32
typedef uint8_t hashblock[SHA256_DIGEST_LENGTH];
typedef uint8_t messageblock[64]; //2*SHA256_DIGEST_LENGTH = 64
                            
#define CHAR2UINT32(hash, digest) \
    memset(digest+0, 0, SHA256_DIGEST_LENGTH); \
    int c = 0; \
    for(; c < 32; c +=4){ \
        digest[c/4] |= hash[c] << 24; \
        digest[c/4] |= hash[c+1] << 16; \
        digest[c/4] |= hash[c+2] << 8; \
        digest[c/4] |= hash[c+3]; \
    }
                            
#define UINT322CHAR(hash, digest) \
    c = 0; \
    for(; c < 32; c +=4){ \
        hash[c] = digest[c/4] >> 24; \
        hash[c+1] = digest[c/4] >> 16; \
        hash[c+2] = digest[c/4] >> 8; \
        hash[c+3] = digest[c/4]; \
}
#include <stdint.h>
#include "sha256_avx1.h" 
extern void sha256_avx(void *input_data, uint32_t digest[8], uint64_t num_blks);
                            
union Hash {
    uint32_t digest[8];
    hashblock hash;
} Hash;
                            
#define OMD_COMP(res, hash, glue)({\
        CHAR2UINT32(hash, Hash.digest) \
        sha256_avx((void*)glue, Hash.digest, 1); \
        UINT322CHAR(res, Hash.digest) \
})

#define OMD_n SHA256_DIGEST_LENGTH /**< Byte-length of the chaining block */
#define OMD_m SHA256_DIGEST_LENGTH /**< Byte-length of the message block  */

#define OMD_tau CRYPTO_ABYTES           /**< Byte-length of the tag   */
#define OMD_k CRYPTO_KEYBYTES           /**< Byte-length of the key   */
#define OMD_lnonce CRYPTO_NPUBBYTES     /**< Byte-length of the nonce */

/**
 * Constant zero message block - used multiple times
 */
static const messageblock
block0s =
   {
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
 * Computes in \f$GF(2^{256})[X]/(X^{256} + X^{10} + X^5 + X^2 + 1)\f$ a.X
 * where a is in the finite field
 * @param res The result of the computation
 * @param in a polynomial in \f$GF(2^{256})[X]/(X^{256} + X^{10} + X^5 + X^2
 *        + 1)\f$
 */
void
double_block (hashblock res, const hashblock in);

/**
 * Computes in \f$GF(2^{256})[X]/(X^{256} + X^{10} + X^5 + X^2 + 1)\f$
 * a.(X+1) where a is in the finite field
 * @param res The result of the computation
 * @param in a polynomial in \f$GF(2^{256})[X]/(X^{256} + X^{10} + X^5 + X^2
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
 * The SHA-256-OMD encrypt/decrypt function
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
omdsha256_process(uint8_t *data, const uint8_t *key,
		  const uint8_t *data_process,
		  uint64_t data_processlen,
		  const uint8_t *ad, uint64_t adlen,
		  const uint8_t *nonce,
		  const enum mode encrypting);

#endif /* not __SHA256OMD_H__ */
