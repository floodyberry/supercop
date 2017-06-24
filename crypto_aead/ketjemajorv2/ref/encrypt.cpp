/*
Implementation by the Keccak, Keyak and Ketje Teams, namely, Guido Bertoni,
Joan Daemen, Michaël Peeters, Gilles Van Assche and Ronny Van Keer, hereby
denoted as "the implementer".

For more information, feedback or questions, please refer to our websites:
http://keccak.noekeon.org/
http://keyak.noekeon.org/
http://ketje.noekeon.org/

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#include <string>
#include <sstream>
#include <string.h>
#include "api.h"
#include "crypto_aead.h"

#include "Ketjev2.h"

int crypto_aead_encrypt(
    unsigned char *c,unsigned long long *clen,
    const unsigned char *m,unsigned long long mlen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *nsec,
    const unsigned char *npub,
    const unsigned char *k
    )
{
    string K((const char *)k, (size_t)CRYPTO_KEYBYTES);
    string N((const char *)npub, (size_t)CRYPTO_NPUBBYTES);
    string AD(string((const char *)ad, adlen));
    string plaintext(string((const char *)m, mlen));
    string ciphertext;
    string tag;

    KetjeMajor instance;
    instance.initialize(K, N);
    ciphertext = instance.wrap(AD, plaintext, CRYPTO_ABYTES*8, tag);
    memcpy(c, ciphertext.data(), ciphertext.size());
    *clen = ciphertext.size();
    memcpy(c+ciphertext.size(), tag.data(), tag.size());
    *clen += tag.size();

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
    if (clen < CRYPTO_ABYTES)
        return -1;

    string K((const char *)k, CRYPTO_KEYBYTES);
    string N((const char *)npub, CRYPTO_NPUBBYTES);
    string AD(string((const char *)ad, adlen));
    string plaintext;
    string ciphertext(string((const char *)c, clen-CRYPTO_ABYTES));
    string tag(string((const char *)c+clen-CRYPTO_ABYTES, CRYPTO_ABYTES));

    KetjeMajor instance;
    instance.initialize(K, N);
    try {
        plaintext = instance.unwrap(AD, ciphertext, tag);
    }
    catch(Exception e) {
        return -1;
    }

    memcpy(m, plaintext.data(), plaintext.size());
    *mlen = plaintext.size();
    return 0;
}
