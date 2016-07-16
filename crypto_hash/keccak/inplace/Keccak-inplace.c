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
    typedef unsigned long long  UINT64;
    typedef UINT64 tKeccakLane;
    #define cKeccakNumberOfRounds   24
#else
    #error  "Unsupported Keccak-f width"
#endif

#define cKeccakLaneSizeInBits   (sizeof(tKeccakLane) * 8)

#define ROL64(a, offset) ((((tKeccakLane)a) << ((offset) % cKeccakLaneSizeInBits)) ^ (((tKeccakLane)a) >> (cKeccakLaneSizeInBits-((offset) % cKeccakLaneSizeInBits))))
void KeccakF( tKeccakLane * state, const tKeccakLane *in, int laneCount );

int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen )
{
    tKeccakLane    state[5 * 5];
#if (crypto_hash_BYTES >= cKeccakR_SizeInBytes)
    #define temp out
#else
    unsigned char temp[cKeccakR_SizeInBytes];
#endif

    memset( state, 0, sizeof(state) );

    for ( /* empty */; inlen >= cKeccakR_SizeInBytes; inlen -= cKeccakR_SizeInBytes, in += cKeccakR_SizeInBytes )
    {
        KeccakF( state, (const tKeccakLane*)in, cKeccakR_SizeInBytes / sizeof(tKeccakLane) );
    }

    //    padding
    memcpy( temp, in, (size_t)inlen );
    temp[inlen++] = 1;
    memset( temp+inlen, 0, cKeccakR_SizeInBytes - (size_t)inlen );
    temp[cKeccakR_SizeInBytes-1] |= 0x80;
    KeccakF( state, (const tKeccakLane*)temp, cKeccakR_SizeInBytes / sizeof(tKeccakLane) );
    memcpy( out, state, crypto_hash_BYTES );
    #if (crypto_hash_BYTES >= cKeccakR_SizeInBytes)
    #undef temp
    #endif

    return ( 0 );
}


const tKeccakLane KeccakF1600RoundConstants[cKeccakNumberOfRounds] = 
{
    (tKeccakLane)0x0000000000000001ULL,
    (tKeccakLane)0x0000000000008082ULL,
    (tKeccakLane)0x800000000000808aULL,
    (tKeccakLane)0x8000000080008000ULL,
    (tKeccakLane)0x000000000000808bULL,
    (tKeccakLane)0x0000000080000001ULL,
    (tKeccakLane)0x8000000080008081ULL,
    (tKeccakLane)0x8000000000008009ULL,
    (tKeccakLane)0x000000000000008aULL,
    (tKeccakLane)0x0000000000000088ULL,
    (tKeccakLane)0x0000000080008009ULL,
    (tKeccakLane)0x000000008000000aULL,
    (tKeccakLane)0x000000008000808bULL,
    (tKeccakLane)0x800000000000008bULL,
    (tKeccakLane)0x8000000000008089ULL,
    (tKeccakLane)0x8000000000008003ULL,
    (tKeccakLane)0x8000000000008002ULL,
    (tKeccakLane)0x8000000000000080ULL,
    (tKeccakLane)0x000000000000800aULL,
    (tKeccakLane)0x800000008000000aULL,
    (tKeccakLane)0x8000000080008081ULL,
    (tKeccakLane)0x8000000000008080ULL,
    (tKeccakLane)0x0000000080000001ULL,
    (tKeccakLane)0x8000000080008008ULL
};

