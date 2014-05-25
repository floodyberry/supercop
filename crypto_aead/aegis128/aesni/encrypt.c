/*The optimized implementation of AEGIS-128*/

#include <string.h>       
#include <immintrin.h> 
#include <wmmintrin.h> 

#include "crypto_aead.h"  

#ifdef _MSC_VER
#define inline __inline
#endif         

// The initialization state of AEGIS 
/*The input to initialization is the 128-bit key; 128-bit IV;*/
void aegis128_initialization(const unsigned char *key, const unsigned char *iv, __m128i *state)
{
       int i;

        __m128i  tmp;
        __m128i  keytmp = _mm_load_si128((__m128i*)key);
        __m128i  ivtmp  = _mm_load_si128((__m128i*)iv);

        state[0] =  ivtmp;
        state[1] = _mm_set_epi8(0xdd,0x28,0xb5,0x73,0x42,0x31,0x11,0x20,0xf1,0x2f,0xc2,0x6d,0x55,0x18,0x3d,0xdb);
        state[2] = _mm_set_epi8(0x62,0x79,0xe9,0x90,0x59,0x37,0x22,0x15,0x0d,0x08,0x05,0x03,0x02,0x01,0x1, 0x0);
        state[3] = _mm_xor_si128(keytmp, _mm_set_epi8(0x62,0x79,0xe9,0x90,0x59,0x37,0x22,0x15,0x0d,0x08,0x05,0x03,0x02,0x01,0x1,0x0));
        state[4] = _mm_xor_si128(keytmp, _mm_set_epi8(0xdd,0x28,0xb5,0x73,0x42,0x31,0x11,0x20,0xf1,0x2f,0xc2,0x6d,0x55,0x18,0x3d,0xdb));
        state[0] = _mm_xor_si128(state[0], keytmp);

        keytmp   = _mm_xor_si128(keytmp, ivtmp); 
        for (i = 0; i < 10; i++)  {
             //state update function
             tmp = state[4];
             state[4] = _mm_aesenc_si128(state[3], state[4]);
             state[3] = _mm_aesenc_si128(state[2], state[3]);
             state[2] = _mm_aesenc_si128(state[1], state[2]);
             state[1] = _mm_aesenc_si128(state[0], state[1]);
             state[0] = _mm_aesenc_si128(tmp, state[0]);

             //xor msg with state[0]
             keytmp   = _mm_xor_si128(keytmp, ivtmp);
             state[0] = _mm_xor_si128(state[0], keytmp);
        }
}


//the finalization state of AEGIS
void aegis128_tag_generation(unsigned long long msglen, unsigned long long adlen, unsigned char maclen, unsigned char *mac, __m128i *state)
{
       int i;

        __m128i  tmp;
        __m128i  msgtmp;
        unsigned char t[16],tt[16];

        for (i = 0; i < 16; i++) tt[i] = 0;

        ((unsigned long long*)tt)[0] = adlen  << 3;
        ((unsigned long long*)tt)[1] = msglen << 3;
        msgtmp = _mm_load_si128((__m128i*)tt);

        msgtmp = _mm_xor_si128(msgtmp, state[3]);

        for (i = 0; i < 7; i++) {
             //state update function
             tmp = state[4];
             state[4] = _mm_aesenc_si128(state[3],state[4]);
             state[3] = _mm_aesenc_si128(state[2],state[3]);
             state[2] = _mm_aesenc_si128(state[1],state[2]);
             state[1] = _mm_aesenc_si128(state[0],state[1]);
             state[0] = _mm_aesenc_si128(tmp,state[0]);

             //xor "msg" with state[0]
             state[0] = _mm_xor_si128(state[0], msgtmp);
        }

        state[4] = _mm_xor_si128(state[4], state[3]);
        state[4] = _mm_xor_si128(state[4], state[2]);
        state[4] = _mm_xor_si128(state[4], state[1]);
        state[4] = _mm_xor_si128(state[4], state[0]);

        _mm_store_si128((__m128i*)t, state[4]);
        //in this program, the mac length is assumed to be multiple of bytes
        memcpy(mac,t,maclen);
}


//one step of encryption
inline void aegis128_enc_aut_step(const unsigned char *plaintextblk,
       unsigned char *ciphertextblk, __m128i *state)
{
        __m128i t, ct;
        __m128i msg = _mm_load_si128((__m128i*)plaintextblk);
        __m128i tmp = state[4];

        //encryption
        t = _mm_and_si128(state[2], state[3]);
        ct = _mm_xor_si128(msg, state[4]);
        ct = _mm_xor_si128(ct, state[1]);
        ct = _mm_xor_si128(ct, t);
    	_mm_store_si128((__m128i*)ciphertextblk, ct);

        //state update function  
        state[4] = _mm_aesenc_si128(state[3],state[4]);
        state[3] = _mm_aesenc_si128(state[2],state[3]);
        state[2] = _mm_aesenc_si128(state[1],state[2]);
        state[1] = _mm_aesenc_si128(state[0],state[1]);
        state[0] = _mm_aesenc_si128(tmp,state[0]);

        //message is used to update the state.
        state[0] = _mm_xor_si128(state[0],msg);
}


