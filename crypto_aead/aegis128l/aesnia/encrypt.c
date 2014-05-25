/*The optimized implementation of AEGIS-128L. No loop unrolling, inline is used.*/

#include <string.h>     
#include <immintrin.h>  
#include <wmmintrin.h>  
#include "crypto_aead.h" 

#ifdef _MSC_VER
#define inline __inline
#endif

// The initialization state of AEGIS
/*The input to initialization is the 128-bit key; 128-bit IV;*/
void aegis128L_initialization(const unsigned char *key, const unsigned char *iv, __m128i *state)
{
       int i;

        __m128i  tmp;
        __m128i  keytmp = _mm_load_si128((__m128i*)key);
        __m128i  ivtmp  = _mm_load_si128((__m128i*)iv);

        state[0] = _mm_xor_si128(keytmp, ivtmp);
        state[1] = _mm_set_epi8(0xdd,0x28,0xb5,0x73,0x42,0x31,0x11,0x20,0xf1,0x2f,0xc2,0x6d,0x55,0x18,0x3d,0xdb);
        state[2] = _mm_set_epi8(0x62,0x79,0xe9,0x90,0x59,0x37,0x22,0x15,0x0d,0x08,0x05,0x03,0x02,0x01,0x1, 0x0);
        state[3] = _mm_set_epi8(0xdd,0x28,0xb5,0x73,0x42,0x31,0x11,0x20,0xf1,0x2f,0xc2,0x6d,0x55,0x18,0x3d,0xdb);
        state[4] = _mm_xor_si128(keytmp, ivtmp);
        state[5] = _mm_xor_si128(keytmp, _mm_set_epi8(0x62,0x79,0xe9,0x90,0x59,0x37,0x22,0x15,0x0d,0x08,0x05,0x03,0x02,0x01,0x1,0x0));
        state[6] = _mm_xor_si128(keytmp, _mm_set_epi8(0xdd,0x28,0xb5,0x73,0x42,0x31,0x11,0x20,0xf1,0x2f,0xc2,0x6d,0x55,0x18,0x3d,0xdb));
        state[7] = _mm_xor_si128(keytmp, _mm_set_epi8(0x62,0x79,0xe9,0x90,0x59,0x37,0x22,0x15,0x0d,0x08,0x05,0x03,0x02,0x01,0x1,0x0));

        for (i = 0; i < 10; i++)  {
             //state update function;
             tmp = state[7];
             state[7] = _mm_aesenc_si128(state[6],state[7]);
             state[6] = _mm_aesenc_si128(state[5],state[6]);
             state[5] = _mm_aesenc_si128(state[4],state[5]);
             state[4] = _mm_aesenc_si128(state[3],state[4]);
             state[3] = _mm_aesenc_si128(state[2],state[3]);
             state[2] = _mm_aesenc_si128(state[1],state[2]);
             state[1] = _mm_aesenc_si128(state[0],state[1]);
             state[0] = _mm_aesenc_si128(tmp,state[0]);

             //message is used to update the state.
             state[0] = _mm_xor_si128(state[0],ivtmp);
             state[4] = _mm_xor_si128(state[4],keytmp);
       }
}

//the finalization state of AEGIS
void aegis128L_tag_generation(unsigned long long msglen, unsigned long long adlen, unsigned char maclen, unsigned char *mac, __m128i *state)
{
       int i;

        __m128i  tmp;
        __m128i  msgtmp;
        unsigned char t[16],tt[16];


        for (i = 0; i < 16; i++) tt[i] = 0;


        ((unsigned long long*)tt)[0] = adlen << 3;
        ((unsigned long long*)tt)[1] = msglen << 3;
        msgtmp = _mm_load_si128((__m128i*)tt);

        msgtmp = _mm_xor_si128(msgtmp, state[2]);   //note the change

        for (i = 0; i < 7; i++) {
             //state update function
             tmp = state[7];
             state[7] = _mm_aesenc_si128(state[6],state[7]);
             state[6] = _mm_aesenc_si128(state[5],state[6]);
             state[5] = _mm_aesenc_si128(state[4],state[5]);
             state[4] = _mm_aesenc_si128(state[3],state[4]);
             state[3] = _mm_aesenc_si128(state[2],state[3]);
             state[2] = _mm_aesenc_si128(state[1],state[2]);
             state[1] = _mm_aesenc_si128(state[0],state[1]);
             state[0] = _mm_aesenc_si128(tmp,state[0]);

             //message is used to update the state.
             state[0] = _mm_xor_si128(state[0],msgtmp);
             state[4] = _mm_xor_si128(state[4],msgtmp);
        }

        state[6] = _mm_xor_si128(state[6], state[5]);
        state[6] = _mm_xor_si128(state[6], state[4]);
        state[6] = _mm_xor_si128(state[6], state[3]);
        state[6] = _mm_xor_si128(state[6], state[2]);
        state[6] = _mm_xor_si128(state[6], state[1]);
        state[6] = _mm_xor_si128(state[6], state[0]);

        _mm_store_si128((__m128i*)t, state[6]);
        //in this program, the mac length is assumed to be multiple of bytes
        memcpy(mac,t,maclen);
}


