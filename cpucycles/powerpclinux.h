/*
cpucycles powerpclinux.h version 20060319
D. J. Bernstein
Public domain.
*/

#ifndef CPUCYCLES_powerpclinux_h
#define CPUCYCLES_powerpclinux_h

#ifdef __cplusplus
extern "C" {
#endif

extern long long cpucycles_powerpclinux(void);
extern long long cpucycles_powerpclinux_persecond(void);

#ifdef __cplusplus
}
#endif

#ifndef cpucycles_implementation
#define cpucycles_implementation "powerpclinux"
#define cpucycles cpucycles_powerpclinux
#define cpucycles_persecond cpucycles_powerpclinux_persecond
#endif

#endif
