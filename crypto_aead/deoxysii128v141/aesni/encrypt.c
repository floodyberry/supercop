/*
 * Deoxys-II-128 Optimized AES-NI C Implementation
 *
 * Copyright 2016:
 *     Ivica Nikolic <inikolic@ntu.edu.sg>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 *
 */

#include <stdlib.h>
#include "api.h"
#include "deoxys.h"
#include "crypto_aead.h"


/*
 the code for the cipher implementation goes here,
 generating a ciphertext c[0],c[1],...,c[*clen-1]
 from a plaintext m[0],m[1],...,m[mlen-1]
 and associated data ad[0],ad[1],...,ad[adlen-1]
 and secret message number nsec[0],nsec[1],...
 and public message number npub[0],npub[1],...
 and secret key k[0],k[1],...
 */
int crypto_aead_encrypt(unsigned char *c, unsigned long long *clen,
                        const unsigned char *m, unsigned long long mlen,
                        const unsigned char *ad, unsigned long long adlen,
                        const unsigned char *nsec,
                        const unsigned char *npub,
                        const unsigned char *k
                        ) 
{
    
    size_t outlen = 0;
    deoxys_aead_encrypt(ad, adlen, m, mlen, k, npub, c, &outlen);
    *clen = outlen;
    (void)nsec;
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
int crypto_aead_decrypt(unsigned char *m, unsigned long long *mlen,
                        unsigned char *nsec,
                        const unsigned char *c, unsigned long long clen,
                        const unsigned char *ad, unsigned long long adlen,
                        const unsigned char *npub,
                        const unsigned char *k
                        )
{
    int result = deoxys_aead_decrypt(ad, adlen, m, (size_t *)mlen, k, npub, c, clen);
    (void)nsec;
    return result;
}