//one step of encryption
inline void aegis128L_enc_aut_step(const unsigned char *plaintextblk, unsigned char *ciphertextblk, __m128i *state)
{
        __m128i ct0,ct1;
        __m128i tmp;
        __m128i msg0 = _mm_load_si128((__m128i*)plaintextblk);
        __m128i msg1 = _mm_load_si128((__m128i*)(plaintextblk+16));

        //encryption
        ct0 = _mm_xor_si128(msg0, state[6]);
        ct0 = _mm_xor_si128(ct0,  state[1]);
        ct1 = _mm_xor_si128(msg1, state[2]);
        ct1 = _mm_xor_si128(ct1,  state[5]);
        ct0 = _mm_xor_si128(ct0,  _mm_and_si128(state[2], state[3]));
        ct1 = _mm_xor_si128(ct1,  _mm_and_si128(state[6], state[7]));
    	_mm_store_si128((__m128i*)ciphertextblk, ct0);
    	_mm_store_si128((__m128i*)(ciphertextblk+16), ct1);

        //state update function
        tmp = state[7];
        state[7] = _mm_aesenc_si128(state[6],state[7]);
        state[6] = _mm_aesenc_si128(state[5],state[6]);
        state[5] = _mm_aesenc_si128(state[4],state[5]);
        state[4] = _mm_aesenc_si128(state[3],state[4]);
        state[3] = _mm_aesenc_si128(state[2],state[3]);
        state[2] = _mm_aesenc_si128(state[1],state[2]);
        state[1] = _mm_aesenc_si128(state[0],state[1]);
        state[0] = _mm_aesenc_si128(tmp,state[0]);

        //message is used to update the state.
        state[0] = _mm_xor_si128(state[0],msg0);
        state[4] = _mm_xor_si128(state[4],msg1);
}



//one step of decryption
inline void aegis128L_dec_aut_step(unsigned char *plaintextblk,
       const unsigned char *ciphertextblk, __m128i *state)
{
        __m128i msg0 = _mm_load_si128((__m128i*)ciphertextblk);
        __m128i msg1 = _mm_load_si128((__m128i*)(ciphertextblk+16));
        __m128i tmp;

        //decryption
        msg0 = _mm_xor_si128(msg0, state[6]);
        msg0 = _mm_xor_si128(msg0, state[1]);
        msg1 = _mm_xor_si128(msg1, state[2]);
        msg1 = _mm_xor_si128(msg1, state[5]);
        msg0 = _mm_xor_si128(msg0, _mm_and_si128(state[2], state[3]));
        msg1 = _mm_xor_si128(msg1, _mm_and_si128(state[6], state[7]));
        _mm_store_si128((__m128i*)plaintextblk, msg0);
        _mm_store_si128((__m128i*)(plaintextblk+16), msg1);

        //state update function
        tmp = state[7];
        state[7] = _mm_aesenc_si128(state[6],state[7]);
        state[6] = _mm_aesenc_si128(state[5],state[6]);
        state[5] = _mm_aesenc_si128(state[4],state[5]);
        state[4] = _mm_aesenc_si128(state[3],state[4]);
        state[3] = _mm_aesenc_si128(state[2],state[3]);
        state[2] = _mm_aesenc_si128(state[1],state[2]);
        state[1] = _mm_aesenc_si128(state[0],state[1]);
        state[0] = _mm_aesenc_si128(tmp,state[0]);

        //message is used to update the state.
        state[0] = _mm_xor_si128(state[0],msg0);
        state[4] = _mm_xor_si128(state[4],msg1);
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
        unsigned char plaintextblock[32], ciphertextblock[32], mac[16];
        __m128i aegis128L_state[8];

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
        // In this program, we assume that the message length is multiple of bytes.
        if (  (mlen & 0x1f) != 0 )  {
              memset(plaintextblock, 0, 32);
              memcpy(plaintextblock, m+i, mlen & 0x1f);
              aegis128L_enc_aut_step(plaintextblock, ciphertextblock, aegis128L_state);
              memcpy(c+i,ciphertextblock,mlen & 0x1f);
        }

        // finalization stage, we assume that the tag length is multiple of bytes
        aegis128L_tag_generation(mlen,adlen, 16, mac, aegis128L_state);
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
        __m128i aegis128L_state[8];

        if (clen < 16) return 1; 

        aegis128L_initialization(k, npub, aegis128L_state);

        //process the associated data
        for (i = 0; i+32 <= adlen; i += 32) {
              aegis128L_enc_aut_step(ad+i, ciphertextblock, aegis128L_state);
        }

        //deal with the partial block of associated data
        //in this program, we assume that the message length is multiple of bytes.
        if (  (adlen & 0x1f) != 0 )  {
              memset(plaintextblock, 0, 32);
              memcpy(plaintextblock, ad+i, adlen & 0x1f);
              aegis128L_enc_aut_step(plaintextblock, ciphertextblock, aegis128L_state);
        }

        //decrypt the ciphertext
        *mlen = clen - 16;  
        for (i = 0; (i+32) <= *mlen; i += 32) {
              aegis128L_dec_aut_step(m+i, c+i, aegis128L_state);
        }

        // Deal with the partial block
        // In this program, we assume that the message length is multiple of bytes.

        if (  (*mlen & 0x1f) != 0 )  {
              memset(ciphertextblock, 0, 32);
              memcpy(ciphertextblock, c+i,  *mlen & 0x1f);
              aegis128L_dec_aut_step(plaintextblock, ciphertextblock, aegis128L_state);
              memcpy(m+i, plaintextblock, *mlen & 0x1f);

              //need to modify the state here (because in the last block, keystream is wrongly used to update the state)
              memset(plaintextblock, 0, *mlen & 0x1f);
              aegis128L_state[0] = _mm_xor_si128( aegis128L_state[0], _mm_load_si128((__m128i*)plaintextblock)  ) ;
              aegis128L_state[4] = _mm_xor_si128( aegis128L_state[4], _mm_load_si128((__m128i*)(plaintextblock+16) )  ) ;
        }

        //we assume that the tag length is multiple of bytes
        aegis128L_tag_generation(*mlen, adlen, 16, tag, aegis128L_state);

        //verification
        for (i = 0; i  < 16; i++) check |= (tag[i] ^ c[i+*mlen]);  
        if (check == 0) return 0;
        else return 1;
}

