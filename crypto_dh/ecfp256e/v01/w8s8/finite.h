/**
 * \file finite.h
 * @brief Finite mathematical structures such as
 * prime and binary fields and cyclic group of points
 * on an elliptic curve defined over a finite field.
 *
 * This file is a part of the freeware CRYMPIX
 * CRYPTOGRAPHIC MULTIPRECISION SOFTWARE Library.
 * This software is initially designed and developed in the
 * Information System Strategy and Security Laboratory (IS3)
 * of Izmir Institute of Technology (IZTECH).
 *
 * CRYMPIX is engineered to provide a portable environment
 * for the implementation of the latest techniques in
 * computational number theory and cryptology.
 * The content can be modified with the sole condition
 * that this header is kept as is.
 * We provide no guarantee for the correctness and
 * completeness of this software.
 *
 * Please report the bugs to:
 *    crympix-bug@is3.iyte.edu.tr
 *
 * Please submit your contributions to:
 *    crympix-devel@is3.iyte.edu.tr
 *
 * Thank you for using this software.
 *
 * @author Huseyin Hisil <huseyinhisil AT iyte.edu.tr, h.hisil AT qut.edu.au>
 * @author Serap Atay <serapatay AT iyte.edu.tr>
 * @date Build Jan 2006, Last Updated Mar 2007.
 **/

#define FP_NRES_OFF 0
#define FP_NRES_DK 1
#define FP_NRES_SQ 2

/**
 * Type definition for a finite field, \f$ F_p \f$.
 *
 * \f$ F_p \f$ is isomorphic \f$ Z/pZ \f$, so that we use integers to
 * represent field elements. This representation can also be
 * done in the way Peter Montgomery described. We name his
 * system as nres.
 *
 * If \f$ nd = 0 \f$, nres mode will be inactive.
 * Dont forget necessary convertions to use this system.
 * The relevant functions are fp_nres_on() and fp_nres_off().
 *
 * @author Huseyin Hisil.
 **/
typedef struct{
	MI_t ch; /* Field characteristic */
	MI_t nd2; /* n^-1 in montgomery's nresidue system */
	uni_t nd; /* n[0]^-1 in montgomery's nresidue system due to dusse and kaliski */
	uni_t rtype; /* Representation type */
}FP_t[1], *FP;



/**
 * @brief Set the characteristic of the prime field.
 * @param fp - Prime field.
 * @param ch - Must be a prime. Not extra check is done!.
 * @param rtype - Logic control for nres.
 *
 * @author Huseyin Hisil.
 **/
void fp_set_ch(FP fp, MI ch, uni_t rtype);

/**
 * @brief Initiate a new prime field.
 * @param new - To be documented.
 * @param ch - Must be a prime. Not extra check is done!.
 * @param rtype - Logic control for nres.
 *
 * @author Huseyin Hisil.
 **/
void fp_init(FP new, MI ch, uni_t rtype);

/**
 * @brief Destroy prime field.
 * @param fp - Prime field.
 *
 * @author Huseyin Hisil.
 **/
void fp_kill(FP fp);

/**
 * @brief Initiate an array of prime field intances.
 * @param a - To be documented.
 * @param len - To be documented.
 * @param nres - Logic control for nres.
 *
 * @author Huseyin Hisil.
 **/
FP_t *fp_init_array(MI_t *a, uni_t len, BOOL nres);

/**
 * @brief Destroy array of prime field instances.
 * @param a - To be documented.
 *
 * @author Huseyin Hisil.
 **/
void fp_kill_array(FP_t *a);

/**
 * @brief Inputs a prime field from a file.
 * @param fp - To be documented.
 * @param chs - To be documented.
 * @param nres - To be documented.
 * @param base - To be documented.
 *
 * @author Huseyin Hisil.
 **/
void fp_io_sscan(FP fp, sic chs, BOOL nres, uni_t base);

/**
 * @brief Clone prime field object.
 * @param zfp - To be documented.
 * @param fp - To be documented.
 *
 * @author Huseyin Hisil.
 **/
void fp_clone(FP zfp, FP fp);

/**
 * @brief Modular reduction.
 * @param z - To be documented.
 * @param a - To be documented.
 * @param fp - To be documented.
 *
 * @author Huseyin Hisil.
 **/
void fp_reduce(MI z, MI a, FP fp);

/**
 * @brief Modular addition.
 * @param z - To be documented.
 * @param a - To be documented.
 * @param b - To be documented.
 * @param fp - To be documented.
 *
 * @author Huseyin Hisil.
 * @date Fixed on 01 March 2007
 **/
void fp_add(MI z, MI a, MI b, FP fp);

/**
 * @brief Modular subtraction.
 * @param z - To be documented.
 * @param a - To be documented.
 * @param b - To be documented.
 * @param fp - To be documented.
 *
 * @author Huseyin Hisil.
 **/
void fp_sub(MI z, MI a, MI b, FP fp);

void fp_mul_1(MI z, MI a, uni_t b, SIGN sign, BOOL reduce, FP fp);

/**
 * @brief Modular multiplication.
 * @param z - To be documented.
 * @param a - To be documented.
 * @param b - To be documented.
 * @param fp - To be documented.
 *
 * @author Huseyin Hisil.
 **/
void fp_mul(MI z, MI a, MI b, FP fp);

void fp_mulmuladd(MI z, MI ab, MI cd, MI a, MI b, MI c, MI d, FP fp);

void fp_mulmulsub(MI z, MI ab, MI cd, MI a, MI b, MI c, MI d, FP fp);

/**
 * @brief Modular division.
 * @param z - To be documented.
 * @param a - To be documented.
 * @param b - To be documented.
 * @param fp - To be documented.
 *
 * @author Huseyin Hisil.
 **/
void fp_div(MI z, MI a, MI b, FP fp);

/**
 * @brief Modular exponentiation.
 * @param z - To be documented.
 * @param M - To be documented.
 * @param e - To be documented.
 * @param fp - To be documented.
 *
 * @author Huseyin Hisil.
 **/
