/*
 * $Id: GF.h 1010 2008-05-06 16:12:55Z owenhsin $
 */

#ifndef _GF_H
#define _GF_H

typedef unsigned char	byte;
typedef unsigned short	uint16;
typedef unsigned int	uint32;

/**
 * \brief		bind 2 bytes together for GF(256^2)
 */
typedef union word
{
	uint16 w;
	byte b[2];
} word_t;

/**
 * \brief		bind 4 bytes together for GF(256^4)
 */ 
typedef union dword
{
	uint32 dw;
	word_t w[2];
} dword_t;

/**
 * \brief		Log table for GF(256).
 *			GF(256) = GF(16)[x]/(x^2+x+9)
 */
extern byte logtab[];

/**
 * \brief		ALog table for GF(256).
 *			GF(256) = GF(16)[x]/(x^2+x+9)
 */
extern byte alogtab[];

/**
 * \brief		Log g, GF(256)[x]/(x^2+x+g),
 *			here g is 144, 
 *			and logg = logtab[144] = 18
 */
extern uint32 logg;

/**
 * \brief		Log (g^1), GF(256)[x]/(x^2+x+g), 
 *			here g is 144, 
 *			and log(g^1) = logtab[145] = 125
 */
extern uint32 logg1;
#endif /* _GF_H */

/*
 * GF.h
 */
