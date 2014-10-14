/**
 * @cond internal
 * @file ec_point.c
 * @copyright
 *   Copyright (c) 2014 Cryptography Research, Inc.  \n
 *   Released under the MIT License.  See LICENSE.txt for license information.
 * @author Mike Hamburg
 * @warning This file was automatically generated.
 *     Then it was edited by hand.  Good luck, have fun.
 */

#include "ec_point.h"

#define is32 (GOLDI_BITS == 32)

/* I wanted to just use if (is32)
 * But clang's -Wunreachable-code flags it.
 * I wanted to keep that warning on.
 */
#if (is32)
#define IF32(s) (s)
#else
#define IF32(s)
#endif

void
p448_isr (
    struct p448_t*       a,
    const struct p448_t* x
) {
    struct p448_t L0, L1, L2;
    p448_sqr  (   &L1,     x );
    p448_mul  (   &L2,     x,   &L1 );
    p448_sqr  (   &L1,   &L2 );
    p448_mul  (   &L2,     x,   &L1 );
    p448_sqrn (   &L1,   &L2,     3 );
    p448_mul  (   &L0,   &L2,   &L1 );
    p448_sqrn (   &L1,   &L0,     3 );
    p448_mul  (   &L0,   &L2,   &L1 );
    p448_sqrn (   &L2,   &L0,     9 );
    p448_mul  (   &L1,   &L0,   &L2 );
    p448_sqr  (   &L0,   &L1 );
    p448_mul  (   &L2,     x,   &L0 );
    p448_sqrn (   &L0,   &L2,    18 );
    p448_mul  (   &L2,   &L1,   &L0 );
    p448_sqrn (   &L0,   &L2,    37 );
    p448_mul  (   &L1,   &L2,   &L0 );
    p448_sqrn (   &L0,   &L1,    37 );
    p448_mul  (   &L1,   &L2,   &L0 );
    p448_sqrn (   &L0,   &L1,   111 );
    p448_mul  (   &L2,   &L1,   &L0 );
    p448_sqr  (   &L0,   &L2 );
    p448_mul  (   &L1,     x,   &L0 );
    p448_sqrn (   &L0,   &L1,   223 );
    p448_mul  (     a,   &L2,   &L0 );
}

void
p448_inverse (
    struct p448_t*       a,
    const struct p448_t* x
) {
    struct p448_t L0, L1;
    p448_isr  (   &L0,     x );
    p448_sqr  (   &L1,   &L0 );
    p448_sqr  (   &L0,   &L1 );
    p448_mul  (     a,     x,   &L0 );
}

void
add_tw_niels_to_tw_extensible (
    struct tw_extensible_t*  d,
    const struct tw_niels_t* e
) {
    struct p448_t L0, L1;
    p448_sub  (   &L1, &d->y, &d->x );
    p448_bias (   &L1,     2 );
    IF32( p448_weak_reduce(   &L1 ) );
    p448_mul  (   &L0, &e->a,   &L1 );
    p448_add  (   &L1, &d->x, &d->y );
    p448_mul  ( &d->y, &e->b,   &L1 );
    p448_mul  (   &L1, &d->u, &d->t );
    p448_mul  ( &d->x, &e->c,   &L1 );
    p448_add  ( &d->u,   &L0, &d->y );
    p448_sub  ( &d->t, &d->y,   &L0 );
    p448_bias ( &d->t,     2 );
    IF32( p448_weak_reduce( &d->t ) );
    p448_sub  ( &d->y, &d->z, &d->x );
    p448_bias ( &d->y,     2 );
    IF32( p448_weak_reduce( &d->y ) );
    p448_add  (   &L0, &d->x, &d->z );
    p448_mul  ( &d->z,   &L0, &d->y );
    p448_mul  ( &d->x, &d->y, &d->t );
    p448_mul  ( &d->y,   &L0, &d->u );
}

void
sub_tw_niels_from_tw_extensible (
    struct tw_extensible_t*  d,
    const struct tw_niels_t* e
) {
    struct p448_t L0, L1;
    p448_sub  (   &L1, &d->y, &d->x );
    p448_bias (   &L1,     2 );
    IF32( p448_weak_reduce(   &L1 ) );
    p448_mul  (   &L0, &e->b,   &L1 );
    p448_add  (   &L1, &d->x, &d->y );
    p448_mul  ( &d->y, &e->a,   &L1 );
    p448_mul  (   &L1, &d->u, &d->t );
    p448_mul  ( &d->x, &e->c,   &L1 );
    p448_add  ( &d->u,   &L0, &d->y );
    p448_sub  ( &d->t, &d->y,   &L0 );
    p448_bias ( &d->t,     2 );
    IF32( p448_weak_reduce( &d->t ) );
    p448_add  ( &d->y, &d->x, &d->z );
    p448_sub  (   &L0, &d->z, &d->x );
    p448_bias (   &L0,     2 );
    IF32( p448_weak_reduce(   &L0 ) );
    p448_mul  ( &d->z,   &L0, &d->y );
    p448_mul  ( &d->x, &d->y, &d->t );
    p448_mul  ( &d->y,   &L0, &d->u );
}

