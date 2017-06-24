#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "cloc.h"
#include "api.h"
#include "twine.h"


#define fix1(x) x = ORDQW((x), _mm_set_epi8(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x80))  /* the fix1 function fixes the MSB of first two 4-bit nibbles to '1' */

#define fix0(x)         x = ANDDQW((x), _mm_set_epi8(0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f))     /* the fix0 function fixes the MSB of first two nibbles to '0' */
/* G^8 */
//state: d c b a
//output: d c b a ^ c a d c ^ b b 0 0
#define f1(state)\
	(state) = XORDQW((state), XORDQW(PSHUFB((state), CLOC_CADC), PSHUFB((state), CLOC_BB00)));


/* G^1 */
//state: d c b a
//output: b d c b ^ a 0 0 0
#define G(state)\
	(state) = XORDQW(PSHUFB((state), CLOC_BDCB), PSHUFB((state), CLOC_A000));\
	

/* f2 = G^1 */
#define f2(state) G(state);


/* G^2 */
//state: d c b a
//output: c a d c ^ b b 0 0 
#define g1(state)\
	(state) = XORDQW(PSHUFB((state), CLOC_CADC), PSHUFB((state), CLOC_BB00));

/* G^1 */
#define g2(state) f2(state);



/* G^4 */
//state: d c b a
//output: d c b a ^ bdcb ^ a 0 0 0
#define h(state)\
	(state) = XORDQW((state), XORDQW(PSHUFB((state), CLOC_A000), PSHUFB((state), CLOC_BDCB)));

void ae_clear(ae_cxt* cxt){
    cxt->es = SETZERO();
    cxt->ts = SETZERO();
    cxt->userkey = NULL;
    cxt->klen = 0;
    cxt->ad = NULL;
    cxt->adlen = 0;
    cxt->nonce = NULL;
    cxt->nlen = 0;
    cxt->pt = NULL;
    cxt->ptlen = 0;
    cxt->ct = NULL;
    cxt->ctlen = 0;
    cxt->tag = NULL;
    cxt->tlen = 0;
}


/* setup key */
int ae_init(ae_cxt* cxt, const byte* userkey, int keylen)
{
	if(keylen/8 != CRYPTO_KEYBYTES){
		return KEY_ERROR;
	}
	cxt->userkey = (byte*)userkey;
	cxt->klen = keylen;
	TWINE80_Keyschedule(cxt->userkey);
	return SUCCESS;
}


/* associated data and nonce length in byte
 * nlen should be less than 16 bytes and larger than 0 byte;
 */
int process_ad(ae_cxt* cxt, const byte* ad, unsigned long long adlen, const byte* nonce, unsigned long long nlen)
{
	int msb = 0;
	int i = 0;
	int unfull = 0;
	ALIGN16(unsigned char tmp[16]);
	dqword state;
	if(adlen < STATE_LEN){
		memset(tmp, 0, sizeof(tmp));
		memcpy(tmp, ad, adlen);
		tmp[adlen] = 0x80;
		msb = tmp[0] & 0x80;
		state = LOAD(tmp);
		i = adlen;
		unfull = 1;
	}
	else{
		msb = ad[0] & 0x80;
		state = LOAD128L(ad);
		i = STATE_LEN;
	}

	fix0(state);
	TWINE80_enc(&state);
	if(msb){
		h(state);
	}

	// if a >= 2
	while((i+STATE_LEN) <= adlen){
		state = XORDQW(state, LOAD128L(ad+i));
		TWINE80_enc(&state);
		i += STATE_LEN;
	}
	// |A[a]| != n
	if(i < adlen){
		//SH[a] ← EK(SH[a − 1] ⊕ ozp(A[a]))
		memset(tmp, 0, sizeof(tmp));
		memcpy(tmp, ad+i, adlen-i);
		tmp[adlen-i] = 0x80;
		state = XORDQW(state, LOAD(tmp));
		TWINE80_enc(&state);
		unfull = 1;
	}

	//SH[a] ⊕ ozp(param ∥ N)
	memset(tmp, 0, sizeof(tmp));
	tmp[0] = PARAM;
	memcpy(tmp+1, nonce, nlen);
	if(nlen + 1 != STATE_LEN){
		tmp[nlen+1] = 0x80; //  ozp
	}
	state = XORDQW(state, LOAD(tmp));
	if(unfull){
		f2(state);
	}
	else{
		f1(state);
	}
	cxt->es = state;
	return SUCCESS;
}

/*
 * plaintext, message length in byte, ciphertext, associated data, and associated data length in byte tag, and tag length in byte
 */
