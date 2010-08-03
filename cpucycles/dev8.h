/*
cpucycles dev8.h version 20100801
D. J. Bernstein
Public domain.
*/

#ifndef CPUCYCLES_dev8_h
#define CPUCYCLES_dev8_h

#ifdef __cplusplus
extern "C" {
#endif

extern long long cpucycles_dev8(void);
extern long long cpucycles_dev8_persecond(void);

#ifdef __cplusplus
}
#endif

#ifndef cpucycles_implementation
#define cpucycles_implementation "dev8"
#define cpucycles cpucycles_dev8
#define cpucycles_persecond cpucycles_dev8_persecond
#endif

#endif
