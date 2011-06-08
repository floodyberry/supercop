/*
 * $Id: GFword.c 1010 2008-05-06 16:12:55Z owenhsin $
 */

#include "GFword.h"

//static byte XX0[12];
/// irr poly: X^2 + X + 144
/// ( x0 + x1 X )(y0 + y1 X ) = x0y0 + ( x0y1 + x1y0 ) X + ( x1y1 ) X^2
///                           = x0y0 + 144 x1y1 +  ( x0y1 + x1y0 + x1y1 ) X
word_t GF_word_mul( word_t x , word_t y )
{  /// log( 144 ) = 18
	uint32 lgX0 = logtab[x.b[0]];
	uint32 lgX1 = logtab[x.b[1]];
	uint32 lgY0 = logtab[y.b[0]];
	uint32 lgY1 = logtab[y.b[1]];
	word_t ret;
	ret.b[0] = (((0==lgX0)|(0==lgY0))?0:alogtab[lgX0+lgY0]) 
				^ (((0==lgX1)|(0==lgY1))?0:alogtab[(lgX1+lgY1+logg)]);
	ret.b[1] = (((0==lgX0)|(0==lgY1))?0:alogtab[lgX0+lgY1])
				^ (((0==lgX1)|(0==lgY0))?0:alogtab[lgX1+lgY0]) 
				^ (((0==lgX1)|(0==lgY1))?0:alogtab[lgX1+lgY1]);
	return ret; 
}

/// ( x0 + x1 X ) ( 144 X ) = 144 x0 X + 144 x1 X + 144 x1 144; 
/*   (x1*X+x0)*(144*X)
 * = 144*(x1+x0)*X+144^2*x1
 */
word_t GF_word_mul_g(word_t x)
{
	word_t ret;
	uint32 xx;
	xx = (uint32)(x.b[0] ^ x.b[1]);
	ret.b[1] = (0==xx)?0:alogtab[logg+(uint32)logtab[xx]];
	ret.b[0] = (0==x.b[1])?0:alogtab[2*logg+(uint32)logtab[x.b[1]]];
	return ret;
}

/*   (x1*X+x0)*(144*X)*(144*X)
 * = 144^3*x1*X+144^2*(x1+x0)*(X+144)
 * = [(144^2)*(x0+x1)+144^3*x1]*X+144^3*(x0+x1)
 * Total 5 table look up.
 */
word_t GF_word_mul_gg(word_t x)
{
	word_t ret;
	uint32 logxx, logx1;

	logx1 = (uint32)logtab[(uint32)x.b[1]];
	logxx = (uint32)logtab[(uint32)(x.b[0] ^ x.b[1])];
	ret.b[0] = (0==logxx)?0:alogtab[3*logg+logxx];
	ret.b[1] = ((0==logxx)?0:alogtab[2*logg+logxx]) ^ ((0==logx1)?0:alogtab[3*logg+logx1]);
	return ret;
}

/*   (x1*X+x0)*(144*X)^3
 * = 144^4*(x0+x1)*X+[(144^3)*(x0+x1)+144^4*x1]*(X+144)
 * = [144^4*(x0+x1)+(144^3)*(x0+x1)+144^4*x1]*X+[144^4*(x0+x1)+144^5*x1]
 * = [144^3*(144+1)*(x0+x1)+144^4*x1]*X+[144^4*(x0+x1)+144^5*x1]
 * log(144) = 18, log(145) = 125
 * Total 6 table look up.
 */
word_t GF_word_mul_ggg(word_t x)
{
	word_t ret;
	uint32 logxx, logx1;

	logx1 = (uint32)logtab[(uint32)x.b[1]];
	logxx = (uint32)logtab[(uint32)(x.b[0] ^ x.b[1])];
	ret.b[0] = ((0==logx1)?0:alogtab[5*logg+logx1]) ^ ((0==logxx)?0:alogtab[4*logg+logxx]);
	ret.b[1] = ((0==logx1)?0:alogtab[4*logg+logx1]) ^ ((0==logxx)?0:alogtab[3*logg+logg1+logxx]);
	return ret;
}

