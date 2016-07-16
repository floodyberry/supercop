#include <string.h>
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
    
    /* initialize the state with secret key and nonce */
    initState(S, k, npub);

    /* ciphertext length is plaintext len + size of tag and nsec */
    *clen = mlen + ICEPOLETAGLEN + ICEPOLENSECLEN; 
    
    /* absorb and encrypt 128-bit secret message number */
    processDataBlock(S, nsec, &c, ICEPOLENSECLEN, 0);
    
    /* process auth-only associated data blocks */
    do {
        unsigned long long blocklen = ICEPOLEDATABLOCKLEN;
        frameBit = (adlen <= blocklen ? 1 : 0); /* is it the last block? */
        if (adlen < blocklen) {
            blocklen = adlen;
        }
        /* apply the permutation to the state */
        P6(S,S);
        /* absorb a data block */
        processDataBlock(S, ad, NULL, blocklen, frameBit);
        ad += blocklen;
        adlen -= blocklen;
    } while (adlen > 0);

    /* process plaintext blocks to get the ciphertext */
    do {
        unsigned long long blocklen = ICEPOLEDATABLOCKLEN;
        frameBit = (mlen <=blocklen ? 0 : 1);
        if (mlen < blocklen) {
            blocklen = mlen;
        }
        /* apply the permutation to the state */
        P6(S,S);
        /* absorb a data block and produce a ciphertext block */
        processDataBlock(S, m, &c, blocklen, frameBit);
        m += blocklen;
        mlen -= blocklen;    
    } while (mlen > 0);

    /* store authentication tag at the end of the ciphertext */
    generateTag(S, c);    
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
    unsigned char Tcomp[ICEPOLETAGLEN]; /* computed authentication tag */
    unsigned int frameBit;
    
    /* ciphertext cannot be shorter than the tag length */
    if (clen < ICEPOLETAGLEN) {
        return -1;
    }
    
    initState(S, k, npub);

    /* process 128-bit secret message number */
    frameBit = 0;
    processDataBlockRev(S, c, &nsec, ICEPOLENSECLEN, frameBit);
    c += ICEPOLENSECLEN;
   
    /* process associated data blocks */
    do {
        unsigned long long blocklen = ICEPOLEDATABLOCKLEN;
        frameBit = (adlen <= blocklen ? 1 : 0);
        if (adlen < blocklen) {
            blocklen = adlen;
        }
        /* apply the permutation to the state */
        P6(S,S);
        /* absorb a data block */
        processDataBlock(S, ad, NULL, blocklen, frameBit);
        ad += blocklen;
        adlen -= blocklen;
    } while (adlen > 0);
    
    /* process ciphertext blocks to get auth tag */
    *mlen = 0;
    clen -= ICEPOLETAGLEN+ICEPOLENSECLEN; /* need to stop before auth tag*/
    do {
        unsigned long long blocklen = ICEPOLEDATABLOCKLEN;
        frameBit = (clen <= blocklen ? 0 : 1);
        if (clen < blocklen) {
            blocklen = clen;
        }
        /* apply the permutation to the state */
        P6(S,S);
        /* absorb a ciphertext block and produce a plaintext block */
        processDataBlockRev(S, c, &m, blocklen, frameBit);
        c += blocklen;
        *mlen += blocklen;
        clen -= blocklen;    
    } while (clen > 0);

    /* compare computed and received auth tags */
    generateTag(S, Tcomp);
    if (memcmp(Tcomp, c, ICEPOLETAGLEN)) {
        *mlen = 0;
        return -1;
    }
    
    return 0;
}

