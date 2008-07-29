/*
cpucycles sparc32psrinfo.h version 20060319
D. J. Bernstein
Public domain.
*/

#ifndef CPUCYCLES_sparc32psrinfo_h
#define CPUCYCLES_sparc32psrinfo_h

#ifdef __cplusplus
extern "C" {
#endif

extern long long cpucycles_sparc32psrinfo(void);
extern long long cpucycles_sparc32psrinfo_persecond(void);

#ifdef __cplusplus
}
#endif

#ifndef cpucycles_implementation
#define cpucycles_implementation "sparc32psrinfo"
#define cpucycles cpucycles_sparc32psrinfo
#define cpucycles_persecond cpucycles_sparc32psrinfo_persecond
#endif

#endif
