/*
 *   MIRACL methods for modular exponentiation
 *   mrpower.c 
 *
 *   Copyright (c) 1988-1999 Shamus Software Ltd.
 */

#include <stdlib.h>

extern "C" {

#include "miracl.h"

BOOL nres_sqroot(_MIPD_ big x,big w)
{ /* w=sqrt(x) mod p. This depends on p being prime! */
    int i,n,e,r,cat;
    BOOL pp;
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    copy(x,mr_mip->w15);
    zero(w);
    if (size(mr_mip->w15)==0)
    {
        zero(w);
        return TRUE;
    }
    if (mr_mip->ERNUM) return FALSE;

    MR_IN(100)

    convert(_MIPP_ 1,w);
    nres(_MIPP_ w,w);
    if (compare(w,mr_mip->w15)==0)
    {
        MR_OUT
        return TRUE;
    }

    cat=remain(_MIPP_ mr_mip->modulus,8);
    switch(cat)
    {
    case 0: case 2: case 4: case 6: 
        zero(w);
        MR_OUT
        return FALSE;

    case 3: case 7:                          /* easy case */
        incr(_MIPP_ mr_mip->modulus,1,mr_mip->w14);
        subdiv(_MIPP_ mr_mip->w14,4,mr_mip->w14);
        nres_powmod(_MIPP_ x,mr_mip->w14,w);
        nres_modmult(_MIPP_ w,w,mr_mip->w14);
        MR_OUT
        if (compare(mr_mip->w14,mr_mip->w15)==0) 
            return TRUE;
        zero(w);
        return FALSE;

    case 5:

        nres_modadd(_MIPP_ mr_mip->w15,mr_mip->w15,mr_mip->w15); /* 2x */
        decr(_MIPP_ mr_mip->modulus,5,mr_mip->w14);
        subdiv(_MIPP_ mr_mip->w14,8,mr_mip->w14);
        nres_powmod(_MIPP_ mr_mip->w15,mr_mip->w14,w);
        nres_modmult(_MIPP_ w,w,mr_mip->w14);
        nres_modmult(_MIPP_ mr_mip->w15,mr_mip->w14,mr_mip->w14);
        convert(_MIPP_ 1,mr_mip->w1);
        nres(_MIPP_ mr_mip->w1,mr_mip->w1);
        nres_modsub(_MIPP_ mr_mip->w14,mr_mip->w1,mr_mip->w14);
        nres_modmult(_MIPP_ mr_mip->w14,w,w);
        if (!subdivisible(_MIPP_ mr_mip->w15,2))
            add(_MIPP_ mr_mip->w15,mr_mip->modulus,mr_mip->w15);
        subdiv(_MIPP_ mr_mip->w15,2,mr_mip->w15);                /* x */
        nres_modmult(_MIPP_ w,mr_mip->w15,w);
        nres_modmult(_MIPP_ w,w,mr_mip->w14);
        MR_OUT
        if (compare(mr_mip->w14,mr_mip->w15)==0) 
            return TRUE;
        zero(w);
        return FALSE;
        
    case 1:                      /* difficult case. Shank's method */

        decr(_MIPP_ mr_mip->modulus,1,mr_mip->w14);
        e=0;
        while (subdivisible(_MIPP_ mr_mip->w14,2))
        {
            subdiv(_MIPP_ mr_mip->w14,2,mr_mip->w14);
            e++;
        }
        for (r=2;;r++)
        {
            convert(_MIPP_ 1,mr_mip->w3);
            nres(_MIPP_ mr_mip->w3,mr_mip->w3);             /* w3=1 */
            nres_powltr(_MIPP_ r,mr_mip->w14,w);
            if (compare(w,mr_mip->w3)==0) continue;
            copy(w,mr_mip->w4);
            nres_negate(_MIPP_ mr_mip->w3,mr_mip->w1);      /* w1 = -1 */
            pp=FALSE;
            for (i=1;i<e;i++)         
            { /* check for composite modulus */
                if (mr_mip->user!=NULL) (*mr_mip->user)();

                if (compare(mr_mip->w4,mr_mip->w1)==0) pp=TRUE;
                nres_modmult(_MIPP_ mr_mip->w4,mr_mip->w4,mr_mip->w4);
                if (!pp && compare(mr_mip->w4,mr_mip->w3)==0)
                {    
                    zero(w);
                    MR_OUT
                    return FALSE;
                }
            }   
            if (compare(mr_mip->w4,mr_mip->w1)==0) break;
            if (!pp)
            {
                zero(w);
                MR_OUT
                return FALSE;
            }
        }                                                /* w= y    */
        copy(mr_mip->w15,mr_mip->w3);                    /* w3 = x  */
        nres_powmod(_MIPP_ mr_mip->w3,mr_mip->w14,mr_mip->w15);  /* w15 = w */
        incr(_MIPP_ mr_mip->w14,1,mr_mip->w14);
        subdiv(_MIPP_ mr_mip->w14,2,mr_mip->w14);
        nres_powmod(_MIPP_ mr_mip->w3,mr_mip->w14,mr_mip->w14);  /* w14 = v */
        forever
        {
            if (mr_mip->user!=NULL) (*mr_mip->user)();

            convert(_MIPP_ 1,mr_mip->w1);
            nres(_MIPP_ mr_mip->w1,mr_mip->w1);
            if (compare(w,mr_mip->w1)==0)  break;
            copy(mr_mip->w15,mr_mip->w2);
            for (n=0;compare(mr_mip->w2,mr_mip->w1)!=0;n++)
                nres_modmult(_MIPP_ mr_mip->w2,mr_mip->w2,mr_mip->w2);
            if (n>=e)
            {
                zero(w);
                MR_OUT
                return FALSE;
            }
            r=e-n-1;
            for (i=0;i<r;i++) nres_modmult(_MIPP_ w,w,w);
            nres_modmult(_MIPP_ mr_mip->w14,w,mr_mip->w14);
            nres_modmult(_MIPP_ w,w,w);
            nres_modmult(_MIPP_ mr_mip->w15,w,mr_mip->w15);
            e=n;
        }
        copy(mr_mip->w14,w);
        nres_modmult(_MIPP_ w,w,mr_mip->w14);
        MR_OUT
        if (compare(mr_mip->w14,mr_mip->w3)==0) 
            return TRUE;
        zero(w);
        return FALSE;
        
    }
    return FALSE;
}

BOOL sqroot(_MIPD_ big x,big p,big w)
{ /* w = sqrt(x) mod p */
#ifdef MR_OS_THREADS
    miracl *mr_mip=get_mip();
#endif
    if (mr_mip->ERNUM) return FALSE;

    MR_IN(101)

    if (subdivisible(_MIPP_ p,2))
    { /* p must be odd */
        zero(w);
        MR_OUT
        return FALSE;
    }
    prepare_monty(_MIPP_ p);
    nres(_MIPP_ x,mr_mip->w15);
    if (nres_sqroot(_MIPP_ mr_mip->w15,w))
    {
        redc(_MIPP_ w,w);
        MR_OUT
        return TRUE;
    }
    zero(w);
    MR_OUT
    return FALSE;
}
}

