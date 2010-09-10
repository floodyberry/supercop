/***********************************************************************NTNU IT*
* C header file to determine compile machine byte order. Take care when cross
* compiling.
* 
* This file is publicly redistributable provided this header, the first 10
* (ten) lines of this file, is kept unchanged.
*------------------------------------------------------------------------------
* $Id: byteorder.h 81 2010-05-30 08:22:23Z joern $
* (c) 2009 jorn.amundsen@ntnu.no
*******************************************************************************/

#if !defined(BYTEORDER_INCLUDED)

#if defined(__linux)
  #include <endian.h>
#else
  #include <sys/param.h>
#endif

#if defined(__BYTE_ORDER)
  #if (__BYTE_ORDER == __BIG_ENDIAN)
    #define MACHINE_IS_BIG_ENDIAN
  #elif (__BYTE_ORDER == __LITTLE_ENDIAN)
    #define MACHINE_IS_LITTLE_ENDIAN
  #endif
#elif defined(BYTE_ORDER)
  #if (BYTE_ORDER == BIG_ENDIAN)
    #define MACHINE_IS_BIG_ENDIAN
  #elif (BYTE_ORDER == LITTLE_ENDIAN)
    #define MACHINE_IS_LITTLE_ENDIAN
  #endif
#endif /*__BYTE_ORDER || BYTE_ORDER*/

#if !defined(MACHINE_IS_BIG_ENDIAN) && !defined(MACHINE_IS_LITTLE_ENDIAN)
  #if defined(_BIG_ENDIAN) || defined(_MIPSEB)
    #define MACHINE_IS_BIG_ENDIAN
  #endif
  #if defined(_LITTLE_ENDIAN) || defined(_MIPSEL)
    #define MACHINE_IS_LITTLE_ENDIAN
  #endif
#endif /*!MACHINE_IS_BIG_ENDIAN && !MACHINE_IS_LITTLE_ENDIAN*/

#if !defined(MACHINE_IS_BIG_ENDIAN) && !defined(MACHINE_IS_LITTLE_ENDIAN)
#error unknown machine byte sex
#endif

#define BYTEORDER_INCLUDED


#if defined(MACHINE_IS_BIG_ENDIAN)
/*
 * Byte swapping macros for big endian architectures and compilers,
 * add as appropriate for other architectures and/or compilers.
 *
 *     ld_swap64(src,dst) : uint64_t dst = *(src)
 *     st_swap64(src,dst) : *(dst)       = uint64_t src
 */

#if defined(__PPC__) || defined(_ARCH_PPC)

#if defined(__64BIT__)
#define aix_ld_swap64(s64,d64)\
{\
	uint64_t *s4, h;\
\
	__asm__ ("addi %0,%3,4;lwbrx %1,0,%3;lwbrx %2,0,%0;rldimi %1,%2,32,0"\
		: "+r"(s4), "=r"(d64), "=r"(h) : "b"(s64));\
}

#define aix_st_swap64(s64,d64)\
{\
	uint64_t *s4, h;\
\
	h = (s64) >> 32;\
\
	__asm__ volatile ("addi %0,%3,4;stwbrx %1,0,%3;stwbrx %2,0,%0"\
		: "+r"(s4) : "r"(s64), "r"(h), "b"(d64));\
}
#else
#if defined(_ARCH_PWR7)
#define aix_ld_swap64(s64,d64)\
	__asm__ ("ldbrx %0,0,%1" : "=r"(d64) : "r"(s64))
#else
#define aix_ld_swap64(s64,d64)\
{\
	uint32_t *s4, h, l;\
\
	__asm__ ("addi %0,%3,4;lwbrx %1,0,%3;lwbrx %2,0,%0"\
		: "+r"(s4), "=r"(l), "=r"(h) : "b"(s64));\
\
	d64 = ((uint64_t)h<<32) | l;\
}
#endif /*PWR7*/

#define aix_st_swap64(s64,d64)\
{\
	uint32_t *s4, h, l;\
\
	l = (s64) & 0xfffffffful, h = (s64) >> 32;\
\
	__asm__ volatile ("addi %0,%3,4;stwbrx %1,0,%3;stwbrx %2,0,%0"\
		: "+r"(s4) : "r"(l), "r"(h), "b"(d64));\
}
#endif /*__64BIT__*/

#define aix_ld_swap32(s32,d32)\
	__asm__ ("lwbrx %0,0,%1" : "=r"(d32) : "r"(s32))

#define aix_st_swap32(s32,d32)\
	__asm__ volatile ("stwbrx %1,0,%0" : : "r"(d32), "r"(s32))

#define ld_swap32(s,d) aix_ld_swap32(s,d)
#define st_swap32(s,d) aix_st_swap32(s,d)
#define ld_swap64(s,d) aix_ld_swap64(s,d)
#define st_swap64(s,d) aix_st_swap64(s,d)
#endif /*__PPC__ || _ARCH_PPC*/

/* GCC fallback */
#if ((__GNUC__ >= 4) || defined(__PGIC__)) && !defined(ld_swap32)
#define ld_swap32(s,d) (d = __builtin_bswap32(*(s)))
#define st_swap32(s,d) (*(d) = __builtin_bswap32(s))
#endif /*GCC4/PGIC && !swap32*/
#if ((__GNUC__ >= 4) || defined(__PGIC__)) && !defined(ld_swap64)
#define ld_swap64(s,d) (d = __builtin_bswap64(*(s)))
#define st_swap64(s,d) (*(d) = __builtin_bswap64(s))
#endif /*GCC4/PGIC && !swap64*/

/* generic fallback */
#if !defined(ld_swap32)
#define ld_swap32(s,d) (d = \
	(*(s)>>24)|(*(s)>>8&0xff00)|(*(s)<<8&0xff0000)|(*(s)<<24))
#define st_swap32(s,d) (*(d) = \
	((s)>>24)|((s)>>8&0xff00)|((s)<<8&0xff0000)|((s)<<24))
#endif
#if !defined(ld_swap64)
#define ld_swap64(s,d) (d = (*(s)>>56)|(*(s)>>40&0xff00)|(*(s)>>24&0xff0000)|\
    (*(s)>>8&0xff000000)|(*(s)&0xff000000)<<8|(*(s)&0xff0000)<<24|\
    (*(s)&0xff00)<<40|*(s)<<56)
#define st_swap64(s,d) (*(d) = ((s)>>56)|((s)>>40&0xff00)|((s)>>24&0xff0000)|\
    ((s)>>8&0xff000000)|((s)&0xff000000)<<8|((s)&0xff0000)<<24|\
    ((s)&0xff00)<<40|(s)<<56)
#endif

#endif /*MACHINE_IS_BIG_ENDIAN*/


#if defined(MACHINE_IS_LITTLE_ENDIAN)
/* replace swaps with simple assignments on little endian systems */
#undef ld_swap32
#undef st_swap32
#define ld_swap32(s,d) (d = *(s))
#define st_swap32(s,d) (*(d) = s)
#undef ld_swap64
#undef st_swap64
#define ld_swap64(s,d) (d = *(s))
#define st_swap64(s,d) (*(d) = s)
#endif /*MACHINE_IS_LITTLE_ENDIAN*/

#endif /*BYTEORDER_INCLUDED*/