void fp_exp(MI z, MI M, MI e, FP fp);

/**
 * @brief Inversion w.r.t. a given modulus.
 * @param z - To be documented.
 * @param a - To be documented.
 * @param fp - To be documented.
 *
 * @author Huseyin Hisil.
 **/
void fp_inv(MI z, MI a, FP fp);

/**
 * @brief Montgomery's Simultaneous Inversion.
 * z == a not allowed.
 * @param z - To be documented.
 * @param a - To be documented.
 * @param len - To be documented.
 * @param fp - To be documented.
 *
 * @author Huseyin Hisil.
 * @date 25 March 2007
 **/
void fp_inv_n(MI_t *z, MI_t *a, uni_t len, FP fp);

/**
 * @brief Type definition for an elliptic curve, \f$ E(F_p) \f$.
 * Tentatively designed for now. To be modified in the future.
 *
 * @author Serap Atay.
 * @author Huseyin Hisil.
 * @date Build Nov 21, 2005. Updated Mar 17, 2007.
 **/
typedef struct{
	FP_t fp;
	MI_t a;
	MI_t b;
	MI_t n; /* #E. */
	MI_t t0, t1, t2, t3, t4, t5; /* Temp variables. */
	BOOL is_a_3; /* TRUE if a = -3. */
}EC_FP_t[1], *EC_FP;

/**
 * @brief Initialize an elliptic curve.
 * The curve equation is \f$ y^2 = x^3 + ax + b \f$.
 * If curve arithmetic is to be made in nres mode.
 * \f$ a \f$ and \f$ b \f$ must be in nres system.
 * @param new - Elliptic curve to be initialized.
 * @param fp - Prime field. NULLABLE.
 * @param a - Curve constant. NULLABLE.
 * @param b - Curve constant. NULLABLE.
 * @param n - Number of poimts on the curve. NULLABLE.
 *
 * @author Huseyin Hisil.
 * @date Dec 10, 2005. Modified Mar 19 2007.
 **/
void ec_fp_init(EC_FP new, FP fp, MI a, MI b, MI n);


/**
 * @brief Clones an elliptic curve.
 * @param zp - Destination elliptic curve.
 * @param ap - Source elliptic curve.
 *
 * @author Sevgi Uslu.
 * @date May 2007.
 **/
void ec_fp_clone(EC_FP zp, EC_FP ap);

/**
 * @brief Destroys an elliptic curve.
 * @param ec - Elliptic curve.
 *
 * @author Huseyin Hisil.
 * @date Dec 10, 2005. Modified Mar 19 2007.
 **/
void ec_fp_kill(EC_FP ec);

/**
 * @brief Find number of points on an elliptic curve.
 * The result is kept within the elliptic curve instance.
 * @warning To be developed.
 * @param a - Elliptic curve.
 *
 * @author Huseyin Hisil.
 * @date Build March 10, 2007.
 **/
void ec_fp_pointcount(EC_FP a);

/**
 * @brief Scan an elliptic curve from a string.
 * @param ec - Destination elliptic curve.
 * @param fps - String for prime field, \f$ F_p \f$.
 * @param as - String for elliptic curve contant, \f$ a \f$.
 * @param bs - String for elliptic curve contant, \f$ b \f$.
 * @param ns - String for number of points on elliptic curve, \f$ n \f$.
 * @param rtype - Logical control for NRES arithmetic.
 * @param base - Base of the input strings.
 *
 * @author Huseyin Hisil.
 * @date Dec 10, 2005. Modified Mar 19 2007.
 **/
void ec_fp_io_sscan(EC_FP ec, sic fps, sic as, sic bs, sic ns, uni_t rtype, uni_t base);

/**
 * @brief Prints an elliptic curve to a file.
 * @param fp - File.
 * @param ec - Elliptic curve.
 * @param base - Base of the output strings.
 *
 * @author Huseyin Hisil.
 * @date Dec 10, 2005. Modified Mar 19 2007.
 **/
void ec_fp_io_fprint(FILE *fp, EC_FP ec, uni_t base);

typedef uni_t ECP_FP_COORD;

#define ECP_FP_AFFN (ECP_FP_COORD)0
#define ECP_FP_PROJ (ECP_FP_COORD)1
#define ECP_FP_JACB (ECP_FP_COORD)2
#define ECP_FP_CHUD (ECP_FP_COORD)3
#define ECP_FP_MJAC (ECP_FP_COORD)4

/**
 * @brief Type definition for an elliptic curve point, \f$ P \in E(F_p) \f$.
 * The elliptic curve must be defined over \f$ F_p \f$.
 *
 * @author Huseyin Hisil.
 * @date Build Mar 21, 2004. Mar 22, 2007.
 **/
typedef struct{
	MI_t x;
	MI_t y;
	MI_t z;
	MI_t z2;
	MI_t z3;
	MI_t az4;
	BOOL inf; /* TRUE if point at infinity, FALSE otherwise. */
	uni_t ct; /* Coordinate type */
}ECP_FP_t[1], *ECP_FP;

/**
 * @brief Initialize an elliptic curve point.
 * @param ap - Elliptic curve point to be initialized.
 * @param x - \f$ x \f$-coordinate. NULLABLE.
 * @param y - \f$ y \f$-coordinate. NULLABLE.
 * @param ct - Coordinate type. Ex: ECP_FP_AFFN.
 *
 * @author Huseyin Hisil.
 * @date Dec 10, 2005. Modified Mar 19 2007.
 **/
void ecp_fp_init(ECP_FP ap, MI x, MI y, ECP_FP_COORD ct);

/**
 * @brief Destroys an elliptic curve point.
 * @param ap - Elliptic curve point.
 *
 * @author Huseyin Hisil.
 * @date Dec 10, 2005. Modified Mar 19 2007.
 **/
void ecp_fp_kill(ECP_FP ap);

