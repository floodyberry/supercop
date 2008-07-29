/*
cpucycles clockmonotonic.h version 20060318
D. J. Bernstein
Public domain.
*/

#ifndef CPUCYCLES_clockmonotonic_h
#define CPUCYCLES_clockmonotonic_h

#ifdef __cplusplus
extern "C" {
#endif

extern long long cpucycles_clockmonotonic(void);
extern long long cpucycles_clockmonotonic_persecond(void);

#ifdef __cplusplus
}
#endif

#ifndef cpucycles_implementation
#define cpucycles_implementation "clockmonotonic"
#define cpucycles cpucycles_clockmonotonic
#define cpucycles_persecond cpucycles_clockmonotonic_persecond
#endif

#endif