int ae_encrypt(ae_cxt* cxt, byte* pt, unsigned long long mlen, byte* ct, byte* tag, unsigned long long tlen)
{
	ALIGN16(unsigned char tmp[16]);
	dqword state = cxt->es;
	// if |M| = 0 
	if(mlen == 0){
		g1(state);
		TWINE80_enc(&state);
		STORE(tmp, state);
		memcpy(tag, tmp, tlen);
		return SUCCESS;
	}

	/*
	SE[1] ← EK(V )
	SP[0] ← EK(g2(V))
	state = SP[0] || SE[1]
	*/
	g2(state);
	state = _mm_unpacklo_epi64(cxt->es, state);
	TWINE80_enc(&state);

	/*
	for i ← 1 to m − 1 do
 		C[i] ← SE[i] ⊕ M[i]
 		SE[i + 1] ← EK(fix1(C[i]))
 		SP[i] ← EK(SP[i − 1] ⊕ C[i])

	*/
 	int i = 0;
 	while((i+STATE_LEN) < mlen){
 		state = XORDQW(state, LOAD128L(pt+i)); //C[i] ← SE[i] ⊕ M[i]
 		STORE128L(ct+i, state);
 		state = XORDQW(state, SHL(state, 8)); //SP[i − 1] ⊕ C[i]
 		fix1(state);
 		TWINE80_enc(&state);
 		i += STATE_LEN;
 	}

 	if(i + STATE_LEN == mlen){
	 	//C[m] ← (SE[m]) ⊕ M[m]
 		state = XORDQW(state, LOAD128L(pt+i));
 		STORE128L(ct+i, state);
 		//SP[m] ← EK(f1(SP[m − 1] ⊕ C[m]))
 		// move SP[m] into low 64 bit
 		state = XORDQW(state, SHR(state, 8));
 		f1(state);
 		TWINE80_enc(&state);
 	}
 	else{
	 	//C[m] ← msb|M[m]|(SE[m]) ⊕ M[m]
 		memset(tmp, 0, sizeof(tmp));
 		int lastblock = mlen - i;
 		memcpy(tmp, pt+i, lastblock);
 		state = XORDQW(state, LOAD(tmp));

 		STORE(tmp, state);
 		memcpy(ct+i, tmp, lastblock);
 		//SP[m] ← EK(f2(SP[m − 1] ⊕ ozp(C[m])))
 		//ozp(C[m])
 		tmp[lastblock] = 0x80;
 		memset(tmp+lastblock+1, 0, STATE_LEN - lastblock-1);
		state = XORDQW(LOAD(tmp), SHR(state, 8));
 		f2(state);
 		TWINE80_enc(&state);
 	}
 	//T ← msbτ(SP[m])
 	STORE(tmp, state);
 	memcpy(tag, tmp, tlen);
	return SUCCESS;
}

/*
 * plaintext, message length in byte, ciphertext, associated data, and associated data length in byte tag, and tag length in byte
 */
int ae_decrypt(ae_cxt* cxt, byte* pt, unsigned long long mlen, byte* ct, byte* tag, unsigned long long tlen)
{
	ALIGN16(unsigned char tmp[16]);
	dqword state = cxt->es;
	dqword tmpState;
	// if |M| = 0 
	if(mlen == 0){
		g1(state);
		TWINE80_enc(&state);
		STORE(tmp, state);
		memcpy(tag, tmp, tlen);
		return SUCCESS;
	}

	/*
	 SD[1] ← EK(V)
	SP[0] ← EK(g2(V))
	state = SP[0] || SE[1]
	*/
	g2(state);
	state = _mm_unpacklo_epi64(cxt->es, state);
	TWINE80_enc(&state);

	/*
	for i ← 1 to m − 1 do
 		M[i] ← SD[i] ⊕ C[i]
 		SD[i + 1] ← EK(fix1(C[i]))
 		SP[i] ← EK(SP[i − 1] ⊕ C[i])
		
	*/
 	int i = 0;
 	while((i+STATE_LEN) < mlen){
 		dqword ciphertext = LOAD128L(ct+i);
 		dqword plaintext  = XORDQW(state, ciphertext); //M[i] ← SD[i] ⊕ C[i]
 		STORE128L(pt+i, plaintext);
 		ciphertext = PSHUFB(ciphertext, _mm_set_epi8(7, 6, 5, 4, 3, 2, 1, 0, 7, 6, 5, 4, 3, 2, 1, 0));//SP[i-1] || C[i]
 		state = XORDQW(MASK128U(state), ciphertext); //SP[i − 1] ⊕ C[i]
 		fix1(state);
 		TWINE80_enc(&state);
 		i += STATE_LEN;
 	}

 	if(i + STATE_LEN == mlen){
	 	//M[m] ← msb|C[m]|(SD[m]) ⊕ C[m]
	 	dqword ciphertext = LOAD128L(ct+i);
 		state = XORDQW(state, ciphertext);
 		STORE128L(pt+i, state);
 		//SP[m] ← EK(f1(SP[m − 1] ⊕ C[m]))
 		// move SP[m] into low 64 bit
 		state = XORDQW(ciphertext, SHR(state, 8));
 		f1(state);
 		TWINE80_enc(&state);
 	}
 	else{
	 	//M[m] ← msb|C[m]|(SD[m]) ⊕ C[m]
 		memset(tmp, 0, sizeof(tmp));
 		int lastblock = mlen - i;
 		memcpy(tmp, ct+i, lastblock);
 		dqword ciphertext = LOAD(tmp);
 		state = XORDQW(state, ciphertext);
		//SP[m] ← EK(f2(SP[m − 1] ⊕ ozp(C[m])))
 		tmp[lastblock] = 0x80;//ozp(C[m])
 		ciphertext = LOAD(tmp);
 		state = XORDQW(state, SHL(ciphertext, 8));
 		STORE(tmp, state);
 		memcpy(pt+i, tmp, lastblock);

 		//move sp into low 64bit
 		state = SHR(state, 8);
 		f2(state);
 		TWINE80_enc(&state);
 	}

 	//T ← msbτ(SP[m])
 	STORE(tmp, state);
 	memcpy(tag, tmp, tlen);
	return SUCCESS;
}
