/*
 * encrypt.c
 *
 * Implemetation file for Artemia-256
 */


#include "crypto_aead.h"
#include "api.h"
#include "jhae.h"

/*
 * The code for the cipher implementation,
 * generating a ciphertext c[0],c[1],...,c[*clen-1]
 * from a plaintext m[0],m[1],...,m[mlen-1]
 * and associated data ad[0],ad[1],...,ad[adlen-1]
 * and secret message number nsec[0],nsec[1],...
 * and public message number npub[0],npub[1],...
 * and secret key k[0],k[1],...
 */
int crypto_aead_encrypt(unsigned char *c, unsigned long long *clen,
                        const unsigned char *m, unsigned long long mlen,
                        const unsigned char *ad, unsigned long long adlen,
                        const unsigned char *nsec,
                        const unsigned char *npub,
                        const unsigned char *k)
{
    int ret, i;
    unsigned char tag[BLOCK_BYTE_SIZE];
    ret = jhae_encryption_authentication(c, clen,
                                         tag,
                                         k,
                                         npub,
                                         m, mlen,
                                         ad, adlen);
    if(ret != 0)
        return ret;

    // Append tag to encrypted data
    for(i=0 ; i<BLOCK_BYTE_SIZE ; i++)
        c[*clen + i] = tag[i];
    // Update length of ciphertext
    *clen += BLOCK_BYTE_SIZE;

    return ret;
}

/*
 * The code for the cipher implementation,
 * generating a plaintext m[0],m[1],...,m[*mlen-1]
 * and secret message number nsec[0],nsec[1],...
 * from a ciphertext c[0],c[1],...,c[clen-1]
 * and associated data ad[0],ad[1],...,ad[adlen-1]
 * and public message number npub[0],npub[1],...
 * and secret key k[0],k[1],...
 */
int crypto_aead_decrypt(unsigned char *m, unsigned long long *mlen,
                        unsigned char *nsec,
                        const unsigned char *c, unsigned long long clen,
                        const unsigned char *ad, unsigned long long adlen,
                        const unsigned char *npub,
                        const unsigned char *k)
{
    int ret;
    const unsigned char *tag = c + clen - BLOCK_BYTE_SIZE; // Point to first byte of last block.
    unsigned long long myclen = clen - BLOCK_BYTE_SIZE;
    ret = jhae_decryption_verification(m, mlen,
                                       k,
                                       npub,
                                       c, myclen,
                                       ad, adlen,
                                       tag);

    return ret;
}