/// ( x0 + x1 X )( x0 + x1 X ) = x0^2 + x1^2 X^2 = x0^2 + 144 x1^2 + x1^2 X
word_t GF_word_sqr(word_t x)
{
	uint32 logX0 = ((uint32)logtab[x.b[0]])<<1;
	uint32 logX1 = ((uint32)logtab[x.b[1]])<<1;
	word_t ret;
	ret.b[1] = (0==logX1)?0:alogtab[logX1];
	ret.b[0] = ((0==logX0)?0:alogtab[logX0]) ^ ((0==logX1)?0:alogtab[(logg+(logX1))]);
	return ret;
}

word_t GF_word_inv( word_t x)
{
	word_t ret;
	uint32 invlogdetA;
	uint32 logX0, logX1, logX0X1;
	logX0 = (uint32)logtab[x.b[0]];
	logX1 = (uint32)logtab[x.b[1]];
	logX0X1 = (uint32)logtab[(uint32)(x.b[0]^x.b[1])];
	invlogdetA = 255-(uint32)(logtab[((((0==logX0)|(0==logX0X1))?0:(alogtab[logX0+logX0X1])) ^ ((0==logX1)?0:alogtab[logg+(logX1<<1)]))]);
	ret.b[0] = (0==logX0X1)?0:alogtab[logX0X1+invlogdetA];
	ret.b[1] = (0==logX1)?0:alogtab[logX1+invlogdetA];
	return ret;
}

word_t GF_word_div( word_t x , word_t y )
{	//return GF_word_mul( x , GF_word_inv( y ) );
	uint32 lgX0 = (uint32)logtab[x.b[0]];
	uint32 lgX1 = (uint32)logtab[x.b[1]];
	
	uint32 logZ0 = (uint32)logtab[y.b[0]];
	uint32 logZ0Z1 = (uint32)logtab[(uint32)(y.b[0]^y.b[1])];
	uint32 logZ1 = (uint32)logtab[y.b[1]];
	uint32 logDetA = 255 - (uint32)(logtab[ ((0==logZ0)|(0==logZ0Z1)?0:alogtab[logZ0+logZ0Z1]) 
									^ ((0==logZ1)?0:alogtab[logg+(logZ1<<1)]) ]);
	uint32 lgY0 = (0==logZ0Z1)?0:(logZ0Z1 + logDetA);
	uint32 lgY1 = (0==logZ1)?0:(logZ1 + logDetA);

	word_t ret;
	ret.b[0] = (((0==lgX0)|(0==lgY0))?0:alogtab[lgX0+lgY0]) 
				^ (((0==lgX1)|(0==lgY1))?0:alogtab[lgX1+lgY1+logg]);
	ret.b[1] = (((0==lgX0)|(0==lgY1))?0:alogtab[lgX0+lgY1])
				^ (((0==lgX1)|(0==lgY0))?0:alogtab[lgX1+lgY0]) 
				^ (((0==lgX1)|(0==lgY1))?0:alogtab[lgX1+lgY1]);
	return ret; 
}

word_t GF_word_sqrt( word_t x )
{
	uint32 logX1 = (uint32)logtab[(uint32)x.b[1]];
	uint32 logX0_D = (uint32)logtab[(uint32)(x.b[0]^((0==logX1)?0:alogtab[logg+logX1]))];
	word_t ret;
	ret.b[0] = (0==logX0_D)?0: alogtab[(uint32)((logX0_D&1)?((logX0_D+255)>>1):(logX0_D>>1))];
	ret.b[1] = (0==logX1)?0: alogtab[(uint32)((logX1&1)?((logX1+255)>>1):(logX1>>1))];
	return ret;
}

dword_t GF_dword_mul( dword_t x , dword_t y )
{
	dword_t ret;
	ret.w[0] = GF_word_mul(x.w[0], y.w[0]);
	ret.w[1].w = (uint16)((GF_word_mul((word_t)(uint16)(x.w[1].w ^ x.w[0].w), (word_t)(uint16)(y.w[1].w ^ y.w[0].w))).w ^ (ret.w[0].w));
	ret.w[0].w ^= (GF_word_mul_g(GF_word_mul(x.w[1], y.w[1]))).w;
	return ret;
}

/* g = 9*16*256
 *   (x1*X+x0)*(g*X)
 * = g*x1*X^2+g*x0
 * = g*(x1+x0)*X+g^2*x1
 */
