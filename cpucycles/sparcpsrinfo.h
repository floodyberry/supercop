/*
cpucycles sparcpsrinfo.h version 20060318
D. J. Bernstein
Public domain.
*/

#ifndef CPUCYCLES_sparcpsrinfo_h
#define CPUCYCLES_sparcpsrinfo_h

#ifdef __cplusplus
extern "C" {
#endif

extern long long cpucycles_sparcpsrinfo(void);
extern long long cpucycles_sparcpsrinfo_persecond(void);

#ifdef __cplusplus
}
#endif

#ifndef cpucycles_implementation
#define cpucycles_implementation "sparcpsrinfo"
#define cpucycles cpucycles_sparcpsrinfo
#define cpucycles_persecond cpucycles_sparcpsrinfo_persecond
#endif

#endif
