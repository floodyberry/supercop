/**
 * @file ec_point.h
 * @copyright
 *   Copyright (c) 2014 Cryptography Research, Inc.  \n
 *   Released under the MIT License.  See LICENSE.txt for license information.
 * @author Mike Hamburg
 * @warning This file was automatically generated.
 */

#ifndef __CC_INCLUDED_EC_POINT_H__
#define __CC_INCLUDED_EC_POINT_H__

#include "p448.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Affine point on an Edwards curve.
 */
struct affine_t {
    struct p448_t x, y;
};

/**
 * Affine point on a twisted Edwards curve.
 */
struct tw_affine_t {
    struct p448_t x, y;
};

/**
 * Montgomery buffer.
 */
struct montgomery_t {
    struct p448_t z0, xd, zd, xa, za;
};

/**
 * Extensible coordinates for Edwards curves, suitable for
 * accumulators.
 * 
 * Represents the point (x/z, y/z).  The extra coordinates
 * t,u satisfy xy = tuz, allowing for conversion to Extended
 * form by multiplying t and u.
 * 
 * The idea is that you don't have to do this multiplication
 * when doubling the accumulator, because the t-coordinate
 * isn't used there.  At the same time, as long as you only
 * have one point in extensible form, additions don't cost
 * extra.
 * 
 * This is essentially a lazier version of Hisil et al's
 * lookahead trick.  It might be worth considering that trick
 * instead.
 */
struct extensible_t {
    struct p448_t x, y, z, t, u;
};

/**
 * Extensible coordinates for twisted Edwards curves,
 * suitable for accumulators.
 */
struct tw_extensible_t {
    struct p448_t x, y, z, t, u;
};

/**
 * Niels coordinates for twisted Edwards curves.
 * 
 * Good for mixed readdition; suitable for fixed tables.
 */
struct tw_niels_t {
    struct p448_t a, b, c;
};

/**
 * Projective niels coordinates for twisted Edwards curves.
 * 
 * Good for readdition; suitable for temporary tables.
 */
struct tw_pniels_t {
    struct tw_niels_t n;
    struct p448_t z;
};


/**
 * Auto-generated copy method.
 */
static __inline__ void
copy_affine (
    struct affine_t*       a,
    const struct affine_t* ds
) __attribute__((unused,always_inline));

/**
 * Auto-generated copy method.
 */
static __inline__ void
copy_tw_affine (
    struct tw_affine_t*       a,
    const struct tw_affine_t* ds
) __attribute__((unused,always_inline));

/**
 * Auto-generated copy method.
 */
static __inline__ void
copy_montgomery (
    struct montgomery_t*       a,
    const struct montgomery_t* ds
) __attribute__((unused,always_inline));

/**
 * Auto-generated copy method.
 */
static __inline__ void
copy_extensible (
    struct extensible_t*       a,
    const struct extensible_t* ds
) __attribute__((unused,always_inline));

/**
 * Auto-generated copy method.
 */
static __inline__ void
copy_tw_extensible (
    struct tw_extensible_t*       a,
    const struct tw_extensible_t* ds
) __attribute__((unused,always_inline));

/**
 * Auto-generated copy method.
 */
static __inline__ void
copy_tw_niels (
    struct tw_niels_t*       a,
    const struct tw_niels_t* ds
) __attribute__((unused,always_inline));

/**
 * Auto-generated copy method.
 */
static __inline__ void
copy_tw_pniels (
    struct tw_pniels_t*       a,
    const struct tw_pniels_t* ds
) __attribute__((unused,always_inline));

/**
 * Returns 1/sqrt(+- x).
 * 
 * The Legendre symbol of the result is the same as that of the
 * input.
 * 
 * If x=0, returns 0.
 */
void
p448_isr (
    struct p448_t*       a,
    const struct p448_t* x
);

/**
 * Returns 1/x.
 * 
 * If x=0, returns 0.
 */
void
p448_inverse (
    struct p448_t*       a,
    const struct p448_t* x
);

/**
 * Add two points on a twisted Edwards curve, one in Extensible form
 * and the other in half-Niels form.
 */
void
add_tw_niels_to_tw_extensible (
    struct tw_extensible_t*  d,
    const struct tw_niels_t* e
);

