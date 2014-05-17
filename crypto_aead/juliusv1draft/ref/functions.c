
#include "AES/aes.c"


void add_to_first(unsigned char blk1[BLK_SIZE], unsigned char blk2[BLK_SIZE]){
	int i;
	for(i = 0; i < BLK_SIZE; i++){
		blk1[i] = blk1[i] ^ blk2[i];
	}
}

void mul_by_x(unsigned char blk[BLK_SIZE]){
	int i;
	unsigned char tmp = (blk[0] / 128) * 135;
	for(i = 0; i < 15; i++){
		blk[i] = (2 * blk[i]) ^ (blk[i+1] / 128);
	}
	blk[15] = (2 * blk[15]) ^ tmp;	
}

void mul_by_delta(unsigned char blk[BLK_SIZE], unsigned char delta[BLK_SIZE]){
	int i,j;
	int power;
	unsigned char res[BLK_SIZE] = {0};
	unsigned char tmp[BLK_SIZE];
	memcpy(tmp, blk, BLK_SIZE);
	for(i = 15; i >= 0; i--){
		power = 1;
		for(j = 0; j < 8; j++){
			if(delta[i] >= power){
				add_to_first(res, tmp);
			}
			power = power * 2;
			mul_by_x(tmp);
		}
	}
	memcpy(blk, res, BLK_SIZE);
}


void evaluate_by_delta(unsigned char res[BLK_SIZE], unsigned char delta[BLK_SIZE], 
		unsigned char *str, unsigned long long blks_len){
	int i;
	unsigned long long cur = BLK_SIZE;
	memcpy(res, str, BLK_SIZE);
	for(i = 0; i < blks_len - 1; i++){
		mul_by_delta(res, delta);
		add_to_first(res, &str[cur]);
		cur = cur + BLK_SIZE;
	}				
}




unsigned long long calc_pad_len_regular_version(unsigned long long mlen, 
		unsigned long long adlen, int npublen){
	int tmp;
	unsigned long long ret = 48 + mlen + adlen + npublen;
	tmp = mlen % BLK_SIZE;
	if(tmp != 0){
		ret = ret + 16 - tmp;
	}
	tmp = (adlen + npublen) % BLK_SIZE;
	if(tmp != 0){
		ret = ret + 16 - tmp;
	}
	
	return ret;
}

unsigned long long calc_ciphertext_len_regular_version(unsigned long long mlen){
	int tmp;
	unsigned long long ret = 16 + mlen;
	
	tmp = mlen % BLK_SIZE;
	if(tmp != 0){
		ret = ret + 16 - tmp;
	}
	
	
	return ret; 
}


void aes_128_encrypt(unsigned char blk[BLK_SIZE], unsigned long expanded_key[EXPANDED_KEY_SIZE]){
	unsigned char tmp_blk[BLK_SIZE];
	memcpy(tmp_blk, blk, BLK_SIZE);
	aes_encrypt(tmp_blk, blk, expanded_key, 128);
}

void aes_128_decrypt(unsigned char blk[BLK_SIZE], unsigned long expanded_key[EXPANDED_KEY_SIZE]){
	unsigned char tmp_blk[BLK_SIZE];
	memcpy(tmp_blk, blk, BLK_SIZE);
	aes_decrypt(tmp_blk, blk, expanded_key, 128);
}

