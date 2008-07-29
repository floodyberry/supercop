/*
 * hector/src/divclass.c version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#include "divclass.h"
#include "field.h"
#include "cpucycles.h"
#include "config.h"
#include "wnaf.h"

// Initialise a divisor class:
void divclass_init(divclass rop)
{
	Kinit(&(rop->m_U1));
	Kinit(&(rop->m_U0));
	Kinit(&(rop->m_V1));
	Kinit(&(rop->m_V0));
	Kinit(&(rop->m_Z));
	Kinit(&(rop->m_z));
}

// Clear a divisor class:
void divclass_clear(divclass rop)
{
	Kclear(&(rop->m_U1));
	Kclear(&(rop->m_U0));
	Kclear(&(rop->m_V1));
	Kclear(&(rop->m_V0));
	Kclear(&(rop->m_Z));
	Kclear(&(rop->m_z));
}

// Copy function for divclasses:
void divclass_set(divclass rop, const divclass op)
{
	if(rop != op)
	{
		Kset(rop->m_U1, op->m_U1);
		Kset(rop->m_U0, op->m_U0);
		Kset(rop->m_V1, op->m_V1);
		Kset(rop->m_V0, op->m_V0);
		Kset(rop->m_Z, op->m_Z);
		Kset(rop->m_z, op->m_z);
	}
}

void divclass_setzero(divclass rop)
{
	Kset_uipoly(rop->m_U1, 0UL);
	Kset_uipoly(rop->m_U0, 1UL);
	Kset_uipoly(rop->m_V1, 0UL);
	Kset_uipoly(rop->m_V0, 0UL);
	Kset_uipoly(rop->m_Z, 1UL);
	Kset_uipoly(rop->m_z, 1UL);
}


// Check a divisorclass for zero:
int divclass_iszero(const divclass op)
{
	//return !(Kcmp_ui(op->m_U1, 0) || Kcmp_ui(op->m_U0, 1) || Kcmp_ui(op->m_V1, 0) || Kcmp_ui(op->m_V0, 0));
	if(Kcmp_ui(op->m_U1, 0UL)) return 0;
	if(Kcmp_ui(op->m_U0, 1UL)) return 0;
	if(Kcmp_ui(op->m_V1, 0UL)) return 0;
	if(Kcmp_ui(op->m_V0, 0UL)) return 0;
	return 1;
}

//////////////////////////////////////////////////////////////////////////////////////////////
//              Affine computation, only needed for wNAF-precomputation:                   ///
//////////////////////////////////////////////////////////////////////////////////////////////

// Add two (different) divisor classes:
void divclass_add_affine(divclass rop, const divclass op1, const divclass op2)
{
	if(divclass_iszero(op1))
	{
		divclass_set(rop, op2);
		return;
	}
	if(divclass_iszero(op2))
	{
		divclass_set(rop, op1);
		return;
	}
	// See Handbook of Elliptic and Hyperelliptic Curve Cryptography, Algorithm 14.19, page 317:
	
	// Step 1: Compute r = Res(U1,u2)
	Ksub(dummyelts[0], op1->m_U1, op2->m_U1); 		// z1 = U11 - u21
	Ksub(dummyelts[1], op2->m_U0, op1->m_U0); 		// z2 = u20 - U10
	Kmul(dummyelts[2], op1->m_U1, dummyelts[0]);	// U11 * z1
	Kadd(dummyelts[2], dummyelts[2], dummyelts[1]); // z3 = U11*z1 + z2
	Ksqr(dummyelts[4], dummyelts[0]);				// z1^2
	Kmul(dummyelts[4], dummyelts[4], op1->m_U0); 	// z1^2*U10
	Kmul(dummyelts[3], dummyelts[1], dummyelts[2]);	// z2*z3
	Kadd(dummyelts[3], dummyelts[3], dummyelts[4]); // r = z2*z3 + z1^2*U10

	// Step 2
	
	// Step 3
	Ksub(dummyelts[4], op1->m_V0, op2->m_V0);			// w0 = V10 - v20
	Ksub(dummyelts[5], op1->m_V1, op2->m_V1);			// w1 = V11 - v21
	Kmul(dummyelts[6], dummyelts[2], dummyelts[4]); 	// w2 = inV0 * w0
	Kmul(dummyelts[7], dummyelts[0], dummyelts[5]);		// w3 = inV1 * w1
	Kadd(dummyelts[8], dummyelts[2], dummyelts[0]);		// inV0 + inV1
	Kadd(dummyelts[9], dummyelts[4], dummyelts[5]);		// w0 + w1
	Kmul(dummyelts[8], dummyelts[8], dummyelts[9]);		// (inV0+inV1)*(w0+w1)
	Ksub(dummyelts[8], dummyelts[8], dummyelts[6]);		// (inV0+inV1)*(w0+w1)-w2
	Kadd_ui(dummyelts[9], op1->m_U1, 1);				// 1 + U11					
	Kmul(dummyelts[9], dummyelts[7], dummyelts[9]);		// w3 * (1+U11)
	Ksub(dummyelts[8], dummyelts[8], dummyelts[9]);		// s1p = (inV0+inV1)*(w0+w1)-w2-w3 * (1+U11)
	Kmul(dummyelts[9], op1->m_U0, dummyelts[7]);		// U10 * w3
	Ksub(dummyelts[14], dummyelts[6], dummyelts[9]);	// s0p = w2 - U10*w3

	// Stop computation, if s' = 0:
	assert(Kcmp_ui(dummyelts[14], 0UL) != 0);

	// Step 4
	Kmul(dummyelts[5], dummyelts[3], dummyelts[8]);		// r * s1p (overwrite w1)
	Kinv(dummyelts[5], dummyelts[5]);					// w1 = 1/(r*s1p)
	Kmul(dummyelts[6], dummyelts[3], dummyelts[5]);		// w2 = r*w1 (overwrite w2)
	Ksqr(dummyelts[9], dummyelts[8]);					// s1p^2
	Kmul(dummyelts[7], dummyelts[9], dummyelts[5]);		// w3 = s1p^2*w1 (overwrite w3)
	Kmul(dummyelts[10], dummyelts[3], dummyelts[6]);	// w4 = r * w2
	Ksqr(dummyelts[11], dummyelts[10]);					// w5 = w4^2
	Kmul(dummyelts[12], dummyelts[14], dummyelts[6]);	// s0pp = s0p * w2
	
	// Step 5
	Kadd(dummyelts[9], op2->m_U1, dummyelts[12]);	// l2p = u21 + s0pp
	Kmul(dummyelts[13], op2->m_U1, dummyelts[12]);	// u21 * s0pp
	Kadd(dummyelts[13], dummyelts[13], op2->m_U0);	// l1p = u21*s0pp + u20
	Kmul(dummyelts[14], op2->m_U0, dummyelts[12]);	// l0p = u20 * s0pp
	
	// Step 6
	Ksub(dummyelts[15], dummyelts[12], op1->m_U1);		// s0pp - U11
	Ksub(dummyelts[16], dummyelts[12], dummyelts[0]);	// s0pp - z1 (Note that h2=0)
	Kmul(dummyelts[15], dummyelts[15], dummyelts[16]);	// (s0pp-U11)*(s0pp-z1)
	Ksub(rop->m_U0, dummyelts[15], op1->m_U0);			// U0p = (s0pp-U11)*(s0pp-z1)-U10
	Kadd(rop->m_U0, rop->m_U0, dummyelts[13]);			// U0p = U0p + l1p
	Kadd(rop->m_U0, rop->m_U0, dummyelts[10]);			// U0p = U0p + w4
	Kmul(dummyelts[15], dummyelts[0], dummyelts[11]);	// z1 * w5
	Kadd(rop->m_U0, rop->m_U0, dummyelts[15]);			// U0p = U0p + l1p + w4 + z1 * w5
	Ksub(rop->m_U1, dummyelts[0], dummyelts[11]);		// U1p = z1 + w5 (h2=0)
	
	// Step 7
	Ksub(dummyelts[5], dummyelts[9], rop->m_U1);		// w1 = l2p - U1p
	Kmul(dummyelts[15], rop->m_U1, dummyelts[5]);		// U1p * w1
	Kadd(dummyelts[6], dummyelts[15], rop->m_U0);		// U1p*w1 + U0p
	Ksub(dummyelts[6], dummyelts[6], dummyelts[13]);	// w2 = U1p*w1 + U0p - l1p
	Kmul(dummyelts[15], dummyelts[6], dummyelts[7]);	// w2 * w3
	Ksub(rop->m_V1, dummyelts[15], op2->m_V1);			// w2*w3 - v21
	Ksub_ui(rop->m_V1, rop->m_V1, 1);					// V1p = w2*w3 - v21 - 1
	Kmul(dummyelts[15], rop->m_U0, dummyelts[5]);		// U0p * w1
	Ksub(dummyelts[6], dummyelts[15], dummyelts[14]);	// w2 = U0p*w1 - l0p
	Kmul(rop->m_V0, dummyelts[6], dummyelts[7]);		// w2 * w3
	Ksub(rop->m_V0, rop->m_V0, op2->m_V0);				// V0p = w2*w3 - v20 (h2=0, h0=0)

	Kset_uipoly(rop->m_Z, 1);
	Kset_uipoly(rop->m_z, 1);
}

void divclass_double_affine(divclass rop, const divclass op)
{
	if(divclass_iszero(op))
	{
		divclass_set(rop, op);
		return;
	}
	// See Handbook of Elliptic and Hyperelliptic Curve Cryptography, Algorithm 14.43, page 339

	// Step 1
	Ksqr(dummyelts[0], op->m_U0);			// z0 = U0^2
	Ksqr(dummyelts[1], op->m_U1);			// U1^2
	Kadd(dummyelts[1], dummyelts[1], f3);	// t1p = U1^2 + f3
	Ksqr(dummyelts[2], op->m_V0);			// V0^2
	Kadd(dummyelts[2], dummyelts[2], f0);	// w0 = V0^2 + f0
	
	// If w0 = 0 then we are in the case where u_input has degree 2 and u_output has degree 1
	// Stop computation, if s' = 0:
	assert(Kcmp_ui(dummyelts[2], 0UL) != 0);

	// Step 2
	Kinv(dummyelts[3], dummyelts[2]);				// 1/w0
	Kmul(dummyelts[3], dummyelts[3], dummyelts[0]);	// w1 = 1/w0 * z0
	Kmul(dummyelts[4], dummyelts[1], dummyelts[3]);	// z1 = t1p * w1
	Kadd(dummyelts[5], dummyelts[4], op->m_U1);		// s0pp = z1 + U1

	// Step 3
	Ksqr(rop->m_U1, dummyelts[3]);					// U1p = w1^2, because h1=1 !!!
	Ksqr(dummyelts[7], dummyelts[5]);				// s0pp^2
	Kadd(rop->m_U0, dummyelts[7], dummyelts[3]);	// U0p = s0pp^2 + w1, because w2=w1 as h1=1 !!!

	// Step 4
	Kadd(dummyelts[7], dummyelts[3], dummyelts[1]);		// w3 = w1 + t1p (= w2 + t1p, because w1 = w2)
	Kmul(dummyelts[8], dummyelts[7], dummyelts[4]);		// w3 * z1
	Kmul(dummyelts[9], dummyelts[3], rop->m_U1);		// w2 * U1p (= w1 * U1p)
	Ksqr(dummyelts[10], op->m_V1);						// V1^2
	Kadd(dummyelts[11], dummyelts[8], dummyelts[9]);	// w3*z1 + w1*U1p
	Kadd_ui(dummyelts[11], dummyelts[11], 1);			// w3*z1 + w1*U1p + f2 (f2 = 1 in our case)
	Kadd(rop->m_V1, dummyelts[11], dummyelts[10]);		// V1p = w3*z1 + w1*U1p + f2 + V1p^2
	Kmul(dummyelts[8], dummyelts[7], rop->m_U0);		// w3*U0p
	Kadd(rop->m_V0, dummyelts[8], dummyelts[0]);		// V0p = w3*U0p + z0

	Kset_uipoly(rop->m_Z, 1);
	Kset_uipoly(rop->m_z, 1);
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////
///                                Addition and doubling in recent coordinates                            ///
/////////////////////////////////////////////////////////////////////////////////////////////////////////////


// Add two (different) divisor classes, op2 has to be in affine represenation!
void divclass_mixadd(divclass rop, const divclass op1, const divclass op2)
{
	if(divclass_iszero(op1))
	{
		divclass_set(rop, op2);
		return;
	}
	if(divclass_iszero(op2))
	{
		divclass_set(rop, op1);
		return;
	}
	// See Algorithm 14.50, p. 346, Handbook
	
	// Step 1
	Kmul(dummyelts[0], op1->m_Z, op2->m_Z);				// Z = Z1*Z2
	Ksqr(dummyelts[1], dummyelts[0]);					// z = Z^2
	Kmul(dummyelts[2], op2->m_U1, op1->m_Z);				// U21t = U21*Z1
	Kmul(dummyelts[3], op2->m_U0, op1->m_Z);				// U20t = U20*Z1
	Kmul(dummyelts[4], op2->m_V1, op1->m_z);			// V21t = V21*z1
	Kmul(dummyelts[5], op2->m_V0, op1->m_z);			// V20t = V20*z1
	
	// Step 2
	Kmul(dummyelts[6], op1->m_U1, op2->m_Z);			// U11*Z2
	Kadd(dummyelts[6], dummyelts[6], dummyelts[2]);		// y1 = U11*Z2 + U21t

	Kmul(dummyelts[7], op1->m_U0, op2->m_Z);			// U10*Z2
	Kadd(dummyelts[7], dummyelts[7], dummyelts[3]);		// y2 = U10*Z2 + U20t

	Kmul(dummyelts[8], op1->m_U1, dummyelts[6]);		// U11*y1
	Kmul(dummyelts[9], dummyelts[7], op1->m_Z);			// y2*Z1
	Kadd(dummyelts[8], dummyelts[8], dummyelts[9]);		// y3 = U11*y1 + y2*Z1

	Kmul(dummyelts[9], dummyelts[7], dummyelts[8]);		// y2*y3
	Ksqr(dummyelts[10], dummyelts[6]);					// y1^2
	Kmul(dummyelts[10], dummyelts[10], op1->m_U0);		// y1^2*U10
	Kadd(dummyelts[9], dummyelts[9], dummyelts[10]);	// r = y2*y3 + y1^2*U10
	
	// Step 3 ...
	
	// Step 4
	Kmul(dummyelts[10], op1->m_V0, op2->m_z);			// V10*z2
	Kadd(dummyelts[10], dummyelts[10], dummyelts[5]);	// w0 = V10*z2 + V20t
	Kmul(dummyelts[11], op1->m_V1, op2->m_z);			// V11*z2
	Kadd(dummyelts[11], dummyelts[11], dummyelts[4]);	// w1 = V11*z2 + V21t
	Kmul(dummyelts[12], dummyelts[8], dummyelts[10]);	// w2 = y3*w0
	Kmul(dummyelts[13], dummyelts[6], dummyelts[11]);	// w3 = y1*w1

	Kmul(dummyelts[14], dummyelts[6], op1->m_Z);		// y1*Z1
	Kadd(dummyelts[14], dummyelts[14], dummyelts[8]);	// y1*Z1 + y3
	Kadd(dummyelts[15], dummyelts[10], dummyelts[11]);	// w0 + w1
	Kmul(dummyelts[14], dummyelts[14], dummyelts[15]);	// (y3 + y1*Z1)*(w0 + w1)
	Kadd(dummyelts[14], dummyelts[14], dummyelts[12]);	// (y3 + y1*Z1)*(w0 + w1) + w2
	Kadd(dummyelts[15], op1->m_Z, op1->m_U1);			// Z1 + U11
	Kmul(dummyelts[15], dummyelts[15], dummyelts[13]);	// w3*(Z1 + U11)
	Kadd(dummyelts[14], dummyelts[14], dummyelts[15]);	// s1 = (y3 + y1*Z1)*(w0 + w1) + w2 + w3*(Z1 + U11)
	
	Kmul(dummyelts[15], op1->m_U0, dummyelts[13]);		// U10*w3
	Kadd(dummyelts[15], dummyelts[15], dummyelts[12]);	// s0 = w2 + U10*w3
	
	// Step 5
	Kmul(dummyelts[16], dummyelts[14], dummyelts[9]);	// Zb = s1*r
	Kmul(dummyelts[17], dummyelts[9], dummyelts[0]);	// w4 = r*Z
	Ksqr(dummyelts[18], dummyelts[17]);					// w5 = w4^2
	Kmul(dummyelts[19], dummyelts[15], dummyelts[0]);	// S = s0*Z
	Kmul(dummyelts[20], dummyelts[0], dummyelts[16]);	// Zp = Z*Zb
	
	Kmul(dummyelts[21], dummyelts[15], dummyelts[20]);	// s0t = s0*Zp
	Kmul(dummyelts[22], dummyelts[14], dummyelts[16]);	// s1b = s1*Zb
	Kmul(dummyelts[23], dummyelts[22], dummyelts[0]);	// s1t = s1b*Z
	
	// Step 6
	Kmul(dummyelts[24], dummyelts[22], dummyelts[2]);	// L2 = s1b*U21t
	Kmul(dummyelts[25], dummyelts[24], dummyelts[0]);	// l2 = L2*Z
	Kmul(dummyelts[26], dummyelts[21], dummyelts[3]);	// l0 = s0t*U20t
	
	Kadd(dummyelts[27], dummyelts[2], dummyelts[3]);	// U21t + U20t
	Kadd(dummyelts[28], dummyelts[21], dummyelts[23]);	// s0t + s1t
	Kmul(dummyelts[27], dummyelts[27], dummyelts[28]);	// (U21t + U20t)*(s0t + s1t)
	Kadd(dummyelts[27], dummyelts[27], dummyelts[25]);	// (U21t + U20t)*(s0t + s1t) + l2
	Kadd(dummyelts[27], dummyelts[27], dummyelts[26]);	// l1 = (U21t + U20t)*(s0t + s1t) + l2 + l0
	Kadd(dummyelts[28], dummyelts[24], dummyelts[21]);	// l2 = L2 + s0t
														// h1t = h1*z = z
		
	// Step 7
	Kadd(dummyelts[29], dummyelts[6], dummyelts[2]);	// y1 + U21t
	Ksqr(dummyelts[30], dummyelts[14]);					// s1^2
	Kmul(dummyelts[29], dummyelts[30], dummyelts[29]);	// s1^2*(y1 + U21t) 												
	Kmul(dummyelts[30], dummyelts[0], dummyelts[18]);	// Z*w5
	Kadd(dummyelts[29], dummyelts[29], dummyelts[30]);	// s1^2*(y1 + U21t) + Z*w5
	Kmul(dummyelts[29], dummyelts[29], dummyelts[6]);	// y1*(s1^2*(y1 + U21t) + Z*w5)
	Ksqr(dummyelts[30], dummyelts[19]);					// S^2
	Kadd(dummyelts[29], dummyelts[29], dummyelts[30]);	// S^2 + y1*(s1^2*(y1 + U21t) + Z*w5)
	Kmul(dummyelts[30], dummyelts[1], dummyelts[20]);	// h1t*Zp = z*Zp
	Kadd(dummyelts[29], dummyelts[29], dummyelts[30]);	// S^2 + y1*(s1^2*(y1 + U21t) + Z*w5) + h1t*Zp
	Kmul(dummyelts[29], dummyelts[29], dummyelts[9]);	// r*(S^2 + y1*(s1^2*(y1 + U21t) + Z*w5) + h1t*Zp)
	Kmul(dummyelts[30], dummyelts[7], dummyelts[23]);	// y2*s1t
	Kadd(dummyelts[29], dummyelts[29], dummyelts[30]);	// r*(S^2 + y1*(s1^2*(y1 + U21t) + Z*w5) + h1t*Zp) + y2*s1t
	Kset(rop->m_U0, dummyelts[29]);						// U0p = r*(S^2 + y1*(s1^2*(y1 + U21t) + Z*w5) + h1t*Zp) + y2*s1t
	
	Kmul(dummyelts[29], dummyelts[6], dummyelts[22]);	// y1*s1b
	Kmul(dummyelts[30], dummyelts[17], dummyelts[18]);	// w4*w5
	Kadd(rop->m_U1, dummyelts[29], dummyelts[30]);		// U1p = y1*s1b + w4*w5
	
	
	// Step 8
	Kadd(dummyelts[11], dummyelts[28], rop->m_U1);		// w1 = l2 + U1p
	Kmul(rop->m_U1, rop->m_U1, dummyelts[17]);			// U1p = U1p*w4
	Kmul(dummyelts[16], dummyelts[20], dummyelts[16]);	// Zb = Zp * Zb
	Kmul(dummyelts[26], dummyelts[26], dummyelts[16]); 	// l0 = l0 * Zb
	
	Kadd(dummyelts[29], rop->m_U0, dummyelts[27]);		// U0p + l1
	Kmul(dummyelts[29], dummyelts[29], dummyelts[16]);	// (U0p + l1)*Zb
	Kmul(dummyelts[12], rop->m_U1, dummyelts[11]);		// U1p * w1
	Kadd(dummyelts[12], dummyelts[12], dummyelts[29]);	// w2 = U1p * w1 + (U0p + l1)*Zb
	Ksqr(dummyelts[16], dummyelts[16]);					// Zb = Zb^2
	
	
	// Step 9
	Kadd(dummyelts[29], dummyelts[4], dummyelts[1]);	// V21t + z 
	Kmul(dummyelts[29], dummyelts[29], dummyelts[16]);	// (V21t + z)*Zb
	Kmul(rop->m_V1, dummyelts[12], dummyelts[14]);		// w2*s1
	Kadd(rop->m_V1, rop->m_V1, dummyelts[29]);			// V1p = w2*s1 + (V21t + z)*Zb
	
	Kmul(rop->m_U0, rop->m_U0, dummyelts[9]);			// U0p = U0p*r
	Kmul(dummyelts[12], rop->m_U0, dummyelts[11]);		// U0p*w1
	Kadd(dummyelts[12], dummyelts[12], dummyelts[26]);	// w2 = U0p*w1 + l0
	
	Kmul(dummyelts[29], dummyelts[12], dummyelts[14]);	// w2*s1
	Kmul(rop->m_V0, dummyelts[5], dummyelts[16]);		// V20t*Zb
	Kadd(rop->m_V0, rop->m_V0, dummyelts[29]);			// V0p = w2*s1 + V20t*Zb
	
	Ksqr(rop->m_Z, dummyelts[20]);						// Zp = Zp^2
	Ksqr(rop->m_z, rop->m_Z);							// zp = Zp^2
	
}

// Double a divisor class:
void divclass_double(divclass rop, const divclass op)
{
	if(divclass_iszero(op))
	{
		divclass_set(rop, op);
		return;
	}

	// cf. Algorithm 14.51, p. 347, Handbook
	
	Ksqr(dummyelts[0], op->m_z);					// Z4 = z^2
	Ksqr(dummyelts[1], op->m_U0);					// y0 = U0^2
	Ksqr(dummyelts[2], op->m_U1);					// U1^2
	Kmul(dummyelts[3], f3, op->m_z);				// f3*z
	Kadd(dummyelts[2], dummyelts[2], dummyelts[3]);	// t1 = U1^2 + f3*z
	Kmul(dummyelts[3], dummyelts[0], f0);			// Z4*f0
	Ksqr(dummyelts[4], op->m_V0);					// V0^2
	Kadd(dummyelts[3], dummyelts[3], dummyelts[4]);	// w0 = Z4*f0 + V0^2
	Kmul(dummyelts[4], op->m_z, dummyelts[3]);		// Zb = z*w0
	Kmul(dummyelts[5], dummyelts[1], dummyelts[0]);	// w1 = y0*Z4
	Kmul(dummyelts[6], dummyelts[2], dummyelts[1]);	// t1*y0
	Kmul(dummyelts[6], dummyelts[6], op->m_z);		// y1 = t1*y0*z
	Kmul(dummyelts[7], op->m_U1, dummyelts[3]);		// U1*w0
	Kmul(dummyelts[7], dummyelts[7], op->m_Z);		// U1*w0*Z
	Kadd(dummyelts[7], dummyelts[7], dummyelts[6]);	// s0 = y1 + U1*w0*Z
	Kmul(dummyelts[8], dummyelts[2], dummyelts[3]);	// t1*w0;
	Kadd(dummyelts[8], dummyelts[8], dummyelts[5]);	// w3 = w2 + t1*w0 (w1=w2)
	Ksqr(rop->m_U1, dummyelts[5]);					// U1p = w1^2 = w1w2
	Kmul(dummyelts[9], dummyelts[5], dummyelts[4]);	// w2 = w2*Zb (=w1*Zb)
	Ksqr(rop->m_U0, dummyelts[7]);					// s0^2
	Kadd(rop->m_U0, rop->m_U0, dummyelts[9]);		// U0p = s0^2 + w2
	
	Ksqr(rop->m_Z, dummyelts[4]);					// Zp = Zb^2
	Kmul(dummyelts[10], op->m_V1, dummyelts[3]);	// V1*w0
	Ksqr(dummyelts[10], dummyelts[10]);				// (V1*w0)^2
	Kmul(dummyelts[11], dummyelts[8], dummyelts[6]);	// w3*y1
	Kadd(dummyelts[10], dummyelts[10], dummyelts[11]);	// w3*y1 + (V1*w0)^2
	Kadd(dummyelts[10], dummyelts[10], rop->m_Z);	// w3*y1 + f2*Zp + (V1*w0)^2
	Kmul(dummyelts[10], dummyelts[10], rop->m_Z);		// (...) * Zp
	Kmul(rop->m_V1, dummyelts[9], rop->m_U1);		// w2*U1p
	Kadd(rop->m_V1, rop->m_V1, dummyelts[10]);		// V1p = w2*U1p + (...)*Zp
	Kmul(dummyelts[11], dummyelts[1], dummyelts[3]);	// y0*w0
	Kmul(dummyelts[11], dummyelts[11], rop->m_Z);		// y0*w0*Zp
	Kmul(rop->m_V0, dummyelts[8], rop->m_U0);		// w3*U0p
	Kadd(rop->m_V0, rop->m_V0, dummyelts[11]);		// w3*U0p + y0*w0*Zp
	Kmul(rop->m_V0, rop->m_V0, dummyelts[4]);		// V0p = Zb*(w3*U0p + y0*w0*Zp)
	Ksqr(rop->m_z, rop->m_Z);						// zp = Zp^2*/
}