dword_t GF_dword_mul_g(dword_t x)
{
	dword_t ret;
	ret.w[1] = GF_word_mul_g((word_t)(uint16)(x.w[0].w^x.w[1].w));
	ret.w[0] = GF_word_mul_gg(x.w[1]);
	return ret;
}

/*   (x1*X+x0)*(g*X)^2
 * = g^3*x1*X+g^2*(x1+x0)*(X+g)
 * = [g^3*x1+g^2*(x1+x0)]*X+g^3*(x1+x0)
 */
dword_t GF_dword_mul_gg(dword_t x)
{
	dword_t ret;
	ret.w[1].w = (uint16)(GF_word_mul_gg((word_t)(uint16)(x.w[0].w^x.w[1].w)).w ^ GF_word_mul_ggg(x.w[1]).w);
	ret.w[0] = GF_word_mul_ggg((word_t)(uint16)(x.w[0].w^x.w[1].w));
	return ret;
}

dword_t GF_dword_inv( dword_t x )
{
	dword_t ret;
	word_t invdetA;
	invdetA = GF_word_inv((word_t)(uint16)((GF_word_mul(x.w[0], (word_t)(uint16)(x.w[0].w ^ x.w[1].w))).w ^ (GF_word_mul_g(GF_word_sqr(x.w[1]))).w));
	ret.w[0] = GF_word_mul((word_t)(uint16)(x.w[0].w ^ x.w[1].w), invdetA);
	ret.w[1] = GF_word_mul(x.w[1], invdetA);
	return ret;
}

dword_t GF_dword_sqr(dword_t x)
{
	dword_t ret;
	ret.w[1] = GF_word_sqr(x.w[1]);
	ret.w[0].w = (GF_word_sqr(x.w[0])).w ^ (GF_word_mul_g(ret.w[1])).w;
	return ret;
}

dword_t GF_dword_div( dword_t x , dword_t y )
{
	dword_t ret, yinv;
	yinv = GF_dword_inv(y);
	ret = GF_dword_mul(x, yinv);
	return ret;
}

dword_t GF_dword_sqrt( dword_t x )
{
	dword_t ret;
	word_t D;
	D = GF_word_mul_g(x.w[1]);
	ret.w[0] = GF_word_sqrt((word_t)(uint16)(x.w[0].w ^ D.w));
	ret.w[1] = GF_word_sqrt(x.w[1]);
	return ret;
}

void GF_256_12_mul( dword_t * outZ , dword_t * x , dword_t * y )
{
	dword_t D[3] , D01 , D02 , D12;

	int i;
	for( i = 0 ; i < 3; i++ ) D[i] = GF_dword_mul( x[i] , y[i] );
	D01 = GF_dword_mul( (dword_t)(x[0].dw ^ x[1].dw) , (dword_t)(y[0].dw ^ y[1].dw) );
	D02 = GF_dword_mul( (dword_t)(x[0].dw ^ x[2].dw) , (dword_t)(y[0].dw ^ y[2].dw) );
	D12 = GF_dword_mul( (dword_t)(x[1].dw ^ x[2].dw) , (dword_t)(y[1].dw ^ y[2].dw) );
	
	outZ[0].dw = D12.dw ^ D[0].dw ^ D[1].dw ^ D[2].dw;
	outZ[1].dw = D01.dw ^ D12.dw ^ D[0].dw;
	outZ[2].dw = D02.dw ^ D[0].dw ^ D[1].dw;
	return;               
}

void GF_256_12_inv( dword_t * outZ , dword_t * x )
{
	dword_t x00, x11, x22, x01, x02, x12, D0, D1, D2, invdetA;

	x00 = GF_dword_sqr(x[0]);
	x11 = GF_dword_sqr(x[1]);
	x22 = GF_dword_sqr(x[2]);
	x01 = GF_dword_mul(x[0], x[1]);
	x02 = GF_dword_mul(x[0], x[2]);
	x12 = GF_dword_mul(x[1], x[2]);
	D0.dw = x00.dw ^ x11.dw ^ x22.dw ^ x12.dw;
	D1.dw = x01.dw ^ x22.dw;
	D2.dw = x11.dw ^ x22.dw ^ x02.dw;
	invdetA = GF_dword_inv((dword_t)(uint32)((GF_dword_mul(D0, x[0])).dw ^ (GF_dword_mul(D1, x[2])).dw ^ (GF_dword_mul(D2, x[1])).dw));
	outZ[0] = GF_dword_mul(D0, invdetA);
	outZ[1] = GF_dword_mul(D1, invdetA);
	outZ[2] = GF_dword_mul(D2, invdetA);
	return;
}