void
add_tw_pniels_to_tw_extensible (
    struct tw_extensible_t*   e,
    const struct tw_pniels_t* a
) {
    struct p448_t L0;
    p448_mul  (   &L0, &e->z, &a->z );
    p448_copy ( &e->z,   &L0 );
    add_tw_niels_to_tw_extensible(     e, &a->n );
}

void
sub_tw_pniels_from_tw_extensible (
    struct tw_extensible_t*   e,
    const struct tw_pniels_t* a
) {
    struct p448_t L0;
    p448_mul  (   &L0, &e->z, &a->z );
    p448_copy ( &e->z,   &L0 );
    sub_tw_niels_from_tw_extensible(     e, &a->n );
}

void
double_tw_extensible (
    struct tw_extensible_t* a
) {
    struct p448_t L0, L1, L2;
    p448_sqr  (   &L2, &a->x );
    p448_sqr  (   &L0, &a->y );
    p448_add  ( &a->u,   &L2,   &L0 );
    p448_add  ( &a->t, &a->y, &a->x );
    p448_sqr  (   &L1, &a->t );
    p448_sub  ( &a->t,   &L1, &a->u );
    p448_bias ( &a->t,     3 );
    IF32( p448_weak_reduce( &a->t ) );
    p448_sub  (   &L1,   &L0,   &L2 );
    p448_bias (   &L1,     2 );
    IF32( p448_weak_reduce(   &L1 ) );
    p448_sqr  ( &a->x, &a->z );
    p448_bias ( &a->x,     2-is32 /*is32 ? 1 : 2*/ );
    p448_add  ( &a->z, &a->x, &a->x );
    p448_sub  (   &L0, &a->z,   &L1 );
    IF32( p448_weak_reduce(   &L0 ) );
    p448_mul  ( &a->z,   &L1,   &L0 );
    p448_mul  ( &a->x,   &L0, &a->t );
    p448_mul  ( &a->y,   &L1, &a->u );
}

void
double_extensible (
    struct extensible_t* a
) {
    struct p448_t L0, L1, L2;
    p448_sqr  (   &L2, &a->x );
    p448_sqr  (   &L0, &a->y );
    p448_add  (   &L1,   &L2,   &L0 );
    p448_add  ( &a->t, &a->y, &a->x );
    p448_sqr  ( &a->u, &a->t );
    p448_sub  ( &a->t, &a->u,   &L1 );
    p448_bias ( &a->t,     3 );
    IF32( p448_weak_reduce( &a->t ) );
    p448_sub  ( &a->u,   &L0,   &L2 );
    p448_bias ( &a->u,     2 );
    IF32( p448_weak_reduce( &a->u ) );
    p448_sqr  ( &a->x, &a->z );
    p448_bias ( &a->x,     2 );
    p448_add  ( &a->z, &a->x, &a->x );
    p448_sub  (   &L0, &a->z,   &L1 );
    IF32( p448_weak_reduce(   &L0 ) );
    p448_mul  ( &a->z,   &L1,   &L0 );
    p448_mul  ( &a->x,   &L0, &a->t );
    p448_mul  ( &a->y,   &L1, &a->u );
}

void
twist_and_double (
    struct tw_extensible_t*    b,
    const struct extensible_t* a
) {
    struct p448_t L0;
    p448_sqr  ( &b->x, &a->x );
    p448_sqr  ( &b->z, &a->y );
    p448_add  ( &b->u, &b->x, &b->z );
    p448_add  ( &b->t, &a->y, &a->x );
    p448_sqr  (   &L0, &b->t );
    p448_sub  ( &b->t,   &L0, &b->u );
    p448_bias ( &b->t,     3 );
    IF32( p448_weak_reduce( &b->t ) );
    p448_sub  (   &L0, &b->z, &b->x );
    p448_bias (   &L0,     2 );
    IF32( p448_weak_reduce(   &L0 ) );
    p448_sqr  ( &b->x, &a->z );
    p448_bias ( &b->x,     2 );
    p448_add  ( &b->z, &b->x, &b->x );
    p448_sub  ( &b->y, &b->z, &b->u );
    IF32( p448_weak_reduce( &b->y ) );
    p448_mul  ( &b->z,   &L0, &b->y );
    p448_mul  ( &b->x, &b->y, &b->t );
    p448_mul  ( &b->y,   &L0, &b->u );
}

void
untwist_and_double (
    struct extensible_t*          b,
    const struct tw_extensible_t* a
) {
    struct p448_t L0;
    p448_sqr  ( &b->x, &a->x );
    p448_sqr  ( &b->z, &a->y );
    p448_add  (   &L0, &b->x, &b->z );
    p448_add  ( &b->t, &a->y, &a->x );
    p448_sqr  ( &b->u, &b->t );
    p448_sub  ( &b->t, &b->u,   &L0 );
    p448_bias ( &b->t,     3 );
    IF32( p448_weak_reduce( &b->t ) );
    p448_sub  ( &b->u, &b->z, &b->x );
    p448_bias ( &b->u,     2 );
    IF32( p448_weak_reduce( &b->u ) );
    p448_sqr  ( &b->x, &a->z );
    p448_bias ( &b->x,     2-is32 /*is32 ? 1 : 2*/ );
    p448_add  ( &b->z, &b->x, &b->x );
    p448_sub  ( &b->y, &b->z, &b->u );
    IF32( p448_weak_reduce( &b->y ) );
    p448_mul  ( &b->z,   &L0, &b->y );
    p448_mul  ( &b->x, &b->y, &b->t );
    p448_mul  ( &b->y,   &L0, &b->u );
}

