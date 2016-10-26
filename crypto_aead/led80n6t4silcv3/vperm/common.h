#ifndef COMMON_H
#define COMMON_H

#include <xmmintrin.h>
#include <emmintrin.h>
// #include <wmmintrin.h>
#include <tmmintrin.h>


#if defined(__GNUC__)
	#define ALIGN16(x) x  __attribute__ ((aligned(16)))
#else
	#define ALIGN16(x) __declspec(align(16)) x
#endif

typedef __m128i dqword;

#define XORDQW(x, y)		_mm_xor_si128((x), (y))
#define ANDDQW(x, y)		_mm_and_si128((x), (y))
#define ANDNOTDQW(x, y)	_mm_andnot_si128((x), (y))
#define ORDQW(x, y)		_mm_or_si128((x), (y))

#define SLLW(x, y)			_mm_slli_epi16((x), y)
#define SRLW(x, y)			_mm_srli_epi16((x), y)
#define SRLQW(x, y)			_mm_srli_epi64((x), (y))
#define SLLQW(x, y)			_mm_slli_epi64((x), (y))
#define SRLDQW(x, y)		_mm_srli_si128((x), (y))
#define SLLDQW(x, y)		_mm_slli_si128((x), (y))

#define SHR(x,n)        _mm_shuffle_epi8((x), _mm_set_epi8(127+(n), 126+(n), 125+(n), 124+(n), 123+(n), 122+(n), 121+(n), 120+(n), 119+(n), 118+(n), 117+(n), 116+(n), 115+(n), 114+(n), 113+(n), 112+(n))) // shift to the right
#define SHL(x,n)        _mm_shuffle_epi8((x), _mm_set_epi8(15-(n), 14-(n), 13-(n), 12-(n), 11-(n), 10-(n), 9-(n), 8-(n), 7-(n), 6-(n), 5-(n), 4-(n), 3-(n), 2-(n), 1-(n), 0-(n))) // shift to the left


#define CONSTANT(b)		_mm_set1_epi8((b))	/*set each unsigned char in a 128-bit register to be b*/
#define MASK4L(x)		ANDDQW((x), CONSTANT(0x0f))
#define MASK4U(x)		ANDDQW((x), CONSTANT(0xf0))
#define MASK128L(x)		ANDDQW((x), _mm_setr_epi32(0xFFFFFFFF, 0xFFFFFFFF, 0, 0))
#define MASK128U(x)		ANDDQW((x), _mm_setr_epi32(0, 0, 0xFFFFFFFF, 0xFFFFFFFF))
#define SETLOWBYTE(x)	_mm_setr_epi8((x), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)


#define PSHUFB(s, x)	_mm_shuffle_epi8((s), (x)) /*return s(x)*/

#define STORE(p, x)		_mm_store_si128((__m128i *)(p), (x))
#define STOREU(p, x)    _mm_storeu_si128((__m128i *)(p), (x))
// #define STORE128L(p, x)  _mm_storel_epi64((__m128i *)(p), (x))
#define STORE128L(p, x) _mm_stream_pi((__m64 *)(p), _mm_movepi64_pi64(x))
#define LOAD(p)			_mm_load_si128((__m128i *)(p))
#define LOADU(p)		_mm_loadu_si128((__m128i *)(p))
#define LOAD128L(p)        _mm_loadl_epi64((__m128i *)(p))
#define SETZERO()       _mm_setzero_si128()

#endif
