/*****************************************************************************
 * C header file to determine compile machine byte order. Take care when
 * cross compiling.
 *
 * This file is publicly redistributable provided this header, lines 1-10,
 * is kept unchanged.
 *
 * (c) jorn.amundsen@ntnu.no
 * $Id: byteorder.h,v 1.5 2009/02/10 20:35:32 joern Exp $
 ****************************************************************************/


#if !defined(BYTEORDER_INCLUDED)

#if defined(__linux)
  #include <endian.h>
#else
  #include <sys/param.h>
#endif

#if defined(BYTE_ORDER)
  #if (BYTE_ORDER == BIG_ENDIAN)
    #define MACHINE_IS_BIG_ENDIAN
  #elif (BYTE_ORDER == LITTLE_ENDIAN)
    #define MACHINE_IS_LITTLE_ENDIAN
  #endif
#endif /*BYTE_ORDER*/

#if !defined(MACHINE_IS_BIG_ENDIAN) && !defined(MACHINE_IS_LITTLE_ENDIAN)
  #if defined(_BIG_ENDIAN) || defined(_MIPSEB)
    #define MACHINE_IS_BIG_ENDIAN
  #endif
  #if defined(_LITTLE_ENDIAN) || defined(_MIPSEL)
    #define MACHINE_IS_LITTLE_ENDIAN
  #endif
#endif /*!MACHINE_IS_BIG_ENDIAN && !MACHINE_IS_LITTLE_ENDIAN*/

/* bail out if no byte sex constant is defined at this point */
#if !defined(MACHINE_IS_BIG_ENDIAN) && !defined(MACHINE_IS_LITTLE_ENDIAN)
#error
#endif

#define BYTEORDER_INCLUDED

#if defined(__IBMC__) && defined(_AIX)
/* add definitions of inline assembly functions */
u_int32_t aix_swap4(u_int32_t *);
u_int64_t aix_swap8(u_int64_t *);

/*
 * aix_swap4() - inline 4-byte swap.
 * Load and return a word byte reversed.
 *
 *     lbrx    3,0,3
 */
#pragma mc_func aix_swap4 { "7c601c2c" }
#pragma reg_killed_by aix_swap4 gr3
#pragma isolated_call(aix_swap4)
#define swap32(u) (aix_swap4(u))

#if defined(__64BIT__)
/*
 * aix_swap8() - inline 8-byte swap.
 * Load 2 words byte reversed and merge into one doubleword.
 *
 *     addi    4,0,4
 *     lbrx    5,4,3
 *     lbrx    3,0,3
 *     rldimi  3,5,32,0
 */
#pragma mc_func aix_swap8 { "38800004" "7ca41c2c" "7c601c2c" "78a3000e" }
#pragma reg_killed_by aix_swap8 gr3, gr4, gr5
#else
/*
 * aix_swap8() - inline 8-byte swap.
 * Load 2 words byte reversed into reverse words
 *
 *     addi    5,0,4
 *     lbrx    4,0,3
 *     lbrx    3,5,3
 */
#pragma mc_func aix_swap8 { "38a00004" "7c801c2c" "7c651c2c" }
#endif /*64BIT*/
#pragma reg_killed_by aix_swap8 gr3, gr4, gr5
#pragma isolated_call(aix_swap8)
#define swap64(u) (aix_swap8(u))
#endif /*IBMC && AIX*/

#if (defined(__GNUC__) || defined(__PGIC__)) && !defined(swap32)
#define swap32(u) __builtin_bswap32(*(u))
#endif /*GNUC/PGIC && !swap32*/
#if (defined(__GNUC__) || defined(__PGIC__)) && !defined(swap64)
#define swap64(u) __builtin_bswap64(*(u))
#endif /*GNUC/PGIC && !swap64*/


#if !defined(swap32)
#define swap32(u) ((*(u)>>24)|(*(u)>>8&0xff00)|(*(u)<<8&0xff0000)|(*(u)<<24))
#endif
#if !defined(swap64)
#define swap64(u) ((*(u)>>56)|(*(u)>>40&0xff00)|(*(u)>>24&0xff0000)|\
	(*(u)>>8&0xff000000)|(*(u)&0xff000000)<<8|(*(u)&0xff0000)<<24|\
	(*(u)&0xff00)<<40|*(u)<<56)
#endif
#endif /*BYTEORDER_INCLUDED*/
