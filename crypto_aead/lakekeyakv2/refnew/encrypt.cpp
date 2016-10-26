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

#include "Keyakv2.h"

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
    stringstream dummy;
    stringstream AD(string((const char *)ad, adlen));
    stringstream plaintext(string((const char *)m, mlen));
    stringstream ciphertext;
    stringstream tag;

    LakeKeyak instance;
    instance.StartEngine(K, N, false, dummy, false, false);
    instance.Wrap(plaintext, ciphertext, AD, tag, false, false);
    memcpy(c, ciphertext.str().data(), ciphertext.str().size());
    *clen = ciphertext.str().size();
    memcpy(c+ciphertext.str().size(), tag.str().data(), tag.str().size());
    *clen += tag.str().size();

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
    stringstream dummy;
    stringstream AD(string((const char *)ad, adlen));
    stringstream plaintext;
    stringstream ciphertext(string((const char *)c, clen-CRYPTO_ABYTES));
    stringstream tag(string((const char *)c+clen-CRYPTO_ABYTES, CRYPTO_ABYTES));

    LakeKeyak instance;
    instance.StartEngine(K, N, false, dummy, true, false);
    bool result = instance.Wrap(ciphertext, plaintext, AD, tag, true, false);

    if (result) {
        memcpy(m, plaintext.str().data(), plaintext.str().size());
        *mlen = plaintext.str().size();
        return 0;
    }
   else
       return -1;
}
