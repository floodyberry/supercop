/*
The Keccak sponge function, designed by Guido Bertoni, Joan Daemen,
Michaël Peeters and Gilles Van Assche. For more information, feedback or
questions, please refer to our website: http://keccak.noekeon.org/

Implementation by the designers,
hereby denoted as "the implementer".

To the extent possible under law, the implementer has waived all copyright
and related or neighboring rights to the source code in this file.
http://creativecommons.org/publicdomain/zero/1.0/
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <x86intrin.h>
#include "DoublePermutation.h"

#include "DoublePermutation-config.h"
#define UseSSE
#define UseOnlySIMD64

typedef unsigned char UINT8;
typedef unsigned long long int UINT64;

#if defined(UseSSE)
    #define ANDnu128(a, b)      _mm_andnot_si128(a, b)
    #define CONST128(a)         _mm_load_si128((const V128 *)&(a))
    #define LOAD128(a)          _mm_load_si128((const V128 *)&(a))
    #define LOAD128u(a)         _mm_loadu_si128((const V128 *)&(a))
    #if defined(UseXOP)
        #define ROL64in128(a, o)    _mm_roti_epi64(a, o)
        #define ROL64in128_8(a)     ROL64in128(a, 8)
        #define ROL64in128_56(a)    ROL64in128(a, 56)
    #else
        #define ROL64in128(a, o)    _mm_or_si128(_mm_slli_epi64(a, o), _mm_srli_epi64(a, 64-(o)))
        #define ROL64in128_8(a)     _mm_shuffle_epi8(a, CONST128(rho8))
        #define ROL64in128_56(a)    _mm_shuffle_epi8(a, CONST128(rho56))
const UINT64 rho8[2] = {0x0605040302010007, 0x0E0D0C0B0A09080F};
const UINT64 rho56[2] = {0x0007060504030201, 0x080F0E0D0C0B0A09};
    #endif
    #define STORE128(a, b)      _mm_store_si128((V128 *)&(a), b)
    #define XOR128(a, b)        _mm_xor_si128(a, b)
    #define XOReq128(a, b)      a = _mm_xor_si128(a, b)
    #define ZERO128()           _mm_setzero_si128()
#endif

#define declareABCDE \
    V128 Aba, Abe, Abi, Abo, Abu; \
    V128 Aga, Age, Agi, Ago, Agu; \
    V128 Aka, Ake, Aki, Ako, Aku; \
    V128 Ama, Ame, Ami, Amo, Amu; \
    V128 Asa, Ase, Asi, Aso, Asu; \
    V128 Bba, Bbe, Bbi, Bbo, Bbu; \
    V128 Bga, Bge, Bgi, Bgo, Bgu; \
    V128 Bka, Bke, Bki, Bko, Bku; \
    V128 Bma, Bme, Bmi, Bmo, Bmu; \
    V128 Bsa, Bse, Bsi, Bso, Bsu; \
    V128 Ca, Ce, Ci, Co, Cu; \
    V128 Da, De, Di, Do, Du; \
    V128 Eba, Ebe, Ebi, Ebo, Ebu; \
    V128 Ega, Ege, Egi, Ego, Egu; \
    V128 Eka, Eke, Eki, Eko, Eku; \
    V128 Ema, Eme, Emi, Emo, Emu; \
    V128 Esa, Ese, Esi, Eso, Esu; \

#define prepareTheta \
    Ca = XOR128(Aba, XOR128(Aga, XOR128(Aka, XOR128(Ama, Asa)))); \
    Ce = XOR128(Abe, XOR128(Age, XOR128(Ake, XOR128(Ame, Ase)))); \
    Ci = XOR128(Abi, XOR128(Agi, XOR128(Aki, XOR128(Ami, Asi)))); \
    Co = XOR128(Abo, XOR128(Ago, XOR128(Ako, XOR128(Amo, Aso)))); \
    Cu = XOR128(Abu, XOR128(Agu, XOR128(Aku, XOR128(Amu, Asu)))); \

// --- Theta Rho Pi Chi Iota Prepare-theta
// --- 64-bit lanes mapped to 64-bit words
#define thetaRhoPiChiIotaPrepareTheta(i, A, E) \
    Da = XOR128(Cu, ROL64in128(Ce, 1)); \
    De = XOR128(Ca, ROL64in128(Ci, 1)); \
    Di = XOR128(Ce, ROL64in128(Co, 1)); \
    Do = XOR128(Ci, ROL64in128(Cu, 1)); \
    Du = XOR128(Co, ROL64in128(Ca, 1)); \
\
    XOReq128(A##ba, Da); \
    Bba = A##ba; \
    XOReq128(A##ge, De); \
    Bbe = ROL64in128(A##ge, 44); \
    XOReq128(A##ki, Di); \
    Bbi = ROL64in128(A##ki, 43); \
    E##ba = XOR128(Bba, ANDnu128(Bbe, Bbi)); \
    XOReq128(E##ba, CONST128(KeccakF1600DoubleRoundConstants[(i)*2])); \
    Ca = E##ba; \
    XOReq128(A##mo, Do); \
    Bbo = ROL64in128(A##mo, 21); \
    E##be = XOR128(Bbe, ANDnu128(Bbi, Bbo)); \
    Ce = E##be; \
    XOReq128(A##su, Du); \
    Bbu = ROL64in128(A##su, 14); \
    E##bi = XOR128(Bbi, ANDnu128(Bbo, Bbu)); \
    Ci = E##bi; \
    E##bo = XOR128(Bbo, ANDnu128(Bbu, Bba)); \
    Co = E##bo; \
    E##bu = XOR128(Bbu, ANDnu128(Bba, Bbe)); \
    Cu = E##bu; \
\
    XOReq128(A##bo, Do); \
    Bga = ROL64in128(A##bo, 28); \
    XOReq128(A##gu, Du); \
    Bge = ROL64in128(A##gu, 20); \
    XOReq128(A##ka, Da); \
    Bgi = ROL64in128(A##ka, 3); \
    E##ga = XOR128(Bga, ANDnu128(Bge, Bgi)); \
    XOReq128(Ca, E##ga); \
    XOReq128(A##me, De); \
    Bgo = ROL64in128(A##me, 45); \
    E##ge = XOR128(Bge, ANDnu128(Bgi, Bgo)); \
    XOReq128(Ce, E##ge); \
    XOReq128(A##si, Di); \
    Bgu = ROL64in128(A##si, 61); \
    E##gi = XOR128(Bgi, ANDnu128(Bgo, Bgu)); \
    XOReq128(Ci, E##gi); \
    E##go = XOR128(Bgo, ANDnu128(Bgu, Bga)); \
    XOReq128(Co, E##go); \
    E##gu = XOR128(Bgu, ANDnu128(Bga, Bge)); \
    XOReq128(Cu, E##gu); \
\
    XOReq128(A##be, De); \
    Bka = ROL64in128(A##be, 1); \
    XOReq128(A##gi, Di); \
    Bke = ROL64in128(A##gi, 6); \
    XOReq128(A##ko, Do); \
    Bki = ROL64in128(A##ko, 25); \
    E##ka = XOR128(Bka, ANDnu128(Bke, Bki)); \
    XOReq128(Ca, E##ka); \
    XOReq128(A##mu, Du); \
    Bko = ROL64in128_8(A##mu); \
    E##ke = XOR128(Bke, ANDnu128(Bki, Bko)); \
    XOReq128(Ce, E##ke); \
    XOReq128(A##sa, Da); \
    Bku = ROL64in128(A##sa, 18); \
    E##ki = XOR128(Bki, ANDnu128(Bko, Bku)); \
    XOReq128(Ci, E##ki); \
    E##ko = XOR128(Bko, ANDnu128(Bku, Bka)); \
    XOReq128(Co, E##ko); \
    E##ku = XOR128(Bku, ANDnu128(Bka, Bke)); \
    XOReq128(Cu, E##ku); \
\
    XOReq128(A##bu, Du); \
    Bma = ROL64in128(A##bu, 27); \
    XOReq128(A##ga, Da); \
    Bme = ROL64in128(A##ga, 36); \
    XOReq128(A##ke, De); \
    Bmi = ROL64in128(A##ke, 10); \
    E##ma = XOR128(Bma, ANDnu128(Bme, Bmi)); \
    XOReq128(Ca, E##ma); \
    XOReq128(A##mi, Di); \
    Bmo = ROL64in128(A##mi, 15); \
    E##me = XOR128(Bme, ANDnu128(Bmi, Bmo)); \
    XOReq128(Ce, E##me); \
    XOReq128(A##so, Do); \
    Bmu = ROL64in128_56(A##so); \
    E##mi = XOR128(Bmi, ANDnu128(Bmo, Bmu)); \
    XOReq128(Ci, E##mi); \
    E##mo = XOR128(Bmo, ANDnu128(Bmu, Bma)); \
    XOReq128(Co, E##mo); \
    E##mu = XOR128(Bmu, ANDnu128(Bma, Bme)); \
    XOReq128(Cu, E##mu); \
\
    XOReq128(A##bi, Di); \
    Bsa = ROL64in128(A##bi, 62); \
    XOReq128(A##go, Do); \
    Bse = ROL64in128(A##go, 55); \
    XOReq128(A##ku, Du); \
    Bsi = ROL64in128(A##ku, 39); \
    E##sa = XOR128(Bsa, ANDnu128(Bse, Bsi)); \
    XOReq128(Ca, E##sa); \
    XOReq128(A##ma, Da); \
    Bso = ROL64in128(A##ma, 41); \
    E##se = XOR128(Bse, ANDnu128(Bsi, Bso)); \
    XOReq128(Ce, E##se); \
    XOReq128(A##se, De); \
    Bsu = ROL64in128(A##se, 2); \
    E##si = XOR128(Bsi, ANDnu128(Bso, Bsu)); \
    XOReq128(Ci, E##si); \
    E##so = XOR128(Bso, ANDnu128(Bsu, Bsa)); \
    XOReq128(Co, E##so); \
    E##su = XOR128(Bsu, ANDnu128(Bsa, Bse)); \
    XOReq128(Cu, E##su); \
\

// --- Theta Rho Pi Chi Iota
// --- 64-bit lanes mapped to 64-bit words
#define thetaRhoPiChiIota(i, A, E) \
    Da = XOR128(Cu, ROL64in128(Ce, 1)); \
    De = XOR128(Ca, ROL64in128(Ci, 1)); \
    Di = XOR128(Ce, ROL64in128(Co, 1)); \
    Do = XOR128(Ci, ROL64in128(Cu, 1)); \
    Du = XOR128(Co, ROL64in128(Ca, 1)); \
\
    XOReq128(A##ba, Da); \
    Bba = A##ba; \
    XOReq128(A##ge, De); \
    Bbe = ROL64in128(A##ge, 44); \
    XOReq128(A##ki, Di); \
    Bbi = ROL64in128(A##ki, 43); \
    E##ba = XOR128(Bba, ANDnu128(Bbe, Bbi)); \
    XOReq128(E##ba, CONST128(KeccakF1600DoubleRoundConstants[(i)*2])); \
    XOReq128(A##mo, Do); \
    Bbo = ROL64in128(A##mo, 21); \
    E##be = XOR128(Bbe, ANDnu128(Bbi, Bbo)); \
    XOReq128(A##su, Du); \
    Bbu = ROL64in128(A##su, 14); \
    E##bi = XOR128(Bbi, ANDnu128(Bbo, Bbu)); \
    E##bo = XOR128(Bbo, ANDnu128(Bbu, Bba)); \
    E##bu = XOR128(Bbu, ANDnu128(Bba, Bbe)); \
\
    XOReq128(A##bo, Do); \
    Bga = ROL64in128(A##bo, 28); \
    XOReq128(A##gu, Du); \
    Bge = ROL64in128(A##gu, 20); \
    XOReq128(A##ka, Da); \
    Bgi = ROL64in128(A##ka, 3); \
    E##ga = XOR128(Bga, ANDnu128(Bge, Bgi)); \
    XOReq128(A##me, De); \
    Bgo = ROL64in128(A##me, 45); \
    E##ge = XOR128(Bge, ANDnu128(Bgi, Bgo)); \
    XOReq128(A##si, Di); \
    Bgu = ROL64in128(A##si, 61); \
    E##gi = XOR128(Bgi, ANDnu128(Bgo, Bgu)); \
    E##go = XOR128(Bgo, ANDnu128(Bgu, Bga)); \
    E##gu = XOR128(Bgu, ANDnu128(Bga, Bge)); \
\
    XOReq128(A##be, De); \
    Bka = ROL64in128(A##be, 1); \
    XOReq128(A##gi, Di); \
    Bke = ROL64in128(A##gi, 6); \
    XOReq128(A##ko, Do); \
    Bki = ROL64in128(A##ko, 25); \
    E##ka = XOR128(Bka, ANDnu128(Bke, Bki)); \
    XOReq128(A##mu, Du); \
    Bko = ROL64in128_8(A##mu); \
    E##ke = XOR128(Bke, ANDnu128(Bki, Bko)); \
    XOReq128(A##sa, Da); \
    Bku = ROL64in128(A##sa, 18); \
    E##ki = XOR128(Bki, ANDnu128(Bko, Bku)); \
    E##ko = XOR128(Bko, ANDnu128(Bku, Bka)); \
    E##ku = XOR128(Bku, ANDnu128(Bka, Bke)); \
\
    XOReq128(A##bu, Du); \
    Bma = ROL64in128(A##bu, 27); \
    XOReq128(A##ga, Da); \
    Bme = ROL64in128(A##ga, 36); \
    XOReq128(A##ke, De); \
    Bmi = ROL64in128(A##ke, 10); \
    E##ma = XOR128(Bma, ANDnu128(Bme, Bmi)); \
    XOReq128(A##mi, Di); \
    Bmo = ROL64in128(A##mi, 15); \
    E##me = XOR128(Bme, ANDnu128(Bmi, Bmo)); \
    XOReq128(A##so, Do); \
    Bmu = ROL64in128_56(A##so); \
    E##mi = XOR128(Bmi, ANDnu128(Bmo, Bmu)); \
    E##mo = XOR128(Bmo, ANDnu128(Bmu, Bma)); \
    E##mu = XOR128(Bmu, ANDnu128(Bma, Bme)); \
\
    XOReq128(A##bi, Di); \
    Bsa = ROL64in128(A##bi, 62); \
    XOReq128(A##go, Do); \
    Bse = ROL64in128(A##go, 55); \
    XOReq128(A##ku, Du); \
    Bsi = ROL64in128(A##ku, 39); \
    E##sa = XOR128(Bsa, ANDnu128(Bse, Bsi)); \
    XOReq128(A##ma, Da); \
    Bso = ROL64in128(A##ma, 41); \
    E##se = XOR128(Bse, ANDnu128(Bsi, Bso)); \
    XOReq128(A##se, De); \
    Bsu = ROL64in128(A##se, 2); \
    E##si = XOR128(Bsi, ANDnu128(Bso, Bsu)); \
    E##so = XOR128(Bso, ANDnu128(Bsu, Bsa)); \
    E##su = XOR128(Bsu, ANDnu128(Bsa, Bse)); \
\

ALIGN const UINT64 KeccakF1600DoubleRoundConstants[48] = {
    0x0000000000000001ULL, 0x0000000000000001ULL,
    0x0000000000008082ULL, 0x0000000000008082ULL,
    0x800000000000808aULL, 0x800000000000808aULL,
    0x8000000080008000ULL, 0x8000000080008000ULL,
    0x000000000000808bULL, 0x000000000000808bULL,
    0x0000000080000001ULL, 0x0000000080000001ULL,
    0x8000000080008081ULL, 0x8000000080008081ULL,
    0x8000000000008009ULL, 0x8000000000008009ULL,
    0x000000000000008aULL, 0x000000000000008aULL,
    0x0000000000000088ULL, 0x0000000000000088ULL,
    0x0000000080008009ULL, 0x0000000080008009ULL,
    0x000000008000000aULL, 0x000000008000000aULL,
    0x000000008000808bULL, 0x000000008000808bULL,
    0x800000000000008bULL, 0x800000000000008bULL,
    0x8000000000008089ULL, 0x8000000000008089ULL,
    0x8000000000008003ULL, 0x8000000000008003ULL,
    0x8000000000008002ULL, 0x8000000000008002ULL,
    0x8000000000000080ULL, 0x8000000000000080ULL,
    0x000000000000800aULL, 0x000000000000800aULL,
    0x800000008000000aULL, 0x800000008000000aULL,
    0x8000000080008081ULL, 0x8000000080008081ULL,
    0x8000000000008080ULL, 0x8000000000008080ULL,
    0x0000000080000001ULL, 0x0000000080000001ULL,
    0x8000000080008008ULL, 0x8000000080008008ULL };

#define copyFromStateAndXor1344bits(X, state, input) \
    X##ba = XOR128(LOAD128(state[ 0]), LOAD128(input[ 0])); \
    X##be = XOR128(LOAD128(state[ 1]), LOAD128(input[ 1])); \
    X##bi = XOR128(LOAD128(state[ 2]), LOAD128(input[ 2])); \
    X##bo = XOR128(LOAD128(state[ 3]), LOAD128(input[ 3])); \
    X##bu = XOR128(LOAD128(state[ 4]), LOAD128(input[ 4])); \
    X##ga = XOR128(LOAD128(state[ 5]), LOAD128(input[ 5])); \
    X##ge = XOR128(LOAD128(state[ 6]), LOAD128(input[ 6])); \
    X##gi = XOR128(LOAD128(state[ 7]), LOAD128(input[ 7])); \
    X##go = XOR128(LOAD128(state[ 8]), LOAD128(input[ 8])); \
    X##gu = XOR128(LOAD128(state[ 9]), LOAD128(input[ 9])); \
    X##ka = XOR128(LOAD128(state[10]), LOAD128(input[10])); \
    X##ke = XOR128(LOAD128(state[11]), LOAD128(input[11])); \
    X##ki = XOR128(LOAD128(state[12]), LOAD128(input[12])); \
    X##ko = XOR128(LOAD128(state[13]), LOAD128(input[13])); \
    X##ku = XOR128(LOAD128(state[14]), LOAD128(input[14])); \
    X##ma = XOR128(LOAD128(state[15]), LOAD128(input[15])); \
    X##me = XOR128(LOAD128(state[16]), LOAD128(input[16])); \
    X##mi = XOR128(LOAD128(state[17]), LOAD128(input[17])); \
    X##mo = XOR128(LOAD128(state[18]), LOAD128(input[18])); \
    X##mu = XOR128(LOAD128(state[19]), LOAD128(input[19])); \
    X##sa = XOR128(LOAD128(state[20]), LOAD128(input[20])); \
    X##se = LOAD128(state[21]); \
    X##si = LOAD128(state[22]); \
    X##so = LOAD128(state[23]); \
    X##su = LOAD128(state[24]); \

#define copyFromStateAndXor1088bits(X, state, input) \
    X##ba = XOR128(LOAD128(state[ 0]), LOAD128(input[ 0])); \
    X##be = XOR128(LOAD128(state[ 1]), LOAD128(input[ 1])); \
    X##bi = XOR128(LOAD128(state[ 2]), LOAD128(input[ 2])); \
    X##bo = XOR128(LOAD128(state[ 3]), LOAD128(input[ 3])); \
    X##bu = XOR128(LOAD128(state[ 4]), LOAD128(input[ 4])); \
    X##ga = XOR128(LOAD128(state[ 5]), LOAD128(input[ 5])); \
    X##ge = XOR128(LOAD128(state[ 6]), LOAD128(input[ 6])); \
    X##gi = XOR128(LOAD128(state[ 7]), LOAD128(input[ 7])); \
    X##go = XOR128(LOAD128(state[ 8]), LOAD128(input[ 8])); \
    X##gu = XOR128(LOAD128(state[ 9]), LOAD128(input[ 9])); \
    X##ka = XOR128(LOAD128(state[10]), LOAD128(input[10])); \
    X##ke = XOR128(LOAD128(state[11]), LOAD128(input[11])); \
    X##ki = XOR128(LOAD128(state[12]), LOAD128(input[12])); \
    X##ko = XOR128(LOAD128(state[13]), LOAD128(input[13])); \
    X##ku = XOR128(LOAD128(state[14]), LOAD128(input[14])); \
    X##ma = XOR128(LOAD128(state[15]), LOAD128(input[15])); \
    X##me = XOR128(LOAD128(state[16]), LOAD128(input[16])); \
    X##mi = LOAD128(state[17]); \
    X##mo = LOAD128(state[18]); \
    X##mu = LOAD128(state[19]); \
    X##sa = LOAD128(state[20]); \
    X##se = LOAD128(state[21]); \
    X##si = LOAD128(state[22]); \
    X##so = LOAD128(state[23]); \
    X##su = LOAD128(state[24]); \

#define copyFromStateAndXor1024bits(X, state, input) \
    X##ba = XOR128(LOAD128(state[ 0]), LOAD128(input[ 0])); \
    X##be = XOR128(LOAD128(state[ 1]), LOAD128(input[ 1])); \
    X##bi = XOR128(LOAD128(state[ 2]), LOAD128(input[ 2])); \
    X##bo = XOR128(LOAD128(state[ 3]), LOAD128(input[ 3])); \
    X##bu = XOR128(LOAD128(state[ 4]), LOAD128(input[ 4])); \
    X##ga = XOR128(LOAD128(state[ 5]), LOAD128(input[ 5])); \
    X##ge = XOR128(LOAD128(state[ 6]), LOAD128(input[ 6])); \
    X##gi = XOR128(LOAD128(state[ 7]), LOAD128(input[ 7])); \
    X##go = XOR128(LOAD128(state[ 8]), LOAD128(input[ 8])); \
    X##gu = XOR128(LOAD128(state[ 9]), LOAD128(input[ 9])); \
    X##ka = XOR128(LOAD128(state[10]), LOAD128(input[10])); \
    X##ke = XOR128(LOAD128(state[11]), LOAD128(input[11])); \
    X##ki = XOR128(LOAD128(state[12]), LOAD128(input[12])); \
    X##ko = XOR128(LOAD128(state[13]), LOAD128(input[13])); \
    X##ku = XOR128(LOAD128(state[14]), LOAD128(input[14])); \
    X##ma = XOR128(LOAD128(state[15]), LOAD128(input[15])); \
    X##me = LOAD128(state[16]); \
    X##mi = LOAD128(state[17]); \
    X##mo = LOAD128(state[18]); \
    X##mu = LOAD128(state[19]); \
    X##sa = LOAD128(state[20]); \
    X##se = LOAD128(state[21]); \
    X##si = LOAD128(state[22]); \
    X##so = LOAD128(state[23]); \
    X##su = LOAD128(state[24]); \

#define copyFromStateAndXor512bits(X, state, input) \
    X##ba = XOR128(LOAD128(state[ 0]), LOAD128(input[ 0])); \
    X##be = XOR128(LOAD128(state[ 1]), LOAD128(input[ 1])); \
    X##bi = XOR128(LOAD128(state[ 2]), LOAD128(input[ 2])); \
    X##bo = XOR128(LOAD128(state[ 3]), LOAD128(input[ 3])); \
    X##bu = XOR128(LOAD128(state[ 4]), LOAD128(input[ 4])); \
    X##ga = XOR128(LOAD128(state[ 5]), LOAD128(input[ 5])); \
    X##ge = XOR128(LOAD128(state[ 6]), LOAD128(input[ 6])); \
    X##gi = XOR128(LOAD128(state[ 7]), LOAD128(input[ 7])); \
    X##go = LOAD128(state[ 8]); \
    X##gu = LOAD128(state[ 9]); \
    X##ka = LOAD128(state[10]); \
    X##ke = LOAD128(state[11]); \
    X##ki = LOAD128(state[12]); \
    X##ko = LOAD128(state[13]); \
    X##ku = LOAD128(state[14]); \
    X##ma = LOAD128(state[15]); \
    X##me = LOAD128(state[16]); \
    X##mi = LOAD128(state[17]); \
    X##mo = LOAD128(state[18]); \
    X##mu = LOAD128(state[19]); \
    X##sa = LOAD128(state[20]); \
    X##se = LOAD128(state[21]); \
    X##si = LOAD128(state[22]); \
    X##so = LOAD128(state[23]); \
    X##su = LOAD128(state[24]); \

#define copyFromState(X, state) \
    X##ba = LOAD128(state[ 0]); \
    X##be = LOAD128(state[ 1]); \
    X##bi = LOAD128(state[ 2]); \
    X##bo = LOAD128(state[ 3]); \
    X##bu = LOAD128(state[ 4]); \
    X##ga = LOAD128(state[ 5]); \
    X##ge = LOAD128(state[ 6]); \
    X##gi = LOAD128(state[ 7]); \
    X##go = LOAD128(state[ 8]); \
    X##gu = LOAD128(state[ 9]); \
    X##ka = LOAD128(state[10]); \
    X##ke = LOAD128(state[11]); \
    X##ki = LOAD128(state[12]); \
    X##ko = LOAD128(state[13]); \
    X##ku = LOAD128(state[14]); \
    X##ma = LOAD128(state[15]); \
    X##me = LOAD128(state[16]); \
    X##mi = LOAD128(state[17]); \
    X##mo = LOAD128(state[18]); \
    X##mu = LOAD128(state[19]); \
    X##sa = LOAD128(state[20]); \
    X##se = LOAD128(state[21]); \
    X##si = LOAD128(state[22]); \
    X##so = LOAD128(state[23]); \
    X##su = LOAD128(state[24]); \

#define copyToState(state, X) \
    STORE128(state[ 0], X##ba); \
    STORE128(state[ 1], X##be); \
    STORE128(state[ 2], X##bi); \
    STORE128(state[ 3], X##bo); \
    STORE128(state[ 4], X##bu); \
    STORE128(state[ 5], X##ga); \
    STORE128(state[ 6], X##ge); \
    STORE128(state[ 7], X##gi); \
    STORE128(state[ 8], X##go); \
    STORE128(state[ 9], X##gu); \
    STORE128(state[10], X##ka); \
    STORE128(state[11], X##ke); \
    STORE128(state[12], X##ki); \
    STORE128(state[13], X##ko); \
    STORE128(state[14], X##ku); \
    STORE128(state[15], X##ma); \
    STORE128(state[16], X##me); \
    STORE128(state[17], X##mi); \
    STORE128(state[18], X##mo); \
    STORE128(state[19], X##mu); \
    STORE128(state[20], X##sa); \
    STORE128(state[21], X##se); \
    STORE128(state[22], X##si); \
    STORE128(state[23], X##so); \
    STORE128(state[24], X##su); \

#define copyStateVariables(X, Y) \
    X##ba = Y##ba; \
    X##be = Y##be; \
    X##bi = Y##bi; \
    X##bo = Y##bo; \
    X##bu = Y##bu; \
    X##ga = Y##ga; \
    X##ge = Y##ge; \
    X##gi = Y##gi; \
    X##go = Y##go; \
    X##gu = Y##gu; \
    X##ka = Y##ka; \
    X##ke = Y##ke; \
    X##ki = Y##ki; \
    X##ko = Y##ko; \
    X##ku = Y##ku; \
    X##ma = Y##ma; \
    X##me = Y##me; \
    X##mi = Y##mi; \
    X##mo = Y##mo; \
    X##mu = Y##mu; \
    X##sa = Y##sa; \
    X##se = Y##se; \
    X##si = Y##si; \
    X##so = Y##so; \
    X##su = Y##su; \

#include "KeccakF-1600-unrolling.macros"

void KeccakDoublePermutationOnWords(V128 *state)
{
    declareABCDE
#if (Unrolling != 24)
    unsigned int i;
#endif

    copyFromState(A, state)
    rounds
#if defined(UseMMX)
    _mm_empty();
#endif
}

void KeccakDoublePermutationOnWordsAfterXoring2x512bits(V128 *state, const V128 *input)
{
    declareABCDE
#if (Unrolling != 24)
    unsigned int i;
#endif

    copyFromStateAndXor512bits(A, state, input)
    rounds
#if defined(UseMMX)
    _mm_empty();
#endif
}

void KeccakDoublePermutationOnWordsAfterXoring2x1024bits(V128 *state, const V128 *input)
{
    declareABCDE
#if (Unrolling != 24)
    unsigned int i;
#endif

    copyFromStateAndXor1024bits(A, state, input)
    rounds
#if defined(UseMMX)
    _mm_empty();
#endif
}

void KeccakDoublePermutationOnWordsAfterXoring2x1088bits(V128 *state, const V128 *input)
{
    declareABCDE
#if (Unrolling != 24)
    unsigned int i;
#endif

    copyFromStateAndXor1088bits(A, state, input)
    rounds
#if defined(UseMMX)
    _mm_empty();
#endif
}

void KeccakDoublePermutationOnWordsAfterXoring2x1344bits(V128 *state, const V128 *input)
{
    declareABCDE
#if (Unrolling != 24)
    unsigned int i;
#endif

    copyFromStateAndXor1344bits(A, state, input)
    rounds
#if defined(UseMMX)
    _mm_empty();
#endif
}

void KeccakInitializeDoubleState(V128 *state)
{
    memset(state, 0, KeccakPermutationSizeInBytes*2);
}