/**
 * Add two points on a twisted Edwards curve, one in Extensible form
 * and the other in half-Niels form.
 */
void
sub_tw_niels_from_tw_extensible (
    struct tw_extensible_t*  d,
    const struct tw_niels_t* e
);

/**
 * Add two points on a twisted Edwards curve, one in Extensible form
 * and the other in projective Niels form.
 */
void
add_tw_pniels_to_tw_extensible (
    struct tw_extensible_t*   e,
    const struct tw_pniels_t* a
);

/**
 * Add two points on a twisted Edwards curve, one in Extensible form
 * and the other in projective Niels form.
 */
void
sub_tw_pniels_from_tw_extensible (
    struct tw_extensible_t*   e,
    const struct tw_pniels_t* a
);

/**
 * Double a point on a twisted Edwards curve, in "extensible" coordinates.
 */
void
double_tw_extensible (
    struct tw_extensible_t* a
);

/**
 * Double a point on an Edwards curve, in "extensible" coordinates.
 */
void
double_extensible (
    struct extensible_t* a
);

/**
 * Double a point, and transfer it to the twisted curve.
 * 
 * That is, apply the 4-isogeny.
 */
void
twist_and_double (
    struct tw_extensible_t*    b,
    const struct extensible_t* a
);

/**
 * Double a point, and transfer it to the untwisted curve.
 * 
 * That is, apply the dual isogeny.
 */
void
untwist_and_double (
    struct extensible_t*          b,
    const struct tw_extensible_t* a
);

void
convert_tw_affine_to_tw_pniels (
    struct tw_pniels_t*       b,
    const struct tw_affine_t* a
);

void
convert_tw_affine_to_tw_extensible (
    struct tw_extensible_t*   b,
    const struct tw_affine_t* a
);

void
convert_affine_to_extensible (
    struct extensible_t*   b,
    const struct affine_t* a
);

void
convert_tw_extensible_to_tw_pniels (
    struct tw_pniels_t*           b,
    const struct tw_extensible_t* a
);

void
convert_tw_pniels_to_tw_extensible (
    struct tw_extensible_t*   e,
    const struct tw_pniels_t* d
);

void
convert_tw_niels_to_tw_extensible (
    struct tw_extensible_t*  e,
    const struct tw_niels_t* d
);

void
montgomery_step (
    struct montgomery_t* a
);

void
deserialize_montgomery (
    struct montgomery_t* a,
    const struct p448_t* sbz
);

mask_t
serialize_montgomery (
    struct p448_t*             b,
    const struct montgomery_t* a,
    const struct p448_t*       sbz
);

/**
 * Serialize a point on an Edwards curve.
 * 
 * The serialized form would be sqrt((z-y)/(z+y)) with sign of xz.
 * 
 * It would be on 4y^2/(1-d) = x^3 + 2(1+d)/(1-d) * x^2 + x.
 * 
 * But 4/(1-d) isn't square, so we need to twist it:
 * 
 * -x is on 4y^2/(d-1) = x^3 + 2(d+1)/(d-1) * x^2 + x
 */
void
serialize_extensible (
    struct p448_t*             b,
    const struct extensible_t* a
);

/**
 * 
 */
void
untwist_and_double_and_serialize (
    struct p448_t*                b,
    const struct tw_extensible_t* a
);

/**
 * Expensive transfer from untwisted to twisted.  Roughly equivalent to halve and isogeny.
 * Correctly transfers point of order 2.
 * 
 * Can't have x=+1 (it's not even).  There is code to fix the exception that would otherwise
 * occur at (0,1).
 * 
 * Input point must be even.
 */
void
twist_even (
    struct tw_extensible_t*    b,
    const struct extensible_t* a
);

/**
 * Expensive transfer from untwisted to twisted.  Roughly equivalent to halve and isogeny.
 * 
 * This function is for testing purposes only, because it can return odd points on the
 * twist.  This can cause exceptions in the point addition formula.  What's more, this
 * function should be able to return points of order 4, which are at infinity.
 * 
 * This function probably doesn't properly handle special cases, such as the point at
 * infinity (FUTURE).
 * 
 * This function probably isn't a homomorphism, in that it probably doesn't consistently
 * handle adjustments by the point of order 2 when the input is odd.    (FUTURE)
 */
