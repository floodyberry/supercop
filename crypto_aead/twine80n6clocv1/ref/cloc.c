#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "cloc.h"
#include "api.h"
#include "twine.h"

/* setup key */
int ae_init(ae_cxt* cxt, const byte* userkey, int keylen)
{
	if(keylen/8 != CRYPTO_KEYBYTES){
		return KEY_ERROR;
	}
	cxt->userkey = (byte*)userkey;
	Keyschedule(keylen, userkey);
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
	/* process the first block */
	int ozp = 0;
	if(adlen < STATE_LEN){       // less than one block
		memcpy(state, ad, adlen);
		memset(state+adlen, 0, STATE_LEN-adlen);
		state[adlen] = 0x80;
		ozp = 1;                // one-zero padding works only if the adlen < 16
	}
	else{                       // full first block
		memcpy(state, ad, STATE_LEN);
	}

	/* apply fix0 and the E_k */
	int fix0 = state[0] & 0x80;    /* test if the MSB is zero */
	state[0] &= 0x7f;

	/* apply the first encryption */
	Encode(state, state);
	/* when fix0 works, apply h */
	if(fix0){
		word* wd = (word*) state;
		h(wd[0], wd[1], wd[2], wd[3]);
	}
	else{
		// do nothing
	}

	/* process the middle normal blocks of ad */
	unsigned long long i;
	for(i = 1; i < (unsigned long long)adlen/STATE_LEN; i++){
		xor_bytes(state, ad+i*STATE_LEN, STATE_LEN);
		pstate2("After xoring associated data:", state);
		Encode(state, state);
	}
	/* process the last block partial block if any */
	unsigned long long lastblocklen = adlen % STATE_LEN;
	if((adlen > STATE_LEN) && lastblocklen){
		xor_bytes(state, ad+i*STATE_LEN, lastblocklen);
		state[lastblocklen] ^= 0x80;
		pstate2("After processing last partial associated data block:", state);
		Encode(state, state);
		ozp = 1;
	}

	/* process the nonce */
	xor_bytes(state, nonce, nlen);

	/* apply padding to nonce */
	if(nlen != STATE_LEN)
		state[nlen] ^= 0x80;

	/* apply f1 or f2 to get V */
	if(ozp){ // apply f2
		word* wd = (word*) state;
		f2(wd[0], wd[1], wd[2], wd[3]);
	}
	else{ // apply f1
		word* wd = (word*) state;
		f1(wd[0], wd[1], wd[2], wd[3]);
	}
	pstate2("After applying f1/f2 to state:", state);

	memcpy(cxt->ts, state, STATE_LEN);
	Encode(state, state);

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

	word* wd = (word*) ts;
	if(mlen != 0){
		g2(wd[0], wd[1], wd[2], wd[3]);
		Encode(cxt->ts, cxt->ts);
	}
	else{
		g1(wd[0], wd[1], wd[2], wd[3]);
		Encode(cxt->ts, cxt->ts);
		memcpy(tag, ts, tlen);
		return SUCCESS;
	}


	unsigned long long pc = 0;
	while((pc + STATE_LEN) < mlen){
		if(enc_dec == ENC){ // encryption
			xor_bytes(es, pt+pc, STATE_LEN);
			pstate2("After xoring message block:", es);
			memcpy(ct+pc, es, STATE_LEN);
		}
		else{ // decryption
			xor_bytes2(pt+pc, ct+pc, es, STATE_LEN);
			pstate2("After xoring ciphertext block:", es);
			memcpy(es, ct+pc, STATE_LEN);
		}
		xor_bytes(ts, es, STATE_LEN);
		Encode(ts, ts);
		/* apply fix1 */
		es[0] |= 0x80;
		pstate2("After applying fix1:", es);
		Encode(es, es);
		pc += STATE_LEN;
	}

	/* process the last block */
	unsigned long long lastblocklen = mlen - pc;
	if(enc_dec == ENC){ // encryption
		xor_bytes(es, pt+pc, lastblocklen);
		pstate2("After xoring last partial message block:", es);
		memcpy(ct+pc, es, lastblocklen);
	}
	else{ // decryption
		xor_bytes2(pt+pc, ct+pc, es, lastblocklen);
		pstate2("After xoring last partial ciphertext block:", es);
		memcpy(es, ct+pc, lastblocklen);
	}
	xor_bytes(ts, es, lastblocklen);
	pstate2("tag state:", ts);
	if(lastblocklen != STATE_LEN){ // apply f2
		/* apply padding only when last message block is not full */
		ts[lastblocklen] ^= 0x80;
		word* wd = (word*) ts;
		f2(wd[0], wd[1], wd[2], wd[3]);
	}
	else{ // apply f1
		word* wd = (word*) ts;
		f1(wd[0], wd[1], wd[2], wd[3]);
	}

	pstate2("After applying f1/f2:", ts);
	Encode(ts, ts);
	memcpy(tag, ts, tlen);

	return SUCCESS;
}

