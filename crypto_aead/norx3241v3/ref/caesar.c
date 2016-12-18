/*
 * NORX reference source code package - reference C implementations
 *
 * Written 2014-2016 by:
 *
 *      - Samuel Neves <sneves@dei.uc.pt>
 *      - Philipp Jovanovic <philipp@jovanovic.io>
 *
 * To the extent possible under law, the author(s) have dedicated all copyright
 * and related and neighboring rights to this software to the public domain
 * worldwide. This software is distributed without any warranty.
 *
 * You should have received a copy of the CC0 Public Domain Dedication along with
 * this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
 */
#if defined(SUPERCOP)
#   include "crypto_aead.h"
#endif

#include "api.h"
#include "norx.h"

/*
the code for the cipher implementation goes here,
generating a ciphertext c[0],c[1],...,c[*clen-1]
from a plaintext m[0],m[1],...,m[mlen-1]
and associated data ad[0],ad[1],...,ad[adlen-1]
and secret message number nsec[0],nsec[1],...
and public message number npub[0],npub[1],...
and secret key k[0],k[1],...
*/
int crypto_aead_encrypt(
    unsigned char *c, unsigned long long *clen,
    const unsigned char *m, unsigned long long mlen,
    const unsigned char *ad, unsigned long long adlen,
    const unsigned char *nsec,
    const unsigned char *npub,
    const unsigned char *k
    )
{
    size_t outlen = 0;
    norx_aead_encrypt(c, &outlen, ad, adlen, m, mlen, NULL, 0, npub, k);
    *clen = outlen;
    (void)nsec; /* avoid warning */
    return 0;
}

/*
the code for the cipher implementation goes here,
generating a plaintext m[0],m[1],...,m[*mlen-1]
and secret message number nsec[0],nsec[1],...
from a ciphertext c[0],c[1],...,c[clen-1]
and associated data ad[0],ad[1],...,ad[adlen-1]
and public message number npub[0],npub[1],...
and secret key k[0],k[1],...
*/
int crypto_aead_decrypt(
    unsigned char *m, unsigned long long *mlen,
    unsigned char *nsec,
    const unsigned char *c, unsigned long long clen,
    const unsigned char *ad, unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k
    )
{
    size_t outlen = 0;
    int result = norx_aead_decrypt(m, &outlen, ad, adlen, c, clen, NULL, 0, npub, k);
    *mlen = outlen;
    (void)nsec; /* avoid warning */
    return result;
}
