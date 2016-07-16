/**
 * Huseyin Hisil.
 * 2012.
 **/
#include "testbox.h"

#define GENERATED_ASM

#ifndef mam_ith_bit
#define mam_ith_bit(ib, an, i)if(1){ \
	uni_t _nw, _nb; \
	_nw = (i) / UNIT_LEN; \
	_nb = (i) - (_nw * UNIT_LEN); \
	if(_nb == 0){ \
		(ib) = (an)[_nw - 1] >> (UNIT_LEN - 1); \
	} \
	else{ \
		(ib) = (((an)[_nw] >> (_nb - 1)) & 0x1); \
	} \
}
#endif

inline void fp_cnt_bits(int *bc, const uni an, const uni_t al);
inline void find_nextwindow(int *v, int *k, uni_t kl, int *wd, const uni en, const int i, uni_t WINDOW_SIZE_LTR, uni_t TABLE_SIZE_LTR);

