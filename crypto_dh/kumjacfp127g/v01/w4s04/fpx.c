//Huseyin Hisil, 2013.

#include "_core.h"
#include "fpx.h"

inline void fp_cnt_bits(int *bc, const uni an, const uni_t al){
	uni_t w, i, j;

	for(i = al - 1; (an[i] == 0) && (i > 0); i--);
	w = an[i];
	for(j = 0; w != 0; j++){
		w >>= 1;
	}
	(*bc) = j + i*UNIT_LEN;
}

inline void find_nextwindow(int *v, int *k, uni_t kl, int *wd, const uni en, const int i, uni_t WINDOW_SIZE_LTR, uni_t TABLE_SIZE_LTR){
	int t, u2, s, b, sl, sr;
	uni_t n;

	b = i/UNIT_LEN;
	sr = (i + 1) - (b*UNIT_LEN);
	sl = UNIT_LEN - sr;
	if(b < kl){
		n = en[b] << sl;
	}
	else{
		n = 0;
	}
	if((b != 0) && (sl != 0)){
		n |= (en[b - 1] >> sr);
	}
	t = n >> (UNIT_LEN - 1);
	if(((n >> (UNIT_LEN - 2)) & 0x1) == t){
		*v = 0; *k = i; *wd = 1;
	}
	else{
		if(WINDOW_SIZE_LTR < (i + 1)){
			*wd = WINDOW_SIZE_LTR;
		}
		else{
			*wd = i + 1;
		}
		n <<= 1;
		n >>= (UNIT_LEN - *wd);
		if((i - *wd + 1) < 1){
			u2 = 0;
		}
		else{
			u2 = n & 0x1;
		}
		*v = -(t << (*wd - 1)) + (n >> 1) + u2;
		s = 0;
		for(; (*v & 0x1) == 0; s++, *v = *v >> 1);
		*k = i - (*wd - 1) + s + 1;
	}
}
