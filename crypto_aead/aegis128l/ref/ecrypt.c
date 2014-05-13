#include <string.h>
#include "crypto_aead.h"

#ifdef _MSC_VER
#define inline __inline
#endif

void AESROUND(unsigned char *out, unsigned char *in, unsigned char *rk);

#define XOR128(x,y,z) {                                                                             \
    ((unsigned long long*)(x))[0] = ((unsigned long long*)(y))[0] ^ ((unsigned long long*)(z))[0];  \
    ((unsigned long long*)(x))[1] = ((unsigned long long*)(y))[1] ^ ((unsigned long long*)(z))[1];  \
}

#define AND128(x,y,z) {                                                                             \
    ((unsigned long long*)(x))[0] = ((unsigned long long*)(y))[0] & ((unsigned long long*)(z))[0];  \
    ((unsigned long long*)(x))[1] = ((unsigned long long*)(y))[1] & ((unsigned long long*)(z))[1];  \
}

// The initialization state of AEGIS
/*The input to initialization is the 128-bit key; 128-bit IV;*/
void aegis128L_initialization(const unsigned char *key, const unsigned char *iv, unsigned char *state)
{
       int i;
       unsigned char tmp[16];
       unsigned char constant[32] = {0x0,0x1,0x01,0x02,0x03,0x05,0x08,0x0d,0x15,0x22,0x37,0x59,0x90,0xe9,0x79,0x62,0xdb,0x3d,0x18,0x55,0x6d,0xc2,0x2f,0xf1,0x20,0x11,0x31,0x42,0x73,0xb5,0x28,0xdd};

       XOR128(state,  key,  iv);
       memcpy(state+16, constant+16, 16);
       memcpy(state+32, constant,    16);
       memcpy(state+48, constant+16, 16);
       XOR128(state+64, key, iv);
       XOR128(state+80, key, constant);
       XOR128(state+96, key, constant+16);
       XOR128(state+112,key, constant);

       for (i = 0; i < 10; i++)  {
             //state update function;
             memcpy(tmp, state+112, 16);

             AESROUND(state+112,state+96, state+112);
             AESROUND(state+96, state+80, state+96);
             AESROUND(state+80, state+64, state+80);
             AESROUND(state+64, state+48, state+64);
             AESROUND(state+48, state+32, state+48);
             AESROUND(state+32, state+16, state+32);
             AESROUND(state+16, state+0,  state+16);
             AESROUND(state+0,  tmp,      state+0);

             //message is used to update the state.
             XOR128(state, state, iv);
             XOR128(state+64, state+64, key);
       }
}


//the finalization state of AEGIS
void aegis128L_tag_generation(unsigned long msglen, unsigned long adlen, unsigned char maclen, unsigned char *mac, unsigned char *state)
{
        int i;

        unsigned char tmp[16];
        unsigned char msgtmp[16];

        ((unsigned long long*)msgtmp)[0] = adlen << 3;
        ((unsigned long long*)msgtmp)[1] = msglen << 3;

        XOR128(msgtmp, msgtmp, state+32);

        for (i = 0; i < 7; i++) {
            //state update function
            memcpy(tmp, state+112, 16);
            AESROUND(state+112,state+96, state+112);
            AESROUND(state+96, state+80, state+96);
            AESROUND(state+80, state+64, state+80);
            AESROUND(state+64, state+48, state+64);
            AESROUND(state+48, state+32, state+48);
            AESROUND(state+32, state+16, state+32);
            AESROUND(state+16, state+0,  state+16);
            AESROUND(state+0,  tmp,      state+0);

            //message is used to update the state.
            XOR128(state,    state,    msgtmp);
            XOR128(state+64, state+64, msgtmp);
        }

        XOR128(state+96, state+96, state+80);
        XOR128(state+96, state+96, state+64);
        XOR128(state+96, state+96, state+48);
        XOR128(state+96, state+96, state+32);
        XOR128(state+96, state+96, state+16);
        XOR128(state+96, state+96, state+0);

        //in this program, the mac length is assumed to be multiple of bytes
        memcpy(mac,state+96,maclen);
}


//one step of encryption
inline void aegis128L_enc_aut_step(const unsigned char *plaintextblk,
       unsigned char *ciphertextblk, unsigned char *state)
{
    unsigned char tmp[16];

    AND128(ciphertextblk, state+32, state+48);
    XOR128(ciphertextblk, ciphertextblk, state+16);
    XOR128(ciphertextblk, ciphertextblk, state+96);
    XOR128(ciphertextblk, ciphertextblk, plaintextblk);

    AND128(ciphertextblk+16, state+96, state+112);
    XOR128(ciphertextblk+16, ciphertextblk+16, state+32);
    XOR128(ciphertextblk+16, ciphertextblk+16, state+80);
    XOR128(ciphertextblk+16, ciphertextblk+16, plaintextblk+16);

    memcpy(tmp, state+112, 16);
    AESROUND(state+112,state+96, state+112);
    AESROUND(state+96, state+80, state+96);
    AESROUND(state+80, state+64, state+80);
    AESROUND(state+64, state+48, state+64);
    AESROUND(state+48, state+32, state+48);
    AESROUND(state+32, state+16, state+32);
    AESROUND(state+16, state+0,  state+16);
    AESROUND(state+0,  tmp,      state+0);

    //message is used to update the state.
    XOR128(state, state, plaintextblk);
    XOR128(state+64, state+64, plaintextblk+16);
}



