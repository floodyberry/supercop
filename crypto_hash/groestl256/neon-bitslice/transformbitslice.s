#
#  Groestl bitslice tranformation of the chaining value using ARM NEON.
#
#  @file     transformbitslice.s
#  @author   Martin Schlaeffer <martin.schlaeffer@iaik.tugraz.at>
#
.fpu neon
.text
.align 4
.global __transformbitslice
.global _transformbitslice
__transformbitslice:
_transformbitslice:
vpush {q4,q5,q6,q7}
sub sp,sp,#0

vldm r0, {d8-d15}

veor q0, q0, q0;        veor q1, q1, q1
veor q2, q2, q2;        veor q3, q3, q3

vmov.u8 d16, #1;        vbit d0, d8, d16
vshr.u8 d8, #1;         vbit d1, d8, d16
vshr.u8 d8, #1;         vbit d2, d8, d16
vshr.u8 d8, #1;         vbit d3, d8, d16
vshr.u8 d8, #1;         vbit d4, d8, d16
vshr.u8 d8, #1;         vbit d5, d8, d16
vshr.u8 d8, #1;         vbit d6, d8, d16
vshr.u8 d8, #1;         vbit d7, d8, d16

vshl.u8 d16, #1;        vbit d1, d9, d16
vshr.u8 d17, d9, #1;    vbit d2, d17, d16
vshr.u8 d17, d17, #1;   vbit d3, d17, d16
vshr.u8 d17, d17, #1;   vbit d4, d17, d16
vshr.u8 d17, d17, #1;   vbit d5, d17, d16
vshr.u8 d17, d17, #1;   vbit d6, d17, d16
vshr.u8 d17, d17, #1;   vbit d7, d17, d16
vshl.u8 d17, d9, #1;    vbit d0, d17, d16

vshl.u8 d16, #1;        vbit d2, d10, d16
vshr.u8 d17, d10, #1;   vbit d3, d17, d16
vshr.u8 d17, d17, #1;   vbit d4, d17, d16
vshr.u8 d17, d17, #1;   vbit d5, d17, d16
vshr.u8 d17, d17, #1;   vbit d6, d17, d16
vshr.u8 d17, d17, #1;   vbit d7, d17, d16
vshl.u8 d17, d10, #1;   vbit d1, d17, d16
vshl.u8 d17, d17, #1;   vbit d0, d17, d16

vshl.u8 d16, #1;        vbit d3, d11, d16
vshr.u8 d17, d11, #1;   vbit d4, d17, d16
vshr.u8 d17, d17, #1;   vbit d5, d17, d16
vshr.u8 d17, d17, #1;   vbit d6, d17, d16
vshr.u8 d17, d17, #1;   vbit d7, d17, d16
vshl.u8 d17, d11, #1;   vbit d2, d17, d16
vshl.u8 d17, d17, #1;   vbit d1, d17, d16
vshl.u8 d17, d17, #1;   vbit d0, d17, d16

vshl.u8 d16, #1;        vbit d4, d12, d16
vshr.u8 d17, d12, #1;   vbit d5, d17, d16
vshr.u8 d17, d17, #1;   vbit d6, d17, d16
vshr.u8 d17, d17, #1;   vbit d7, d17, d16
vshl.u8 d17, d12, #1;   vbit d3, d17, d16
vshl.u8 d17, d17, #1;   vbit d2, d17, d16
vshl.u8 d17, d17, #1;   vbit d1, d17, d16
vshl.u8 d17, d17, #1;   vbit d0, d17, d16

vshl.u8 d16, #1;        vbit d5, d13, d16
vshr.u8 d17, d13, #1;   vbit d6, d17, d16
vshr.u8 d17, d17, #1;   vbit d7, d17, d16
vshl.u8 d17, d13, #1;   vbit d4, d17, d16
vshl.u8 d17, d17, #1;   vbit d3, d17, d16
vshl.u8 d17, d17, #1;   vbit d2, d17, d16
vshl.u8 d17, d17, #1;   vbit d1, d17, d16
vshl.u8 d17, d17, #1;   vbit d0, d17, d16

vshl.u8 d16, #1;        vbit d6, d14, d16
vshr.u8 d17, d14, #1;   vbit d7, d17, d16
vshl.u8 d17, d14, #1;   vbit d5, d17, d16
vshl.u8 d17, d17, #1;   vbit d4, d17, d16
vshl.u8 d17, d17, #1;   vbit d3, d17, d16
vshl.u8 d17, d17, #1;   vbit d2, d17, d16
vshl.u8 d17, d17, #1;   vbit d1, d17, d16
vshl.u8 d17, d17, #1;   vbit d0, d17, d16

vshl.u8 d16, #1;        vbit d7, d15, d16
vshl.u8 d17, d15, #1;   vbit d6, d17, d16
vshl.u8 d17, d17, #1;   vbit d5, d17, d16
vshl.u8 d17, d17, #1;   vbit d4, d17, d16
vshl.u8 d17, d17, #1;   vbit d3, d17, d16
vshl.u8 d17, d17, #1;   vbit d2, d17, d16
vshl.u8 d17, d17, #1;   vbit d1, d17, d16
vshl.u8 d17, d17, #1;   vbit d0, d17, d16

vstm r0, {d0-d8}

add sp,sp,#0
vpop {q4,q5,q6,q7}
bx lr