/**
 * @brief Initialize an elliptic curve point array.
 * @param len - Size of the array.
 * @param ct - Coordinate type. Ex: ECP_FP_AFFN.
 *
 * @author Huseyin Hisil.
 * @date Dec 10, 2005. Modified Mar 19 2007.
 **/
ECP_FP_t *ecp_fp_init_array(uni_t len, ECP_FP_COORD ct);

/**
 * @brief Destroy an elliptic curve point array.
 * @param a - Elliptic curve point array.
 *
 * @author Huseyin Hisil.
 * @date Dec 10, 2005. Modified Mar 19 2007.
 **/
void ecp_fp_kill_array(ECP_FP_t *a);

/**
 * @brief Clones an elliptic curve point.
 * @param zp - Destination elliptic curve point.
 * @param ap - Source elliptic curve point.
 *
 * @author Huseyin Hisil.
 * @date Dec 10, 2005. Modified Mar 19 2007.
 **/
void ecp_fp_clone(ECP_FP zp, ECP_FP ap);

/**
 * @brief Checks the validity of an elliptic curve point.
 * @param p -  Elliptic curve point to be validated.
 * @param ec - Elliptic curve.
 *
 * @author Huseyin Hisil.
 * @date Dec 10, 2005. Modified Mar 19 2007.
 **/
BOOL ecp_fp_isonthecurve(ECP_FP p, EC_FP ec);

/**
 * @brief Scan an elliptic curve point from a string.
 * (0 : 1) is interpreted as point at infinity.
 * @param p - Destination elliptic curve point.
 * @param xs - String for \f$ x \f$-coordinate.
 * @param ys - String for \f$ y \f$-coordinate.
 * @param rtype - Logical control for NRES arithmetic.
 * @param base - Base of the input strings.
 * @param ec - Elliptic curve.
 *
 * @author Huseyin Hisil.
 * @date Dec 10, 2005. Modified Mar 19 2007.
 **/
void ecp_fp_io_sscan(ECP_FP p, sic xs, sic ys, uni_t rtype, uni_t base, EC_FP ec);

/**
 * @brief Prints an elliptic curve point to a file.
 * Point at infinity is represented as (0 : 1).
 * @param fp - File.
 * @param p - Elliptic curve point.
 * @param base - Base for the output string.
 *
 * @author Huseyin Hisil.
 * @date Dec 10, 2005. Modified Mar 19 2007.
 **/
void ecp_fp_io_fprint(FILE *fp, ECP_FP p, uni_t base);

/**
 * @brief Compares two elliptic curve points.
 * @param ap - Elliptic curve point.
 * @param bp - Elliptic curve point.
 * @return TRUE is two points are equal, FALSE otherwise.
 *
 * @author Huseyin Hisil.
 * @date Dec 10, 2005. Modified Mar 19 2007.
 **/
COMPARE ecp_fp_compare(ECP_FP ap, ECP_FP bp);

void ecp_fp_negate(ECP_FP p2, ECP_FP p1, EC_FP ec);

void ecp_fp_normalize(ECP_FP p2, ECP_FP p1, EC_FP ec);

