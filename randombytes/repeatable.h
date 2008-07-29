/*
randombytes/repeatable.h version 20080728
D. J. Bernstein
Public domain.
*/

#ifndef randombytes_repeatable_H
#define randombytes_repeatable_H

#ifdef __cplusplus
extern "C" {
#endif

extern void randombytes(unsigned char *,unsigned long long);

#ifdef __cplusplus
}
#endif

#ifndef randombytes_implementation
#define randombytes_implementation "repeatable"
#endif

#endif
