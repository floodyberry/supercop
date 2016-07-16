/*
The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
Michaël Peeters and Gilles Van Assche. For more information, feedback or
questions, please refer to our website: http://keccak.noekeon.org/

Implementation by Ronny Van Keer and the designers,
hereby denoted as "the implementer".

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

// WARNING: This implementation assumes a little-endian platform. Support for big-endinanness is not yet implemented.

#include    <string.h>
#include "Keccak-inplace-settings.h"
#define cKeccakR_SizeInBytes    (cKeccakR / 8)
#include "crypto_hash.h"
#ifndef crypto_hash_BYTES
    #ifdef cKeccakFixedOutputLengthInBytes
        #define crypto_hash_BYTES cKeccakFixedOutputLengthInBytes
    #else
        #define crypto_hash_BYTES cKeccakR_SizeInBytes
    #endif
#endif
#if (crypto_hash_BYTES > cKeccakR_SizeInBytes)
    #error "Full squeezing not yet implemented"
#endif

#if     (cKeccakB   == 1600)
    typedef unsigned int        UINT32;
    // WARNING: on 8-bit and 16-bit platforms, this should be replaced by:
    //typedef unsigned long       UINT32;
    #define cKeccakNumberOfRounds   24
    #define cKeccakLaneSizeInBytes 8
#else
    #error  "Unsupported Keccak-f width"
#endif

#define cKeccakLaneSizeInBits   (cKeccakLaneSizeInBytes * 8)

#define ROL32(a, offset) ((((UINT32)a) << (offset)) ^ (((UINT32)a) >> (32-(offset))))
void KeccakF( UINT32 * state, const UINT32 *in, int laneCount );
void extractFromState( unsigned char *out, const UINT32 *state, int laneCount );

int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen )
{
    UINT32 state[5 * 5 * 2];
#if (crypto_hash_BYTES >= cKeccakR_SizeInBytes)
    #define temp out
#else
    unsigned char temp[cKeccakR_SizeInBytes];
#endif

    memset( state, 0, sizeof(state) );

    for ( /* empty */; inlen >= cKeccakR_SizeInBytes; inlen -= cKeccakR_SizeInBytes, in += cKeccakR_SizeInBytes )
    {
        KeccakF( state, (const UINT32*)in, cKeccakR_SizeInBytes / cKeccakLaneSizeInBytes );
    }

    //    padding
    memcpy( temp, in, (size_t)inlen );
    temp[inlen++] = 1;
    memset( temp+inlen, 0, cKeccakR_SizeInBytes - (size_t)inlen );
    temp[cKeccakR_SizeInBytes-1] |= 0x80;
    KeccakF( state, (const UINT32*)temp, cKeccakR_SizeInBytes / cKeccakLaneSizeInBytes );

    #if ((crypto_hash_BYTES % cKeccakLaneSizeInBytes) == 0)
    extractFromState( out, state, crypto_hash_BYTES / cKeccakLaneSizeInBytes );
    #else
    #error "The output size must be a multiple of the lane size in this simple implementation."
    #endif

    #if (crypto_hash_BYTES >= cKeccakR_SizeInBytes)
    #undef temp
    #endif

    return ( 0 );
}

void extractFromState( unsigned char *out, const UINT32 *state, int laneCount )
{
    // Credit: Henry S. Warren, Hacker's Delight, Addison-Wesley, 2002
    UINT32 * pI = (UINT32 *)out;
    const UINT32 * pS = state;
    UINT32 t, x0, x1;
    int i;
    for (i = laneCount-1; i >= 0; --i)
    {
        x0 = *(pS++);
        x1 = *(pS++);
        t = (x0 & 0x0000FFFF) | (x1 << 16);
        x1 = (x0 >> 16) | (x1 & 0xFFFF0000);
        x0 = t;
        t = (x0 ^ (x0 >>  8)) & 0x0000FF00UL;  x0 = x0 ^ t ^ (t <<  8);
        t = (x0 ^ (x0 >>  4)) & 0x00F000F0UL;  x0 = x0 ^ t ^ (t <<  4);
        t = (x0 ^ (x0 >>  2)) & 0x0C0C0C0CUL;  x0 = x0 ^ t ^ (t <<  2);
        t = (x0 ^ (x0 >>  1)) & 0x22222222UL;  x0 = x0 ^ t ^ (t <<  1);
        t = (x1 ^ (x1 >>  8)) & 0x0000FF00UL;  x1 = x1 ^ t ^ (t <<  8);
        t = (x1 ^ (x1 >>  4)) & 0x00F000F0UL;  x1 = x1 ^ t ^ (t <<  4);
        t = (x1 ^ (x1 >>  2)) & 0x0C0C0C0CUL;  x1 = x1 ^ t ^ (t <<  2);
        t = (x1 ^ (x1 >>  1)) & 0x22222222UL;  x1 = x1 ^ t ^ (t <<  1);
        *(pI++) = x0;
        *(pI++) = x1;
    }
}

