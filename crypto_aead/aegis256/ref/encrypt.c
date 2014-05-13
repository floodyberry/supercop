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

inline void aegis256_initialization(const unsigned char *key,
       const unsigned char *iv, unsigned char *state)
{
       int i;
       unsigned char constant[32] = {0x0,0x1,0x01,0x02,0x03,0x05,0x08,0x0d,0x15,0x22,0x37,0x59,0x90,0xe9,0x79,0x62,0xdb,0x3d,0x18,0x55,0x6d,0xc2,0x2f,0xf1,0x20,0x11,0x31,0x42,0x73,0xb5,0x28,0xdd};
       unsigned char tmp[16], temp[64];

  	    XOR128(state,    key,    iv);
  	    XOR128(state+16, key+16, iv+16);

        memcpy(state+32, constant+16,  16);
        memcpy(state+48, constant,     16);
        XOR128(state+64, key,    constant);
        XOR128(state+80, key+16, constant+16);

        memcpy(temp,     key,  32);
        XOR128(temp+32,  key,  iv);
        XOR128(temp+48,  key+16, iv+16);

        for (i = 0; i < 16; i++)
        {
             //state update function
             memcpy(tmp, state+80, 16);
             AESROUND(state+80, state+64, state+80);
             AESROUND(state+64, state+48, state+64);
             AESROUND(state+48, state+32, state+48);
             AESROUND(state+32, state+16, state+32);
             AESROUND(state+16, state+0,  state+16);
             AESROUND(state+0,  tmp,      state+0);

             XOR128(state, state, temp+16*(i&3));
        }
}


//the finalization state of AEGIS
void aegis256_tag_generation(unsigned long long msglen, unsigned long long adlen, unsigned char maclen, unsigned char *mac, unsigned char *state)
{
        int i;

        unsigned char tmp[16];
        unsigned char msgtmp[16];

        ((unsigned long long*)msgtmp)[0] = adlen << 3;
        ((unsigned long long*)msgtmp)[1] = msglen << 3;

        XOR128(msgtmp, msgtmp, state+48);

        for (i = 0; i < 7; i++) {
             //state update function
             memcpy(tmp, state+80, 16);

             AESROUND(state+80, state+64, state+80);
             AESROUND(state+64, state+48, state+64);
             AESROUND(state+48, state+32, state+48);
             AESROUND(state+32, state+16, state+32);
             AESROUND(state+16, state+0,  state+16);
             AESROUND(state+0,  tmp,      state+0);

             //xor "msg" with state[0]
             XOR128(state, state, msgtmp);
        }

        XOR128(state+80, state+80, state+64);
        XOR128(state+80, state+80, state+48);
        XOR128(state+80, state+80, state+32);
        XOR128(state+80, state+80, state+16);
        XOR128(state+80, state+80, state+0);

        //in this program, the mac length is assumed to be multiple of bytes
        memcpy(mac, state+80, maclen);
}


// one step of encryption
inline void aegis256_enc_aut_step(const unsigned char *plaintextblk,
       unsigned char *ciphertextblk, unsigned char *state)
{
        unsigned char tmp[16];

        AND128(ciphertextblk, state+32, state+48);
        XOR128(ciphertextblk, ciphertextblk, state+16);
        XOR128(ciphertextblk, ciphertextblk, state+64);
        XOR128(ciphertextblk, ciphertextblk, state+80);
        XOR128(ciphertextblk, ciphertextblk, plaintextblk);

        //state update function
        memcpy(tmp, state+80, 16);

        AESROUND(state+80, state+64, state+80);
        AESROUND(state+64, state+48, state+64);
        AESROUND(state+48, state+32, state+48);
        AESROUND(state+32, state+16, state+32);
        AESROUND(state+16, state+0,  state+16);
        AESROUND(state+0,  tmp,      state+0);

        //message is used to update the state.
        XOR128(state, state, plaintextblk);
}


