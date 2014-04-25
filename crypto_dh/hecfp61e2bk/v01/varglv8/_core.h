/**
 * @file _core.h
 * @brief Core primitives for kernel.h.
 *
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
 *
 * @author Huseyin Hisil, <huseyinhisil AT iyte.edu.tr, h.hisil AT qut.edu.au>
 * @date Build Nov 2004, Last Updated Mar 2006.
 */
#include <stdio.h>
#include <stdlib.h>

#include "_config.h"

#define UNIT_LEN (sizeof(uni_t) * BYTE_LEN)
#define UNIT_LEN_HALF (UNIT_LEN >> 1)

#define LO 0
#define HI 1

#define BOOL uni_t
#define TRUE (BOOL)1
#define FALSE (BOOL)0

#define SIGN uni_t
#define POSITIVE (SIGN)0 /* Dont change this value */
#define NEGATIVE (SIGN)1 /* Dont change this value */

#define COMPARE uni_t
#define EQUAL (COMPARE)0
#define NOT_EQUAL (COMPARE)2
#define GREATER (COMPARE)1
#define LESS (COMPARE)-1 /* Actually this is not minus one */

#define LL_SET 1
#define LL_UNSET 0

#define QR uni_t
#define QRESIDUE (QR)1
#define QNRESIDUE (QR)~0
#define QMULTIPLE (QR)0

/**
 * @brief Type definition for a pointer to a single precision variable.
 * numbers.
 *
 * @author Huseyin Hisil.
 * @date Build Mar 21, 2004.
 **/
typedef uni_t *uni;

/**
 * @brief Type definition for a string.
 *
 * @author Huseyin Hisil.
 * @date Build Mar 21, 2004.
 **/
typedef sic_t *sic;

/**
 * @brief Type definition for a linked list (internal use only).
 * To minimize the memory management overhead, this struct is
 * tentatively designed. It may be modified in the future.
 * @warning EXPERIMENTAL.
 *
 * @author Mutlu Beyazit.
 * @date Build Dec 20, 2005.
 **/
typedef struct {
	void *next;
	uni_t type;
	uni_t flag;
}LL_t, *LL;

/**
 * @brief Type definition for the CRYMPIX runtime.
 * Tentatively designed for now. To be modified in the future.
 *
 * @author Mutlu Beyazit.
 * @author Ali Mersin.
 * @author Huseyin Hisil.
 * @date Build Dec 20, 2005.
 **/
typedef struct CRYMPIX_RUNTIME{
	LL ll_fast;
	LL ll_slow;
	uni_t maxlen;
} CRYMPIX_t, *CRYMPIX;

CRYMPIX crympix;

#define ERR_NULL_POINTER 0
#define ERR_DIVIDE_BY_ZERO 1
#define ERR_OUT_OF_MEMORY 2
#define ERR_MEMORY_RELEASE 3
#define ERR_OBJECT_KILL 4
#define ERR_OUT_OF_BOUNDS 5
#define ERR_INVALID_MODULUS 6
#define ERR_INVALID_MEMORY 7
#define ERR_INVALID_CHARACTER 8
#define ERR_IO_BUFFER_OVERFLOW 9
#define ERR_INVALID_STRING 10
#define ERR_JACOBI_INVALID_INPUT 11

#define CHECK(__a__)if(1){ \
	if((__a__) == FALSE){ \
		printf("VALIDATION FAULT\n"); \
		exit(0); \
	} \
}

void kn_exit(sic_t *s, uni_t code);
