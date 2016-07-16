#include "jhae.h"
#include <stdio.h>
#include <stdlib.h>

int jhae_encryption_authentication(unsigned char *c, unsigned long long *clen,
                                  unsigned char *t,
                                  const unsigned char *key,
                                  const unsigned char *noc,
                                  const unsigned char *msg, unsigned long long msglen,
                                  const unsigned char *ad, unsigned long long adlen)
{
    unsigned long long i;
    int j, k;
    unsigned char *yprim;
    unsigned char *y;
    unsigned char *xprim;
    unsigned char *x;
    const unsigned char *m;
    const unsigned char *mnext;

    i = msglen + 13;
    i += i % BLOCK_BYTE_SIZE == 0 ? 0 : BLOCK_BYTE_SIZE - (i % BLOCK_BYTE_SIZE);
    *clen = i;

    x = (unsigned char*)malloc(2 * BLOCK_BYTE_SIZE * sizeof(unsigned char));
    xprim = x + BLOCK_BYTE_SIZE; // xprim points to second half of memory

    y = (unsigned char*)malloc(2 * BLOCK_BYTE_SIZE * sizeof(unsigned char));
    yprim = y + BLOCK_BYTE_SIZE; // y points to second half of memory

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

    // Process message
    unsigned long long mb = msglen / BLOCK_BYTE_SIZE; // number of complete blocks of message
    // Process complete blocks of message
    mnext = msg;
    for(i=0 ; i<mb ; i++){
        artemia_permutation(x, y);
        for(j=0 ; j<BLOCK_BYTE_SIZE ; j++){
            xprim[j] = yprim[j] ^ mnext[j];
            x[j] = y[j] ^ m[j];
            c[i * BLOCK_BYTE_SIZE + j] = xprim[j]; // Storing ciphertext
        }
        m = mnext;
        mnext += BLOCK_BYTE_SIZE;
    }
    // Padding last block of message and process it
    unsigned char* padded;
    padded = padding_message(mnext, msglen % BLOCK_BYTE_SIZE, msglen, noc, ad, adlen, &k);
    mnext = padded;
    for(i=0 ; i<k/BLOCK_BYTE_SIZE ; i++){
        artemia_permutation(x, y);
        for(j=0 ; j<BLOCK_BYTE_SIZE ; j++){
            xprim[j] = yprim[j] ^ mnext[j];
            x[j] = y[j] ^ m[j];
            c[(mb + i) * BLOCK_BYTE_SIZE + j] = xprim[j]; // Storing ciphertext
        }
        m = mnext;
        mnext += BLOCK_BYTE_SIZE;
    }
    // final step
    artemia_permutation(x, y);
    for(j=0 ; j<BLOCK_BYTE_SIZE ; j++){
        //x[j] = y[j] ^ m[j];
        t[j] = y[j] ^ m[j] ^ key[j];
    }

    m = mnext = 0x0;
    xprim = yprim = NULL;
    free(x);
    free(y);

    return 0;
}

