/*
 * CPQREF/params.c
 *
 *  Copyright 2014 John M. Schanck
 *
 *  This file is part of CPQREF.
 *
 *  CPQREF is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  CPQREF is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with CPQREF.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#include "params.h"


static PQ_PARAM_SET pqParamSets[] = {

    {
      DRAFT_401,           /* parameter set id */
      "xxx-20140508-401",  /* human readable name */
      {0xff, 0xff, 0xff},  /* OID */
      9,                   /* bitlength of N */
      18,                  /* bitlength of q */
      401,                 /* ring degree */
      3,                   /* message space prime */
      1<<18,               /* ring modulus */
      240,                 /* max norm of f*a convolution */
      80,                  /* max norm of g*a convolution */
      (1<<17) - 240,       /* q/2 - B_s */
      (1<<17) - 80,        /* q/2 - B_t */
      8,                   /* Product form +1/-1 counts */
      8,
      6,
      416,                 /* # Polynomial coefficients for Karatsuba */
    },

    {
      DRAFT_439,           /* parameter set id */
      "xxx-20140508-439",  /* human readable name */
      {0xff, 0xff, 0xfe},  /* OID */
      9,                   /* bitlength of N */
      19,                  /* bitlength of q */
      439,                 /* ring degree */
      3,                   /* message space prime */
      1<<19,               /* ring modulus */
      264,                 /* max norm of f*a convolution */
      88,                  /* max norm of g*a convolution */
      (1<<18) - 264,       /* q/2 - B_s */
      (1<<18) - 88,        /* q/2 - B_t */
      9,                   /* Product form +1/-1 counts */
      8,
      5,
      448,                 /* # Polynomial coefficients for Karatsuba */
    },

    {
      DRAFT_593,           /* parameter set id */
      "xxx-20140508-593",  /* human readable name */
      {0xff, 0xff, 0xfd},  /* OID */
      10,                  /* bitlength of N */
      19,                  /* bitlength of q */
      593,                 /* ring degree */
      3,                   /* message space prime */
      1<<19,               /* ring modulus */
      300,                 /* max norm of f*a convolution */
      100,                 /* max norm of g*a convolution */
      (1<<18) - 300,       /* q/2 - B_s */
      (1<<18) - 100,       /* q/2 - B_t */
      10,                  /* Product form +1/-1 counts */
      10,
       8,
      608,                 /* # Polynomial coefficients for Karatsuba */
    },

    {
      DRAFT_743,           /* parameter set id */
      "xxx-20140508-743",  /* human readable name */
      {0xff, 0xff, 0xfc},  /* OID */
      10,                  /* bitlength of N */
      20,                  /* bitlength of q */
      743,                 /* ring degree */
      3,                   /* message space prime */
      1<<20,               /* ring modulus */
      336,                 /* max norm of f*a convolution */
      112,                 /* max norm of g*a convolution */
      (1<<19) - 336,       /* q/2 - B_s */
      (1<<19) - 112,       /* q/2 - B_t */
      11,                  /* Product form +1/-1 counts */
      11,
      15,
      768,                 /* # Polynomial coefficients for Karatsuba */
    },
};


static int numParamSets = sizeof(pqParamSets)/sizeof(PQ_PARAM_SET);

PQ_PARAM_SET *
pq_get_param_set_by_id(PQ_PARAM_SET_ID id)
{
  int i;

  for(i=0; i<numParamSets; i++)
  {
    if(pqParamSets[i].id == id)
    {
      return (pqParamSets + i);
    }
  }
  return NULL;
}

PQ_PARAM_SET *
pq_get_param_set_by_oid(const uint8_t *oid)
{
  int i;

  for(i=0; i<numParamSets; i++)
  {
    if (0 == memcmp(pqParamSets[i].OID, oid, 3))
    {
      return (pqParamSets + i);
    }
  }
  return NULL;
}

