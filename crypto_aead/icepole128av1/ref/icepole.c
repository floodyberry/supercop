#include "icepole.h"

/* little endian load of len characters into least significant bits of the resulting value */
uint64_t load64(const unsigned char * p, unsigned int len)
{
    uint64_t v = 0;
    unsigned int i;
    assert(len <= 8);
    for(i=0; i<len; ++i) {
        v = v ^ (((uint64_t)p[i]) << (8*i));
    }
    return v;
}

/* little endian store of up len bytes from the value v */
void store64(unsigned char * p, uint64_t v, unsigned int len)
{
    unsigned int i;
    assert(len <= 8);
    for (i=0; i<len; ++i) {
        p[i] = (unsigned char) (v >> (8*i));
    }
}

void Mu(ICESTATE SS, ICESTATE S)
{
    SS[0][0] = S[0][4] ^ S[1][0] ^ S[2][0] ^ S[3][0];
    SS[0][1] = S[0][0] ^ S[1][1] ^ S[2][1] ^ S[3][1];
    SS[0][2] = S[0][4] ^ S[0][1] ^ S[1][2] ^ S[2][2] ^ S[3][2];
    SS[0][3] = S[0][2] ^ S[1][3] ^ S[2][3] ^ S[3][3];
    SS[0][4] = S[0][3] ^ S[1][4] ^ S[2][4] ^ S[3][4];

    SS[1][0] = S[0][0] ^ S[1][0] ^ S[2][1] ^ S[3][4];
    SS[1][1] = S[0][1] ^ S[1][1] ^ S[2][2] ^ S[2][0] ^ S[3][0];
    SS[1][2] = S[0][2] ^ S[1][2] ^ S[2][3] ^ S[3][4] ^ S[3][1];
    SS[1][3] = S[0][3] ^ S[1][3] ^ S[2][4] ^ S[3][2];
    SS[1][4] = S[0][4] ^ S[1][4] ^ S[2][0] ^ S[3][3];

    SS[2][0] = S[0][0] ^ S[1][4] ^ S[2][0] ^ S[3][1];
    SS[2][1] = S[0][1] ^ S[1][0] ^ S[2][1] ^ S[3][2] ^ S[3][0];
    SS[2][2] = S[0][2] ^ S[1][4] ^ S[1][1] ^ S[2][2] ^ S[3][3];
    SS[2][3] = S[0][3] ^ S[1][2] ^ S[2][3] ^ S[3][4];
    SS[2][4] = S[0][4] ^ S[1][3] ^ S[2][4] ^ S[3][0];

    SS[3][0] = S[0][0] ^ S[1][1] ^ S[2][4] ^ S[3][0];
    SS[3][1] = S[0][1] ^ S[1][2] ^ S[1][0] ^ S[2][0] ^ S[3][1];
    SS[3][2] = S[0][2] ^ S[1][3] ^ S[2][4] ^ S[2][1] ^ S[3][2];
    SS[3][3] = S[0][3] ^ S[1][4] ^ S[2][2] ^ S[3][3];
    SS[3][4] = S[0][4] ^ S[1][0] ^ S[2][3] ^ S[3][4];
}

void Rho(ICESTATE SS, ICESTATE S)
{
    SS[0][0] = S[0][0]; 
    SS[0][1] = ROTL(S[0][1], 36);
    SS[0][2] = ROTL(S[0][2],  3);
    SS[0][3] = ROTL(S[0][3], 41);
    SS[0][4] = ROTL(S[0][4], 18);
    
    SS[1][0] = ROTL(S[1][0],  1); 
    SS[1][1] = ROTL(S[1][1], 44);
    SS[1][2] = ROTL(S[1][2], 10);
    SS[1][3] = ROTL(S[1][3], 45);
    SS[1][4] = ROTL(S[1][4],  2);
    
    SS[2][0] = ROTL(S[2][0], 62); 
    SS[2][1] = ROTL(S[2][1],  6);
    SS[2][2] = ROTL(S[2][2], 43);
    SS[2][3] = ROTL(S[2][3], 15);
    SS[2][4] = ROTL(S[2][4], 61);

    SS[3][0] = ROTL(S[3][0], 28); 
    SS[3][1] = ROTL(S[3][1], 55);
    SS[3][2] = ROTL(S[3][2], 25);
    SS[3][3] = ROTL(S[3][3], 21);
    SS[3][4] = ROTL(S[3][4], 56);
}