void GF_256_12_div( dword_t * outZ , dword_t * x, dword_t * y )
{
	dword_t yinv[3];
	GF_256_12_inv((dword_t *)yinv, y);
	GF_256_12_mul(outZ, x, yinv);
	return;
}

void GF_256_12_sqrt( dword_t * outZ , dword_t * x )
{
	outZ[0] = GF_dword_sqrt((dword_t)(x[0].dw));
	outZ[1] = GF_dword_sqrt((dword_t)(x[1].dw ^ x[2].dw));
	outZ[2] = GF_dword_sqrt((dword_t)(x[1].dw));
	return;
}

/*   (x1*X+x0)*(y1*X+y0)
 * = x1*y1*X^2 + (x0*y1+x1*y0)*X+x0*y0
 * = (x1*y1+x0*y1+x1*y0)*X+(x0*y0+g*x1*y1)
 * = [(x1+x0)*(y1+y0)-x0*y0]*X+(x0*y0+g*x1*y1)
 */
void GF_256_8_mul(dword_t *outZ, dword_t *x, dword_t *y)
{
	dword_t D01, D0, gD1;
	D0 = GF_dword_mul(x[0], y[0]);
	gD1 = GF_dword_mul_g(GF_dword_mul(x[1], y[1]));
	D01 = GF_dword_mul((dword_t)(uint32)(x[0].dw ^ x[1].dw), (dword_t)(uint32)(y[0].dw ^ y[1].dw));
	outZ[0].dw = (uint32)(D0.dw ^ gD1.dw);
	outZ[1].dw = (uint32)(D01.dw ^ D0.dw);
	return;
}

/*   (x1*X+x0)*(g*X)
 * = g*(x1+x0)*X+g^2*x1
 */
void GF_256_8_mul_g(dword_t *outZ, dword_t *x)
{
	outZ[0] = GF_dword_mul_gg(x[1]);
	outZ[1] = GF_dword_mul_g((dword_t)(uint32)(x[1].dw ^ x[0].dw));
	return;
}

/// irr poly: X^2 + X + g
/// ( x0 + x1 t )^2 = x0x0 + ( x1x1 ) t^2
///                 = x0x0 + ( t + g ) x1x1
///		    = x0x0 + x1x1 g  +  x1x1 t
void GF_256_8_sqr(dword_t *outZ, dword_t *x)
{
	outZ[1] = GF_dword_sqr( x[1] );
	outZ[0] = (dword_t)(uint32)((GF_dword_sqr( x[0] )).dw ^ (GF_dword_mul_g( outZ[1] )).dw );
	return;
}

///   ( x1 t + x0 )( y1 t + y0 )  = 1
///   [ x0y0 +  ( g * x1 ) y1     ]  = 0
///   [ x1y0 +  (x0 + x1 ) y1 + 1 ]t = 0
///   detA = x0 * (x0 + x1) + g * x1 ^2
///   y0 = ( x0 + x1 ) / detA
///   y1 = x1 / detA
void GF_256_8_inv(dword_t *outZ, dword_t *x)
{
	dword_t invdetA;

	outZ[1] = (dword_t)(uint32)(x[0].dw ^ x[1].dw);
	invdetA = GF_dword_inv((dword_t)(uint32)(GF_dword_mul(x[0], outZ[1]).dw ^ GF_dword_mul_g(GF_dword_sqr(x[1])).dw));
	
	outZ[0] = GF_dword_mul( outZ[1] , invdetA );
	outZ[1] = GF_dword_mul( x[1] , invdetA );
	return;
}

void GF_256_8_div(dword_t *outZ, dword_t *x, dword_t *y)
{
	dword_t temp[2];
	GF_256_8_inv( temp , y );
	GF_256_8_mul( outZ , x , temp ); 
	return;
}