void
convert_tw_affine_to_tw_pniels (
    struct tw_pniels_t*       b,
    const struct tw_affine_t* a
) {
    p448_sub  ( &b->n.a, &a->y, &a->x );
    p448_bias ( &b->n.a,     2 );
    p448_weak_reduce( &b->n.a );
    p448_add  ( &b->n.b, &a->x, &a->y );
    p448_weak_reduce( &b->n.b );
    p448_mul  ( &b->n.c, &a->y, &a->x );
    p448_mulw ( &b->z, &b->n.c, 78164 );
    p448_neg  ( &b->n.c, &b->z );
    p448_bias ( &b->n.c,     2 );
    p448_weak_reduce( &b->n.c );
    p448_set_ui( &b->z,     2 );
}

void
convert_tw_affine_to_tw_extensible (
    struct tw_extensible_t*   b,
    const struct tw_affine_t* a
) {
    p448_copy ( &b->x, &a->x );
    p448_copy ( &b->y, &a->y );
    p448_set_ui( &b->z,     1 );
    p448_copy ( &b->t, &a->x );
    p448_copy ( &b->u, &a->y );
}

void
convert_affine_to_extensible (
    struct extensible_t*   b,
    const struct affine_t* a
) {
    p448_copy ( &b->x, &a->x );
    p448_copy ( &b->y, &a->y );
    p448_set_ui( &b->z,     1 );
    p448_copy ( &b->t, &a->x );
    p448_copy ( &b->u, &a->y );
}

void
convert_tw_extensible_to_tw_pniels (
    struct tw_pniels_t*           b,
    const struct tw_extensible_t* a
) {
    p448_sub  ( &b->n.a, &a->y, &a->x );
    p448_bias ( &b->n.a,     2 );
    p448_weak_reduce( &b->n.a );
    p448_add  ( &b->n.b, &a->x, &a->y );
    p448_weak_reduce( &b->n.b );
    p448_mul  ( &b->n.c, &a->u, &a->t );
    p448_mulw ( &b->z, &b->n.c, 78164 );
    p448_neg  ( &b->n.c, &b->z );
    p448_bias ( &b->n.c,     2 );
    p448_weak_reduce( &b->n.c );
    p448_add  ( &b->z, &a->z, &a->z );
    p448_weak_reduce( &b->z );
}

void
convert_tw_pniels_to_tw_extensible (
    struct tw_extensible_t*   e,
    const struct tw_pniels_t* d
) {
    p448_add  ( &e->u, &d->n.b, &d->n.a );
    p448_sub  ( &e->t, &d->n.b, &d->n.a );
    p448_bias ( &e->t,     2 );
    IF32( p448_weak_reduce( &e->t ) );
    p448_mul  ( &e->x, &d->z, &e->t );
    p448_mul  ( &e->y, &d->z, &e->u );
    p448_sqr  ( &e->z, &d->z );
}

void
convert_tw_niels_to_tw_extensible (
    struct tw_extensible_t*  e,
    const struct tw_niels_t* d
) {
    p448_add  ( &e->y, &d->b, &d->a );
    p448_weak_reduce( &e->y );
    p448_sub  ( &e->x, &d->b, &d->a );
    p448_bias ( &e->x,     2 );
    p448_weak_reduce( &e->x );
    p448_set_ui( &e->z,     1 );
    p448_copy ( &e->t, &e->x );
    p448_copy ( &e->u, &e->y );
}

void
montgomery_step (
    struct montgomery_t* a
) {
    struct p448_t L0, L1;
    p448_add  (   &L0, &a->zd, &a->xd );
    p448_sub  (   &L1, &a->xd, &a->zd );
    p448_bias (   &L1,     2 );
    IF32( p448_weak_reduce(   &L1 ) );
    p448_sub  ( &a->zd, &a->xa, &a->za );
    p448_bias ( &a->zd,     2 );
    IF32( p448_weak_reduce( &a->zd ) );
    p448_mul  ( &a->xd,   &L0, &a->zd );
    p448_add  ( &a->zd, &a->za, &a->xa );
    p448_mul  ( &a->za,   &L1, &a->zd );
    p448_add  ( &a->xa, &a->za, &a->xd );
    p448_sqr  ( &a->zd, &a->xa );
    p448_mul  ( &a->xa, &a->z0, &a->zd );
    p448_sub  ( &a->zd, &a->xd, &a->za );
    p448_bias ( &a->zd,     2 );
    IF32( p448_weak_reduce( &a->zd ) );
    p448_sqr  ( &a->za, &a->zd );
    p448_sqr  ( &a->xd,   &L0 );
    p448_sqr  (   &L0,   &L1 );
    p448_mulw ( &a->zd, &a->xd, 39082 );
    p448_sub  (   &L1, &a->xd,   &L0 );
    p448_bias (   &L1,     2 );
    IF32( p448_weak_reduce(   &L1 ) );
    p448_mul  ( &a->xd,   &L0, &a->zd );
    p448_sub  (   &L0, &a->zd,   &L1 );
    p448_bias (   &L0,     4 - 2*is32 /*is32 ? 2 : 4*/ );
    IF32( p448_weak_reduce(   &L0 ) );
    p448_mul  ( &a->zd,   &L0,   &L1 );
}