void Pi(ICESTATE SS, ICESTATE S)
{
    unsigned int x,y;
    for(x = 0; x < 4; ++x) {
        for (y = 0; y < 5; ++y) {
            unsigned int xx = (x + y) % 4;
            unsigned int yy = (xx + y + 1) % 5;
            SS[xx][yy] = S[x][y];
        }
    }
}

void Psi(ICESTATE SS, ICESTATE S)
{
    unsigned int x;
    for (x = 0; x < 4; ++x) {
        uint64_t tmp1 = S[x][0] & S[x][1] & S[x][2] & S[x][3] & S[x][4];
        uint64_t tmp2 = (~S[x][0]) & (~S[x][1]) & (~S[x][2]) & (~S[x][3]) & (~S[x][4]);
        SS[x][0] = S[x][0] ^ ((~S[x][1]) & S[x][2]) ^ tmp1 ^ tmp2;
        SS[x][1] = S[x][1] ^ ((~S[x][2]) & S[x][3]) ^ tmp1 ^ tmp2;
        SS[x][2] = S[x][2] ^ ((~S[x][3]) & S[x][4]) ^ tmp1 ^ tmp2;
        SS[x][3] = S[x][3] ^ ((~S[x][4]) & S[x][0]) ^ tmp1 ^ tmp2;
        SS[x][4] = S[x][4] ^ ((~S[x][0]) & S[x][1]) ^ tmp1 ^ tmp2;
    }
}

void Kappa(ICESTATE SS, ICESTATE S, int roundNo)
{
    const uint64_t constant[MAXROUND] = {
    0x0091A2B3C4D5E6F7ULL, 0x0048D159E26AF37BULL, 0x002468ACF13579BDULL, 0x00123456F89ABCDEULL,
    0x00091A2BFC4D5E6FULL, 0x00048D15FE26AF37ULL, 0x0002468AFF13579BULL, 0x000123457F89ABCDULL,
    0x000091A2BFC4D5E6ULL, 0x000048D1DFE26AF3ULL, 0x00002468EFF13579ULL, 0x00001234F7F89ABC };
    unsigned int x,y;
    for(x = 0; x < 4; ++x) {
        for(y = 0; y < 5; ++y) {
            SS[x][y] = S[x][y];
        }
    }

    SS[0][0] = SS[0][0] ^ constant[roundNo];
}

void oneround(ICESTATE SS, ICESTATE S, int roundNo)
{
    ICESTATE B;
    ICESTATE C;
    ICESTATE D;
    ICESTATE E;

    Mu(B, S);
    Rho(C, B);
    Pi(D, C);
    Psi(E, D);
    Kappa(SS, E, roundNo);
}

void P6(ICESTATE SS, ICESTATE S)
{
    ICESTATE A;
    ICESTATE B;

    oneround(A,S,0);
    oneround(B,A,1);
    oneround(A,B,2);
    oneround(B,A,3);
    oneround(A,B,4);
    oneround(SS,A,5);
}

void P12(ICESTATE SS, ICESTATE S)
{
    ICESTATE A;
    ICESTATE B;

    oneround(A,S,0);
    oneround(B,A,1);
    oneround(A,B,2);
    oneround(B,A,3);
    oneround(A,B,4);
    oneround(B,A,5);
    oneround(A,B,6);
    oneround(B,A,7);
    oneround(A,B,8);
    oneround(B,A,9);
    oneround(A,B,10);
    oneround(SS,A,11);
}