// Compute the inverse of a divisor class, affine input assumed!
inline void divclass_negaff(divclass rop, const divclass op)
{
	Kset(rop->m_U1,op->m_U1);
	Kset(rop->m_U0,op->m_U0);
	Kset(rop->m_V1,op->m_V1);
	Kset(rop->m_V0,op->m_V0);
	// Subtract h=1 from the curve equation:
	(rop->m_V1)[0] ^= 1;
}

void divclass_make_affine(divclass rop, const divclass op)
{
	Kinv(dummyelts[0], op->m_Z);
	Kmul(rop->m_U0, op->m_U0, dummyelts[0]);
	Kmul(rop->m_U1, op->m_U1, dummyelts[0]);
	Ksqr(dummyelts[1], dummyelts[0]);
	Kmul(rop->m_V0, op->m_V0, dummyelts[1]);
	Kmul(rop->m_V1, op->m_V1, dummyelts[1]);
	Kset_uipoly(rop->m_Z, 1);
	Kset_uipoly(rop->m_z, 1);
}

// Compute multiple of a divisor class:
void divclass_multiply(divclass rop, const divclass op, mpz_t scalar)
{
	if(mpz_cmp_ui(scalar, 0) == 0)
	{
		divclass_setzero(rop);
		return;
	}


	// Compute the w-NAF of scalar:
	wnaf wnafscalar;
	wnaf_init(wnafscalar);
	wnaf_set(wnafscalar, scalar, WINDOWSIZE_DIVCLASS);
	unsigned long int i = wnafscalar->length - 1;
	if(wnafscalar->length == 0) i = 0;

	// Precomputation:
	divclass *multiples;
	size_t number_of_multiples = (1 << (WINDOWSIZE_DIVCLASS - 2));
	multiples = malloc(sizeof(divclass) * number_of_multiples);

	divclass dummy;
	divclass_init(dummy);

	divclass_double_affine(dummy,op);

	size_t j;
	divclass_set(*multiples, op);
	for(j = 1; j < number_of_multiples; j++)
	{
		divclass_add_affine(*(multiples + j), dummy, *(multiples + j - 1));
	}

	// Actual multiplication:

	// Initialise rop:
	divclass_set(rop, *(multiples + (*(wnafscalar->coefficients + wnafscalar->length - 1) / 2)));
	while(i > 0)
	{
		divclass_double(rop, rop);
		if(*(wnafscalar->coefficients + i - 1))
		{
			if(*(wnafscalar->coefficients + i - 1) > 0) 
			{
				divclass_mixadd(rop, rop, *(multiples + (*(wnafscalar->coefficients + i - 1) / 2)));
			}
			else
			{
				divclass_negaff(dummy, *(multiples - (*(wnafscalar->coefficients + i - 1) / 2)));
				divclass_mixadd(rop, rop, dummy);
			}
		}
		i--;
	}
	wnaf_clear(wnafscalar);
	free(multiples);
	divclass_clear(dummy);

}


// Output functions:
void divclass_print(FILE * outfile, const divclass op)
{
	printf("Parameter U1:\n");
	Kprint(outfile, op->m_U1);
	
	printf("Parameter U0:\n");
	Kprint(outfile, op->m_U0);

	printf("Parameter V1:\n");
	Kprint(outfile, op->m_V1);
	
	printf("Parameter V0:\n");
	Kprint(outfile, op->m_V0);

	printf("Parameter Z:\n");
	Kprint(outfile, op->m_Z);

	printf("Parameter z:\n");
	Kprint(outfile, op->m_z);
}