//one step of decryption
inline void aegis256_dec_aut_step(unsigned char *plaintextblk,
       const unsigned char *ciphertextblk, unsigned char *state)
{
        unsigned char tmp[16];

        AND128(plaintextblk, state+32, state+48);
        XOR128(plaintextblk, plaintextblk, state+16);
        XOR128(plaintextblk, plaintextblk, state+64);
        XOR128(plaintextblk, plaintextblk, state+80);
        XOR128(plaintextblk, plaintextblk, ciphertextblk);

        //state update function
        memcpy(tmp, state+80, 16);

        AESROUND(state+80, state+64, state+80);
        AESROUND(state+64, state+48, state+64);
        AESROUND(state+48, state+32, state+48);
        AESROUND(state+32, state+16, state+32);
        AESROUND(state+16, state+0,  state+16);
        AESROUND(state+0,  tmp,      state+0);

        //message is used to update the state.
        XOR128(state, state, plaintextblk);
}


//encrypt a message.
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
        unsigned char plaintextblock[16], ciphertextblock[16], mac[16];
        unsigned char aegis256_state[96];

        //initialization stage
        aegis256_initialization(k, npub, aegis256_state);

        //process the associated data
        for (i = 0; (i+16) <= adlen; i += 16) {
              aegis256_enc_aut_step(ad+i, ciphertextblock, aegis256_state);
        }

        //deal with the partial block of associated data
        //in this program, we assume that the message length is multiple of bytes.
        if ( (adlen & 0xf) != 0 )  {
              memset(plaintextblock, 0, 16);
              memcpy(plaintextblock, ad+i, adlen & 0xf);
              aegis256_enc_aut_step(plaintextblock, ciphertextblock, aegis256_state);
        }

        //encrypt the plaintext
        for (i = 0; (i+16) <= mlen; i += 16) {
              aegis256_enc_aut_step(m+i, c+i, aegis256_state);
        }

        // Deal with the partial block
        // In this program, we assume that the message length is multiple of bytes.
        if (  (mlen & 0xf) != 0 )  {
              memset(plaintextblock, 0, 16);
              memcpy(plaintextblock, m+i, mlen & 0xf);
              aegis256_enc_aut_step(plaintextblock, ciphertextblock, aegis256_state);
              memcpy(c+i,ciphertextblock, mlen & 0xf);
        }

        //finalization stage, we assume that the tag length is a multiple of bytes
        aegis256_tag_generation(mlen, adlen, 16, mac, aegis256_state);
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
        unsigned char plaintextblock[16], ciphertextblock[16];
        unsigned char tag[16];
        unsigned char check = 0;
        unsigned char aegis256_state[96];

        if (clen < 16) return -1;

        aegis256_initialization(k, npub, aegis256_state);

        //process the associated data
        for (i = 0; (i+16) <= adlen; i += 16) {
              aegis256_enc_aut_step(ad+i, ciphertextblock, aegis256_state);
        }

        //deal with the partial block of associated data
        //in this program, we assume that the message length is multiple of bytes.
        if (  (adlen & 0xf) != 0 )  {
              memset(plaintextblock, 0, 16);
              memcpy(plaintextblock, ad+i, adlen & 0xf);
              aegis256_enc_aut_step(plaintextblock, ciphertextblock, aegis256_state);
        }

        *mlen = clen - 16;

        //decrypt the ciphertext
        for (i = 0; (i+16) <= *mlen; i += 16) {
              aegis256_dec_aut_step(m+i, c+i, aegis256_state);
        }

        // Deal with the partial block
        // In this program, we assume that the message length is multiple of bytes.
        if (  (*mlen & 0xf) != 0  )  {
              memset(ciphertextblock, 0, 16);
              memcpy(ciphertextblock, c+i, *mlen & 0xf);
              aegis256_dec_aut_step(plaintextblock, ciphertextblock, aegis256_state);
              memcpy(m+i, plaintextblock, *mlen & 0xf);

              //need to modify the state here (because in the last block, keystream is wrongly used to update the state)
              memset(plaintextblock, 0, *mlen & 0xf);
              ((unsigned long long*)aegis256_state)[0] ^= ((unsigned long long*)plaintextblock)[0];
              ((unsigned long long*)aegis256_state)[1] ^= ((unsigned long long*)plaintextblock)[1];
        }

        //we assume that the tag length is multiple of bytes
        aegis256_tag_generation(*mlen, adlen, 16, tag, aegis256_state);

        //verification
        for (i = 0; i  < 16; i++) check |= (tag[i] ^ c[clen - 16 + i]);
        if (check == 0) return 0;
        else return -1;
}