/**
 * @brief Elliptic curve point doubling.
 * All coordinates of p1 must be larger than or equal to zero.
 * For the pointers, (p1 == == p3) is allowed.
 *
 * <B>AFFINE COORDINATES</B>
 *
 * The equation is \f$ E(F_p): y^2 = x^3 + ax + b \f$.
 *
 * The complexity of \f$ \mathcal{A} := 2\mathcal{A}$ is $(I + 2M + 2S) \f$.
 *
 * Negative of the point \f$ (x_1 : y_1) \f$ is \f$ (x_1 : -y_1) \f$.
 *
 * If \f$ (x_3, y_3) \; = \; 2(x_1, y_1) \f$, then
 * \f{tabular}{l}
 * 		$ \lambda = (2y_1)^{-1}(3{x_1}^2 + a), $ \\
 * 		~\\
 * 		$ {x_3} = \lambda^2 - 2{x_1}, $ \\
 * 		~\\
 * 		$ {y_3} = \lambda({x_1} - {x_3}) - {y_1}. $ \\
 * \f}
 *
 * The operations are scheduled as follows.

@verbatim
t0 = x1 * x1    // <S>
t1 =  3 * t0
t0 =  a + t1
t1 =  2 * y1
t1 = t0 / t1    // <M+I>
t0 = t1 * t1    // <S>
t2 =  2 * x1
t2 = t0 - t2
t0 = x1 - t2
t1 = t1 * t0    // <M>
y3 = t1 - y1
x3 = t2
@endverbatim

 * <B>PROJECTIVE COORDINATES</B>
 *
 * The equation is \f$ E(F_p): Y^2Z = X^3 + aXZ^2 + bZ^3 \f$.
 *
 * The following cases are supported.
 *
 * \f{tabular}{c}
 * 		\mathcal{P} := 2$\mathcal{A} \quad\longrightarrow\quad$ 6M + 4S \\
 * 		\mathcal{P} := 2$\mathcal{P} \quad\longrightarrow\quad$ 7M + 5S \\
 * \f}
 *
 * The point \f$ (X_1 : Y_1: Z_1) \f$ corresponds to the affine point \f$ (X_1/Z_1 : Y_1/Z_1) \f$ when \f$ Z_1 \neq 0 \f$ and to the point at infinity otherwise.
 *
 * Negative of the point \f$ (X_1 : Y_1: Z_1) \f$ is \f$ (X_1 : -Y_1 : Z_1) \f$.
 *
 * If \f$ (X_3, Y_3, Z_3) \; = \; 2(X_1, Y_1, Z_1) \f$, then
 * \f{tabular}{l}
 * 		$ {X_3} = 2 a^2 {Y_1} {Z_1}^5 + 12 a {X_1}^2 {Y_1} {Z_1}^3 + 18 {X_1}^4 {Y_1} {Z_1} - 16 {X_1} {Y_1}^3 {Z_1}^2, $ \\
 * 		~\\
 *		$ {Y_3} = -a^3 {Z_1}^6 - 9 a^2 {X_1}^2 {Z_1}^4 - 27 a {X_1}^4 {Z_1}^2 + 12 a {X_1} Y^2 {Z_1}^3 - 27 {X_1}^6 + 36 {X_1}^3 Y^2 {Z_1} - 8 Y^4 {Z_1}^2, $ \\
 *		~\\
 *		$ {Z_3} = 8 {Y_1}^3 {Z_1}^3. $ \\
 * \f}
 *
 * Or simply;
 *
 * \f{tabular}{c}
 * 		$ A = a{Z_1}^2 + 3{X_1}^2, \quad B = 2{Y_1}{Z_1} \quad C = 2{X_1}{Y_1}B \quad D = A^2-2C, $ \\
 * 		~\\
 * 		$ {X_3} = BD, \quad {Y_3} = A(C-D)-2({Y_1}B)^2, \quad {Z_3} = B^3. $ \\
 * \f}
 *
 * The operations are scheduled as follows.

@verbatim
t0 := Y1 * Z1;
t1 :=  2 * t0;
t0 := Z1 * Z1;
t2 :=  a * t0;
t3 := X1 * X1;
t4 :=  3 * t3;
t4 := t2 + t4;
t0 := Y1 * t1;
t2 := X1 * t0;
t3 :=  2 * t2;
t2 :=  2 * t3;
Z3 := t4 * t4;
Z3 := Z3 - t2;
X3 := t1 * Z3;
t3 := t3 - Z3;
Y3 := t4 * t3;
t2 := t0 * t0;
Z3 :=  2 * t2;
Y3 := Y3 - Z3;
Z3 := t1 * t1;
Z3 := Z3 * t1;
@endverbatim

 * <B>JACOBIAN COORDINATES</B>
 *
 * The equation is \f$ E(F_p): Y^2Z = X^3 + aXZ^2 + bZ^3 \f$.
 *
 * The following cases are supported.
 *
 * \f{tabular}{c}
 * 		\mathcal{J} := 2$\mathcal{A} \quad\longrightarrow\quad$ 2M + 4S \\
 * 		\mathcal{J} := 2$\mathcal{J} \quad\longrightarrow\quad$ 4M + 6S \\
 * \f}
 *
 * The point \f$ (X_1 : Y_1: Z_1) \f$ corresponds to the affine point \f$ ({X_1} / {Z_1^2} : {Y_1} / {Z_1}^3) \f$ when \f$ {Z_1} \neq 0 \f$ and to the point at infinity otherwise.
 *
 * Negative of the point \f$ (X_1 : Y_1: Z_1) \f$ is \f$ (X_1 : -Y_1 : Z_1) \f$.
 *
 * If \f$ (X_3, Y_3, Z_3) \; = \; 2(X_1, Y_1, Z_1) \f$, then
 * \f{tabular}{l}
 * 		$ {X_3} = a^2 {Z_1}^8 + 6 a {X_1}^2 {Z_1}^4 + 9 {X_1}^4 - 8 {X_1} {Y_1}^2, $ \\
 * 		~\\
 * 		$ {Y_3} = -a^3 {Z_1}^{12} - 9 a^2 {X_1}^2 {Z_1}^8 - 27 a {X_1}^4 {Z_1}^4 + 12 a {X_1} {Y_1}^2 {Z_1}^4 - 27 {X_1}^6 + 36 {X_1}^3 {Y_1}^2 - 8 {Y_1}^4, $ \\
 * 		~\\
 * 		$ {Z_3} = 2 {Y_1} {Z_1}. $ \\
 * \f}
 *
 * Or simply;
 *
 * \f{tabular}{c}
 * 		$ A = 4{X_1}{Y_1}^2, \quad B = 3{X_1}^2 + a{Z_1}^4, $ \\
 * 		~\\
 * 		$ {X_3} = B^2 - 2A, \quad {Y_3} = B(A-{X_3}) - 8{Y_1}^4, \quad {Z_3} = 2{Y_1}{Z_1}. $ \\
 * \f}
 *
 * The operations are scheduled as follows.

@verbatim
t0 := Z1 * Z1;
Z3 := Y1 * Z1;
Z3 :=  2 * Z3;
if (a eq -3) then
	t1 := X1 - t0;
	t0 := t0 + X1;
	t1 := t0 * t1;
	t0 :=  2 * t1;
else
	t1 := t0 * t0;
	t0 :=  a * t1;
	t1 := X1 * X1;
	t0 := t0 + t1;
	t1 :=  2 * t1;
end if;
t0 := t0 + t1;
Y3 := Y1 * Y1;
t1 := Y3 * Y3;
Y3 :=  4 * Y3;
t1 :=  8 * t1;
Y3 := Y3 * X1;
X3 := t0 * t0;
X3 := X3 - Y3;
X3 := X3 - Y3;
Y3 := Y3 - X3;
Y3 := Y3 * t0;
Y3 := Y3 - t1;
@endverbatim

 * <B>CHUDHOVSKY-JACOBIAN COORDINATES</B>
 *
 * The following cases are supported.
 *
 * \f{tabular}{c}
 * 		\mathcal{J^C} := 2$\mathcal{A} \quad\longrightarrow\quad$ 3M + 5S \\
 * 		\mathcal{J^C} := 2$\mathcal{J^C} \quad\longrightarrow\quad$ 5M + 6S \\
 * \f}
 *
 * The doubling formula are the same with Jacobian Coordinates but the points have a
 * redundant respresentation of the form \f$ (X_i, Y_i, Z_i, {Z_i}^2, {Z_i}^3) \f$.
 *
 * The operations are scheduled as follows.

@verbatim
Z3 := Y1 * Z1;
Z3 :=  2 * Z3;
if (a eq -3) then
	ZZ3 := X1 - ZZ1;
	ZZZ3 := ZZ1 + X1;
	ZZ3 := ZZZ3 * ZZ3;
	ZZZ3 := 2 * ZZ3;
else
	ZZ3 := ZZ1 * ZZ1;
	ZZZ3 :=  a * ZZ3;
	ZZ3 := X1 * X1;
	ZZZ3 := ZZZ3 + ZZ3;
	ZZ3 :=  2 * ZZ3;
end if;
ZZZ3 := ZZZ3 + ZZ3;
Y3 := Y1 * Y1;
ZZ3 := Y3 * Y3;
Y3 :=  4 * Y3;
ZZ3 :=  8 * ZZ3;
Y3 := Y3 * X1;
X3 := ZZZ3 * ZZZ3;
X3 := X3 - Y3;
X3 := X3 - Y3;
Y3 := Y3 - X3;
Y3 := Y3 * ZZZ3;
Y3 := Y3 - ZZ3;
ZZ3 := Z3 * Z3;
ZZZ3 := ZZ3 * Z3;
@endverbatim

 * <B>MODIFIED-JACOBIAN COORDINATES</B> (To be altered)
 *
 * The following cases are supported.
 *
 * \f{tabular}{c}
 * 		\mathcal{J^M} := 2$\mathcal{A} \quad\longrightarrow\quad$ 3M + 4S \\
 * 		\mathcal{J^M} := 2$\mathcal{J^M} \quad\longrightarrow\quad$ 4M + 4S \\
 * \f}
 *
 * The doubling formula are the same with Jacobian Coordinates but the points have a
 * redundant respresentation of the form \f$ (X_i, Y_i, Z_i, {aZ_i}^4) \f$.
 *
 * The operations are scheduled as follows.

@verbatim
Z3 := Y1 * Z1;
Z3 :=  2 * Z3;
t0 := X1 * X1;
t0 :=  3 * t0;
t0 := t0 + aZ41;
Y3 := Y1 * Y1;
t1 := Y3 * Y3;
t1 :=  8 * t1;
Y3 :=  4 * Y3;
Y3 := Y3 * X1;
X3 := t0 * t0;
X3 := X3 - Y3;
X3 := X3 - Y3;
Y3 := Y3 - X3;
Y3 := Y3 * t0;
Y3 := Y3 - t1;
t1 :=  2 * t1;
aZ43 := t1 * aZ41;
@endverbatim

 * @param p3 - Destination elliptic curve point.
 * @param p1 - Source elliptic curve point.
 * @param ec - Elliptic curve.
 *
 * @author Serap Atay
 * @author Huseyin Hisil.
 * @date Build Dec 10, 2005. Modified May 10, 2007 (HH).
 **/
