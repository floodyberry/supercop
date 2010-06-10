/**
 * This file is a part of the freeware CRYMPIX
 * CRYPTOGRAPHIC MULTIPRECISION SOFTWARE Library.
 * This software is initially designed and developed in the
 * Information System Strategy and Security Laboratory (IS3)
 * of Izmir Institute of Technology (IZTECH).
 *
 * CRYMPIX is engineered to provide a portable environment
 * for the implementation of the latest techniques in
 * computational number theory and cryptology.
 * The content can be modified with the sole condition
 * that this header is kept as is.
 * We provide no guarantee for the correctness and
 * completeness of this software.
 *
 * Please report the bugs to:
 *    crympix-bug@is3.iyte.edu.tr
 *
 * Please submit your contributions to:
 *    crympix-devel@is3.iyte.edu.tr
 *
 * Thank you for using this software.
 **/

#include <stdio.h>
#include <stdlib.h>
#include "_core.h"

void kn_exit(sic_t *s, uni_t code)
{
	printf("Exception occured at \"%s\", ERROR_CODE = %lu.\n", s, code);
	exit(code);
}

void kn_warn(sic_t *s, uni_t code)
{
	printf("Debug warning: \"%s\"", s);
	exit(code);
}

void kn_memcheck(uni_t len)
{
	if(len >= crympix->maxlen){
		kn_exit("Increase the workspace space using crypmix_init(maxlen)", ERR_OUT_OF_BOUNDS);
	}
}