void KeccakF( tKeccakLane * state, const tKeccakLane *in, int laneCount )
{

    {
        while ( --laneCount >= 0 )
        {
            state[laneCount] ^= in[laneCount];
        }
    }

    {
        tKeccakLane Ba, Be, Bi, Bo, Bu;
        tKeccakLane Ca, Ce, Ci, Co, Cu;
        tKeccakLane Da, De, Di, Do, Du;
        #define i laneCount

        #define Aba state[ 0]
        #define Abe state[ 1]
        #define Abi state[ 2]
        #define Abo state[ 3]
        #define Abu state[ 4]
        #define Aga state[ 5]
        #define Age state[ 6]
        #define Agi state[ 7]
        #define Ago state[ 8]
        #define Agu state[ 9]
        #define Aka state[10]
        #define Ake state[11]
        #define Aki state[12]
        #define Ako state[13]
        #define Aku state[14]
        #define Ama state[15]
        #define Ame state[16]
        #define Ami state[17]
        #define Amo state[18]
        #define Amu state[19]
        #define Asa state[20]
        #define Ase state[21]
        #define Asi state[22]
        #define Aso state[23]
        #define Asu state[24]

        for( i = 0; i < cKeccakNumberOfRounds; i += 4 )
        {
            // --- Code for 4 rounds
            // --- 64-bit lanes mapped to 64-bit words
            Ca = Aba^Aga^Aka^Ama^Asa;
            Ce = Abe^Age^Ake^Ame^Ase;
            Ci = Abi^Agi^Aki^Ami^Asi;
            Co = Abo^Ago^Ako^Amo^Aso;
            Cu = Abu^Agu^Aku^Amu^Asu;
            Da = Cu^ROL64(Ce, 1);
            De = Ca^ROL64(Ci, 1);
            Di = Ce^ROL64(Co, 1);
            Do = Ci^ROL64(Cu, 1);
            Du = Co^ROL64(Ca, 1);

            Ba = (Aba^Da);
            Be = ROL64((Age^De), 44);
            Bi = ROL64((Aki^Di), 43);
            Bo = ROL64((Amo^Do), 21);
            Bu = ROL64((Asu^Du), 14);
            Aba =   Ba ^((~Be)&  Bi );
            Aba ^= KeccakF1600RoundConstants[i+0];
            Age =   Be ^((~Bi)&  Bo );
            Aki =   Bi ^((~Bo)&  Bu );
            Amo =   Bo ^((~Bu)&  Ba );
            Asu =   Bu ^((~Ba)&  Be );

            Bi = ROL64((Aka^Da), 3);
            Bo = ROL64((Ame^De), 45);
            Bu = ROL64((Asi^Di), 61);
            Ba = ROL64((Abo^Do), 28);
            Be = ROL64((Agu^Du), 20);
            Aka =   Ba ^((~Be)&  Bi );
            Ame =   Be ^((~Bi)&  Bo );
            Asi =   Bi ^((~Bo)&  Bu );
            Abo =   Bo ^((~Bu)&  Ba );
            Agu =   Bu ^((~Ba)&  Be );

            Bu = ROL64((Asa^Da), 18);
            Ba = ROL64((Abe^De), 1);
            Be = ROL64((Agi^Di), 6);
            Bi = ROL64((Ako^Do), 25);
            Bo = ROL64((Amu^Du), 8);
            Asa =   Ba ^((~Be)&  Bi );
            Abe =   Be ^((~Bi)&  Bo );
            Agi =   Bi ^((~Bo)&  Bu );
            Ako =   Bo ^((~Bu)&  Ba );
            Amu =   Bu ^((~Ba)&  Be );

            Be = ROL64((Aga^Da), 36);
            Bi = ROL64((Ake^De), 10);
            Bo = ROL64((Ami^Di), 15);
            Bu = ROL64((Aso^Do), 56);
            Ba = ROL64((Abu^Du), 27);
            Aga =   Ba ^((~Be)&  Bi );
            Ake =   Be ^((~Bi)&  Bo );
            Ami =   Bi ^((~Bo)&  Bu );
            Aso =   Bo ^((~Bu)&  Ba );
            Abu =   Bu ^((~Ba)&  Be );

            Bo = ROL64((Ama^Da), 41);
            Bu = ROL64((Ase^De), 2);
            Ba = ROL64((Abi^Di), 62);
            Be = ROL64((Ago^Do), 55);
            Bi = ROL64((Aku^Du), 39);
            Ama =   Ba ^((~Be)&  Bi );
            Ase =   Be ^((~Bi)&  Bo );
            Abi =   Bi ^((~Bo)&  Bu );
            Ago =   Bo ^((~Bu)&  Ba );
            Aku =   Bu ^((~Ba)&  Be );

            Ca = Aba^Aka^Asa^Aga^Ama;
            Ce = Age^Ame^Abe^Ake^Ase;
            Ci = Aki^Asi^Agi^Ami^Abi;
            Co = Amo^Abo^Ako^Aso^Ago;
            Cu = Asu^Agu^Amu^Abu^Aku;
            Da = Cu^ROL64(Ce, 1);
            De = Ca^ROL64(Ci, 1);
            Di = Ce^ROL64(Co, 1);
            Do = Ci^ROL64(Cu, 1);
            Du = Co^ROL64(Ca, 1);

            Ba = (Aba^Da);
            Be = ROL64((Ame^De), 44);
            Bi = ROL64((Agi^Di), 43);
            Bo = ROL64((Aso^Do), 21);
            Bu = ROL64((Aku^Du), 14);
            Aba =   Ba ^((~Be)&  Bi );
            Aba ^= KeccakF1600RoundConstants[i+1];
            Ame =   Be ^((~Bi)&  Bo );
            Agi =   Bi ^((~Bo)&  Bu );
            Aso =   Bo ^((~Bu)&  Ba );
            Aku =   Bu ^((~Ba)&  Be );

            Bi = ROL64((Asa^Da), 3);
            Bo = ROL64((Ake^De), 45);
            Bu = ROL64((Abi^Di), 61);
            Ba = ROL64((Amo^Do), 28);
            Be = ROL64((Agu^Du), 20);
            Asa =   Ba ^((~Be)&  Bi );
            Ake =   Be ^((~Bi)&  Bo );
            Abi =   Bi ^((~Bo)&  Bu );
            Amo =   Bo ^((~Bu)&  Ba );
            Agu =   Bu ^((~Ba)&  Be );

            Bu = ROL64((Ama^Da), 18);
            Ba = ROL64((Age^De), 1);
            Be = ROL64((Asi^Di), 6);
            Bi = ROL64((Ako^Do), 25);
            Bo = ROL64((Abu^Du), 8);
            Ama =   Ba ^((~Be)&  Bi );
            Age =   Be ^((~Bi)&  Bo );
            Asi =   Bi ^((~Bo)&  Bu );
            Ako =   Bo ^((~Bu)&  Ba );
            Abu =   Bu ^((~Ba)&  Be );

            Be = ROL64((Aka^Da), 36);
            Bi = ROL64((Abe^De), 10);
            Bo = ROL64((Ami^Di), 15);
            Bu = ROL64((Ago^Do), 56);
            Ba = ROL64((Asu^Du), 27);
            Aka =   Ba ^((~Be)&  Bi );
            Abe =   Be ^((~Bi)&  Bo );
            Ami =   Bi ^((~Bo)&  Bu );
            Ago =   Bo ^((~Bu)&  Ba );
            Asu =   Bu ^((~Ba)&  Be );

            Bo = ROL64((Aga^Da), 41);
            Bu = ROL64((Ase^De), 2);
            Ba = ROL64((Aki^Di), 62);
            Be = ROL64((Abo^Do), 55);
            Bi = ROL64((Amu^Du), 39);
            Aga =   Ba ^((~Be)&  Bi );
            Ase =   Be ^((~Bi)&  Bo );
            Aki =   Bi ^((~Bo)&  Bu );
            Abo =   Bo ^((~Bu)&  Ba );
            Amu =   Bu ^((~Ba)&  Be );

            Ca = Aba^Asa^Ama^Aka^Aga;
            Ce = Ame^Ake^Age^Abe^Ase;
            Ci = Agi^Abi^Asi^Ami^Aki;
            Co = Aso^Amo^Ako^Ago^Abo;
            Cu = Aku^Agu^Abu^Asu^Amu;
            Da = Cu^ROL64(Ce, 1);
            De = Ca^ROL64(Ci, 1);
            Di = Ce^ROL64(Co, 1);
            Do = Ci^ROL64(Cu, 1);
            Du = Co^ROL64(Ca, 1);

            Ba = (Aba^Da);
            Be = ROL64((Ake^De), 44);
            Bi = ROL64((Asi^Di), 43);
            Bo = ROL64((Ago^Do), 21);
            Bu = ROL64((Amu^Du), 14);
            Aba =   Ba ^((~Be)&  Bi );
            Aba ^= KeccakF1600RoundConstants[i+2];
            Ake =   Be ^((~Bi)&  Bo );
            Asi =   Bi ^((~Bo)&  Bu );
            Ago =   Bo ^((~Bu)&  Ba );
            Amu =   Bu ^((~Ba)&  Be );

            Bi = ROL64((Ama^Da), 3);
            Bo = ROL64((Abe^De), 45);
            Bu = ROL64((Aki^Di), 61);
            Ba = ROL64((Aso^Do), 28);
            Be = ROL64((Agu^Du), 20);
            Ama =   Ba ^((~Be)&  Bi );
            Abe =   Be ^((~Bi)&  Bo );
            Aki =   Bi ^((~Bo)&  Bu );
            Aso =   Bo ^((~Bu)&  Ba );
            Agu =   Bu ^((~Ba)&  Be );

            Bu = ROL64((Aga^Da), 18);
            Ba = ROL64((Ame^De), 1);
            Be = ROL64((Abi^Di), 6);
            Bi = ROL64((Ako^Do), 25);
            Bo = ROL64((Asu^Du), 8);
            Aga =   Ba ^((~Be)&  Bi );
            Ame =   Be ^((~Bi)&  Bo );
            Abi =   Bi ^((~Bo)&  Bu );
            Ako =   Bo ^((~Bu)&  Ba );
            Asu =   Bu ^((~Ba)&  Be );

            Be = ROL64((Asa^Da), 36);
            Bi = ROL64((Age^De), 10);
            Bo = ROL64((Ami^Di), 15);
            Bu = ROL64((Abo^Do), 56);
            Ba = ROL64((Aku^Du), 27);
            Asa =   Ba ^((~Be)&  Bi );
            Age =   Be ^((~Bi)&  Bo );
            Ami =   Bi ^((~Bo)&  Bu );
            Abo =   Bo ^((~Bu)&  Ba );
            Aku =   Bu ^((~Ba)&  Be );

            Bo = ROL64((Aka^Da), 41);
            Bu = ROL64((Ase^De), 2);
            Ba = ROL64((Agi^Di), 62);
            Be = ROL64((Amo^Do), 55);
            Bi = ROL64((Abu^Du), 39);
            Aka =   Ba ^((~Be)&  Bi );
            Ase =   Be ^((~Bi)&  Bo );
            Agi =   Bi ^((~Bo)&  Bu );
            Amo =   Bo ^((~Bu)&  Ba );
            Abu =   Bu ^((~Ba)&  Be );

            Ca = Aba^Ama^Aga^Asa^Aka;
            Ce = Ake^Abe^Ame^Age^Ase;
            Ci = Asi^Aki^Abi^Ami^Agi;
            Co = Ago^Aso^Ako^Abo^Amo;
            Cu = Amu^Agu^Asu^Aku^Abu;
            Da = Cu^ROL64(Ce, 1);
            De = Ca^ROL64(Ci, 1);
            Di = Ce^ROL64(Co, 1);
            Do = Ci^ROL64(Cu, 1);
            Du = Co^ROL64(Ca, 1);

            Ba = (Aba^Da);
            Be = ROL64((Abe^De), 44);
            Bi = ROL64((Abi^Di), 43);
            Bo = ROL64((Abo^Do), 21);
            Bu = ROL64((Abu^Du), 14);
            Aba =   Ba ^((~Be)&  Bi );
            Aba ^= KeccakF1600RoundConstants[i+3];
            Abe =   Be ^((~Bi)&  Bo );
            Abi =   Bi ^((~Bo)&  Bu );
            Abo =   Bo ^((~Bu)&  Ba );
            Abu =   Bu ^((~Ba)&  Be );

            Bi = ROL64((Aga^Da), 3);
            Bo = ROL64((Age^De), 45);
            Bu = ROL64((Agi^Di), 61);
            Ba = ROL64((Ago^Do), 28);
            Be = ROL64((Agu^Du), 20);
            Aga =   Ba ^((~Be)&  Bi );
            Age =   Be ^((~Bi)&  Bo );
            Agi =   Bi ^((~Bo)&  Bu );
            Ago =   Bo ^((~Bu)&  Ba );
            Agu =   Bu ^((~Ba)&  Be );

            Bu = ROL64((Aka^Da), 18);
            Ba = ROL64((Ake^De), 1);
            Be = ROL64((Aki^Di), 6);
            Bi = ROL64((Ako^Do), 25);
            Bo = ROL64((Aku^Du), 8);
            Aka =   Ba ^((~Be)&  Bi );
            Ake =   Be ^((~Bi)&  Bo );
            Aki =   Bi ^((~Bo)&  Bu );
            Ako =   Bo ^((~Bu)&  Ba );
            Aku =   Bu ^((~Ba)&  Be );

            Be = ROL64((Ama^Da), 36);
            Bi = ROL64((Ame^De), 10);
            Bo = ROL64((Ami^Di), 15);
            Bu = ROL64((Amo^Do), 56);
            Ba = ROL64((Amu^Du), 27);
            Ama =   Ba ^((~Be)&  Bi );
            Ame =   Be ^((~Bi)&  Bo );
            Ami =   Bi ^((~Bo)&  Bu );
            Amo =   Bo ^((~Bu)&  Ba );
            Amu =   Bu ^((~Ba)&  Be );

            Bo = ROL64((Asa^Da), 41);
            Bu = ROL64((Ase^De), 2);
            Ba = ROL64((Asi^Di), 62);
            Be = ROL64((Aso^Do), 55);
            Bi = ROL64((Asu^Du), 39);
            Asa =   Ba ^((~Be)&  Bi );
            Ase =   Be ^((~Bi)&  Bo );
            Asi =   Bi ^((~Bo)&  Bu );
            Aso =   Bo ^((~Bu)&  Ba );
            Asu =   Bu ^((~Ba)&  Be );
        }
        #undef i
        #undef Aba
        #undef Abe
        #undef Abi
        #undef Abo
        #undef Abu
        #undef Aga
        #undef Age
        #undef Agi
        #undef Ago
        #undef Agu
        #undef Aka
        #undef Ake
        #undef Aki
        #undef Ako
        #undef Aku
        #undef Ama
        #undef Ame
        #undef Ami
        #undef Amo
        #undef Amu
        #undef Asa
        #undef Ase
        #undef Asi
        #undef Aso
        #undef Asu
    }

}
