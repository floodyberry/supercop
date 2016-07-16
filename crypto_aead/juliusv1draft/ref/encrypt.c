#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BLK_SIZE 16
#define NPUB_SIZE 16
#define KEY_SIZE 16
#define EXPANDED_KEY_SIZE 44

#include "functions.c"

void julius_regular_involution(unsigned char *pad, unsigned long long padlen, 
		unsigned long long reg_index, unsigned long expanded_key[EXPANDED_KEY_SIZE]){
	int i; //RRR j?
	unsigned long long cur;
	unsigned char seed[BLK_SIZE];
	unsigned char mu[BLK_SIZE];
	unsigned char tmp_mask[BLK_SIZE];
	unsigned char delta[BLK_SIZE];
	for(i = 0; i < BLK_SIZE; i++){
		delta[i] = 0;
	}
	aes_128_encrypt(delta, expanded_key);
	
	evaluate_by_delta(seed, delta, pad, padlen / BLK_SIZE);
	memcpy(mu, seed, BLK_SIZE);
	aes_128_encrypt(mu, expanded_key);
	
	if(((padlen - reg_index) / BLK_SIZE) % 2 == 0){
		cur = reg_index;
		memcpy(tmp_mask, mu, BLK_SIZE);
		for(cur = reg_index; cur < padlen; cur = cur + BLK_SIZE){
			add_to_first(&pad[cur], tmp_mask);
			mul_by_delta(tmp_mask, delta);
		}
	}else{
		cur = reg_index;
		memcpy(tmp_mask, mu, BLK_SIZE);
		
		//first block:
		add_to_first(&pad[cur], tmp_mask);
		cur = cur + BLK_SIZE;
		
		//second block:
		if(cur < padlen){
			mul_by_delta(tmp_mask, delta);
			add_to_first(&pad[cur], tmp_mask);
			add_to_first(&pad[cur], mu);
			cur = cur + BLK_SIZE;
		}
		
		//rest of the blocks:
		for(; cur < padlen; cur = cur + BLK_SIZE){
			add_to_first(&pad[cur], tmp_mask);
			mul_by_delta(tmp_mask, delta);
		}
	}
	
}



void regular_ecb_encrypt(unsigned char *reg, unsigned long long reg_len, 
		unsigned long expanded_key[EXPANDED_KEY_SIZE]){
	unsigned long long cur;
	for(cur = 0; cur < reg_len; cur = cur + BLK_SIZE){
		aes_128_encrypt(&reg[cur], expanded_key); 
	}
} 

void regular_ecb_decrypt(unsigned char *reg, unsigned long long reg_len,
		unsigned long expanded_key[EXPANDED_KEY_SIZE]){
	unsigned long long cur;
	for(cur = 0; cur < reg_len; cur = cur + BLK_SIZE){
		aes_128_decrypt(&reg[cur], expanded_key); 
	}
}







int crypto_aead_encrypt(
		unsigned char *c,unsigned long long *clen,
		const unsigned char *m, unsigned long long mlen,
		const unsigned char *ad, unsigned long long adlen,
		const unsigned char *nsec, const unsigned char *npub,
		const unsigned char *k){
		
		
	unsigned long expanded_key[EXPANDED_KEY_SIZE];
	KeyExpansion(k, expanded_key, 128);
	*clen = calc_ciphertext_len_regular_version(mlen);
	unsigned long long padlen = 
			calc_pad_len_regular_version(mlen, adlen, NPUB_SIZE);
	unsigned char* pad = (unsigned char *) malloc(padlen);
	int i;
	int adres, pres;
	if(adlen % BLK_SIZE == 0){
		adres = 0;
	}else{
		adres = BLK_SIZE - (adlen % BLK_SIZE);
	}
	if(mlen % BLK_SIZE == 0){
		pres = 0;
	}else{
		pres = BLK_SIZE - (mlen % BLK_SIZE);
	}
	unsigned long long tmp;
	unsigned long long reg_index;
	unsigned long long cur = 0;
	
	//padding:
	for(i = 0; i < BLK_SIZE - 1; i++){
		pad[cur] = 0;
		cur++;
	}
	pad[cur] = 1;
	cur++;
	
	
	memcpy(&pad[cur], npub, NPUB_SIZE);
	cur = cur + NPUB_SIZE;
	
	
	tmp = adlen;
	for(i = 0; i < 8; i++){
		pad[cur + 7 - i] = tmp % 256;
		tmp = tmp / 256;
	}
	cur = cur + 8;
	
	
	tmp = mlen;
	for(i = 0; i < 8; i++){
		pad[cur + 7 - i] = tmp % 256;
		tmp = tmp / 256;
	}
	cur = cur + 8;
	
	
	memcpy(&pad[cur], ad, adlen);
	cur = cur + adlen;
	reg_index = cur + adres;
	
	
	for(i = 0; i < BLK_SIZE + adres + pres; i++){
		pad[cur] = 0;
		cur++;
	}
	
	
	memcpy(&pad[cur], m, mlen);
	//end of padding.
	
	//the julius involution:
	julius_regular_involution(pad, padlen, reg_index, expanded_key);
	
	
	//ecb
	regular_ecb_encrypt(&pad[reg_index], *clen, expanded_key);
	
	
	memcpy(c, &pad[reg_index], *clen);
	free(pad);
	
	return 0;
}





