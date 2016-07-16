#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "silc.h"
#include "api.h"

/* setup key */
int ae_init(ae_cxt* cxt, const byte* userkey, int keylen)
{
	if(keylen != CRYPTO_KEYBYTES){
		return KEY_ERROR;
	}
	cxt->userkey = (byte*)userkey;
	cxt->klen = keylen;

	return SUCCESS;
}

/* associated data and nonce length in byte
 * nlen should be less than 16 bytes and larger than 0 byte;
 */
int process_ad(ae_cxt* cxt, const byte* ad, unsigned long long adlen, const byte* nonce, unsigned long long nlen)
{
	byte* state = cxt->es;

	cxt->ad = (byte*) ad;
	cxt->adlen = adlen;
	cxt->nonce = (byte*) nonce;
	cxt->nlen = nlen;

	/* process the nonce */
	memset(state, 0, STATE_LEN);
	state[STATE_LEN-nlen-1] = PARAM;
	memcpy(state+STATE_LEN-nlen, nonce, nlen);
	LED80_enc(state, cxt->userkey);

	/* process the middle normal blocks of ad */
	unsigned long long i;
	for(i = 0; i < (unsigned long long)adlen/STATE_LEN; i++){
		xor_bytes(state, ad+STATE_LEN*i, STATE_LEN);
		LED80_enc(state, cxt->userkey);
	}
	/* process the last block partial block if any */
	unsigned long long lastblocklen = adlen % STATE_LEN;
	if(lastblocklen){
		xor_bytes(state, ad+i*STATE_LEN, lastblocklen);
		LED80_enc(state, cxt->userkey);
	}

	/* encode the adlen and process */
	unsigned long long t_adlen = adlen;
	for(i = 0; i < sizeof(unsigned long long); i++) {
		state[STATE_LEN-1-i] ^= t_adlen & 0xff;
		t_adlen >>= 8;
	}

	g(state);
	memcpy(cxt->ts, state, STATE_LEN);
	LED80_enc(state, cxt->userkey);

	g(cxt->ts);
	LED80_enc(cxt->ts, cxt->userkey);
	return SUCCESS;
}

/*
 * plaintext, message length in byte, ciphertext, associated data, and associated data length in byte tag, and tag length in byte
 */
int ae_encrypt(ae_cxt* cxt, byte* pt, unsigned long long mlen, byte* ct, byte* tag, unsigned long long tlen, int enc_dec)
{
	cxt->pt = pt;
	cxt->ptlen = mlen;
	cxt->ct = ct;
	cxt->ctlen = mlen;
	cxt->tag = tag;
	cxt->tlen = tlen;

	byte* es = cxt->es;
	byte* ts = cxt->ts;


	unsigned long long pc = 0;
	while((pc + STATE_LEN) < mlen){
		if(enc_dec == ENC){ // encryption
			xor_bytes(es, pt+pc, STATE_LEN);
			memcpy(ct+pc, es, STATE_LEN);
		}
		else{ // decryption
			xor_bytes2(pt+pc, ct+pc, es, STATE_LEN);
			memcpy(es, ct+pc, STATE_LEN);
		}
		xor_bytes(ts, es, STATE_LEN);
		LED80_enc(ts, cxt->userkey);
		/* apply fix1 */
		es[0] |= 0x80;
		LED80_enc(es, cxt->userkey);
		pc += STATE_LEN;
	}

	/* process the last block */
	unsigned long long lastblocklen = mlen - pc;

	if(lastblocklen > 0){
		if(enc_dec == ENC){ // encryption
			xor_bytes(es, pt+pc, lastblocklen);
			memcpy(ct+pc, es, lastblocklen);
		}
		else{ // decryption
			xor_bytes2(pt+pc, ct+pc, es, lastblocklen);
			memcpy(es, ct+pc, lastblocklen);
		}
		xor_bytes(ts, es, lastblocklen);
		LED80_enc(ts, cxt->userkey);
	}
	/* encode the adlen and process */
	unsigned long long t_adlen = mlen;
	unsigned long long i;
	for(i = 0; i < sizeof(unsigned long long); i++) {
		ts[STATE_LEN-1-i] ^= t_adlen & 0xff;
		t_adlen >>= 8;
	}
	g(ts);
	LED80_enc(ts, cxt->userkey);

	memcpy(tag, ts, tlen);
	return SUCCESS;
}