//one step of decryption
inline void aegis128_dec_aut_step(unsigned char *plaintextblk,
       const unsigned char *ciphertextblk, __m128i *state)
{
        __m128i msg = _mm_load_si128((__m128i*)ciphertextblk);
        __m128i tmp = state[4];
                      
        //decryption  
        msg = _mm_xor_si128(msg, _mm_and_si128(state[2], state[3]));
        msg = _mm_xor_si128(msg, state[4]);
        msg = _mm_xor_si128(msg, state[1]);

        _mm_store_si128((__m128i*)plaintextblk, msg);

        //state update function
        state[4] = _mm_aesenc_si128(state[3],state[4]);
        state[3] = _mm_aesenc_si128(state[2],state[3]);
        state[2] = _mm_aesenc_si128(state[1],state[2]);
        state[1] = _mm_aesenc_si128(state[0],state[1]);
        state[0] = _mm_aesenc_si128(tmp,state[0]);

        //message is used to update the state
        state[0] = _mm_xor_si128(state[0],msg);
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
        unsigned long long i;  
        unsigned char plaintextblock[16], ciphertextblock[16], mac[16];  
        __m128i aegis128_state[5];  

        //initialization stage  
        aegis128_initialization(k, npub, aegis128_state);

        //process the associated data  
        for (i = 0; (i+16) <= adlen; i += 16) {  
              aegis128_enc_aut_step(ad+i, ciphertextblock, aegis128_state);    
        }

        //deal with the partial block of associated data
        //in this program, we assume that the message length is multiple of bytes.  
        if (  (adlen & 0xf) != 0 )  {    
              memset(plaintextblock, 0, 16);    
              memcpy(plaintextblock, ad+i, adlen & 0xf);    
              aegis128_enc_aut_step(plaintextblock, ciphertextblock, aegis128_state);  
        }

        //encrypt the plaintext
        for (i = 0; (i+16) <= mlen; i += 16) {  
              aegis128_enc_aut_step(m+i, c+i, aegis128_state);
        }

        // Deal with the partial block   
        // In this program, we assume that the message length is multiple of bytes.
        if (  (mlen & 0xf) != 0 )  { 
              memset(plaintextblock, 0, 16);  
              memcpy(plaintextblock, m+i, mlen & 0xf);  
              aegis128_enc_aut_step(plaintextblock, ciphertextblock, aegis128_state);
              memcpy(c+i,ciphertextblock, mlen & 0xf);  
        }     

        //finalization stage, we assume that the tag length is multiple of bytes
        aegis128_tag_generation(mlen,adlen, 16, mac, aegis128_state);
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
        unsigned long long i;
        unsigned char plaintextblock[16], ciphertextblock[16];
        unsigned char tag[16];
        unsigned char check = 0;
        __m128i aegis128_state[5];

        if (clen < 16) return -1; 

        aegis128_initialization(k, npub, aegis128_state);

        //process the associated data  
        for (i = 0; (i+16) <= adlen; i += 16) {
              aegis128_enc_aut_step(ad+i, ciphertextblock, aegis128_state);
        }

        //deal with the partial block of associated data  
        //in this program, we assume that the message length is multiple of bytes.
        if (  (adlen & 0xf) != 0 )  {  
              memset(plaintextblock, 0, 16);
              memcpy(plaintextblock, ad+i, adlen & 0xf);
              aegis128_enc_aut_step(plaintextblock, ciphertextblock, aegis128_state);
        }

        //decrypt the ciphertext
        *mlen = clen - 16; 
        for (i = 0; (i+16) <= *mlen; i += 16) {
              aegis128_dec_aut_step(m+i, c+i, aegis128_state);
        }

        // Deal with the partial block
        // In this program, we assume that the message length is multiple of bytes.
        if (  (*mlen & 0xf) != 0 )  {
              memset(ciphertextblock, 0, 16);
              memcpy(ciphertextblock, c+i, *mlen & 0xf);
              aegis128_dec_aut_step(plaintextblock, ciphertextblock, aegis128_state);
              memcpy(m+i, plaintextblock, *mlen & 0xf);

              //need to modify the state here (because in the last block, keystream is wrongly used to update the state)
              memset(plaintextblock, 0, *mlen & 0xf);
              aegis128_state[0] = _mm_xor_si128( aegis128_state[0], _mm_load_si128((__m128i*)plaintextblock)  ) ;
        }     

        //we assume that the tag length is multiple of bytes
        aegis128_tag_generation(*mlen, adlen, 16, tag, aegis128_state);

        //verification
        for (i = 0; i  < 16; i++) check |= (tag[i] ^ c[i+*mlen]);  
        if (check == 0) return 0;  
        else return -1;
}