void
deserialize_montgomery (
    struct montgomery_t* a,
    const struct p448_t* sbz
) {
    p448_sqr  ( &a->z0,   sbz );
    p448_set_ui( &a->xd,     1 );
    p448_set_ui( &a->zd,     0 );
    p448_set_ui( &a->xa,     1 );
    p448_copy ( &a->za, &a->z0 );
}

mask_t
serialize_montgomery (
    struct p448_t*             b,
    const struct montgomery_t* a,
    const struct p448_t*       sbz
) {
    mask_t L4, L5, L6;
    struct p448_t L0, L1, L2, L3;
    p448_mul  (   &L3, &a->z0, &a->zd );
    p448_sub  (   &L1,   &L3, &a->xd );
    p448_bias (   &L1,     2 );
    IF32( p448_weak_reduce(   &L1 ) );
    p448_mul  (   &L3, &a->za,   &L1 );
    p448_mul  (   &L2, &a->z0, &a->xd );
    p448_sub  (   &L1,   &L2, &a->zd );
    p448_bias (   &L1,     2 );
    IF32( p448_weak_reduce(   &L1 ) );
    p448_mul  (   &L0, &a->xa,   &L1 );
    p448_add  (   &L2,   &L0,   &L3 );
    p448_sub  (   &L1,   &L3,   &L0 );
    p448_bias (   &L1,     2 );
    IF32( p448_weak_reduce(   &L1 ) );
    p448_mul  (   &L3,   &L1,   &L2 );
    p448_copy (   &L2, &a->z0 );
    p448_addw (   &L2,     1 );
    p448_sqr  (   &L1,   &L2 );
    p448_mulw (   &L2,   &L1, 39082 );
    p448_neg  (   &L1,   &L2 );
    p448_add  (   &L2, &a->z0, &a->z0 );
    p448_bias (   &L2,     1 );
    p448_add  (   &L0,   &L2,   &L2 );
    p448_add  (   &L2,   &L0,   &L1 );
    IF32( p448_weak_reduce(   &L2 ) );
    p448_mul  (   &L0, &a->xd,   &L2 );
       L5 = p448_is_zero( &a->zd );
       L6 = -   L5;
    p448_mask (   &L1,   &L0,    L5 );
    p448_add  (   &L2,   &L1, &a->zd );
       L4 = ~   L5;
    p448_mul  (   &L1,   sbz,   &L3 );
    p448_addw (   &L1,    L6 );
    p448_mul  (   &L3,   &L2,   &L1 );
    p448_mul  (   &L1,   &L3,   &L2 );
    p448_mul  (   &L2,   &L3, &a->xd );
    p448_mul  (   &L3,   &L1,   &L2 );
    p448_isr  (   &L0,   &L3 );
    p448_mul  (   &L2,   &L1,   &L0 );
    p448_sqr  (   &L1,   &L0 );
    p448_mul  (   &L0,   &L3,   &L1 );
    p448_mask (     b,   &L2,    L4 );
    p448_subw (   &L0,     1 );
    p448_bias (   &L0,     1 );
       L5 = p448_is_zero(   &L0 );
       L4 = p448_is_zero(   sbz );
    return    L5 |    L4;
}

void
serialize_extensible (
    struct p448_t*             b,
    const struct extensible_t* a
) {
    struct p448_t L0, L1, L2;
    p448_sub  (   &L0, &a->y, &a->z );
    p448_bias (   &L0,     2 );
    IF32( p448_weak_reduce(   &L0 ) );
    p448_add  (     b, &a->z, &a->y );
    p448_mul  (   &L1, &a->z, &a->x );
    p448_mul  (   &L2,   &L0,   &L1 );
    p448_mul  (   &L1,   &L2,   &L0 );
    p448_mul  (   &L0,   &L2,     b );
    p448_mul  (   &L2,   &L1,   &L0 );
    p448_isr  (   &L0,   &L2 );
    p448_mul  (     b,   &L1,   &L0 );
    p448_sqr  (   &L1,   &L0 );
    p448_mul  (   &L0,   &L2,   &L1 );
}

void
untwist_and_double_and_serialize (
    struct p448_t*                b,
    const struct tw_extensible_t* a
) {
    struct p448_t L0, L1, L2, L3;
    p448_mul  (   &L3, &a->y, &a->x );
    p448_add  (     b, &a->y, &a->x );
    p448_sqr  (   &L1,     b );
    p448_add  (   &L2,   &L3,   &L3 );
    p448_sub  (     b,   &L1,   &L2 );
    p448_bias (     b,     3 );
    IF32( p448_weak_reduce(     b ) );
    p448_sqr  (   &L2, &a->z );
    p448_sqr  (   &L1,   &L2 );
    p448_add  (   &L2,     b,     b );
    p448_mulw (     b,   &L2, 39082 );
    p448_neg  (   &L2,     b );
    p448_bias (   &L2,     2 );
    p448_mulw (   &L0,   &L2, 39082 );
    p448_neg  (     b,   &L0 );
    p448_bias (     b,     2 );
    p448_mul  (   &L0,   &L2,   &L1 );
    p448_mul  (   &L2,     b,   &L0 );
    p448_isr  (   &L0,   &L2 );
    p448_mul  (   &L1,     b,   &L0 );
    p448_sqr  (     b,   &L0 );
    p448_mul  (   &L0,   &L2,     b );
    p448_mul  (     b,   &L1,   &L3 );
}

