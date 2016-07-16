#ifndef _ICEPOLE_H_
#define _ICEPOLE_H_
#include <stdint.h>
#include <stddef.h>
#include <assert.h>

#define ROTL(a,k) ((a)<<(k) | (a)>>(64-(k)))
#define MAXROUND 12
#define ICEPOLETAGLEN 16
#define ICEPOLENSECLEN 0
#define ICEPOLEDATABLOCKLEN 120

uint64_t load64(const unsigned char * p, unsigned int len);
void store64(unsigned char * p, uint64_t v, unsigned int len);

typedef uint64_t ICESTATE[4][5];

void Mu(ICESTATE SS, ICESTATE S);
void Rho(ICESTATE SS, ICESTATE S);
void Pi(ICESTATE SS, ICESTATE S);
void Psi(ICESTATE SS, ICESTATE S);
void Kappa(ICESTATE SS, ICESTATE S, int roundNo);
void oneround(ICESTATE SS, ICESTATE S, int roundNo);
void P6(ICESTATE SS, ICESTATE S);
void P12(ICESTATE SS, ICESTATE S);

void initState256a(
    ICESTATE S, 
    const unsigned char * k, 
    const unsigned char *nonce
);

void processDataBlock(
    ICESTATE S, 
    const unsigned char * source, 
    unsigned char ** dest,
    unsigned long long blocklen, 
    unsigned int frameBit
);

void processDataBlockRev(
    ICESTATE S, 
    const unsigned char * source, 
    unsigned char ** dest,
    unsigned long long blocklen, 
    unsigned int frameBit
);

void generateTag(
    ICESTATE S, 
    unsigned char * tag);
#endif