void ecp_fp_dbl(ECP_FP p3, ECP_FP p1, EC_FP ec);

/**
 * @brief Elliptic curve point addition.
 * All coordinates of p1 and p2 must be larger than or equal to zero.
 * For the pointers, any combination of (p1 == p2 == p3) is allowed.
 *
 * <B>AFFINE COORDINATES</B>
 *
 * The equation is \f$ E(F_p): y^2 = x^3 + ax + b \f$.
 *
 * The complexity of \f$ \mathcal{A} := \mathcal{A} + \mathcal{A}$ is $(I + 2M + S) \f$.
 *
 * Negative of the point \f$ (x_1 : y_1) \f$ is \f$ (x_1 : -y_1) \f$.
 *
 * If \f$ (x_3, y_3) \; = \; 2(x_1, y_1) \f$, then
 * \f{tabular}{l}
 * 		$ \lambda = (y_2 - y_1) / (x_2 - x_1), $ \\
 * 		~\\
 * 		$ {x_3} = \lambda^2 - {x_1} - {x_2}, $ \\
 * 		~\\
 * 		$ {y_3} = \lambda({x_1} - {x_3}) - {y_1}. $ \\
 * \f}
 *
 * The operations are scheduled as follows.

@verbatim
if(x2 != x1){
    t0 = x2 - x1
    t1 = y2 - y1
    t0 = t1 / t0    // <I+M>
    t1 = x1 + x2
    x3 = t0 * t0    // <S>
    x3 = x3 - t1
    t1 = x1 - x3
    y3 = t0 * t1    // <M>
    y3 = y3 - y1
}
else if(y2 == y1){
    (p3) = 2(p1)
}
else{
    (p3) = inf
}
@endverbatim

 * <B>PROJECTIVE COORDINATES</B>
 *
 * The equation is \f$ E(F_p): Y^2Z = X^3 + aXZ^2 + bZ^3 \f$.
 *
 * The following cases are supported.
 *
 * \f{tabular}{c}
  		$\mathcal{A} + \mathcal{P} = \mathcal{P} \quad\longrightarrow\quad$ (10M + 2S) \\
 * 		$\mathcal{P} + \mathcal{P} = \mathcal{P} \quad\longrightarrow\quad$ (12M + 2S) \\
 * \f}
 *
 * The point \f$ (X_1 : Y_1: Z_1) \f$ corresponds to the affine point \f$ (X_1/Z_1 : Y_1/Z_1) \f$ when \f$ Z_1 \neq 0 \f$ and to the point at infinity otherwise.
 *
 * Negative of the point \f$ (X_1 : Y_1: Z_1) \f$ is \f$ (X_1 : -Y_1 : Z_1) \f$.
 *
 * If \f$ (X_3, Y_3, Z_3) \; = \; (X_1, Y_1, Z_1) + (X_2, Y_2, Z_2) \f$, then
 * \f{tabular}{rcl}
 * 		$ {X_3} & = & {X_1}^4 {Z_2}^4 - 2 {X_1}^3 {Z_1} {X_2} {Z_2}^3 - {X_1} {Y_1}^2 {Z_1} {Z_2}^4 + 2 {X_1} {Y_1} {Z_1}^2 {Y_2} {Z_2}^3 + 2 {X_1} {Z_1}^3 {X_2}^3 {Z_2} - $ \\
 *		$ ~     & ~ & {X_1} {Z_1}^3 {Y_2}^2 {Z_2}^2 + {Y_1}^2 {Z_1}^2 {X_2} {Z_2}^3 - 2 {Y_1} {Z_1}^3 {X_2} {Y_2} {Z_2}^2 - {Z_1}^4 {X_2}^4 + {Z_1}^4 {X_2} {Y_2}^2 {Z_2}, $ \\
 * 		~\\
 *		$ {Y_3} & = & -{X_1}^3 {Y_1} {Z_2}^4 + 2 {X_1}^3 {Z_1} {Y_2} {Z_2}^3 - 3 {X_1}^2 {Z_1}^2 {X_2} {Y_2} {Z_2}^2 + 3 {X_1} {Y_1} {Z_1}^2 {X_2}^2 {Z_2}^2 + $ \\
 *		$ ~     & ~ & {Y_1}^3 {Z_1} {Z_2}^4 - 3 {Y_1}^2 {Z_1}^2 {Y_2} {Z_2}^3 - 2 {Y_1} {Z_1}^3 {X_2}^3 {Z_2} + 3 {Y_1} {Z_1}^3 {Y_2}^2 {Z_2}^2 + {Z_1}^4 {X_2}^3 {Y_2} - {Z_1}^4 {Y_2}^3 {Z_2}, $ \\
 *		~\\
 *		$ {Z_3} & = & -{X_1}^3 {Z_1} {Z_2}^4 + 3 {X_1}^2 {Z_1}^2 {X_2} {Z_2}^3 - 3 {X_1} {Z_1}^3 {X_2}^2 {Z_2}^2 + {Z_1}^4 {X_2}^3 {Z_2}. $ \\
 * \f}
 *
 * Or simply;
 *
 * \f{tabular}{c}
 * 		$A = {Y_2} {Z_1} - {Y_1} {Z_2} \quad B = {X_2} {Z_1} - {X_1} {Z_2} \quad C = A^2 {Z_1} {Z_2} - B^3 - 2 B^2 {X_1} {Z_2}, $ \\
 * 		~\\
 * 		${X_3} = B C \quad {Y_3} = A (B^2 {X_1} {Z_2} - C) - B^3 {Y_1} {Z_2} \quad {Z_3} = B^3 {Z_1} {Z_2}. $ \\
 * \f}
 *
 * The operations are scheduled as follows.

@verbatim
if (Z1 eq 1) then
	X3 := X1 * Z2;
	Y3 := Y1 * Z2;
	Z3 := Z2;
	t0 := Y2 - Y3;
	t1 := X2 - X3;
else
	t0 := Y2 * Z1;
	t1 := X2 * Z1;
	X3 := X1 * Z2;
	Y3 := Y1 * Z2;
	Z3 := Z1 * Z2;
	t0 := t0 - Y3;
	t1 := t1 - X3;
end if;
if (t1 ne 0) then
	t3 := t1 * t1;
	t4 := t3 * X3;
	t2 := t0 * t0;
	if (Z1 eq 1) then
		X3 := t2 * Z2;
	else
		X3 := t2 * Z3;
	end if;
	t2 := t3 * t1;
	if (Z1 eq 1) then
		Z3 := t2 * Z2;
	else
		Z3 := t2 * Z3;
	end if;
	X3 := X3 - t2;
	Y3 := t2 * Y3;
	t2 :=  2 * t4;
	X3 := X3 - t2;
	t4 := t4 - X3;
	t4 := t4 * t0;
	Y3 := t4 - Y3;
	X3 := t1 * X3;
elif (t0 eq 0) then
	// (p3) = 2(p1);
else
	// (p3) = inf;
end if;
@endverbatim

 * <B>JACOBIAN COORDINATES</B>
 *
 * The following cases are supported.
 *
 * \f{tabular}{c}
 * 		$\mathcal{A} + \mathcal{J} = \mathcal{J} \quad\longrightarrow\quad$ (8M + 3S) \\
 * 		$\mathcal{J} + \mathcal{J} = \mathcal{J} \quad\longrightarrow\quad$ (12M + 4S) \\
  * \f}
 *
 * The point at infinity, \f$ \mathcal{O} \f$, corresponds to \f$ (1 : 1 : 0) \f$.
 *
 * Negative of \f$ (X : Y: Z) \f$ is \f$ (X : -Y : Z) \f$
 *
 * If \f$ (X_3, Y_3, Z_3) \; = \; (X_1, Y_1, Z_1) + (X_2, Y_2, Z_2) \f$, then
 * \f{tabular}{rcl}
 * 		$ {X_3} & = & -{X_1}^3{Z_2}^6 + {X_1}^2{Z_1}^2{X_2}{Z_2}^4 + {X_1}{Z_1}^4{X_2}^2{Z_2}^2 + {Y_1}^2{Z_2}^6 - 2{Y_1}{Z_1}^3{Y_2}{Z_2}^3 - {Z_1}^6{X_2}^3 + {Z_1}^6{Y_2}^2,$ \\
 *  	~\\
 * 		$ {Y_3} & = & {X_1}^3{Y_1}{Z_2}^9 - 2{X_1}^3{Z_1}^3{Y_2}{Z_2}^6 + 3{X_1}^2{Z_1}^5{X_2}{Y_2}{Z_2}^4 - 3{X_1}{Y_1}{Z_1}^4{X_2}^2{Z_2}^5 - {Y_1}^3{Z_2}^9 + $ \\
 *      $ ~     & ~ & 3{Y_1}^2{Z_1}^3{Y_2}{Z_2}^6 + 2{Y_1}{Z_1}^6{X_2}^3{Z_2}^3 - 3{Y_1}{Z_1}^6{Y_2}^2{Z_2}^3 - {Z_1}^9{X_2}^3{Y_2} + {Z_1}^9{Y_2}^3,$ \\
 * 		~\\
 * 		$ {Z_3} & = & {X_1}{Z_1}{Z_2}^3 - {Z_1}^3{X_2}{Z_2}.$ \\
 * \f}
 *
 * Or simply;
 *
 * \f{tabular}{c}
 * 		$A = {X_1} {Z_2}^2, \quad B = {X_2} {Z_1}^2, \quad C = {Y_1} {Z_2}^3, \quad D = {Y_2} {Z_1}^3, \quad E = B - A, \quad F = D - C, $ \\
 * 		~\\
 * 		${X_3} = - E^3 - 2 A E^2 + F^2, \quad {Y_3} = -C E^3 + F (A E^2 - {X_3}), \quad {Z_3} = {Z_1} {Z_2} E. $ \\
 * \f}
 *
 * The operations are scheduled as follows.

@verbatim
if (Z1 ne 1) then
	t0 := Z1 * Z1;
	t1 := Z1 * t0;
	X3 := X2 * t0;
	Y3 := Y2 * t1;
end if;
t0 := Z2 * Z2;
t1 := X1 * t0;
t0 := Z2 * t0;
t0 := Y1 * t0;
if (Z1 eq 1) then
	t0 := t0 - Y2;
	t1 := t1 - X2;
else
	t0 := t0 - Y3;
	t1 := t1 - X3;
end if;
if (t1 ne 0) then
	if (Z1 eq 1) then
		Z3 := Z2 * t1;
	else
		t2 := Z2 * Z1;
		Z3 := t2 * t1;
	end if;
	t2 := t1 * t1;
	t1 := t1 * t2;
	if (Z1 eq 1) then
		t2 := t2 * X2;
	else
		t2 := t2 * X3;
	end if;
	X3 := t0 * t0;
	X3 := X3 - t2;
	X3 := X3 - t1;
	X3 := X3 - t2;
	t2 := t2 - X3;
	if (Z1 eq 1) then
		t1 := t1 * Y2;  // [Y3, "Y3", "t1"] := t0 * t2 - t1 * Y2;
		Y3 := t0 * t2;
		Y3 := Y3 - t1;
	else
		t1 := t1 * Y3;  // [Y3, "Y3", "t1"] := t0 * t2 - t1 * Y3;
		Y3 := t0 * t2;
		Y3 := Y3 - t1;
	end if;
elif (t0 eq 0) then
	// (p3) = 2(p1);
else
	// (p3) = inf;
end if;
@endverbatim

 * <B>CHUDNOVSKY-JACOBIAN COORDINATES</B>
 *
 * The following cases are supported.
 *
 * \f{tabular}{c}
 * 		$\mathcal{A} + \mathcal{J^C} = \mathcal{J^C} \quad\longrightarrow\quad$ (8M + 3S) \\
 * 		$\mathcal{J^C} + \mathcal{J^C} = \mathcal{J^C} \quad\longrightarrow\quad$ (11M + 3S) \\
  * \f}
 *
 * The addition formula is the same with Jacobian Coordinates but the points have a
 * redundant respresentation of the form \f$ (X_i, Y_i, Z_i, {Z_i}^2, {Z_i}^3) \f$.
 *
 * The operations are scheduled as follows.

@verbatim
ZZ3 := X1 * ZZ2;
ZZZ3 := Y1 * ZZZ2;
if (Z1 eq 1) then
	ZZ3 := ZZ3 - X2;
	ZZZ3 := ZZZ3 - Y2;
else
	X3 := X2 * ZZ1;
	Y3 := Y2 * ZZZ1;
	ZZ3 := ZZ3 - X3;
	ZZZ3 := ZZZ3 - Y3;
end if;
if (ZZ3 ne 0) then
	if (Z1 eq 1) then
		Z3 := Z2 * ZZ3;
	else
		t0 := Z2 * Z1;
		Z3 := t0 * ZZ3;
	end if;
	t0 := ZZ3 * ZZ3;
	ZZ3 := ZZ3 * t0;
	if (Z1 eq 1) then
		t0 := t0 * X2;
	else
		t0 := t0 * X3;
	end if;
	X3 := ZZZ3 * ZZZ3;
	X3 := X3 - t0;
	X3 := X3 - ZZ3;
	X3 := X3 - t0;
	t0 := t0 - X3;
	if (Z1 eq 1) then
		ZZ3 := ZZ3 * Y2; //[Y3, "Y3", "ZZ3"] := ZZZ3 * t0 - ZZ3 * Y2;
		Y3 := ZZZ3 * t0;
		Y3 := Y3 - ZZ3;
	else
		ZZ3 := ZZ3 * Y3; //[Y3, "Y3", "ZZ3"] := ZZZ3 * t0 - ZZ3 * Y3;
		Y3 := ZZZ3 * t0;
		Y3 := Y3 - ZZ3;
	end if;
	ZZ3 := Z3 * Z3;
	ZZZ3 := ZZ3 * Z3;
elif (ZZZ3 eq 0) then
	// (p3) = 2(p1);
else
	// (p3) = inf;
end if;
@endverbatim

 * <B>MODIFIED-JACOBIAN COORDINATES</B>
 *
 * The following cases are supported.
 *
 * \f{tabular}{c}
 * 		$\mathcal{A} + \mathcal{J^M} = \mathcal{J^M} \quad\longrightarrow\quad$ (9M + 5S) \\
 * 		$\mathcal{J^M} + \mathcal{J^M} = \mathcal{J^M} \quad\longrightarrow\quad$ (13M + 6S) \\
  * \f}
 *
 * The addition formula is the same with Jacobian Coordinates but the points have a
 * redundant respresentation of the form \f$ (X_i, Y_i, Z_i, {aZ_i}^4) \f$.
 *
 * The operations are scheduled as follows.

@verbatim
if (Z1 ne 1) then
	t0 := Z1 * Z1;
	t1 := Z1 * t0;
	X3 := X2 * t0;
	Y3 := Y2 * t1;
end if;
t0 := Z2 * Z2;
t1 := X1 * t0;
t0 := Z2 * t0;
t0 := Y1 * t0;
if (Z1 eq 1) then
	t0 := t0 - Y2;
	t1 := t1 - X2;
else
	t0 := t0 - Y3;
	t1 := t1 - X3;
end if;
if (t1 ne 0) then
	if (Z1 eq 1) then
		Z3 := Z2 * t1;
	else
		aZ43 := Z2 * Z1;
		Z3 := aZ43 * t1;
	end if;
	aZ43 := t1 * t1;
	t1 := t1 * aZ43;
	if (Z1 eq 1) then
		aZ43 := aZ43 * X2;
	else
		aZ43 := aZ43 * X3;
	end if;
	X3 := t0 * t0;
	X3 := X3 - aZ43;
	X3 := X3 - t1;
	X3 := X3 - aZ43;
	aZ43 := aZ43 - X3;
	if (Z1 eq 1) then
		t1 := t1 * Y2;  // [Y3, "Y3", "t1"] := t0 * aZ43 - t1 * Y2;
		Y3 := t0 * aZ43;
		Y3 := Y3 - t1;
	else
		t1 := t1 * Y3;  // [Y3, "Y3", "t1"] := t0 * aZ43 - t1 * Y3;
		Y3 := t0 * aZ43;
		Y3 := Y3 - t1;
	end if;
	t0 := Z3 * Z3;
	t1 := t0 * t0;
	if (a eq -3) then
		aZ43 := -3 * t1;
	else
		aZ43 := a * t1;
	end if;
elif (t0 eq 0) then
	// (p3) = 2(p1);
else
	// (p3) = inf;
end if;
@endverbatim

 * <B>FURTHER COMMENTS</B>
 * ...
 *
 * @param p3 - Destination elliptic curve point.
 * @param p2 - Source elliptic curve point.
 * @param p1 - Source elliptic curve point.
 * @param ec - Elliptic curve.
 *
 * @author Serap Atay
 * @author Huseyin Hisil.
 * @date Build Dec 10, 2005. Modified May 10, 2007 (HH).
 **/
