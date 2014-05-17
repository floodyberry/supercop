#include "crypto_aead.h"
#include "icepole.h"


int crypto_aead_encrypt(
	unsigned char *c,unsigned long long *clen,
	const unsigned char *m,unsigned long long mlen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k )
{
    ICESTATE S;
    unsigned int frameBit;
    initState256a(S, k, npub);

    /* ciphertext length is plaintext len + size of tag and nsec */
    *clen = mlen + ICEPOLETAGLEN; 
    
    /* secret message number is zero length */
    frameBit = 0;
    processIceBlock(S, NULL, NULL, 0, frameBit);

    /* process auth-only associated data blocks */
    do {
        unsigned long long blocklen = 128;
        frameBit = (adlen <= blocklen ? 1 : 0); /* is it the last block? */
        if (adlen < blocklen) {
            blocklen = adlen;
        }
        processIceBlock(S, ad, NULL, blocklen, frameBit);
        ad += blocklen;
        adlen -= blocklen;
    } while (adlen > 0);

    /* process plaintext blocks to get the ciphertext */
    do {
        unsigned long long blocklen = 128;
        frameBit = (mlen <=blocklen ? 0 : 1);
        if (mlen < blocklen) {
            blocklen = mlen;
        }
        processIceBlock(S, m, &c, blocklen, frameBit);
        m += blocklen;
        mlen -= blocklen;    
    } while (mlen > 0);

    /* store authentication tag at the end of the ciphertext */
    store64(c, S[0][0], 8);
    c += 8;
    store64(c, S[1][0], 8);

    return 0;
}

int crypto_aead_decrypt(
	unsigned char *m,unsigned long long *mlen,
	unsigned char *nsec,
	const unsigned char *c,unsigned long long clen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k
)
{
    ICESTATE S;
    uint64_t Tcomp[2]; /* computed authentication tag */
    uint64_t Trecv[2]; /* received authentication tag */
    unsigned int frameBit;
    
    /* ciphertext cannot be shorter than the tag length */
    if (clen < ICEPOLETAGLEN) {
        return -1;
    }
    
    initState256a(S, k, npub);

    /* secret message number is zero-length */
    frameBit = 0;
    processIceBlockRev(S, NULL, NULL, 0, frameBit);
   
    /* process associated data blocks */
    do {
        unsigned long long blocklen = 128;
        frameBit = (adlen <= blocklen ? 1 : 0);
        if (adlen < blocklen) {
            blocklen = adlen;
        }
        processIceBlock(S, ad, NULL, blocklen, frameBit);
        ad += blocklen;
        adlen -= blocklen;
    } while (adlen > 0);
    
    /* process ciphertext blocks to get auth tag */
    *mlen = 0;
    clen -= ICEPOLETAGLEN; /* need to stop before auth tag*/
    do {
        unsigned long long blocklen = 128;
        frameBit = (clen <= blocklen ? 0 : 1);
        if (clen < blocklen) {
            blocklen = clen;
        }
        processIceBlockRev(S, c, &m, blocklen, frameBit);
        c += blocklen;
        *mlen += blocklen;
        clen -= blocklen;    
    } while (clen > 0);

    /* compare computed and received auth tags */
    Tcomp[0] = S[0][0];
    Tcomp[1] = S[1][0];
    Trecv[0] = load64(c, 8);
    Trecv[1] = load64(c+8, 8);
    if (Tcomp[0] != Trecv[0] || Tcomp[1] != Trecv[1]) {
        *mlen = 0;
        return -1;
    }
    
    return 0;
}

