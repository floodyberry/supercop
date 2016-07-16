#include "jhae.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int jhae_decryption_verification(unsigned char *msg, unsigned long long *msglen,
                                 const unsigned char *key,
                                 const unsigned char *noc,
                                 const unsigned char *ctx, unsigned long long ctxlen,
                                 const unsigned char *ad, unsigned long long adlen,
                                 const unsigned char *t)
{
    unsigned long long i;
    int j, k;
    unsigned char *yprim;
    unsigned char *y;
    unsigned char *xprim;
    unsigned char *x;
    const unsigned char *m;
    const unsigned char *mnext;
    unsigned char* tprim;

    tprim = (unsigned char*)malloc(BLOCK_BYTE_SIZE * sizeof(unsigned char));

    x = (unsigned char*)malloc(2 * BLOCK_BYTE_SIZE * sizeof(unsigned char));
    xprim = x + BLOCK_BYTE_SIZE; // xprim points to second half of memory

    y = (unsigned char*)malloc(2 * BLOCK_BYTE_SIZE * sizeof(unsigned char));
    yprim = y + BLOCK_BYTE_SIZE; // yprim points to second half of memory

    if(x == 0x0 || xprim == 0x0 || y == 0x0 || yprim == 0x0)
        return -2;

    // initial xprim, x, m0 and m1
    m = noc;
    mnext = ad;
    for(i=0 ; i<BLOCK_BYTE_SIZE ; i++){
        xprim[i] = noc[i];
        x[i] = key[i];
    }

    // Process associated data
    if(adlen != 0){
        unsigned long long ab = adlen / BLOCK_BYTE_SIZE;    // number of complete blocks of associated data
        // Process complete blocks of associated data
        for(i=0 ; i<ab ; i++){
            artemia_permutation(x, y);
            for(j=0 ; j<BLOCK_BYTE_SIZE ; j++){
                xprim[j] = yprim[j] ^ mnext[j];
                x[j] = y[j] ^ m[j];
            }
            m = mnext;
            mnext += BLOCK_BYTE_SIZE;
        }
        // Padding last block of AD and process it
        unsigned char* padded;
        padded = padding_associated_data(mnext, adlen % BLOCK_BYTE_SIZE, &k);
        mnext = padded;
        for(i=0 ; i<k/BLOCK_BYTE_SIZE ; i++){
            artemia_permutation(x, y);
            for(j=0 ; j<BLOCK_BYTE_SIZE ; j++){
                xprim[j] = yprim[j] ^ mnext[j];
                x[j] = y[j] ^ m[j];
            }
            m = mnext;
            mnext += BLOCK_BYTE_SIZE;
        }
    }

    // Process ciphertext
    unsigned long long cb = ctxlen / BLOCK_BYTE_SIZE;   // number of blocks of ciphertext
    for(i=0 ; i<cb ; i++){
        artemia_permutation(x, y);
        for(j=0 ; j<BLOCK_BYTE_SIZE ; j++){
            xprim[j] = ctx[i * BLOCK_BYTE_SIZE + j];    // prepare xprim for next permutation
            msg[i * BLOCK_BYTE_SIZE + j] = yprim[j] ^ xprim[j]; // Storing message
            x[j] = y[j] ^ m[j];
        }
        m = msg + i * BLOCK_BYTE_SIZE;
    }

    // final step
    artemia_permutation(x, y);
    for(j=0 ; j<BLOCK_BYTE_SIZE ; j++){
        //x[j] = y[j] ^ m[j];
        tprim[j] = y[j] ^ m[j] ^ key[j];
    }

    // Unpadding
    *msglen = unpadding_message_inplace(msg, ctxlen);

    int result = 0;
    // Check if T = Tprim
    for(j=0 ; j<BLOCK_BYTE_SIZE ; j++)
        if(tprim[j] != t[j]){
            result = -1;  // Encryption Fail
            memset(msg, 0, (*msglen) * sizeof(unsigned char)); // clear output
            break;
        }

    m = mnext = NULL;
    yprim = xprim = 0x0;
    free(y);
    free(x);
    free(tprim);

    return result;
}
