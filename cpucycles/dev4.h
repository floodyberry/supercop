/*
cpucycles dev4.h version 20100712
D. J. Bernstein
Public domain.
*/

#ifndef CPUCYCLES_dev4_h
#define CPUCYCLES_dev4_h

#ifdef __cplusplus
extern "C" {
#endif

extern long long cpucycles_dev4(void);
extern long long cpucycles_dev4_persecond(void);

#ifdef __cplusplus
}
#endif

#ifndef cpucycles_implementation
#define cpucycles_implementation "dev4"
#define cpucycles cpucycles_dev4
#define cpucycles_persecond cpucycles_dev4_persecond
#endif

#endif
