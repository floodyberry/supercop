#include <stdint.h>
#include <stdlib.h>

void SimonKeySetup64(const uint8_t* rk, uint32_t* rkexp);
void SimonEncrypt64(uint32_t *SR, uint32_t *SL, const uint32_t *k);

void SimonKeySetup96(const uint8_t* rk, uint64_t *rkexp);
void SimonEncrypt96(uint64_t *SR, uint64_t *SL, const uint64_t *k);

void SimonKeySetup128(const uint8_t* rk, uint64_t *rkexp);
void SimonEncrypt128(uint64_t *SR, uint64_t *SL, const uint64_t *k);

#define ROTL( n, X )    ( ( ( X ) << n ) | ( ( X ) >> ( 32 - n ) ) )
#define ROTL2( n, X, L )    ( ( ( X ) << ( n + 64 - L ) >> (64-L)) | ( ( X ) >> ( L - n ) ) )

#define ROTL64(x, n) ( ( ( x ) << n ) | ( ( x ) >> ( 64 - n ) ) )
#define ROTR64(x, n) ( ( ( x ) >> n ) | ( ( x ) << ( 64 - n ) ) )