static const UINT32 KeccakF1600RoundConstants_int2[2*24+1] =
{
    0x00000001UL,    0x00000000UL,
    0x00000000UL,    0x00000089UL,
    0x00000000UL,    0x8000008bUL,
    0x00000000UL,    0x80008080UL,
    0x00000001UL,    0x0000008bUL,
    0x00000001UL,    0x00008000UL,
    0x00000001UL,    0x80008088UL,
    0x00000001UL,    0x80000082UL,
    0x00000000UL,    0x0000000bUL,
    0x00000000UL,    0x0000000aUL,
    0x00000001UL,    0x00008082UL,
    0x00000000UL,    0x00008003UL,
    0x00000001UL,    0x0000808bUL,
    0x00000001UL,    0x8000000bUL,
    0x00000001UL,    0x8000008aUL,
    0x00000001UL,    0x80000081UL,
    0x00000000UL,    0x80000081UL,
    0x00000000UL,    0x80000008UL,
    0x00000000UL,    0x00000083UL,
    0x00000000UL,    0x80008003UL,
    0x00000001UL,    0x80008088UL,
    0x00000000UL,    0x80000088UL,
    0x00000001UL,    0x00008000UL,
    0x00000000UL,    0x80008082UL,
    0x000000FFUL
};

#define KeccakAtoD_round0() \
        Cx = Abu0^Agu0^Aku0^Amu0^Asu0; \
        Du1 = Abe1^Age1^Ake1^Ame1^Ase1; \
        Da0 = Cx^ROL32(Du1, 1); \
        Cz = Abu1^Agu1^Aku1^Amu1^Asu1; \
        Du0 = Abe0^Age0^Ake0^Ame0^Ase0; \
        Da1 = Cz^Du0; \
\
        Cw = Abi0^Agi0^Aki0^Ami0^Asi0; \
        Do0 = Cw^ROL32(Cz, 1); \
        Cy = Abi1^Agi1^Aki1^Ami1^Asi1; \
        Do1 = Cy^Cx; \
\
        Cx = Aba0^Aga0^Aka0^Ama0^Asa0; \
        De0 = Cx^ROL32(Cy, 1); \
        Cz = Aba1^Aga1^Aka1^Ama1^Asa1; \
        De1 = Cz^Cw; \
\
        Cy = Abo1^Ago1^Ako1^Amo1^Aso1; \
        Di0 = Du0^ROL32(Cy, 1); \
        Cw = Abo0^Ago0^Ako0^Amo0^Aso0; \
        Di1 = Du1^Cw; \
\
        Du0 = Cw^ROL32(Cz, 1); \
        Du1 = Cy^Cx; \

#define KeccakAtoD_round1() \
        Cx = Asu0^Agu0^Amu0^Abu1^Aku1; \
        Du1 = Age1^Ame0^Abe0^Ake1^Ase1; \
        Da0 = Cx^ROL32(Du1, 1); \
        Cz = Asu1^Agu1^Amu1^Abu0^Aku0; \
        Du0 = Age0^Ame1^Abe1^Ake0^Ase0; \
        Da1 = Cz^Du0; \
\
        Cw = Aki1^Asi1^Agi0^Ami1^Abi0; \
        Do0 = Cw^ROL32(Cz, 1); \
        Cy = Aki0^Asi0^Agi1^Ami0^Abi1; \
        Do1 = Cy^Cx; \
\
        Cx = Aba0^Aka1^Asa0^Aga0^Ama1; \
        De0 = Cx^ROL32(Cy, 1); \
        Cz = Aba1^Aka0^Asa1^Aga1^Ama0; \
        De1 = Cz^Cw; \
\
        Cy = Amo0^Abo1^Ako0^Aso1^Ago0; \
        Di0 = Du0^ROL32(Cy, 1); \
        Cw = Amo1^Abo0^Ako1^Aso0^Ago1; \
        Di1 = Du1^Cw; \
\
        Du0 = Cw^ROL32(Cz, 1); \
        Du1 = Cy^Cx; \

#define KeccakAtoD_round2() \
        Cx = Aku1^Agu0^Abu1^Asu1^Amu1; \
        Du1 = Ame0^Ake0^Age0^Abe0^Ase1; \
        Da0 = Cx^ROL32(Du1, 1); \
        Cz = Aku0^Agu1^Abu0^Asu0^Amu0; \
        Du0 = Ame1^Ake1^Age1^Abe1^Ase0; \
        Da1 = Cz^Du0; \
\
        Cw = Agi1^Abi1^Asi1^Ami0^Aki1; \
        Do0 = Cw^ROL32(Cz, 1); \
        Cy = Agi0^Abi0^Asi0^Ami1^Aki0; \
        Do1 = Cy^Cx; \
\
        Cx = Aba0^Asa1^Ama1^Aka1^Aga1; \
        De0 = Cx^ROL32(Cy, 1); \
        Cz = Aba1^Asa0^Ama0^Aka0^Aga0; \
        De1 = Cz^Cw; \
\
        Cy = Aso0^Amo0^Ako1^Ago0^Abo0; \
        Di0 = Du0^ROL32(Cy, 1); \
        Cw = Aso1^Amo1^Ako0^Ago1^Abo1; \
        Di1 = Du1^Cw; \
\
        Du0 = Cw^ROL32(Cz, 1); \
        Du1 = Cy^Cx; \

