#include "testbox.h"

//#define COUNT_OPERATIONS

#ifdef COUNT_OPERATIONS
	unsigned long COUNT_MUL;
	unsigned long COUNT_SQR;
	unsigned long COUNT_MLD;
	unsigned long COUNT_ADD;
#endif

#define FIX_FIELD

#ifdef FIX_FIELD
#define FP_LEN (256/UNIT_LEN)
//#if defined (__x86_64__)
//	#include "fp_x86_64_256.h"
//#endif
//#if (defined (__i386__) || defined (__i486__))
//	#include "fp_x86_32_256.h"
//#endif
#endif

#include "fp_256x8664.h"

void fp_inv_256(uni zn, uni an);

void ec_fp_smul_256M(uni X1, uni Z1, uni kn, uni X2, uni_t a);

void ec_fp_smul_256e(uni X1, uni Y1, uni Z1, uni kn, uni X2, uni Y2);
void ec_fp_smulbase_256e(uni X1, uni Y1, uni Z1, const uni kn, const uni *xn0, const uni *yn0, const uni *tn0);

void ec_fp_smul_256q(uni X1, uni Y1, uni Z1, uni kn, uni X2, uni Y2, uni_t d);
void ec_fp_smulbase_256q(uni X1, uni Y1, uni Z1, const uni kn, const uni *xn0, const uni *yn0, const uni *tn0, const uni_t d);

void ec_fp_smul_256s(uni X1, uni Y1, uni Z1, uni kn, uni X2, uni Y2);
void ec_fp_smulbase_256s(uni X1, uni Y1, uni Z1, const uni kn, const uni *xn0, const uni *yn0);

void ec_fp_smul_256h(uni X1, uni Y1, uni Z1, uni kn, uni X2, uni Y2);
//void ec_fp_smulbase_256h(uni X1, uni Y1, uni Z1, const uni kn, const uni *xn0, const uni *yn0);

void ec_fp_smul_256i(uni S1, uni C1, uni D1, uni Z1, uni kn, uni S2, uni C2, uni D2);
void ec_fp_smulbase_256i(uni S1, uni C1, uni D1, uni Z1, const uni kn, const uni *sn0, const uni *cn0, const uni *dn0);

#define TRIAL (unsigned long)20000
#define IOBASE 10