void
test_only_twist (
    struct tw_extensible_t*    b,
    const struct extensible_t* a
);

mask_t
is_square (
    const struct p448_t* x
);

mask_t
is_even_pt (
    const struct extensible_t* a
);

mask_t
is_even_tw (
    const struct tw_extensible_t* a
);

/**
 * Deserialize a point to an untwisted affine curve.
 */
mask_t
deserialize_affine (
    struct affine_t*     a,
    const struct p448_t* sz
);

/**
 * Deserialize a point and transfer it to the twist.
 * 
 * Not guaranteed to preserve the 4-torsion component.
 * 
 * Refuses to deserialize +-1, which are the points of order 2.
 */
mask_t
deserialize_and_twist_approx (
    struct tw_extensible_t* a,
    const struct p448_t*    sdm1,
    const struct p448_t*    sz
);

void
set_identity_extensible (
    struct extensible_t* a
);

void
set_identity_tw_extensible (
    struct tw_extensible_t* a
);

void
set_identity_affine (
    struct affine_t* a
);

mask_t
eq_affine (
    const struct affine_t* a,
    const struct affine_t* b
);

mask_t
eq_extensible (
    const struct extensible_t* a,
    const struct extensible_t* b
);

mask_t
eq_tw_extensible (
    const struct tw_extensible_t* a,
    const struct tw_extensible_t* b
);

void
elligator_2s_inject (
    struct affine_t*     a,
    const struct p448_t* r
);

mask_t
validate_affine (
    const struct affine_t* a
);

/**
 * Check the invariants for struct tw_extensible_t.
 * NOTE: This function was automatically generated
 * with no regard for speed.
 */
mask_t
validate_tw_extensible (
    const struct tw_extensible_t* ext
);

/**
 * Check the invariants for struct extensible_t.
 * NOTE: This function was automatically generated
 * with no regard for speed.
 */
mask_t
validate_extensible (
    const struct extensible_t* ext
);


void
copy_affine (
    struct affine_t*       a,
    const struct affine_t* ds
) {
    p448_copy ( &a->x, &ds->x );
    p448_copy ( &a->y, &ds->y );
}

void
copy_tw_affine (
    struct tw_affine_t*       a,
    const struct tw_affine_t* ds
) {
    p448_copy ( &a->x, &ds->x );
    p448_copy ( &a->y, &ds->y );
}

void
copy_montgomery (
    struct montgomery_t*       a,
    const struct montgomery_t* ds
) {
    p448_copy ( &a->z0, &ds->z0 );
    p448_copy ( &a->xd, &ds->xd );
    p448_copy ( &a->zd, &ds->zd );
    p448_copy ( &a->xa, &ds->xa );
    p448_copy ( &a->za, &ds->za );
}

void
copy_extensible (
    struct extensible_t*       a,
    const struct extensible_t* ds
) {
    p448_copy ( &a->x, &ds->x );
    p448_copy ( &a->y, &ds->y );
    p448_copy ( &a->z, &ds->z );
    p448_copy ( &a->t, &ds->t );
    p448_copy ( &a->u, &ds->u );
}

void
copy_tw_extensible (
    struct tw_extensible_t*       a,
    const struct tw_extensible_t* ds
) {
    p448_copy ( &a->x, &ds->x );
    p448_copy ( &a->y, &ds->y );
    p448_copy ( &a->z, &ds->z );
    p448_copy ( &a->t, &ds->t );
    p448_copy ( &a->u, &ds->u );
}

void
copy_tw_niels (
    struct tw_niels_t*       a,
    const struct tw_niels_t* ds
) {
    p448_copy ( &a->a, &ds->a );
    p448_copy ( &a->b, &ds->b );
    p448_copy ( &a->c, &ds->c );
}

void
copy_tw_pniels (
    struct tw_pniels_t*       a,
    const struct tw_pniels_t* ds
) {
    copy_tw_niels( &a->n, &ds->n );
    p448_copy ( &a->z, &ds->z );
}



#ifdef __cplusplus
}; /* extern "C" */
#endif

#endif /* __CC_INCLUDED_EC_POINT_H__ */