#define KeccakAtoD_round3() \
        Cx = Amu1^Agu0^Asu1^Aku0^Abu0; \
        Du1 = Ake0^Abe1^Ame1^Age0^Ase1; \
        Da0 = Cx^ROL32(Du1, 1); \
        Cz = Amu0^Agu1^Asu0^Aku1^Abu1; \
        Du0 = Ake1^Abe0^Ame0^Age1^Ase0; \
        Da1 = Cz^Du0; \
\
        Cw = Asi0^Aki0^Abi1^Ami1^Agi1; \
        Do0 = Cw^ROL32(Cz, 1); \
        Cy = Asi1^Aki1^Abi0^Ami0^Agi0; \
        Do1 = Cy^Cx; \
\
        Cx = Aba0^Ama0^Aga1^Asa1^Aka0; \
        De0 = Cx^ROL32(Cy, 1); \
        Cz = Aba1^Ama1^Aga0^Asa0^Aka1; \
        De1 = Cz^Cw; \
\
        Cy = Ago1^Aso0^Ako0^Abo0^Amo1; \
        Di0 = Du0^ROL32(Cy, 1); \
        Cw = Ago0^Aso1^Ako1^Abo1^Amo0; \
        Di1 = Du1^Cw; \
\
        Du0 = Cw^ROL32(Cz, 1); \
        Du1 = Cy^Cx; \