void ecp_fp_add(ECP_FP p3, ECP_FP p2, ECP_FP p1, EC_FP ec);

/**
 * @brief Elliptic curve point subtraction.
 * Calls ecp_fp_add().
 *
 * @param p3 - Destination elliptic curve point.
 * @param p2 - Source elliptic curve point.
 * @param p1 - Source elliptic curve point.
 * @param ec - Elliptic curve.
 *
 * @author Huseyin Hisil.
 * @date Build Feb 07, 2007.
 **/
void ecp_fp_sub(ECP_FP p3, ECP_FP p2, ECP_FP p1, EC_FP ec);

void ecp_fp_add_n(ECP_FP_t *p3, ECP_FP_t *p2, ECP_FP_t *p1, MI_t *ti, MI_t *tx, uni_t len, EC_FP ec);

/**
 * @brief Point multiplication.
 * @warning Experimental. To be updated with NAF sliding window.
 * @param q - Destination elliptic curve point.
 * @param m - Scalar.
 * @param p - Source elliptic curve point.
 * @param ec - Elliptic curve.
 *
 * @author Huseyin Hisil.
 * @date Build March 10, 2007.
 **/
void ecp_fp_smul(ECP_FP q, MI m, ECP_FP p, EC_FP ec);

/**
 * @brief Muli-point multiplication with fixed scalar.
 * @warning Experimental.
 * @param q - Destination elliptic curve point array.
 * @param m - Scalar.
 * @param p - Source elliptic curve point array.
 * @param tp - Temporary space.
 * @param ti - Temporary space.
 * @param tx - Temporary space.
 * @param len - Size of arrays.
 * @param ec - Elliptic curve.
 *
 * @author Huseyin Hisil.
 * @date Build March 10, 2007.
 **/
