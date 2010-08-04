/*
cpucycles sparc32.h version 20100803
D. J. Bernstein
Public domain.
*/

#ifndef CPUCYCLES_sparc32_h
#define CPUCYCLES_sparc32_h

#ifdef __cplusplus
extern "C" {
#endif

extern long long cpucycles_sparc32(void);
extern long long cpucycles_sparc32_persecond(void);

#ifdef __cplusplus
}
#endif

#ifndef cpucycles_implementation
#define cpucycles_implementation "sparc32"
#define cpucycles cpucycles_sparc32
#define cpucycles_persecond cpucycles_sparc32_persecond
#endif

#endif
