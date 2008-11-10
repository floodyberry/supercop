dnl  Intel P6 mpn_add_n, mpn_sub_n -- mpn add or subtract.

dnl  Copyright 2003 Free Software Foundation, Inc.
dnl
dnl  This file is part of the GNU MP Library.
dnl
dnl  The GNU MP Library is free software; you can redistribute it and/or
dnl  modify it under the terms of the GNU Lesser General Public License as
dnl  published by the Free Software Foundation; either version 3 of the
dnl  License, or (at your option) any later version.
dnl
dnl  The GNU MP Library is distributed in the hope that it will be useful,
dnl  but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
dnl  Lesser General Public License for more details.
dnl
dnl  You should have received a copy of the GNU Lesser General Public License
dnl  along with the GNU MP Library.  If not, see http://www.gnu.org/licenses/.

include(`../config.m4')


C P6: 2.7 cycles/limb


C The K7 code runs quite well on P6, but this seems mainly due to the larger
C amount of unrolling than in mpn/x86/aors_n.asm.
C
C P6 apparently doesn't separately rename the carry flag, or something, so a
C loop holding a carry across decl or incl takes 4 cycles for the loop
C control.  Perhaps it's more when relying on out-of-order execution to hide
C load latencies too.
C
C Not sure what the best approach would be.  sbbl then addl to save and
C restore the carry across the loop control would be a possibility.  A
C couple of experiments didn't get much joy, but such an approach would at
C least avoid serialization, presumably.
C

MULFUNC_PROLOGUE(mpn_add_n mpn_sub_n)
include_mpn(`x86/k7/aors_n.asm')