void
twist_even (
    struct tw_extensible_t*    b,
    const struct extensible_t* a
) {
    mask_t L0, L1;
    p448_sqr  ( &b->y, &a->z );
    p448_sqr  ( &b->z, &a->x );
    p448_sub  ( &b->u, &b->y, &b->z );
    p448_bias ( &b->u,     2 );
    IF32( p448_weak_reduce( &b->u ) );
    p448_sub  ( &b->z, &a->z, &a->x );
    p448_bias ( &b->z,     2 );
    IF32( p448_weak_reduce( &b->z ) );
    p448_mul  ( &b->y, &b->z, &a->y );
    p448_sub  ( &b->z, &a->z, &a->y );
    p448_bias ( &b->z,     2 );
    IF32( p448_weak_reduce( &b->z ) );
    p448_mul  ( &b->x, &b->z, &b->y );
    p448_mul  ( &b->t, &b->x, &b->u );
    p448_mul  ( &b->y, &b->x, &b->t );
    p448_isr  ( &b->t, &b->y );
    p448_mul  ( &b->u, &b->x, &b->t );
    p448_sqr  ( &b->x, &b->t );
    p448_mul  ( &b->t, &b->y, &b->x );
    p448_mul  ( &b->x, &a->x, &b->u );
    p448_mul  ( &b->y, &a->y, &b->u );
       L1 = p448_is_zero( &b->z );
       L0 = -   L1;
    p448_addw ( &b->y,    L0 );
    p448_weak_reduce( &b->y );
    p448_set_ui( &b->z,     1 );
    p448_copy ( &b->t, &b->x );
    p448_copy ( &b->u, &b->y );
}

void
test_only_twist (
    struct tw_extensible_t*    b,
    const struct extensible_t* a
) {
    mask_t L2, L3;
    struct p448_t L0, L1;
    p448_sqr  ( &b->u, &a->z );
    p448_sqr  ( &b->y, &a->x );
    p448_sub  ( &b->z, &b->u, &b->y );
    p448_bias ( &b->z,     2 );
    p448_add  ( &b->y, &b->z, &b->z );
    p448_add  ( &b->u, &b->y, &b->y );
    IF32( p448_weak_reduce( &b->u ) );
    p448_sub  ( &b->y, &a->z, &a->x );
    p448_bias ( &b->y,     2 );
    IF32( p448_weak_reduce( &b->y ) );
    p448_mul  ( &b->x, &b->y, &a->y );
    p448_sub  ( &b->z, &a->z, &a->y );
    p448_bias ( &b->z,     2 );
    IF32( p448_weak_reduce( &b->z ) );
    p448_mul  ( &b->t, &b->z, &b->x );
    p448_mul  (   &L1, &b->t, &b->u );
    p448_mul  ( &b->x, &b->t,   &L1 );
    p448_isr  (   &L0, &b->x );
    p448_mul  ( &b->u, &b->t,   &L0 );
    p448_sqr  (   &L1,   &L0 );
    p448_mul  ( &b->t, &b->x,   &L1 );
    p448_add  (   &L1, &a->y, &a->x );
    IF32( p448_weak_reduce(   &L1 ) );
    p448_sub  (   &L0, &a->x, &a->y );
    p448_bias (   &L0,     2 );
    IF32( p448_weak_reduce(   &L0 ) );
    p448_mul  ( &b->x, &b->t,   &L0 );
    p448_add  (   &L0, &b->x,   &L1 );
    p448_sub  ( &b->t,   &L1, &b->x );
    p448_bias ( &b->t,     2 );
    IF32( p448_weak_reduce( &b->t ) );
    p448_mul  ( &b->x,   &L0, &b->u );
       L2 = p448_is_zero( &b->y );
       L3 = -   L2;
    p448_addw ( &b->x,    L3 );
    p448_weak_reduce( &b->x );
    p448_mul  ( &b->y, &b->t, &b->u );
       L2 = p448_is_zero( &b->z );
       L3 = -   L2;
    p448_addw ( &b->y,    L3 );
    p448_weak_reduce( &b->y );
       L3 = p448_is_zero( &a->y );
       L2 =    L3 +     1;
    p448_set_ui( &b->z,    L2 );
    p448_copy ( &b->t, &b->x );
    p448_copy ( &b->u, &b->y );
}

mask_t
is_square (
    const struct p448_t* x
) {
    mask_t L2, L3;
    struct p448_t L0, L1;
    p448_isr  (   &L0,     x );
    p448_sqr  (   &L1,   &L0 );
    p448_mul  (   &L0,     x,   &L1 );
    p448_subw (   &L0,     1 );
    p448_bias (   &L0,     1 );
       L3 = p448_is_zero(   &L0 );
       L2 = p448_is_zero(     x );
    return    L3 |    L2;
}

