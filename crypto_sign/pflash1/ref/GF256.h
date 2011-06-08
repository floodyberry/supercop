/*
 * $Id: GF256.h 1010 2008-05-06 16:12:55Z owenhsin $
 */

#ifndef _GF256_H
#define _GF256_H

#include "GF.h"
#include <stdlib.h>

/**
 * \brief		Generate random GF(256) number 
 *			using pseudorandom number generator from stdlib
 */
static inline
byte GF_256_rand()
{
	return (byte)(rand());
}

/**
 * \brief		Turn a GF(256) element into log form
 */
static inline
byte GF_256_log(byte x)
{
	return logtab[x];
}

/**
 * \brief		Turn a GF(256) in log form back into element
 */
static inline
byte GF_256_exp(byte x)
{
	return alogtab[x];
}

/**
 * \brief		GF(256) multiplication
 *
 * \param x		GF(256) element
 * \param y		GF(256) element
 *
 * \param ret		ret = x * y
 */
static inline
byte GF_256_mul(byte x, byte y)
{
	return ((x==0)|(y==0))?0:alogtab[(uint32)logtab[x]+(uint32)logtab[y]];
}

/**
 * \brief		GF(256) squaring
 *
 * \param x		GF(256) element
 *
 * \return ret		ret = x^2
 */
static inline
byte GF_256_sqr(byte x)
{
	return (x==0)?0:alogtab[((uint32)logtab[x])<<1];
}

/**
 * \brief		Specialized GF(256) multiplication
 *			for GF(256^2) = GF(256)[a]/(a^2+a+144) use
 *
 * \param x		GF(256) element
 *
 * \return ret		ret = x * 144
 */
static inline
byte GF_256_mul_g(byte x)
{
	return (x==0)?0:alogtab[(uint32)logtab[x]+logg];
}

/**
 * \brief		Specialized GF(256) multiplication
 *			for GF(256^2) = GF(256)[a]/(a^2+a+144) use
 *
 * \param x		GF(256) element
 *
 * \return ret		ret = x * 144 *144
 */
static inline
byte GF_256_mul_gg(byte x)
{
	return (x==0)?0:alogtab[(uint32)logtab[x]+2*logg];
}

/**
 * \brief		GF(256) multiplication
 *
 * \param x		GF(256) element
 * \param y		GF(256) element
 * \param z		GF(256) element
 *
 * \return ret		ret = x * y * z
 */
static inline
byte GF_256_mul3(byte x, byte y, byte z)
{
	return ((x==0)|(y==0)|(z==0))?0:alogtab[(uint32)logtab[x]+(uint32)logtab[y]+(uint32)logtab[z]];
}

/**
 * \brief		GF(256) inversion
 *
 * \param x		GF(256) element
 *
 * \return ret		ret = 1 / x
 */
static inline
byte GF_256_inv(byte x)
{
	return alogtab[255-(uint32)logtab[x]];
}

/**
 * \brief		GF(256) division
 *
 * \param x		GF(256) element
 * \param y		GF(256) element
 *
 * \return ret		ret = x / y
 */
static inline
byte GF_256_div(byte x, byte y)
{
	return (x==0)?0:alogtab[255+(uint32)logtab[x]-(uint32)logtab[y]];
}

/**
 * \brief		GF(256) square root
 *
 * \param x		GF(256) element
 *
 * \return ret		ret = sqrt(x)
 */
static inline
byte GF_256_sqrt(byte x)
{
	uint32 exp;
	exp = (uint32)logtab[x];
	exp = (exp&0x1)?((exp+255)>>1):(exp>>1);
	return (x==0)?0:alogtab[exp];
}

#endif /* _GF256_H */

/*
 * GF256.h
 */
