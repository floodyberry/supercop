/*
 * $Id: GF16.h 955 2008-05-03 14:39:31Z owenhsin $
 */

#ifndef _GF16_H
#define _GF16_H

#include "GF.h"
#include <stdlib.h>

/** \file GF16.h
 * \brief		GF(16) uses the same Log and Alog table as GF(256).
 *			[GF(256) = GF(16)[x]/(x^2+x+9)]. 
 *
 *			GF(16) multiplication
 *			a_1, a_0, b_1, b_0 are GF(16) element.
 *			(a_1*x+a_0)*(b_1*x+b_0)
 *			= (a_0*b_1+a_1*b_0+a_1*b_1)*x+(a_1*b_1*9 + a_0*b_0).
 *			= (a_0*b_1)*x+(a_0*b_0), if a_1 == 0
 */

/**
 * \brief		Generate random GF(!6) number
 *			using psuedorandom number from stdlib
 */
static inline
byte GF_16_rand()
{
	return (byte)(rand()&0xf);
}

/**
 * \brief		Calculate two 2-way GF(16) multiplication
 *
 * \param x		contains two GF(16) element
 * \param y		contains two GF(16) element
 * \param z		contains two GF(16) element
 *
 * \return ret		ret[0] = x[0]*y[0] ^ x[1]*z[0]; 
 *			ret[1] = x[0]*y[1] ^ x[1]*z[1];
 */
static inline
byte GF_16_muladd_2_to_4(byte x, byte y, byte z)
{
	byte x0, x1;
	x0 = x&0xf;
	x1 = (x>>4)&0xf;
	return (((x0==0)|(y==0))?0:alogtab[(uint32)logtab[x0]+(uint32)logtab[y]])^(((x1==0)|(z==0))?0:alogtab[(uint32)logtab[x1]+(uint32)logtab[z]]);
}

/**
 * \brief		same functionality as GF_16_muladd_2_to_4_2(a,b,c) 
 *			but may faster if the elements are already in log form
 *
 * \param x0		x0 = logtab[a&0xf]
 * \param x1		x1 = logtab[(a>>4)&0xf]
 * \param y		y = logtab[b]
 * \param z		z = logtab[c]
 *
 * \return ret		ret[0] = a[0]*b[0] ^ a[1]*c[0]
 *			ret[1] = a[0]*b[1] ^ a[1]*c[1]
 */
static inline
byte GF_16_muladd_2_to_4_2(byte x0, byte x1, byte y, byte z)
{
	return (((x0==0)|(y==0))?0:alogtab[x0+y])^(((x1==0)|(z==0))?0:alogtab[x1+z]);
}

/**
 * \brief		similar functionality as GF_!6_muladd_2_to_4_2(a0,a1,b,c)
 *			but only half of it
 *
 * \param x		x = a0, assumed not zero
 * \param y		y = b
 *
 * \return ret		ret = alogtab[x+y]
 */
static inline
byte GF_16_mul_1_to_2(byte x, byte y)
{
	return (y==0)?0:alogtab[x+y];
}

static inline 
byte GF_16_getEle( int idx , byte * GF16Str )
{
	return ((idx&0x1)? (((GF16Str[idx>>1])>>4)&0x0f) : ((GF16Str[idx>>1])&0x0f));       
}

static inline 
void GF_16_setEle( int idx , byte GF16ele , byte * GF16Str )
{
	if( idx&0x1) GF16Str[(idx>>1)] = (GF16Str[(idx>>1)]&0x0f)|((GF16ele<<4)&0xf0);
	else GF16Str[(idx>>1)] = (GF16Str[(idx>>1)]&0xf0)|(GF16ele&0x0f);
}

static inline 
void GF_16_addEle( int idx , byte GF16ele , byte * GF16Str )
{
	if( idx&0x1 ) GF16Str[(idx>>1)] ^= (GF16ele<<4)&0xf0;
	else GF16Str[(idx>>1)] ^= GF16ele&0x0f;
}

#endif /* _GF16_H */

/*
 * GF16.h
 */