mask_t
is_even_pt (
    const struct extensible_t* a
) {
    struct p448_t L0, L1, L2;
    p448_sqr  (   &L2, &a->z );
    p448_sqr  (   &L1, &a->x );
    p448_sub  (   &L0,   &L2,   &L1 );
    p448_bias (   &L0,     2 );
    p448_weak_reduce(   &L0 );
    return is_square (   &L0 );
}

mask_t
is_even_tw (
    const struct tw_extensible_t* a
) {
    struct p448_t L0, L1, L2;
    p448_sqr  (   &L2, &a->z );
    p448_sqr  (   &L1, &a->x );
    p448_add  (   &L0,   &L1,   &L2 );
    p448_weak_reduce(   &L0 );
    return is_square (   &L0 );
}

mask_t
deserialize_affine (
    struct affine_t*     a,
    const struct p448_t* sz
) {
    struct p448_t L0, L1, L2, L3;
    p448_sqr  (   &L1,    sz );
    p448_copy (   &L3,   &L1 );
    p448_addw (   &L3,     1 );
    p448_sqr  ( &a->x,   &L3 );
    p448_mulw (   &L3, &a->x, 39082 );
    p448_neg  ( &a->x,   &L3 );
    p448_add  (   &L3,   &L1,   &L1 );
    p448_bias (   &L3,     1 );
    p448_add  ( &a->y,   &L3,   &L3 );
    p448_add  (   &L3, &a->y, &a->x );
    IF32( p448_weak_reduce(   &L3 ) );
    p448_copy ( &a->y,   &L1 );
    p448_subw ( &a->y,     1 );
    p448_neg  ( &a->x, &a->y );
    p448_bias ( &a->x,     2 );
    IF32( p448_weak_reduce( &a->x ) );
    p448_mul  ( &a->y, &a->x,   &L3 );
    p448_sqr  (   &L2, &a->x );
    p448_mul  (   &L0,   &L2, &a->y );
    p448_mul  ( &a->y, &a->x,   &L0 );
    p448_isr  (   &L3, &a->y );
    p448_mul  ( &a->y,   &L2,   &L3 );
    p448_sqr  (   &L2,   &L3 );
    p448_mul  (   &L3,   &L0,   &L2 );
    p448_mul  (   &L0, &a->x,   &L3 );
    p448_add  (   &L2, &a->y, &a->y );
    p448_mul  ( &a->x,    sz,   &L2 );
    p448_addw (   &L1,     1 );
    p448_mul  ( &a->y,   &L1,   &L3 );
    p448_subw (   &L0,     1 );
    p448_bias (   &L0,     1 );
    return p448_is_zero(   &L0 );
}

mask_t
deserialize_and_twist_approx (
    struct tw_extensible_t* a,
    const struct p448_t*    sdm1,
    const struct p448_t*    sz
) {
    struct p448_t L0, L1;
    p448_sqr  ( &a->z,    sz );
    p448_copy ( &a->y, &a->z );
    p448_addw ( &a->y,     1 );
    p448_sqr  ( &a->x, &a->y );
    p448_mulw ( &a->y, &a->x, 39082 );
    p448_neg  ( &a->x, &a->y );
    p448_add  ( &a->y, &a->z, &a->z );
    p448_bias ( &a->y,     1 );
    p448_add  ( &a->u, &a->y, &a->y );
    p448_add  ( &a->y, &a->u, &a->x );
    IF32( p448_weak_reduce( &a->y ) );
    p448_sqr  ( &a->x, &a->z );
    p448_subw ( &a->x,     1 );
    p448_neg  ( &a->u, &a->x );
    p448_bias ( &a->u,     2 );
    IF32( p448_weak_reduce( &a->u ) );
    p448_mul  ( &a->x,  sdm1, &a->u );
    p448_mul  (   &L0, &a->x, &a->y );
    p448_mul  ( &a->t,   &L0, &a->y );
    p448_mul  ( &a->u, &a->x, &a->t );
    p448_mul  ( &a->t, &a->u,   &L0 );
    p448_mul  ( &a->y, &a->x, &a->t );
    p448_isr  (   &L0, &a->y );
    p448_mul  ( &a->y, &a->u,   &L0 );
    p448_sqr  (   &L1,   &L0 );
    p448_mul  ( &a->u, &a->t,   &L1 );
    p448_mul  ( &a->t, &a->x, &a->u );
    p448_add  ( &a->x,    sz,    sz );
    p448_mul  (   &L0, &a->u, &a->x );
    p448_copy ( &a->x, &a->z );
    p448_subw ( &a->x,     1 );
    p448_neg  (   &L1, &a->x );
    p448_bias (   &L1,     2 );
    IF32( p448_weak_reduce(   &L1 ) );
    p448_mul  ( &a->x,   &L1,   &L0 );
    p448_mul  (   &L0, &a->u, &a->y );
    p448_addw ( &a->z,     1 );
    p448_mul  ( &a->y, &a->z,   &L0 );
    p448_subw ( &a->t,     1 );
    p448_bias ( &a->t,     1 );
    mask_t ret = p448_is_zero( &a->t );
    p448_set_ui( &a->z,     1 );
    p448_copy ( &a->t, &a->x );
    p448_copy ( &a->u, &a->y );
    return ret;
}