/// x1 t + x0 = ( y1 t + y0 )^2 = y0y0 + g* y1y1 + y1y1 t
/// x0 = y0y0 + g * x1
/// y1 = sqrt( x1 )
/// y0 = sqrt( x0 + g * x1 )
void GF_256_8_sqrt(dword_t *outZ, dword_t *x)
{
	outZ[0] = GF_dword_sqrt((dword_t)(uint32)(x[0].dw ^ GF_dword_mul_g(x[1]).dw));
	outZ[1] = GF_dword_sqrt( x[1] );
	return;
}

/// irr poly: X^2 + X + g
/// ( x0 + x1 X )(y0 + y1 X ) = x0y0 + ( x0y1 + x1y0 ) X + ( x1y1 ) X^2
///                           = x0y0 + g * x1y1 +  ( x0y1 + x1y0 + x1y1 ) X
///									= x0y0 + g * x1y1 + ( (x1+x0)(y1+y0) + x0y0 ) X
void GF_256_16_mul(dword_t *outZ, dword_t *x, dword_t *y)
{
	dword_t x0y0[2], x1y1[2], temp[2];
	dword_t *x1 = x+2;
	dword_t *y1 = y+2;
	dword_t *z1 = outZ+2;
	
	GF_256_8_mul( x0y0 , x , y );
	GF_256_8_mul( x1y1 , x1 , y1 );
	GF_256_8_mul_g( z1 , x1y1 );       // g = g * x1y1
	outZ[0].dw = x0y0[0].dw ^ z1[0].dw;
	outZ[1].dw = x0y0[1].dw ^ z1[1].dw;
	
	z1[0].dw = x1[0].dw ^ x[0].dw;
	z1[1].dw = x1[1].dw ^ x[1].dw;       // z1 = x1 + x0
	x1y1[0].dw = y1[0].dw ^ y[0].dw;
	x1y1[1].dw = y1[1].dw ^ y[1].dw;    // x1y1 = y1 + y0
	GF_256_8_mul( temp , z1 , x1y1 );
	z1[0].dw = x0y0[0].dw ^ temp[0].dw;
	z1[1].dw = x0y0[1].dw ^ temp[1].dw;
	return;
}

///   ( x1 t + x0 )( y1 t + y0 )  = 1
///   [ x0y0 +  ( g * x1 ) y1     ]  = 0
///   [ x1y0 +  (x0 + x1 ) y1 + 1 ]t = 0
///   detA = x0 * (x0 + x1) + g * x1 ^2
///   y0 = ( x0 + x1 ) / detA
///   y1 = x1 / detA
void GF_256_16_inv(dword_t *outZ, dword_t *x)
{
	dword_t detA[2], invdetA[2];
	dword_t * x1 = x+2;
	dword_t * z1 = outZ+2;
	
	GF_256_8_sqr( outZ , x1 );
	GF_256_8_mul_g( detA , outZ );
	z1[0].dw = x[0].dw ^ x1[0].dw;
	z1[1].dw = x[1].dw ^ x1[1].dw;
	GF_256_8_mul( outZ , x , z1 );
	detA[0].dw ^= outZ[0].dw;
	detA[1].dw ^= outZ[1].dw;
	GF_256_8_inv(invdetA, detA);
	
	GF_256_8_mul( outZ , z1 , invdetA );
	GF_256_8_mul( z1 , x1 , invdetA );
	return;
}

void GF_256_16_div(dword_t *outZ, dword_t *x, dword_t *y)
{
	dword_t temp[4];
	GF_256_16_inv( temp , y );
	GF_256_16_mul( outZ , x , temp );
	return;
}

/// x1 t + x0 = ( y1 t + y0 )^2 = y0y0 + g* y1y1 + y1y1 t
/// x0 = y0y0 + g * x1
/// y1 = sqrt( x1 )
/// y0 = sqrt( x0 + g * x1 )
void GF_256_16_sqrt(dword_t *outZ, dword_t *x)
{
	dword_t * x1 = x+2;
	dword_t * z1 = outZ+2;
	dword_t gx1[2];
	GF_256_8_mul_g( gx1 , x1 );
	z1[0].dw = gx1[0].dw ^ x[0].dw;
	z1[1].dw = gx1[1].dw ^ x[1].dw;
	GF_256_8_sqrt( outZ , z1 );
	GF_256_8_sqrt( z1 , x1 );
	return;
}

/*
 * GFword.c
 */
