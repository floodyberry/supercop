#ifndef __COMPAT_H__
#define __COMPAT_H__

#include <limits.h>


/* 
 * This file desfines some helper function for cross-platform compatibility.
 */

#if defined __GNUC__ && (! defined __STRICT_ANSI__)
#define GNU_EXT
#endif

/*
 * First define some integer types.
 */

#if defined __STDC__ && __STDC_VERSION__ >= 199901L

/*
 * On C99 implementations, we can use <stdint.h> to get an exact 32-bit
 * type, if any, or otherwise use a wider type.
 */

#include <stdint.h>

#ifdef UINT32_MAX
typedef uint32_t u32;
#else
typedef uint_fast32_t u32;
#endif

typedef unsigned long long u64;

#define C32(x)    ((u32)(x))

#define HAS_64  1

#else

/*
 * On non-C99 systems, we use "unsigned int" if it is wide enough,
 * "unsigned long" otherwise. This supports all "reasonable" architectures.
 * We have to be cautious: pre-C99 preprocessors handle constants
 * differently in '#if' expressions. Hence the shifts to test UINT_MAX.
 */

#if ((UINT_MAX >> 11) >> 11) >= 0x3FF

typedef unsigned int u32;

#define C32(x)    ((u32)(x ## U))

#else

typedef unsigned long u32;

#define C32(x)    ((u32)(x ## UL))

#endif

/*
 * We want a 64-bit type. We use "unsigned long" if it is wide enough (as
 * is common on 64-bit architectures such as AMD64, Alpha or Sparcv9),
 * "unsigned long long" otherwise, if available. We use ULLONG_MAX to
 * test whether "unsigned long long" is available; we also know that
 * gcc features this type, even if the libc header do not know it.
 */

#if ((ULONG_MAX >> 31) >> 31) >= 3

typedef unsigned long u64;

#define HAS_64  1

#elif ((ULLONG_MAX >> 31) >> 31) >= 3 || defined __GNUC__

typedef unsigned long long u64;

#define HAS_64  1

#else

/*
 * No 64-bit type...
 */

#endif

#endif


/*
 * fft_t should be at least 16 bits wide.
 * using short int will require less memory, but int is faster...
 */

typedef int fft_t;


/*
 * Implementation note: some processors have specific opcodes to perform
 * a rotation. Recent versions of gcc recognize the expression above and
 * use the relevant opcodes, when appropriate.
 */

#define T32(x)    ((x) & C32(0xFFFFFFFF))
#define ROTL32(x, n)   T32(((x) << (n)) | ((x) >> (32 - (n))))
#define ROTR32(x, n)   ROTL32(x, (32 - (n)))



/*
 * The macro MAYBE_INLINE expands to an inline qualifier, is available.
 */

#if (defined __STDC__ && __STDC_VERSION__ >= 199901L) || defined GNU_EXT
#define MAYBE_INLINE inline
#elif defined _MSC_VER
#define MAYBE_INLINE __inline
#else
#define MAYBE_INLINE
#endif


/*  */

#if defined __GNUC__ && ( defined __i386__ || defined __x86_64__ )

#define rdtsc()                                                         \
  ({                                                                    \
    u32 lo, hi;                                                         \
    __asm__ __volatile__ (      /* serialize */                         \
                          "xorl %%eax,%%eax \n        cpuid"            \
                          ::: "%rax", "%rbx", "%rcx", "%rdx");          \
    /* We cannot use "=A", since this would use %rax on x86_64 */       \
    __asm__ __volatile__ ("rdtsc" : "=a" (lo), "=d" (hi));              \
    (u64)hi << 32 | lo;                                                 \
  })                                                                    \

#elif defined _MSC_VER

#define rdtsc __rdtsc

#endif

/* 
 * The IS_ALIGNED macro tests if a char* pointer can be used as u32* pointer.
 * It is defined as false on unknown architectures.
 */


/*
 * Unaligned access are not expensive on x86 so we don't care
 */

#if defined __i386__ || defined __x86_64 || defined _M_IX86 || defined _M_X64
#define IS_ALIGNED(p)    1
#elif defined __sparcv9
#define IS_ALIGNED(p)    ((((u64) (p)) & 3) == 0)
#elif defined __sparc
#define IS_ALIGNED(p)    ((((u32) (p)) & 3) == 0)
#elif defined __arm
#define IS_ALIGNED(p)    ((((u32) (p)) & 3) == 0)
#elif defined __sparc
#define IS_ALIGNED(p)    ((((u32) (p)) & 3) == 0)
#elif defined __ia64 || defined __ia64__ || defined __itanium__ || defined __M_IA64
#if defined __LP64__ || defined _LP64
#define IS_ALIGNED(p)    ((((u64) (p)) & 3) == 0)
#else
#define IS_ALIGNED(p)    ((((u32) (p)) & 3) == 0)
#endif
#else
#define IS_ALIGNED(p)    0
#endif

/* checks for endianness */

#if defined __i386__
#define LITTLE_ENDIAN   1
#elif defined __x86_64
#define LITTLE_ENDIAN   1
#elif defined __sparcv9
#define BIG_ENDIAN      1
#elif defined __sparc
#define BIG_ENDIAN      1
#elif defined __arm__
#define LITTLE_ENDIAN   1
#elif defined __ia64 || defined __ia64__ || defined __itanium__
#if defined __BIG_ENDIAN__ || defined _BIG_ENDIAN
#define BIG_ENDIAN      1
#else
#define LITTLE_ENDIAN   1
#endif
#endif

/* safety net...  */
#if defined(__hppa__) || \
    defined(__m68k__) || defined(mc68000) || defined(_M_M68K) || \
    (defined(__MIPS__) && defined(__MISPEB__)) || \
    defined(__ppc__) || defined(__POWERPC__) || defined(_M_PPC) || \
    defined(__sparc__)
#define BIG_ENDIAN
#endif

#endif