void
set_identity_extensible (
    struct extensible_t* a
) {
    p448_set_ui( &a->x,     0 );
    p448_set_ui( &a->y,     1 );
    p448_set_ui( &a->z,     1 );
    p448_set_ui( &a->t,     0 );
    p448_set_ui( &a->u,     0 );
}

void
set_identity_tw_extensible (
    struct tw_extensible_t* a
) {
    p448_set_ui( &a->x,     0 );
    p448_set_ui( &a->y,     1 );
    p448_set_ui( &a->z,     1 );
    p448_set_ui( &a->t,     0 );
    p448_set_ui( &a->u,     0 );
}

void
set_identity_affine (
    struct affine_t* a
) {
    p448_set_ui( &a->x,     0 );
    p448_set_ui( &a->y,     1 );
}

mask_t
eq_affine (
    const struct affine_t* a,
    const struct affine_t* b
) {
    mask_t L1, L2;
    struct p448_t L0;
    p448_sub  (   &L0, &a->x, &b->x );
    p448_bias (   &L0,     2 );
       L2 = p448_is_zero(   &L0 );
    p448_sub  (   &L0, &a->y, &b->y );
    p448_bias (   &L0,     2 );
       L1 = p448_is_zero(   &L0 );
    return    L2 &    L1;
}

mask_t
eq_extensible (
    const struct extensible_t* a,
    const struct extensible_t* b
) {
    mask_t L3, L4;
    struct p448_t L0, L1, L2;
    p448_mul  (   &L2, &b->z, &a->x );
    p448_mul  (   &L1, &a->z, &b->x );
    p448_sub  (   &L0,   &L2,   &L1 );
    p448_bias (   &L0,     2 );
       L4 = p448_is_zero(   &L0 );
    p448_mul  (   &L2, &b->z, &a->y );
    p448_mul  (   &L1, &a->z, &b->y );
    p448_sub  (   &L0,   &L2,   &L1 );
    p448_bias (   &L0,     2 );
       L3 = p448_is_zero(   &L0 );
    return    L4 &    L3;
}

mask_t
eq_tw_extensible (
    const struct tw_extensible_t* a,
    const struct tw_extensible_t* b
) {
    mask_t L3, L4;
    struct p448_t L0, L1, L2;
    p448_mul  (   &L2, &b->z, &a->x );
    p448_mul  (   &L1, &a->z, &b->x );
    p448_sub  (   &L0,   &L2,   &L1 );
    p448_bias (   &L0,     2 );
       L4 = p448_is_zero(   &L0 );
    p448_mul  (   &L2, &b->z, &a->y );
    p448_mul  (   &L1, &a->z, &b->y );
    p448_sub  (   &L0,   &L2,   &L1 );
    p448_bias (   &L0,     2 );
       L3 = p448_is_zero(   &L0 );
    return    L4 &    L3;
}

void
elligator_2s_inject (
    struct affine_t*     a,
    const struct p448_t* r
) {
    mask_t L0, L1;
    struct p448_t L2, L3, L4, L5, L6, L7, L8;
    p448_sqr  ( &a->x,     r );
    p448_sqr  (   &L3, &a->x );
    p448_copy ( &a->y,   &L3 );
    p448_subw ( &a->y,     1 );
    p448_neg  (   &L4, &a->y );
    p448_bias (   &L4,     2 );
    IF32( p448_weak_reduce(   &L4 ) );
    p448_sqr  (   &L2,   &L4 );
    p448_mulw (   &L7,   &L2, 1527402724 );
    p448_mulw (   &L8,   &L3, 6108985600 );
    p448_add  ( &a->y,   &L8,   &L7 );
    IF32( p448_weak_reduce( &a->y ) );
    p448_mulw (   &L8,   &L2, 6109454568 );
    p448_sub  (   &L7, &a->y,   &L8 );
    p448_bias (   &L7,     2 );
    IF32( p448_weak_reduce(   &L7 ) );
    p448_mulw (   &L6, &a->y, 78160 );
    p448_mul  (   &L5,   &L7,   &L6 );
    p448_mul  (   &L8,   &L5,   &L4 );
    p448_mul  (   &L4,   &L5,   &L6 );
    p448_mul  (   &L5,   &L7,   &L8 );
    p448_mul  (   &L8,   &L5,   &L4 );
    p448_mul  (   &L4,   &L7,   &L8 );
    p448_isr  (   &L6,   &L4 );
    p448_mul  (   &L4,   &L5,   &L6 );
    p448_sqr  (   &L5,   &L6 );
    p448_mul  (   &L6,   &L8,   &L5 );
    p448_mul  (   &L8,   &L7,   &L6 );
    p448_mul  (   &L7,   &L8,   &L6 );
    p448_copy (   &L6, &a->x );
    p448_subw (   &L6,     1 );
    p448_addw ( &a->x,     1 );
    p448_mul  (   &L5, &a->x,   &L8 );
    p448_sub  ( &a->x,   &L6,   &L5 );
    p448_bias ( &a->x,     3 );
    IF32( p448_weak_reduce( &a->x ) );
    p448_mul  (   &L5,   &L4, &a->x );
    p448_mulw (   &L4,   &L5, 78160 );
    p448_neg  ( &a->x,   &L4 );
    p448_bias ( &a->x,     2 );
    p448_weak_reduce( &a->x );
    p448_add  (   &L4,   &L3,   &L3 );
    p448_add  (   &L3,   &L4,   &L2 );
    p448_subw (   &L3,     2 );
    p448_bias (   &L3,     1 );
    IF32( p448_weak_reduce(   &L3 ) );
    p448_mul  (   &L2,   &L3,   &L8 );
    p448_mulw (   &L3,   &L2, 3054649120 );
    p448_add  (   &L2,   &L3, &a->y );
    p448_mul  ( &a->y,   &L7,   &L2 );
       L1 = p448_is_zero(   &L8 );
       L0 = -   L1;
    p448_addw ( &a->y,    L0 );
    p448_weak_reduce( &a->y );
}