void initState128a(ICESTATE S, const unsigned char * k, const unsigned char * nonce)
{
    ICESTATE T;

    /* init state */
    S[0][0] = 0xFF97A42D7F8E6FD4ULL;
    S[0][1] = 0x90FEE5A0A44647C4ULL;
    S[0][2] = 0x8C5BDA0CD6192E76ULL;
    S[0][3] = 0xAD30A6F71B19059CULL;
    S[0][4] = 0x30935AB7D08FFC64ULL;

    S[1][0] = 0xEB5AA93F2317D635ULL;
    S[1][1] = 0xA9A6E6260D712103ULL;
    S[1][2] = 0x81A57C16DBCF555FULL;
    S[1][3] = 0x43B831CD0347C826ULL;
    S[1][4] = 0x01F22F1A11A5569FULL;

    S[2][0] = 0x05E5635A21D9AE61ULL;
    S[2][1] = 0x64BEFEF28CC970F2ULL;
    S[2][2] = 0x613670957BC46611ULL;
    S[2][3] = 0xB87C5A554FD00ECBULL;
    S[2][4] = 0x8C3EE88A1CCF32C8ULL;

    S[3][0] = 0x940C7922AE3A2614ULL;
    S[3][1] = 0x1841F924A2C509E4ULL;
    S[3][2] = 0x16F53526E70465C2ULL;
    S[3][3] = 0x75F644E97F30A13BULL;
    S[3][4] = 0xEAF1FF7B5CECA249ULL;

    /* xor key, nonce */
    S[0][0] = S[0][0] ^ load64(k, 8);
    S[1][0] = S[1][0] ^ load64(k+8, 8);
    S[2][0] = S[2][0] ^ load64(nonce, 8);
    S[3][0] = S[3][0] ^ load64(nonce+8, 4);

    /* do P_12 */
    oneround(T,S,0);
    oneround(S,T,1);
    oneround(T,S,2);
    oneround(S,T,3);
    oneround(T,S,4);
    oneround(S,T,5);
    oneround(T,S,6);
    oneround(S,T,7);
    oneround(T,S,8);
    oneround(S,T,9);
    oneround(T,S,10);
    oneround(S,T,11);
}

void processIceBlock(
    ICESTATE S, 
    const unsigned char * source, 
    unsigned char ** dest,
    unsigned long long blocklen, 
    unsigned int frameBit
)
{
	uint64_t q;
	uint64_t snew;
	uint64_t padding;
	unsigned int qlen; 
	unsigned int i = 0;	
	assert(blocklen <= 128);
	
	do {
        qlen = (blocklen < 8 ? (unsigned int) blocklen : 8); 
        q = load64(source, qlen);
        snew = S[i%4][i/4] ^ q;
        if (dest) {
            store64(*dest, snew, qlen);
            *dest += qlen;
        }        
        padding = qlen < 8 ? ((uint64_t)frameBit | 0x02ULL) << (8*qlen) : 0;
        S[i%4][i/4] ^= q ^ padding;
        ++i;
        source += qlen;
        blocklen -= qlen;
	} while (qlen == 8);
	P6(S,S);
}

void processIceBlockRev(
	ICESTATE S, 
	const unsigned char * source, 
	unsigned char ** dest,
	unsigned long long blocklen, 
	unsigned int frameBit
	)
{
	uint64_t q;
	uint64_t snew;
	uint64_t padding;
	uint64_t bitmask;
	unsigned int qlen; 
	unsigned int i = 0;	
	assert(blocklen <= 128);

	do {
		qlen = (blocklen < 8 ? (unsigned int) blocklen : 8); 
		q = load64(source, qlen);
		snew = S[i%4][i/4] ^ q;
		bitmask = (qlen==8 ? 0 : 1ULL<< 8*qlen) - 1ULL;
		snew = snew & bitmask;
		if (dest) {
			store64(*dest, snew, qlen);
			*dest += qlen;
		}        
		padding = qlen < 8 ? ((uint64_t)frameBit | 0x02ULL) << (8*qlen) : 0;
		S[i%4][i/4] ^= snew ^ padding;
		++i;
		source += qlen;
		blocklen -= qlen;
	} while (qlen == 8);
	P6(S,S);
}

