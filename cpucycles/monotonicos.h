/*
cpucycles monotonicos.h version 20100803
D. J. Bernstein
Public domain.
*/

#ifndef CPUCYCLES_monotonicos_h
#define CPUCYCLES_monotonicos_h

#ifdef __cplusplus
extern "C" {
#endif

extern long long cpucycles_monotonicos(void);
extern long long cpucycles_monotonicos_persecond(void);

#ifdef __cplusplus
}
#endif

#ifndef cpucycles_implementation
#define cpucycles_implementation "monotonicos"
#define cpucycles cpucycles_monotonicos
#define cpucycles_persecond cpucycles_monotonicos_persecond
#endif

#endif
