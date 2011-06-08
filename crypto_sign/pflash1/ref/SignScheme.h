/*
 * $Id: SignScheme.h 1029 2008-05-08 16:19:48Z owenhsin $
 */
#ifndef _SIGNSCHEME_H
#define _SIGNSCHEME_H

#include "GF.h"
#include "GF16.h"
#include "GF256.h"
#include "BLAS.h"

#define IDX2(x,y,width) ((x)*(width)+(y))
#define IDXUUTRI(x,y,dimX) (((((dimX)-1)+((dimX)-(x)))*(x)/2)+(y)-((x)+1))

#define PFLASH

#ifdef PFLASH
	#define L_SIGN	37
	#define L_MSG	26
	#define SignScheme_QMap PFLASH_QMap
	#define SignScheme_ivsQMap PFLASH_ivsQMap
	#include "PFLASH.h"
#else
	#define L_SIGN	48
	#define L_MSG	32
	#define SignScheme_QMap P3IC_QMap
	#define SignScheme_ivsQMap P3IC_ivsQMap
	#include "P3IC.h"
#endif

#define L_DELTA		(L_SIGN-L_MSG)
#define L_AFFMAT	(2*L_SIGN*L_SIGN)
#define L_AFFINE	(L_AFFMAT+L_SIGN)
#define L_pSIZE		1
#define L_pSIGN		(2*L_SIGN-L_pSIZE)
#define L_PRI		(2*L_AFFINE)
#define L_PUB		(L_MSG*(2*L_pSIGN+L_pSIGN*(L_pSIGN-1)/2))


/**
 * \brief		Generate private & public key. Size(in bytes) of key is defined 
 *					as L_PUB and L_PRI.
 *
 * \param pub	The allocated (L_PUB bytes )byte* pointer of store public key.
 * \param pri	The allocated (L_PRU bytes )byte* pointer of store private key.
 *
 * \return ret	always return 0.
 */
int SignScheme_genKey( byte * pub , byte * pri );

/**
 * \brief			Generate quadratic multivariate polynomial public key 
 *							from secret parameters.
 *
 * \param Ms		Input affine map S linear part.
 * \param Ms_c		Input S map constant part.
 * \param Mt		Input affine map T linear part.
 *	\param Mt_c		Input T map constant part.
 *	\param pub		Output public key. L_PUB bytes should be pre-allocated.
 *
 * \return ret		always return 0.
 */
int SignScheme_genPubKey( byte * Ms , byte * Ms_c , byte * Mt , byte * Mt_c , byte * pub );

/**
 * \brief			Using private key (pri) to give message (Y) a signature(outX). 
 *
 * \param pri		Input private key.
 * \param Y			Input L_MSG bytes message.
 * \param outX		Output signature. L_SIGN bytes space should be pre-allocated.
 *
 * \return ret		always return 0.
 */
int SignScheme_sign( byte * pri , byte * Y , int Ylen , byte * outX );



/**
 * \brief			Calculate message(outY) from signature(X) by MQ public key.
 *
 * \param pub		Input public key.
 * \param X			Input signature X(L_SIGN bytes).
 * \param outY		Oupput message outY(L_MSG bytes).
 *
 * \return ret		always return 0.
 */
int SignScheme_GMap( byte * pub , byte * X , byte * outY );

/**
 * \brief		Calculate signature outZ using secret parameters.
 *
 * \param Ms	Linear part of affine map S.
 * \param Ms_c	Constant part of affine map S.
 * \param Mt	Linear part of affine map T.
 *	\param Mt_c	Constant part of affine map T.
 *	\param outZ	Output signature.
 *	\param W		Input message to be sign.
 *
 * \return ret	Aloways return 0.
 */
int SignScheme_PMap( byte * Ms , byte * Ms_c , byte * Mt , byte * Mt_c , byte * outZ , byte * W );

#endif   /* _SIGNSCHEME_H */

/*
 * SignScheme.h
 */
