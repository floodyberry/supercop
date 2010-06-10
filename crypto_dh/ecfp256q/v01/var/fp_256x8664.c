#include <stdio.h>
#include "crympix.h"
#include "multiprecision256.h"
#include "finite256.h"

void fp_inv_256(uni zn, uni an){
	MI_t z, a, p;
	int i;
	unsigned char pn[32] = {
	    0xB5, 0xFD, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
	    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	};

	/*Stack only version of inversion.*/
	//crympix_init(32);
	p->v->n = (uni)pn; p->v->l = FP_LEN; p->s = POSITIVE;
	z->v->n = (uni)zn;
	a->v->n = (uni)an; a->s = POSITIVE;
	for(i = FP_LEN; (a->v->n[i - 1] == 0) && (i > 0); i--);
	a->v->l = i;
	mi_modinv_stack(z, a, p);
	//mi_modinv(z, a, p);
	for(i = z->v->l; i < FP_LEN; i++) zn[i] = 0;
	//crympix_kill();
}