void KeccakF( UINT32 *state, const UINT32 *in, int laneCount )
{

    // Credit: Henry S. Warren, Hacker's Delight, Addison-Wesley, 2002
    {
        const UINT32 * pI = (const UINT32 *)in;
        UINT32 * pS = state;
        UINT32 t, x0, x1;
        int i;
        for (i = laneCount-1; i >= 0; --i)
        {
            x0 = *(pI++);
            t = (x0 ^ (x0 >>  1)) & 0x22222222UL;  x0 = x0 ^ t ^ (t <<  1);
            t = (x0 ^ (x0 >>  2)) & 0x0C0C0C0CUL;  x0 = x0 ^ t ^ (t <<  2);
            t = (x0 ^ (x0 >>  4)) & 0x00F000F0UL;  x0 = x0 ^ t ^ (t <<  4);
            t = (x0 ^ (x0 >>  8)) & 0x0000FF00UL;  x0 = x0 ^ t ^ (t <<  8);
            x1 = *(pI++);
            t = (x1 ^ (x1 >>  1)) & 0x22222222UL;  x1 = x1 ^ t ^ (t <<  1);
            t = (x1 ^ (x1 >>  2)) & 0x0C0C0C0CUL;  x1 = x1 ^ t ^ (t <<  2);
            t = (x1 ^ (x1 >>  4)) & 0x00F000F0UL;  x1 = x1 ^ t ^ (t <<  4);
            t = (x1 ^ (x1 >>  8)) & 0x0000FF00UL;  x1 = x1 ^ t ^ (t <<  8);
            *(pS++) ^= (x0 & 0x0000FFFF) | (x1 << 16);
            *(pS++) ^= (x0 >> 16) | (x1 & 0xFFFF0000);
        }
    }

    {
        UINT32 Da0, De0, Di0, Do0, Du0;
        UINT32 Da1, De1, Di1, Do1;
        #define Du1 laneCount
        UINT32 Ca0, Ce0, Ci0, Co0, Cu0;
        UINT32 Cx, Cy, Cz, Cw;
        #define Ba Ca0
        #define Be Ce0
        #define Bi Ci0
        #define Bo Co0
        #define Bu Cu0
        #define pRoundConstants in


        #define Aba0 state[ 0]
        #define Aba1 state[ 1]
        #define Abe0 state[ 2]
        #define Abe1 state[ 3]
        #define Abi0 state[ 4]
        #define Abi1 state[ 5]
        #define Abo0 state[ 6]
        #define Abo1 state[ 7]
        #define Abu0 state[ 8]
        #define Abu1 state[ 9]
        #define Aga0 state[10]
        #define Aga1 state[11]
        #define Age0 state[12]
        #define Age1 state[13]
        #define Agi0 state[14]
        #define Agi1 state[15]
        #define Ago0 state[16]
        #define Ago1 state[17]
        #define Agu0 state[18]
        #define Agu1 state[19]
        #define Aka0 state[20]
        #define Aka1 state[21]
        #define Ake0 state[22]
        #define Ake1 state[23]
        #define Aki0 state[24]
        #define Aki1 state[25]
        #define Ako0 state[26]
        #define Ako1 state[27]
        #define Aku0 state[28]
        #define Aku1 state[29]
        #define Ama0 state[30]
        #define Ama1 state[31]
        #define Ame0 state[32]
        #define Ame1 state[33]
        #define Ami0 state[34]
        #define Ami1 state[35]
        #define Amo0 state[36]
        #define Amo1 state[37]
        #define Amu0 state[38]
        #define Amu1 state[39]
        #define Asa0 state[40]
        #define Asa1 state[41]
        #define Ase0 state[42]
        #define Ase1 state[43]
        #define Asi0 state[44]
        #define Asi1 state[45]
        #define Aso0 state[46]
        #define Aso1 state[47]
        #define Asu0 state[48]
        #define Asu1 state[49]

        pRoundConstants = KeccakF1600RoundConstants_int2;
        do
        {
            // --- Code for 4 rounds
            // --- using factor 2 interleaving, 64-bit lanes mapped to 32-bit words
            KeccakAtoD_round0();

            Ba = (Aba0^Da0);
            Be = ROL32((Age0^De0), 22);
            Bi = ROL32((Aki1^Di1), 22);
            Bo = ROL32((Amo1^Do1), 11);
            Bu = ROL32((Asu0^Du0), 7);
            Aba0 =   Ba ^((~Be)&  Bi );
            Aba0 ^= *(pRoundConstants++);
            Age0 =   Be ^((~Bi)&  Bo );
            Aki1 =   Bi ^((~Bo)&  Bu );
            Amo1 =   Bo ^((~Bu)&  Ba );
            Asu0 =   Bu ^((~Ba)&  Be );

            Ba = (Aba1^Da1);
            Be = ROL32((Age1^De1), 22);
            Bi = ROL32((Aki0^Di0), 21);
            Bo = ROL32((Amo0^Do0), 10);
            Bu = ROL32((Asu1^Du1), 7);
            Aba1 =   Ba ^((~Be)&  Bi );
            Aba1 ^= *(pRoundConstants++);
            Age1 =   Be ^((~Bi)&  Bo );
            Aki0 =   Bi ^((~Bo)&  Bu );
            Amo0 =   Bo ^((~Bu)&  Ba );
            Asu1 =   Bu ^((~Ba)&  Be );

            Bi = ROL32((Aka1^Da1), 2);
            Bo = ROL32((Ame1^De1), 23);
            Bu = ROL32((Asi1^Di1), 31);
            Ba = ROL32((Abo0^Do0), 14);
            Be = ROL32((Agu0^Du0), 10);
            Aka1 =   Ba ^((~Be)&  Bi );
            Ame1 =   Be ^((~Bi)&  Bo );
            Asi1 =   Bi ^((~Bo)&  Bu );
            Abo0 =   Bo ^((~Bu)&  Ba );
            Agu0 =   Bu ^((~Ba)&  Be );

            Bi = ROL32((Aka0^Da0), 1);
            Bo = ROL32((Ame0^De0), 22);
            Bu = ROL32((Asi0^Di0), 30);
            Ba = ROL32((Abo1^Do1), 14);
            Be = ROL32((Agu1^Du1), 10);
            Aka0 =   Ba ^((~Be)&  Bi );
            Ame0 =   Be ^((~Bi)&  Bo );
            Asi0 =   Bi ^((~Bo)&  Bu );
            Abo1 =   Bo ^((~Bu)&  Ba );
            Agu1 =   Bu ^((~Ba)&  Be );

            Bu = ROL32((Asa0^Da0), 9);
            Ba = ROL32((Abe1^De1), 1);
            Be = ROL32((Agi0^Di0), 3);
            Bi = ROL32((Ako1^Do1), 13);
            Bo = ROL32((Amu0^Du0), 4);
            Asa0 =   Ba ^((~Be)&  Bi );
            Abe1 =   Be ^((~Bi)&  Bo );
            Agi0 =   Bi ^((~Bo)&  Bu );
            Ako1 =   Bo ^((~Bu)&  Ba );
            Amu0 =   Bu ^((~Ba)&  Be );

            Bu = ROL32((Asa1^Da1), 9);
            Ba = (Abe0^De0);
            Be = ROL32((Agi1^Di1), 3);
            Bi = ROL32((Ako0^Do0), 12);
            Bo = ROL32((Amu1^Du1), 4);
            Asa1 =   Ba ^((~Be)&  Bi );
            Abe0 =   Be ^((~Bi)&  Bo );
            Agi1 =   Bi ^((~Bo)&  Bu );
            Ako0 =   Bo ^((~Bu)&  Ba );
            Amu1 =   Bu ^((~Ba)&  Be );

            Be = ROL32((Aga0^Da0), 18);
            Bi = ROL32((Ake0^De0), 5);
            Bo = ROL32((Ami1^Di1), 8);
            Bu = ROL32((Aso0^Do0), 28);
            Ba = ROL32((Abu1^Du1), 14);
            Aga0 =   Ba ^((~Be)&  Bi );
            Ake0 =   Be ^((~Bi)&  Bo );
            Ami1 =   Bi ^((~Bo)&  Bu );
            Aso0 =   Bo ^((~Bu)&  Ba );
            Abu1 =   Bu ^((~Ba)&  Be );

            Be = ROL32((Aga1^Da1), 18);
            Bi = ROL32((Ake1^De1), 5);
            Bo = ROL32((Ami0^Di0), 7);
            Bu = ROL32((Aso1^Do1), 28);
            Ba = ROL32((Abu0^Du0), 13);
            Aga1 =   Ba ^((~Be)&  Bi );
            Ake1 =   Be ^((~Bi)&  Bo );
            Ami0 =   Bi ^((~Bo)&  Bu );
            Aso1 =   Bo ^((~Bu)&  Ba );
            Abu0 =   Bu ^((~Ba)&  Be );

            Bo = ROL32((Ama1^Da1), 21);
            Bu = ROL32((Ase0^De0), 1);
            Ba = ROL32((Abi0^Di0), 31);
            Be = ROL32((Ago1^Do1), 28);
            Bi = ROL32((Aku1^Du1), 20);
            Ama1 =   Ba ^((~Be)&  Bi );
            Ase0 =   Be ^((~Bi)&  Bo );
            Abi0 =   Bi ^((~Bo)&  Bu );
            Ago1 =   Bo ^((~Bu)&  Ba );
            Aku1 =   Bu ^((~Ba)&  Be );

            Bo = ROL32((Ama0^Da0), 20);
            Bu = ROL32((Ase1^De1), 1);
            Ba = ROL32((Abi1^Di1), 31);
            Be = ROL32((Ago0^Do0), 27);
            Bi = ROL32((Aku0^Du0), 19);
            Ama0 =   Ba ^((~Be)&  Bi );
            Ase1 =   Be ^((~Bi)&  Bo );
            Abi1 =   Bi ^((~Bo)&  Bu );
            Ago0 =   Bo ^((~Bu)&  Ba );
            Aku0 =   Bu ^((~Ba)&  Be );

            KeccakAtoD_round1();

            Ba = (Aba0^Da0);
            Be = ROL32((Ame1^De0), 22);
            Bi = ROL32((Agi1^Di1), 22);
            Bo = ROL32((Aso1^Do1), 11);
            Bu = ROL32((Aku1^Du0), 7);
            Aba0 =   Ba ^((~Be)&  Bi );
            Aba0 ^= *(pRoundConstants++);
            Ame1 =   Be ^((~Bi)&  Bo );
            Agi1 =   Bi ^((~Bo)&  Bu );
            Aso1 =   Bo ^((~Bu)&  Ba );
            Aku1 =   Bu ^((~Ba)&  Be );

            Ba = (Aba1^Da1);
            Be = ROL32((Ame0^De1), 22);
            Bi = ROL32((Agi0^Di0), 21);
            Bo = ROL32((Aso0^Do0), 10);
            Bu = ROL32((Aku0^Du1), 7);
            Aba1 =   Ba ^((~Be)&  Bi );
            Aba1 ^= *(pRoundConstants++);
            Ame0 =   Be ^((~Bi)&  Bo );
            Agi0 =   Bi ^((~Bo)&  Bu );
            Aso0 =   Bo ^((~Bu)&  Ba );
            Aku0 =   Bu ^((~Ba)&  Be );

            Bi = ROL32((Asa1^Da1), 2);
            Bo = ROL32((Ake1^De1), 23);
            Bu = ROL32((Abi1^Di1), 31);
            Ba = ROL32((Amo1^Do0), 14);
            Be = ROL32((Agu0^Du0), 10);
            Asa1 =   Ba ^((~Be)&  Bi );
            Ake1 =   Be ^((~Bi)&  Bo );
            Abi1 =   Bi ^((~Bo)&  Bu );
            Amo1 =   Bo ^((~Bu)&  Ba );
            Agu0 =   Bu ^((~Ba)&  Be );

            Bi = ROL32((Asa0^Da0), 1);
            Bo = ROL32((Ake0^De0), 22);
            Bu = ROL32((Abi0^Di0), 30);
            Ba = ROL32((Amo0^Do1), 14);
            Be = ROL32((Agu1^Du1), 10);
            Asa0 =   Ba ^((~Be)&  Bi );
            Ake0 =   Be ^((~Bi)&  Bo );
            Abi0 =   Bi ^((~Bo)&  Bu );
            Amo0 =   Bo ^((~Bu)&  Ba );
            Agu1 =   Bu ^((~Ba)&  Be );

            Bu = ROL32((Ama1^Da0), 9);
            Ba = ROL32((Age1^De1), 1);
            Be = ROL32((Asi1^Di0), 3);
            Bi = ROL32((Ako0^Do1), 13);
            Bo = ROL32((Abu1^Du0), 4);
            Ama1 =   Ba ^((~Be)&  Bi );
            Age1 =   Be ^((~Bi)&  Bo );
            Asi1 =   Bi ^((~Bo)&  Bu );
            Ako0 =   Bo ^((~Bu)&  Ba );
            Abu1 =   Bu ^((~Ba)&  Be );

            Bu = ROL32((Ama0^Da1), 9);
            Ba = (Age0^De0);
            Be = ROL32((Asi0^Di1), 3);
            Bi = ROL32((Ako1^Do0), 12);
            Bo = ROL32((Abu0^Du1), 4);
            Ama0 =   Ba ^((~Be)&  Bi );
            Age0 =   Be ^((~Bi)&  Bo );
            Asi0 =   Bi ^((~Bo)&  Bu );
            Ako1 =   Bo ^((~Bu)&  Ba );
            Abu0 =   Bu ^((~Ba)&  Be );

            Be = ROL32((Aka1^Da0), 18);
            Bi = ROL32((Abe1^De0), 5);
            Bo = ROL32((Ami0^Di1), 8);
            Bu = ROL32((Ago1^Do0), 28);
            Ba = ROL32((Asu1^Du1), 14);
            Aka1 =   Ba ^((~Be)&  Bi );
            Abe1 =   Be ^((~Bi)&  Bo );
            Ami0 =   Bi ^((~Bo)&  Bu );
            Ago1 =   Bo ^((~Bu)&  Ba );
            Asu1 =   Bu ^((~Ba)&  Be );

            Be = ROL32((Aka0^Da1), 18);
            Bi = ROL32((Abe0^De1), 5);
            Bo = ROL32((Ami1^Di0), 7);
            Bu = ROL32((Ago0^Do1), 28);
            Ba = ROL32((Asu0^Du0), 13);
            Aka0 =   Ba ^((~Be)&  Bi );
            Abe0 =   Be ^((~Bi)&  Bo );
            Ami1 =   Bi ^((~Bo)&  Bu );
            Ago0 =   Bo ^((~Bu)&  Ba );
            Asu0 =   Bu ^((~Ba)&  Be );

            Bo = ROL32((Aga1^Da1), 21);
            Bu = ROL32((Ase0^De0), 1);
            Ba = ROL32((Aki1^Di0), 31);
            Be = ROL32((Abo1^Do1), 28);
            Bi = ROL32((Amu1^Du1), 20);
            Aga1 =   Ba ^((~Be)&  Bi );
            Ase0 =   Be ^((~Bi)&  Bo );
            Aki1 =   Bi ^((~Bo)&  Bu );
            Abo1 =   Bo ^((~Bu)&  Ba );
            Amu1 =   Bu ^((~Ba)&  Be );

            Bo = ROL32((Aga0^Da0), 20);
            Bu = ROL32((Ase1^De1), 1);
            Ba = ROL32((Aki0^Di1), 31);
            Be = ROL32((Abo0^Do0), 27);
            Bi = ROL32((Amu0^Du0), 19);
            Aga0 =   Ba ^((~Be)&  Bi );
            Ase1 =   Be ^((~Bi)&  Bo );
            Aki0 =   Bi ^((~Bo)&  Bu );
            Abo0 =   Bo ^((~Bu)&  Ba );
            Amu0 =   Bu ^((~Ba)&  Be );

            KeccakAtoD_round2();

            Ba = (Aba0^Da0);
            Be = ROL32((Ake1^De0), 22);
            Bi = ROL32((Asi0^Di1), 22);
            Bo = ROL32((Ago0^Do1), 11);
            Bu = ROL32((Amu1^Du0), 7);
            Aba0 =   Ba ^((~Be)&  Bi );
            Aba0 ^= *(pRoundConstants++);
            Ake1 =   Be ^((~Bi)&  Bo );
            Asi0 =   Bi ^((~Bo)&  Bu );
            Ago0 =   Bo ^((~Bu)&  Ba );
            Amu1 =   Bu ^((~Ba)&  Be );

            Ba = (Aba1^Da1);
            Be = ROL32((Ake0^De1), 22);
            Bi = ROL32((Asi1^Di0), 21);
            Bo = ROL32((Ago1^Do0), 10);
            Bu = ROL32((Amu0^Du1), 7);
            Aba1 =   Ba ^((~Be)&  Bi );
            Aba1 ^= *(pRoundConstants++);
            Ake0 =   Be ^((~Bi)&  Bo );
            Asi1 =   Bi ^((~Bo)&  Bu );
            Ago1 =   Bo ^((~Bu)&  Ba );
            Amu0 =   Bu ^((~Ba)&  Be );

            Bi = ROL32((Ama0^Da1), 2);
            Bo = ROL32((Abe0^De1), 23);
            Bu = ROL32((Aki0^Di1), 31);
            Ba = ROL32((Aso1^Do0), 14);
            Be = ROL32((Agu0^Du0), 10);
            Ama0 =   Ba ^((~Be)&  Bi );
            Abe0 =   Be ^((~Bi)&  Bo );
            Aki0 =   Bi ^((~Bo)&  Bu );
            Aso1 =   Bo ^((~Bu)&  Ba );
            Agu0 =   Bu ^((~Ba)&  Be );

            Bi = ROL32((Ama1^Da0), 1);
            Bo = ROL32((Abe1^De0), 22);
            Bu = ROL32((Aki1^Di0), 30);
            Ba = ROL32((Aso0^Do1), 14);
            Be = ROL32((Agu1^Du1), 10);
            Ama1 =   Ba ^((~Be)&  Bi );
            Abe1 =   Be ^((~Bi)&  Bo );
            Aki1 =   Bi ^((~Bo)&  Bu );
            Aso0 =   Bo ^((~Bu)&  Ba );
            Agu1 =   Bu ^((~Ba)&  Be );

            Bu = ROL32((Aga1^Da0), 9);
            Ba = ROL32((Ame0^De1), 1);
            Be = ROL32((Abi1^Di0), 3);
            Bi = ROL32((Ako1^Do1), 13);
            Bo = ROL32((Asu1^Du0), 4);
            Aga1 =   Ba ^((~Be)&  Bi );
            Ame0 =   Be ^((~Bi)&  Bo );
            Abi1 =   Bi ^((~Bo)&  Bu );
            Ako1 =   Bo ^((~Bu)&  Ba );
            Asu1 =   Bu ^((~Ba)&  Be );

            Bu = ROL32((Aga0^Da1), 9);
            Ba = (Ame1^De0);
            Be = ROL32((Abi0^Di1), 3);
            Bi = ROL32((Ako0^Do0), 12);
            Bo = ROL32((Asu0^Du1), 4);
            Aga0 =   Ba ^((~Be)&  Bi );
            Ame1 =   Be ^((~Bi)&  Bo );
            Abi0 =   Bi ^((~Bo)&  Bu );
            Ako0 =   Bo ^((~Bu)&  Ba );
            Asu0 =   Bu ^((~Ba)&  Be );

            Be = ROL32((Asa1^Da0), 18);
            Bi = ROL32((Age1^De0), 5);
            Bo = ROL32((Ami1^Di1), 8);
            Bu = ROL32((Abo1^Do0), 28);
            Ba = ROL32((Aku0^Du1), 14);
            Asa1 =   Ba ^((~Be)&  Bi );
            Age1 =   Be ^((~Bi)&  Bo );
            Ami1 =   Bi ^((~Bo)&  Bu );
            Abo1 =   Bo ^((~Bu)&  Ba );
            Aku0 =   Bu ^((~Ba)&  Be );

            Be = ROL32((Asa0^Da1), 18);
            Bi = ROL32((Age0^De1), 5);
            Bo = ROL32((Ami0^Di0), 7);
            Bu = ROL32((Abo0^Do1), 28);
            Ba = ROL32((Aku1^Du0), 13);
            Asa0 =   Ba ^((~Be)&  Bi );
            Age0 =   Be ^((~Bi)&  Bo );
            Ami0 =   Bi ^((~Bo)&  Bu );
            Abo0 =   Bo ^((~Bu)&  Ba );
            Aku1 =   Bu ^((~Ba)&  Be );

            Bo = ROL32((Aka0^Da1), 21);
            Bu = ROL32((Ase0^De0), 1);
            Ba = ROL32((Agi1^Di0), 31);
            Be = ROL32((Amo0^Do1), 28);
            Bi = ROL32((Abu0^Du1), 20);
            Aka0 =   Ba ^((~Be)&  Bi );
            Ase0 =   Be ^((~Bi)&  Bo );
            Agi1 =   Bi ^((~Bo)&  Bu );
            Amo0 =   Bo ^((~Bu)&  Ba );
            Abu0 =   Bu ^((~Ba)&  Be );

            Bo = ROL32((Aka1^Da0), 20);
            Bu = ROL32((Ase1^De1), 1);
            Ba = ROL32((Agi0^Di1), 31);
            Be = ROL32((Amo1^Do0), 27);
            Bi = ROL32((Abu1^Du0), 19);
            Aka1 =   Ba ^((~Be)&  Bi );
            Ase1 =   Be ^((~Bi)&  Bo );
            Agi0 =   Bi ^((~Bo)&  Bu );
            Amo1 =   Bo ^((~Bu)&  Ba );
            Abu1 =   Bu ^((~Ba)&  Be );

            KeccakAtoD_round3();

            Ba = (Aba0^Da0);
            Be = ROL32((Abe0^De0), 22);
            Bi = ROL32((Abi0^Di1), 22);
            Bo = ROL32((Abo0^Do1), 11);
            Bu = ROL32((Abu0^Du0), 7);
            Aba0 =   Ba ^((~Be)&  Bi );
            Aba0 ^= *(pRoundConstants++);
            Abe0 =   Be ^((~Bi)&  Bo );
            Abi0 =   Bi ^((~Bo)&  Bu );
            Abo0 =   Bo ^((~Bu)&  Ba );
            Abu0 =   Bu ^((~Ba)&  Be );

            Ba = (Aba1^Da1);
            Be = ROL32((Abe1^De1), 22);
            Bi = ROL32((Abi1^Di0), 21);
            Bo = ROL32((Abo1^Do0), 10);
            Bu = ROL32((Abu1^Du1), 7);
            Aba1 =   Ba ^((~Be)&  Bi );
            Aba1 ^= *(pRoundConstants++);
            Abe1 =   Be ^((~Bi)&  Bo );
            Abi1 =   Bi ^((~Bo)&  Bu );
            Abo1 =   Bo ^((~Bu)&  Ba );
            Abu1 =   Bu ^((~Ba)&  Be );

            Bi = ROL32((Aga0^Da1), 2);
            Bo = ROL32((Age0^De1), 23);
            Bu = ROL32((Agi0^Di1), 31);
            Ba = ROL32((Ago0^Do0), 14);
            Be = ROL32((Agu0^Du0), 10);
            Aga0 =   Ba ^((~Be)&  Bi );
            Age0 =   Be ^((~Bi)&  Bo );
            Agi0 =   Bi ^((~Bo)&  Bu );
            Ago0 =   Bo ^((~Bu)&  Ba );
            Agu0 =   Bu ^((~Ba)&  Be );

            Bi = ROL32((Aga1^Da0), 1);
            Bo = ROL32((Age1^De0), 22);
            Bu = ROL32((Agi1^Di0), 30);
            Ba = ROL32((Ago1^Do1), 14);
            Be = ROL32((Agu1^Du1), 10);
            Aga1 =   Ba ^((~Be)&  Bi );
            Age1 =   Be ^((~Bi)&  Bo );
            Agi1 =   Bi ^((~Bo)&  Bu );
            Ago1 =   Bo ^((~Bu)&  Ba );
            Agu1 =   Bu ^((~Ba)&  Be );

            Bu = ROL32((Aka0^Da0), 9);
            Ba = ROL32((Ake0^De1), 1);
            Be = ROL32((Aki0^Di0), 3);
            Bi = ROL32((Ako0^Do1), 13);
            Bo = ROL32((Aku0^Du0), 4);
            Aka0 =   Ba ^((~Be)&  Bi );
            Ake0 =   Be ^((~Bi)&  Bo );
            Aki0 =   Bi ^((~Bo)&  Bu );
            Ako0 =   Bo ^((~Bu)&  Ba );
            Aku0 =   Bu ^((~Ba)&  Be );

            Bu = ROL32((Aka1^Da1), 9);
            Ba = (Ake1^De0);
            Be = ROL32((Aki1^Di1), 3);
            Bi = ROL32((Ako1^Do0), 12);
            Bo = ROL32((Aku1^Du1), 4);
            Aka1 =   Ba ^((~Be)&  Bi );
            Ake1 =   Be ^((~Bi)&  Bo );
            Aki1 =   Bi ^((~Bo)&  Bu );
            Ako1 =   Bo ^((~Bu)&  Ba );
            Aku1 =   Bu ^((~Ba)&  Be );

            Be = ROL32((Ama0^Da0), 18);
            Bi = ROL32((Ame0^De0), 5);
            Bo = ROL32((Ami0^Di1), 8);
            Bu = ROL32((Amo0^Do0), 28);
            Ba = ROL32((Amu0^Du1), 14);
            Ama0 =   Ba ^((~Be)&  Bi );
            Ame0 =   Be ^((~Bi)&  Bo );
            Ami0 =   Bi ^((~Bo)&  Bu );
            Amo0 =   Bo ^((~Bu)&  Ba );
            Amu0 =   Bu ^((~Ba)&  Be );

            Be = ROL32((Ama1^Da1), 18);
            Bi = ROL32((Ame1^De1), 5);
            Bo = ROL32((Ami1^Di0), 7);
            Bu = ROL32((Amo1^Do1), 28);
            Ba = ROL32((Amu1^Du0), 13);
            Ama1 =   Ba ^((~Be)&  Bi );
            Ame1 =   Be ^((~Bi)&  Bo );
            Ami1 =   Bi ^((~Bo)&  Bu );
            Amo1 =   Bo ^((~Bu)&  Ba );
            Amu1 =   Bu ^((~Ba)&  Be );

            Bo = ROL32((Asa0^Da1), 21);
            Bu = ROL32((Ase0^De0), 1);
            Ba = ROL32((Asi0^Di0), 31);
            Be = ROL32((Aso0^Do1), 28);
            Bi = ROL32((Asu0^Du1), 20);
            Asa0 =   Ba ^((~Be)&  Bi );
            Ase0 =   Be ^((~Bi)&  Bo );
            Asi0 =   Bi ^((~Bo)&  Bu );
            Aso0 =   Bo ^((~Bu)&  Ba );
            Asu0 =   Bu ^((~Ba)&  Be );

            Bo = ROL32((Asa1^Da0), 20);
            Bu = ROL32((Ase1^De1), 1);
            Ba = ROL32((Asi1^Di1), 31);
            Be = ROL32((Aso1^Do0), 27);
            Bi = ROL32((Asu1^Du0), 19);
            Asa1 =   Ba ^((~Be)&  Bi );
            Ase1 =   Be ^((~Bi)&  Bo );
            Asi1 =   Bi ^((~Bo)&  Bu );
            Aso1 =   Bo ^((~Bu)&  Ba );
            Asu1 =   Bu ^((~Ba)&  Be );
        }
        while ( *pRoundConstants != 0xFF );

        #undef Aba0
        #undef Aba1
        #undef Abe0
        #undef Abe1
        #undef Abi0
        #undef Abi1
        #undef Abo0
        #undef Abo1
        #undef Abu0
        #undef Abu1
        #undef Aga0
        #undef Aga1
        #undef Age0
        #undef Age1
        #undef Agi0
        #undef Agi1
        #undef Ago0
        #undef Ago1
        #undef Agu0
        #undef Agu1
        #undef Aka0
        #undef Aka1
        #undef Ake0
        #undef Ake1
        #undef Aki0
        #undef Aki1
        #undef Ako0
        #undef Ako1
        #undef Aku0
        #undef Aku1
        #undef Ama0
        #undef Ama1
        #undef Ame0
        #undef Ame1
        #undef Ami0
        #undef Ami1
        #undef Amo0
        #undef Amo1
        #undef Amu0
        #undef Amu1
        #undef Asa0
        #undef Asa1
        #undef Ase0
        #undef Ase1
        #undef Asi0
        #undef Asi1
        #undef Aso0
        #undef Aso1
        #undef Asu0
        #undef Asu1
    }

}