int crypto_aead_decrypt(
		unsigned char *m,unsigned long long mlen,
		unsigned char *nsec, const unsigned char *c,
		unsigned long long clen, const unsigned char *ad,
		unsigned long long adlen, const unsigned char *npub,
		const unsigned char *k){
		   
	unsigned long expanded_key[EXPANDED_KEY_SIZE];
	KeyExpansion(k, expanded_key, 128);	
	
	unsigned char tmp_blk[BLK_SIZE];
	unsigned long long tmp_num[10]; //there is a strange bug when I write unsigned long long *tmp_num;
	
	//cases of short ciphertext:
	if(clen < BLK_SIZE){
		return -1;
	}
	if(clen == BLK_SIZE){
		crypto_aead_encrypt(tmp_blk, tmp_num, NULL, 0, ad, adlen, NULL, npub, k);
		if((memcpy(tmp_blk, c, BLK_SIZE) == 0) && (*tmp_num == BLK_SIZE)){
			return 0;
		}else{
			return -1;
		}
	}if((clen > BLK_SIZE) && (clen < 2 * BLK_SIZE)){
		return -1;
	}
	
	
	
	
	unsigned long long padlen = 
			calc_pad_len_regular_version(mlen, adlen, (unsigned long long) NPUB_SIZE);
	unsigned char* pad = (unsigned char *) malloc(padlen);
	int i;
	int adres, pres;
	if(adlen % BLK_SIZE == 0){
		adres = 0;
	}else{
		adres = BLK_SIZE - (adlen % BLK_SIZE);
	}
	if(mlen % BLK_SIZE == 0){
		pres = 0;
	}else{
		pres = BLK_SIZE - (mlen % BLK_SIZE);
	}
	unsigned long long tmp; //RR?
	unsigned long long reg_index;
	unsigned long long cur = 0;
	
	//padding:
	for(i = 0; i < BLK_SIZE - 1; i++){
		pad[cur] = 0;
		cur++;
	}
	pad[cur] = 1;
	cur++;
	
	
	memcpy(&pad[cur], npub, NPUB_SIZE);
	cur = cur + NPUB_SIZE;
	
	
	tmp = adlen;
	for(i = 0; i < 8; i++){
		pad[cur + 7 - i] = tmp % 256;
		tmp = tmp / 256;
	}
	cur = cur + 8;
	
	
	tmp = mlen;
	for(i = 0; i < 8; i++){
		pad[cur + 7 - i] = tmp % 256;
		tmp = tmp / 256;
	}
	cur = cur + 8;
	
	
	memcpy(&pad[cur], ad, adlen);
	cur = cur + adlen;
	
	
	for(i = 0; i < adres; i++){
		pad[cur] = 0;
		cur++;
	}
	reg_index = cur;
	
	
	memcpy(&pad[reg_index], c, clen);
	//end of padding.
	
	
	
	
	//ecb decryption:
	regular_ecb_decrypt(&pad[reg_index], clen, expanded_key);
	
	
	for(cur = reg_index; cur < reg_index + BLK_SIZE + pres; cur++){
		if(pad[cur] != 0){
			return -1;
		}
	}
	
	memcpy(m, &pad[cur], mlen);
	free(pad);
	
	return 0;
}