//one step of encryption
inline void aegis128L_dec_aut_step(unsigned char *plaintextblk,
       const unsigned char *ciphertextblk, unsigned char *state)
{
    unsigned char tmp[16];

    AND128(plaintextblk, state+32, state+48);
    XOR128(plaintextblk, plaintextblk, state+16);
    XOR128(plaintextblk, plaintextblk, state+96);
    XOR128(plaintextblk, plaintextblk, ciphertextblk);

    AND128(plaintextblk+16, state+96, state+112);
    XOR128(plaintextblk+16, plaintextblk+16, state+32);
    XOR128(plaintextblk+16, plaintextblk+16, state+80);
    XOR128(plaintextblk+16, plaintextblk+16, ciphertextblk+16);

    memcpy(tmp, state+112, 16);
    AESROUND(state+112,state+96, state+112);
    AESROUND(state+96, state+80, state+96);
    AESROUND(state+80, state+64, state+80);
    AESROUND(state+64, state+48, state+64);
    AESROUND(state+48, state+32, state+48);
    AESROUND(state+32, state+16, state+32);
    AESROUND(state+16, state+0,  state+16);
    AESROUND(state+0,  tmp,      state+0);

    //message is used to update the state.
    XOR128(state, state, plaintextblk);
    XOR128(state+64, state+64, plaintextblk+16);
}


//encrypt a message
int crypto_aead_encrypt(
	unsigned char *c,unsigned long long *clen,
	const unsigned char *m,unsigned long long mlen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
	)
{
        unsigned long i;
        unsigned char plaintextblock[32], ciphertextblock[32], mac[16];
        unsigned char aegis128L_state[128];

        //initialization stage
        aegis128L_initialization(k, npub, aegis128L_state);

        //process the associated data
        for (i = 0; (i+32) <= adlen; i += 32) {
              aegis128L_enc_aut_step(ad+i, ciphertextblock, aegis128L_state);
        }

        //deal with the partial block of associated data
        //in this program, we assume that the message length is multiple of bytes.
        if (  (adlen & 0x1f) != 0 )  {
              memset(plaintextblock, 0, 32);
              memcpy(plaintextblock, ad+i, adlen & 0x1f);
              aegis128L_enc_aut_step(plaintextblock, ciphertextblock, aegis128L_state);
        }

        //encrypt the plaintext
        for (i = 0; (i+32) <= mlen; i += 32) {
              aegis128L_enc_aut_step(m+i, c+i, aegis128L_state);
        }

        // Deal with the partial block
        // In this program, we assume that the message length is a multiple of bytes.
        if (  (mlen & 0x1f) != 0 )  {
              memset(plaintextblock, 0, 32);
              memcpy(plaintextblock, m+i, mlen & 0x1f);
              aegis128L_enc_aut_step(plaintextblock, ciphertextblock, aegis128L_state);
              memcpy(c+i,ciphertextblock, mlen & 0x1f);
        }

        //finalization stage, we assume that the tag length is a multiple of bytes
        aegis128L_tag_generation(mlen, adlen, 16, mac, aegis128L_state);
        *clen = mlen + 16;
        memcpy(c+mlen, mac, 16);

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
        unsigned long i;
        unsigned char plaintextblock[32], ciphertextblock[32];
        unsigned char tag[16];
        unsigned char check = 0;
        unsigned char aegis128L_state[128];

        if (clen < 16) return -1;

        aegis128L_initialization(k, npub, aegis128L_state);

        //process the associated data
        for (i = 0; (i+32) <= adlen; i += 32) {
              aegis128L_enc_aut_step(ad+i, ciphertextblock, aegis128L_state);
        }

        //deal with the partial block of associated data
        //in this program, we assume that the message length is multiple of bytes.
        if (  (adlen & 0x1f) != 0 )  {
              memset(plaintextblock, 0, 32);
              memcpy(plaintextblock, ad+i, adlen & 0x1f);
              aegis128L_enc_aut_step(plaintextblock, ciphertextblock, aegis128L_state);
        }


        *mlen = clen - 16;

        //decrypt the ciphertext
        for (i = 0; (i+32) <= *mlen; i += 32) {
              aegis128L_dec_aut_step(m+i, c+i, aegis128L_state);
        }

        // Deal with the partial block
        // In this program, we assume that the message length is multiple of bytes.
        if (  (*mlen & 0x1f) != 0  )  {
              memset(ciphertextblock, 0, 32);
              memcpy(ciphertextblock, c+i, *mlen & 0x1f);
              aegis128L_dec_aut_step(plaintextblock, ciphertextblock, aegis128L_state);
              memcpy(m+i, plaintextblock, *mlen & 0x1f);

              //need to modify the state here (because in the last block, keystream is wrongly used to update the state)
              memset(plaintextblock, 0, *mlen & 0x1f);
              XOR128(aegis128L_state, aegis128L_state, plaintextblock);
              XOR128(aegis128L_state+64, aegis128L_state+64, plaintextblock+16);
        }

        //we assume that the tag length is multiple of bytes
        aegis128L_tag_generation(*mlen, adlen, 16, tag, aegis128L_state);

        //verification
        for (i = 0; i  < 16; i++) check |= (tag[i] ^ c[clen - 16 + i]);
        if (check == 0) return 0;
        else return -1;
}

