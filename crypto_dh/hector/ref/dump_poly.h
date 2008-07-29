/*
 * hector/src/dump_poly.h version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#ifndef DUMP_POLY_H_
#define DUMP_POLY_H_

#include <gmp.h>
#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

static void dump_poly(char * name, int n, int s, mp_limb_t * x)
	__attribute__((unused));

static void dump_poly(char * name, int n, int s, mp_limb_t * x)
{
	int i;
	int j = 0;
	int some = 0;
	printf("%s:=", name);
        for(i = 0 ; i < n ; i++) {
		if ((i-j*s) >= s) {
			j++;
		}
		if (((x[j] >> (i%s)) & 1UL) == 0)
			continue;
                if (some) printf(" + ");
		switch(i) {
			case 0 : printf("1"); break;
			case 1 : printf("z"); break;
			default: printf("z^%d", i); break;
		}
		some = 1;
        }
	if (some == 0) {
		printf("0");
	}
        printf(";\n");
}


#ifdef __cplusplus
}
#endif

#endif	/* DUMP_POLY_H_ */