mask_t
validate_affine (
    const struct affine_t* a
) {
    struct p448_t L0, L1, L2, L3;
    p448_sqr  (   &L0, &a->y );
    p448_sqr  (   &L2, &a->x );
    p448_add  (   &L3,   &L2,   &L0 );
    p448_subw (   &L3,     1 );
    p448_mulw (   &L1,   &L2, 39081 );
    p448_neg  (   &L2,   &L1 );
    p448_bias (   &L2,     2 );
    p448_mul  (   &L1,   &L0,   &L2 );
    p448_sub  (   &L0,   &L3,   &L1 );
    p448_bias (   &L0,     3 );
    return p448_is_zero(   &L0 );
}

mask_t
validate_tw_extensible (
    const struct tw_extensible_t* ext
) {
    mask_t L4, L5;
    struct p448_t L0, L1, L2, L3;
    /*
     * Check invariant:
     * 0 = -x*y + z*t*u
     */
    p448_mul  (   &L1, &ext->t, &ext->u );
    p448_mul  (   &L2, &ext->z,   &L1 );
    p448_addw (   &L2,     0 );
    p448_mul  (   &L0, &ext->x, &ext->y );
    p448_neg  (   &L1,   &L0 );
    p448_add  (   &L0,   &L1,   &L2 );
    p448_bias (   &L0,     2 );
       L5 = p448_is_zero(   &L0 );
    /*
     * Check invariant:
     * 0 = d*t^2*u^2 + x^2 - y^2 + z^2 - t^2*u^2
     */
    p448_sqr  (   &L2, &ext->y );
    p448_neg  (   &L1,   &L2 );
    p448_addw (   &L1,     0 );
    p448_sqr  (   &L0, &ext->x );
    p448_add  (   &L2,   &L0,   &L1 );
    p448_sqr  (   &L3, &ext->u );
    p448_sqr  (   &L0, &ext->t );
    p448_mul  (   &L1,   &L0,   &L3 );
    p448_mulw (   &L0,   &L1, 39081 );
    p448_neg  (   &L3,   &L0 );
    p448_add  (   &L0,   &L3,   &L2 );
    p448_neg  (   &L3,   &L1 );
    p448_add  (   &L2,   &L3,   &L0 );
    p448_sqr  (   &L1, &ext->z );
    p448_add  (   &L0,   &L1,   &L2 );
    p448_bias (   &L0,     4 );
       L4 = p448_is_zero(   &L0 );
    return    L5 &    L4;
}

mask_t
validate_extensible (
    const struct extensible_t* ext
) {
    mask_t L4, L5;
    struct p448_t L0, L1, L2, L3;
    /*
     * Check invariant:
     * 0 = d*t^2*u^2 - x^2 - y^2 + z^2
     */
    p448_sqr  (   &L2, &ext->y );
    p448_neg  (   &L1,   &L2 );
    p448_addw (   &L1,     0 );
    p448_sqr  (   &L0, &ext->z );
    p448_add  (   &L2,   &L0,   &L1 );
    p448_sqr  (   &L3, &ext->u );
    p448_sqr  (   &L0, &ext->t );
    p448_mul  (   &L1,   &L0,   &L3 );
    p448_mulw (   &L3,   &L1, 39081 );
    p448_neg  (   &L0,   &L3 );
    p448_add  (   &L1,   &L0,   &L2 );
    p448_sqr  (   &L0, &ext->x );
    p448_neg  (   &L2,   &L0 );
    p448_add  (   &L0,   &L2,   &L1 );
    p448_bias (   &L0,     4 );
       L5 = p448_is_zero(   &L0 );
    /*
     * Check invariant:
     * 0 = -x*y + z*t*u
     */
    p448_mul  (   &L1, &ext->t, &ext->u );
    p448_mul  (   &L2, &ext->z,   &L1 );
    p448_addw (   &L2,     0 );
    p448_mul  (   &L0, &ext->x, &ext->y );
    p448_neg  (   &L1,   &L0 );
    p448_add  (   &L0,   &L1,   &L2 );
    p448_bias (   &L0,     2 );
       L4 = p448_is_zero(   &L0 );
    return    L5 &    L4;
}


