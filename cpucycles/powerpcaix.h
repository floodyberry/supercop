/*
cpucycles powerpcaix.h version 20060318
D. J. Bernstein
Public domain.
*/

#ifndef CPUCYCLES_powerpcaix_h
#define CPUCYCLES_powerpcaix_h

#ifdef __cplusplus
extern "C" {
#endif

extern long long cpucycles_powerpcaix(void);
extern long long cpucycles_powerpcaix_persecond(void);

#ifdef __cplusplus
}
#endif

#ifndef cpucycles_implementation
#define cpucycles_implementation "powerpcaix"
#define cpucycles cpucycles_powerpcaix
#define cpucycles_persecond cpucycles_powerpcaix_persecond
#endif

#endif
