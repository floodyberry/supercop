/**
 * @file _config.h
 * @brief Hardware specification for kernel.h.
 * This file is a part of the freeware CRYMPIX Library.
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

#define DEBUG_OFF /* DEBUG_ON - DEBUG_OFF */

#ifdef DEBUG_ON
	/**
	 * @brief Activates debug mode for mai functions.
	 **/
	#define DEBUG_MAI

	/**
	 * @brief Activates debug mode for mi_mod functions.
	 **/
	#define DEBUG_MOD

	/**
	 * @brief Activates debug mode for mrec functions.
	 **/
	#define DEBUG_ECC
#endif

/**
 * @brief Number of bits in a byte.
 **/
#define BYTE_LEN 8

/**
 * @brief GCC compiler support.
 **/
#define GCC
/*#define VISUAL_C*/


/**
 * @brief Generic x86_32 support for double precision operations.
 **/
/* #define SUPPORT_PROCESSOR_x86 */

/**
 * @brief Generic x86_64 support for double precision operations.
 **/
#define SUPPORT_PROCESSOR_x86_64

/**
 * @brief NON-ANSI, C'99. Using unsigned long long.
 * If all support flags are turned off, then CRYMPIX executes in ANSI C.
 **/
/* #define SUPPORT_DOUBLE_PRECISION_C99 */

/**
 * @brief Character type to be used in (I/O) routines
 **/
typedef signed char sic_t;

/**
 * @brief Type definition for a single precision variable.
 **/
typedef unsigned long uni_t;

/**
 * @brief Compiler tuning
 * Don't change this.
 **/
#ifdef SUPPORT_DOUBLE_PRECISION_C99
	#ifdef GCC
		typedef unsigned long long unid_t;
	#endif
	#ifdef VISUAL_C
		typedef unsigned __int64 unid_t;
	#endif
#endif

/**
 * @brief Threshold values for CRYMPIX Runtime.
 **/
#define THRESHOLD_GCD_DIV 8
#define THRESHOLD_GCD_LEHMER 16
#define THRESHOLD_SQR 6
#define THRESHOLD_KARATSUBA_MUL 28
#define THRESHOLD_KARATSUBA_SQR 56
#define THRESHOLD_TOOMCOOK3_MUL 1000
#define THRESHOLD_TOOMCOOK3_SQR 1000

/**
 * @brief (I/O) buffer size.
 * This should be removed in the next release.
 **/
#define IO_BUFFER_SIZE 100000

/*
#define COUNT_OPERATIONS
int ADD, DBL1, DBL2, DBL3, DBL4;
unsigned long COUNT_MLD;
unsigned long COUNT_ADD;
unsigned long COUNT_MUL;
unsigned long COUNT_SQR;
*/