void ecp_fp_mul_n(ECP_FP_t *q, MI m, ECP_FP_t *p, ECP_FP_t *tp, MI_t *ti, MI_t *tx, uni_t len, EC_FP ec);

/**
 * Type definition for a finite field, \f$ F_{2^m} \f$.
 * @warning EXPERIMENTAL.
 *
 * @author Huseyin Hisil.
 **/
typedef struct{
	MI_t ch; /* Field characteristic */
	uni_t ex; /* Field extention */
	uni_t rtype; /* Representation type */
}F2M_t[1], *F2M;

/**
 * Type definition for a finite field, \f$ F_{q^m} \f$.
 * @warning Nothing is developed for now.
 *
 * @author Huseyin Hisil.
 **/
typedef struct{
	MI_t ch; /* Field characteristic */
	uni_t ex; /* Field extention */
	uni_t rtype; /* Representation type */
}FQM_t[1], *FQM;

/**
 * @brief Type definition for an elliptic curve, \f$ E(F_{2^m}) \f$.
 * Tentatively designed for now. To be modified in the future.
 * @warning EXPERIMENTAL.
 *
 * @author Serap Atay.
 * @author Huseyin Hisil.
 * @date Build Nov 21, 2005. Updated Mar 17, 2007.
 **/
typedef struct{
	FP_t fp;
	MBPN_t a;
	MBPN_t b;
	/*int ct;*/ /* ??? */
}EC_F2M_t[1], *EC_F2M;

/**
 * @brief Type definition for an elliptic curve point, \f$ P \in E(F_{2^m}) \f$.
 * The elliptic curve must be defined over \f$ F_{2^m} \f$.
 * @warning EXPERIMENTAL.
 *
 * @author Huseyin Hisil.
 * @date Build Mar 21, 2004. Mar 22, 2007.
 **/
typedef struct{
	MBP x;
	MBP y;
	MBP z;
	MBP z2;
	MBP z3;
	MBP az4;
	uni_t ct; /* Coordinate type */
}ECP_F2M_t[1], *ECP_F2M;



typedef struct{
	FP_t fp;
	MI_t a;
	MI_t d;
}EC_FP_TE_t[1], *EC_FP_TE;

typedef struct{
	MI_t x;
	MI_t y;
	MI_t t; /*used in extended projective coordinates*/
	MI_t z; /*used in (extended) projective coordinates*/
}ECP_FP_TE_t[1], *ECP_FP_TE;
