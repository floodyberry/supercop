/* vperm-neon.S     April 2012
 * Groestl optimized for ARM using NEON instructions.
 * Author: Severin Holzer-Graf
 * EMail: s.holzer-graf@student.tugraz.at
 *
 * This code is placed in the public domain
 */

#define RND_CONST_L0 r7
#define RND_CONST_Lx r8
#define RND_CONST_L7 r9
.syntax unified
.file "vperm-neon.S"

#------------------------------------------------------------------------------
.section .rodata
.align 15

#Transformation constants
vperm_inv_0: .word 0x0F0B0780, 0x01040A06, 0x02050809, 0x030D0E0C
vperm_inv_1: .word 0x0D080180, 0x0E05060F, 0x0A0B0C02, 0x04070309

#Lookup tables for lookup for factor 1, 2, 4
vperm_sb1_0: .word 0xFAE22300, 0x3618D415, 0x0D2ED9EF, 0x3BF7CCC1
vperm_sb1_1: .word 0xCB503E00, 0xB19BE18F, 0x142AF544, 0xA5DF7A6E

#Not needed anymore, left just for information.
/*
vperm_sb2_0: .word 0x0AE12900, 0x69EB8840, 0xAB82234A, 0xC2A163C8
vperm_sb2_1: .word 0x0B712400, 0xE27A93C6, 0xBC982FCD, 0x5EB7E955

vperm_sb4_0: .word 0xC393EA00, 0x3D50AED7, 0x876D2914, 0xBA44FE79
vperm_sb4_1: .word 0x3FD64100, 0xE1E937A0, 0x49087E9F, 0xA876DE97
*/

#vperm mul2
vperm_mul2_0: .word 0x728efc00,	0x6894e61a, 0x3fc3b14d, 0x25d9ab57
vperm_mul2_1: .word 0xfd5ba600,	0x2a8c71d7, 0x1eb845e3,	0xc96f9234


#Input transformation
vperm_ipt_0: .word 0x317C4D00, 0x4C01307D, 0xB0FDCC81, 0xCD80B1FC
vperm_ipt_1: .word 0x5A2A7000, 0xC2B2E898, 0x52227808, 0xCABAE090

#Output transformation
vperm_opt_0: .word 0x50bcec00, 0x01edbd51, 0xb05c0ce0, 0xe10d5db1
vperm_opt_1: .word 0xd6b66000, 0xff9f4929, 0xdebe6808, 0xf7974121

#Base Round constants
#These are used later for transformation
round_const_base_L0:
             .byte 0x00, 0x10, 0x20, 0x30, 0x40, 0x50, 0x60, 0x70 @L0 const for P
             .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff @L0 const for Q
round_const_base_Lx:
             .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
             .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
round_const_base_L7:
             .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
             .byte 0xff, 0xef, 0xdf, 0xcf, 0xbf, 0xaf, 0x9f, 0x8f

#Is used as incrementor for the round constants for p. By using \
# vswp it is used for Q as well.
round_const_add:
             .byte 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
             .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

.align 15 
.lcomm TEMP_Q, 16*8          @Temporary storage for q registers.
.lcomm ROUND_CONST_Lx, 16    @RoundConst for middle rows gets saved there.
.lcomm ROUND_CONST_L0, 16*10 @RoundConst for first row.
.lcomm ROUND_CONST_L7, 16*10 @RoundConst for last row.
.lcomm tmp_mix_bytes, 16     @temp storage for MixBytes.

#------------------------------------------------------------------------------
#Start of text
.section .text
.align 4
.arm

###############################################################################
# Concatenation macros are following.
# These macros are used to expand from q to d registers for example.
# This is performed by using altmacro.

#------------------------------------------------------------------------------
# Concatenates 3 operands.
.macro concat_op op,prefix,a,b,c
  .noaltmacro
  \op \prefix\a, \b, \prefix\c
.endm

#------------------------------------------------------------------------------
# Concatenates 2 operands.
.macro concat_op2 op,prefix,a,b
  .noaltmacro
  \op \prefix\a, \prefix\b
.endm

#------------------------------------------------------------------------------
# Concats the vext instruction
.macro concat_vext dst:req first:req second:req imm:req
  .noaltmacro
  vext.8 d\dst, d\first, d\second, #\imm
.endm


#-----------------------------------------------------------------------------
# Expands to a vtbl instruction for the two d registers of one q reg.
.macro vtbl_q dest:req, op:req, mask:req, q_tmp
  .LdestLo = \dest * 2
  .LmaskLo = \mask * 2
  .LdestHi = \dest * 2 + 1
  .LmaskHi = \mask * 2 + 1

  .if \dest == \op
    vmov q\q_tmp, q\op @should be conditional

    .altmacro
    concat_op vtbl.8, d, %.LdestLo, {q\q_tmp}, %.LmaskLo
    .altmacro
    concat_op vtbl.8, d, %.LdestHi, {q\q_tmp}, %.LmaskHi
    .noaltmacro
  .else
    .altmacro
    concat_op vtbl.8, d, %.LdestLo, {q\op}, %.LmaskLo
    .altmacro
    concat_op vtbl.8, d, %.LdestHi, {q\op}, %.LmaskHi
    .noaltmacro
  .endif
.endm

#-----------------------------------------------------------------------------
.macro vtbl_qLo dest:req, op:req, mask:req
  .LdestLo = \dest * 2
  .LmaskLo = \mask * 2

 .altmacro
 concat_op vtbl.8, d, %.LdestLo, {q\op}, %.LmaskLo
.endm

#-----------------------------------------------------------------------------
.macro vtbl_qHi dest:req, op:req, mask:req
  .LdestHi = \dest * 2 + 1
  .LmaskHi = \mask * 2 + 1

 .altmacro
  concat_op vtbl.8, d, %.LdestHi, {q\op}, %.LmaskHi
.endm


#------------------------------------------------------------------------------
# Applies the vtrn instruction for an q register.
.macro vtrn_q vec:req size:req
  .LvecLo = \vec * 2
  .LvecHi = \vec * 2 + 1
  .altmacro
  concat_op2 vtrn.\size, d, %.LvecLo, %.LvecHi
.endm

#------------------------------------------------------------------------------
.macro vtrn_d_interleaved size:req vec0:req vec1:req
  .LvecLo0 = \vec0 * 2
  .LvecLo1 = \vec1 * 2

  .LvecHi0 = \vec0 * 2 + 1
  .LvecHi1 = \vec1 * 2 + 1

  .altmacro
  concat_op2 vtrn.\size, d, %.LvecLo0, %.LvecLo1
  .altmacro
  concat_op2 vtrn.\size, d, %.LvecHi0, %.LvecHi1
.endm

#-----------------------------------------------------------------------------
# Macro concatenate the vld instruction

.macro concat_vld op:req, dest1:req, dest2:req, arm_reg:vararg
  .noaltmacro
  \op {d\dest1, d\dest2}, \arm_reg
.endm

#-----------------------------------------------------------------------------
# Macro to concatenate the vld or vst instruction.

.macro V_LOAD_STORE op:req, q_reg:req, arm_reg:vararg

  .LdestLo = \q_reg * 2
  .LdestHi = \q_reg * 2 + 1

  .altmacro
  concat_vld \op, %.LdestLo, %.LdestHi, \arm_reg
.endm


#----------------------------------------------------------------------------
# vld1q/vst1q
# Expands to a vst1/vld1 instruction which two d regs in the list.

.macro vld1q q_reg, arm_reg:vararg
  V_LOAD_STORE vld1.8, \q_reg, \arm_reg
.endm

.macro vst1q q_reg, arm_reg:vararg
  V_LOAD_STORE vst1.8, \q_reg, \arm_reg
.endm


###############################################################################
# Matrix transformation macros
# These macros are used for various matrix transformations in the input
# and output transformation functions.

#------------------------------------------------------------------------------
# This macro puts one row of P and one row of Q in one q reg.
# inputs are 8 q regs, with each w columns of P or Q in it.
# a0-a3: P
# b0-b3: Q
# output: row0: a0
#         row1: b0
#         row2: a1
#         row3: b1
#         row4: a2
#         row5: b2
#         row6: a3
#         row7: b3
# The swapping could be technically omitted, but usage of the whole programm is
# easier with rows in correct order.

.macro MATRIX_TRANSPOSE_B a0:req a1:req a2:req a3:req b0:req b1:req b2:req b3:req
  swap_hi_lo \a0, \b0
  swap_hi_lo \a1, \b1
  swap_hi_lo \a2, \b2
  swap_hi_lo \a3, \b3

  vswp q\a1, q\b0
  vswp q\a2, q\b0
  vswp q\a3, q\b1
  vswp q\b1, q\b2
.endm

#------------------------------------------------------------------------------
# inputs: a0-a7: P|Q
# outputs:
#        p0: a0
#        p1: a2
#        p2: a4
#        p3: a6
#
#        q0: a1
#        q1: a3
#        q2: a5
#        q3: a7
.macro MATRIX_TRANSPOSE_B_INV a0:req a1:req a2:req a3:req a4:req a5:req a6:req a7:req
  swap_hi_lo \a0, \a1
  swap_hi_lo \a2, \a3
  swap_hi_lo \a4, \a5
  swap_hi_lo \a6, \a7
.endm

#------------------------------------------------------------------------------
# Loads the necessary constants for the input transformation.
.macro SET_INPUT_TRANSFORM_CONSTS  q_0x0f:req q_ipt0:req q_ipt1:req r_tmp0:req \
                                  r_tmp1:req
  vmov.i8 q\q_0x0f, #0x0f
  ldr    r\r_tmp1, =vperm_ipt_0
  vldm   r\r_tmp1, {q\q_ipt0, q\q_ipt1}
.endm

#------------------------------------------------------------------------------
# Loads the necessary constants for the output transformation.
.macro SET_OUTPUT_TRANSFORM_CONSTS  q_0x0f:req q_opt0:req q_opt1:req r_tmp0:req \
                                  r_tmp1:req
  vmov.i8 q\q_0x0f, #0x0f
  ldr    r\r_tmp1, =vperm_opt_0
  vldm   r\r_tmp1, {q\q_opt0, q\q_opt1}
.endm

#------------------------------------------------------------------------------
# Transforms two input rows into vperm field.
# input: a0, a1
# ouput: a0, a1
# prequesits: q_0x0f, q_ipt0, q_ipt1
.macro TRANSFORM_INPUT a0:req a1:req q_0x0f:req q_ipt0:req q_ipt1:req q_tmp0:req \
                       q_tmp1:req q_tmp2:req q_tmp3:req q_vtbl_clobber:req
  #vbic     q\q_tmp0,  q\a0, q\q_0x0f
  #vbic     q\q_tmp1,  q\a1, q\q_0x0f
  vshr.u8 q\q_tmp0, q\a0, #4
  vshr.u8 q\q_tmp1, q\a1, #4
  vand    q\a0, q\a0, q\q_0x0f
  vand    q\a1, q\a1, q\q_0x0f

  vtbl_q \q_tmp2, \q_ipt1, \a0
  vtbl_q \q_tmp3, \q_ipt1, \a1

  vtbl_q \a0, \q_ipt0, \q_tmp0
  vtbl_q \a1, \q_ipt0, \q_tmp1

  veor   q\a0, q\a0, q\q_tmp2
  veor   q\a1, q\a1, q\q_tmp3
.endm

#------------------------------------------------------------------------------
# Transforms a single input row.
# The same as the function above, just for one row.
# Duplicated for better performance usage.
.macro TRANSFORM_INPUT_SINGLE a0:req q_0x0f:req q_ipt0:req q_ipt1:req q_tmp0:req q_tmp1:req
  #vbic     q\q_tmp0,  q\a0, q\q_0x0f
  vshr.u8 q\q_tmp0, q\a0, #4
  vand    q\a0, q\a0, q\q_0x0f

  vtbl_q \q_tmp1, \q_ipt1, \a0

  vtbl_q \a0, \q_ipt0, \q_tmp0

  veor   q\a0, q\a0, q\q_tmp1
.endm


#------------------------------------------------------------------------------
# Transforms an input state to a vperm state.
# input: a0-a3
.macro VPERM_TRANSFORM_STATE  a0:req a1:req a2:req a3:req a4:req q_0x0f:req \
                              q_ipt0:req q_ipt1:req q_tmp0:req q_tmp1:req \
                              q_tmp2:req q_tmp3:req q_tmp4:req r_tmp0:req r_tmp1:req

  SET_INPUT_TRANSFORM_CONSTS \q_0x0f \q_ipt0 \q_ipt1 \r_tmp0 \r_tmp1
  TRANSFORM_INPUT \a0 \a1 \q_0x0f \q_ipt0 \q_ipt1 \q_tmp0 \q_tmp1 \q_tmp2 \q_tmp3 \q_tmp4
  TRANSFORM_INPUT \a2 \a3 \q_0x0f \q_ipt0 \q_ipt1 \q_tmp0 \q_tmp1 \q_tmp2 \q_tmp3 \q_tmp4
.endm

#------------------------------------------------------------------------------
# Transforms a vperm state into a normal state back
# input: a0, a1
# Note: This function is only suited for a 512byte state and has to be expanded
#       for an 1024 state.
.macro VPERM_UNTRANSFORM_STATE  a0:req a1:req q_0x0f:req \
                                q_opt0:req q_opt1:req q_tmp0:req q_tmp1:req \
                                q_tmp2:req q_tmp3:req q_tmp4:req r_tmp0:req r_tmp1:req

  SET_OUTPUT_TRANSFORM_CONSTS \q_0x0f \q_opt0 \q_opt1 \r_tmp0 \r_tmp1
  TRANSFORM_INPUT \a0 \a1 \q_0x0f \q_opt0 \q_opt1 \q_tmp0 \q_tmp1 \q_tmp2 \q_tmp3 \q_tmp4
.endm

#------------------------------------------------------------------------------
# This macro does a conventional matrix tranpose in place.
# Originally there are 2 columns in one q register. After transpose there are
# two rows in one q register.
#
# input/output : a0, a1, a2, a3
.macro MATRIX_TRANSPOSE_A a0:req a1:req a2:req a3:req
  vtrn_q \a0, 8
  vtrn_q \a1, 8
  vtrn_q \a2, 8
  vtrn_q \a3, 8

  vtrn_d_interleaved 16, \a0, \a1
  vtrn_d_interleaved 16, \a2, \a3

  vtrn.32 q\a0, q\a2
  vtrn.32 q\a1, q\a3
.endm

#------------------------------------------------------------------------------
# This macro swaps the higher d register of dst0 with the lower d register of
# dst1
#
  .macro swap_hi_lo dst0:req dst1:req
  .Lsrc0 = 2 * \dst0 + 1
  .Lsrc1 = 2 * \dst1

  .altmacro
  concat_op2 vswp, d, %.Lsrc0, %.Lsrc1
.endm

#------------------------------------------------------------------------------
# Input is a q reg.
# Output are two q regs with the low and high half of the q reg.
#
.macro SPLIT_TO_LOW input:req out0:req out1:req
  .LinputLo = 2 * \input
  .LinputHi = 2 * \input + 1

  .LoutLo0 = 2 * \out0
  .LoutLo1 = 2 * \out1

  .altmacro
  concat_op2 vmov, d, %.LoutLo0, %.LinputLo
  .altmacro
  concat_op2 vmov, d, %.LoutLo1, %.LinputHi
.endm

#------------------------------------------------------------------------------
# Merges the lower parts of two d regs to one q reg.
#
.macro MERGE_FROM_LOW input1:req input2 out:req
  .LinputLo0 = 2 * \input1
  .LinputLo1 = 2 * \input2

  .LoutLo = 2 * \out
  .LoutHi = 2 * \out + 1

  .altmacro
  concat_op2 vmov, d, %.LoutLo, %.LinputLo0
  .altmacro
  concat_op2 vmov, d, %.LoutHi, %.LinputLo1
.endm

#------------------------------------------------------------------------------
# Splits a whole state to 8 q regs with each a half of the input q 
# in the lower part.
#
# input: i0-i3
# output: o0-o7
#
.macro MATRIX_SPLIT_TO_LOW i0:req i1:req i2:req i3:req o0:req o1:req o2:req \
                           o3:req o4:req o5:req o6:req o7:req

  SPLIT_TO_LOW \i0, \o0, \o1
  SPLIT_TO_LOW \i1, \o2, \o3
  SPLIT_TO_LOW \i2, \o4, \o5
  SPLIT_TO_LOW \i3, \o6, \o7
.endm

#------------------------------------------------------------------------------
# Merges the lower parts of q regs to full q regs.
# input: i0-i8 #only the lower d regs are used for merging.
# output: o0-o1
.macro MATRIX_MERGE_FROM_LOW i0:req i1:req i2:req i3:req i4:req i5:req i6:req \
                             i7:req o0:req o1:req o2:req o3:req
  MERGE_FROM_LOW \i0 \i1 \o0
  MERGE_FROM_LOW \i2 \i3 \o1
  MERGE_FROM_LOW \i4 \i5 \o2
  MERGE_FROM_LOW \i6 \i7 \o3
.endm

#------------------------------------------------------------------------------
# Expands to a swap of the d regs within a q reg.
.macro vswp_q q_reg:req
.Llow = 2 * \q_reg
.Lhi  = 2 * \q_reg + 1
.altmacro
concat_op2 vswp d, %.Llow, %.Lhi
.endm

#------------------------------------------------------------------------------
# Transforms the RoundConsts for the first and last rows into vperm.
# preq: q_0x15, q_0x0f, q_ipt0, q_ip1
.macro TRANSFORM_FIRST_LAST_ROW_CONSTS row:req, a0:req, a1:req, a2:req, a3:req, a4:req,\
                                       a5:req, base_const:req, q_add:req,\
                                       add_base:req, \
                                       q_0x15:req, q_0x0f:req, q_ipt0:req, q_ipt1:req, \
                                       q_tmp0:req, q_tmp1:req \
                                       r_tmp0:req, r_tmp1:req, r_tmp2:req, r_tmp3:req, r_tmp4:req
  ldr r\r_tmp3, =round_const_add
  vld1.8 {q\q_add}, [r\r_tmp3 ,:128]
  .if \row == first
    ldr r\r_tmp1, =round_const_base_L0
    ldr r\r_tmp0, =ROUND_CONST_L0
  .elseif \row == last
    ldr r\r_tmp1, =round_const_base_L7
    ldr r\r_tmp0, =ROUND_CONST_L7
    vswp_q \q_add
  .else
    .error @Wrong parameter given, abort.
  .endif

  vmov q\add_base, q\q_add @save original add q to add_base
  vld1.8 {q\base_const}, [r\r_tmp1 ,:128] @load rnd_const L0
  vmov q\a0, q\base_const
  
  veor q\a1, q\base_const, q\q_add
  vadd.u8 q\q_add, q\q_add, q\add_base
  veor q\a2, q\base_const, q\q_add
  vadd.u8 q\q_add, q\q_add, q\add_base
  veor q\a3, q\base_const, q\q_add
  vadd.u8 q\q_add, q\q_add, q\add_base
  veor q\a4, q\base_const, q\q_add
  vadd.u8 q\q_add, q\q_add, q\add_base

  pld [r\r_tmp0] @Announce write to RoundConst array.

  #Transformation of RoundConsts for Round 0-5
  TRANSFORM_INPUT_SINGLE \a0, \q_0x0f, \q_ipt0, \q_ipt1, \q_tmp0, \q_tmp1
  veor q\a0, q\a0, q\q_0x15
  vst1.8 {q\a0}, [r\r_tmp0 ,:128]! @Store Round const a0 for round 0

  TRANSFORM_INPUT_SINGLE \a1, \q_0x0f, \q_ipt0, \q_ipt1, \q_tmp0, \q_tmp1
  veor q\a1, q\a1, q\q_0x15
  vst1.8 {q\a1}, [r\r_tmp0 ,:128]!

  TRANSFORM_INPUT_SINGLE \a2, \q_0x0f, \q_ipt0, \q_ipt1, \q_tmp0, \q_tmp1
  veor q\a2, q\a2, q\q_0x15
  vst1.8 {q\a2}, [r\r_tmp0 ,:128]!
  
  TRANSFORM_INPUT_SINGLE \a3, \q_0x0f, \q_ipt0, \q_ipt1, \q_tmp0, \q_tmp1
  veor q\a3, q\a3, q\q_0x15
  vst1.8 {q\a3}, [r\r_tmp0 ,:128]!
  
  TRANSFORM_INPUT_SINGLE \a4, \q_0x0f, \q_ipt0, \q_ipt1, \q_tmp0, \q_tmp1
  veor q\a4, q\a4, q\q_0x15
  vst1.8 {q\a4}, [r\r_tmp0 ,:128]!
 
  veor q\a0, q\base_const, q\q_add
  vadd.u8 q\q_add, q\q_add, q\add_base

  #Transformation of RoundConsts for Round 5-9
  pld [r\r_tmp0] @Announce write to RoundConst array
  TRANSFORM_INPUT_SINGLE \a0, \q_0x0f, \q_ipt0, \q_ipt1, \q_tmp0, \q_tmp1
  veor q\a0, q\a0, q\q_0x15
  vst1.8 {q\a0}, [r\r_tmp0 ,:128]!
  
  veor q\a1, q\base_const, q\q_add
  vadd.u8 q\q_add, q\q_add, q\add_base
  TRANSFORM_INPUT_SINGLE \a1, \q_0x0f, \q_ipt0, \q_ipt1, \q_tmp0, \q_tmp1
  veor q\a1, q\a1, q\q_0x15
  vst1.8 {q\a1}, [r\r_tmp0 ,:128]!
  
  veor q\a2, q\base_const, q\q_add
  vadd.u8 q\q_add, q\q_add, q\add_base
  TRANSFORM_INPUT_SINGLE \a2, \q_0x0f, \q_ipt0, \q_ipt1, \q_tmp0, \q_tmp1
  veor q\a2, q\a2, q\q_0x15
  vst1.8 {q\a2}, [r\r_tmp0 ,:128]!

  veor q\a3, q\base_const, q\q_add
  vadd.u8 q\q_add, q\q_add, q\add_base
  TRANSFORM_INPUT_SINGLE \a3, \q_0x0f, \q_ipt0, \q_ipt1, \q_tmp0, \q_tmp1
  veor q\a3, q\a3, q\q_0x15
  veor q\a4, q\base_const, q\q_add @adding round constant for round 10
  vst1.8 {q\a3}, [r\r_tmp0 ,:128]!

  TRANSFORM_INPUT_SINGLE \a4, \q_0x0f, \q_ipt0, \q_ipt1, \q_tmp0, \q_tmp1
  veor q\a4, q\a4, q\q_0x15
  vst1.8 {q\a4}, [r\r_tmp0 ,:128]!
.endm

#------------------------------------------------------------------------------
# This macro initializes and transforms all RoundConsts into vperm state.
.macro VPERM_INIT_TRANSFORM_ROUND_CONST a0:req, a1:req, a2:req, a3:req, a4:req, \
                                        a5:req, a6:req, a7:req, q_0x15:req, q_0x0f:req, \
                                        q_ipt0:req, q_ipt1:req, q_add, \
                                        q_tmp0:req, q_tmp1:req, \
                                        r_tmp0:req, r_tmp1:req, r_tmp2:req, \
                                        r_tmp3:req, r_tmp4:req
  ldr r\r_tmp2, =round_const_base_Lx
  ldr r\r_tmp3, =ROUND_CONST_Lx

  pld [r\r_tmp2] @Announce read of const-base of Lx

  SET_INPUT_TRANSFORM_CONSTS \q_0x0f, \q_ipt0, \q_ipt1, \r_tmp0, \r_tmp1

  vmov.i8 q\q_0x15, #0x15

  #Round const Lx
  vld1.8 {q\a1}, [r\r_tmp2 ,:128]
  pld [r\r_tmp3] @Announce store of RoundConstLx

  TRANSFORM_INPUT_SINGLE \a1, \q_0x0f, \q_ipt0, \q_ipt1, \q_tmp0, \q_tmp1
  veor q\a1, q\a1, q\q_0x15
  vst1.8 {q\a1}, [r\r_tmp3 ,:128] @store transformed rnd_const Lx

  #Round const for Row 0
  TRANSFORM_FIRST_LAST_ROW_CONSTS first, \a0, \a1, \a2, \a3, \a4, \a5, \a6, \a7,\
                                  \q_add, \q_0x15, \q_0x0f, \q_ipt0, \q_ipt1,\
                                  \q_tmp0, \q_tmp1,\
                                  \r_tmp0, \r_tmp1, \r_tmp2, \r_tmp3, \r_tmp4

  #Round const for Row 7
  TRANSFORM_FIRST_LAST_ROW_CONSTS last, \a0, \a1, \a2, \a3, \a4, \a5, \a6, \a7,\
                                  \q_add, \q_0x15, \q_0x0f, \q_ipt0, \q_ipt1,\
                                  \q_tmp0, \q_tmp1,\
                                  \r_tmp0, \r_tmp1, \r_tmp2, \r_tmp3, \r_tmp4
.endm

#----------------------------------------------------------------------------
# Sets certain registers to necessary vperm values.
#
# q_0x0f: all 0x0f
# q_inv0: inversion constant part 1
# q_inv1: inversion constant part 2
#
.macro VPERM_SUBSTITUTE_CORE_SET_CONST rtmp0:req q_0x0f:req q_inv0:req q_inv1:req
  ldr     r\rtmp0, =vperm_inv_0 
  vldm    r\rtmp0, {q\q_inv0, q\q_inv1}
  vmov.i8 q\q_0x0f, #0x0f
.endm

#------------------------------------------------------------------------------
# First step of the sbox computation.
#
# preq: q_0x0f, q_inv0, q_inv1
# input: row
# output: q_out0, q_out1 (used later in lookup step)

.macro VPERM_SUBSTITUTE_CORE row:req q_out0:req q_out1:req  q_inv0:req q_inv1:req \
                                     q_0x0f:req \
                                     q_tmp0:req q_tmp1:req
                                     
  vand    q\q_tmp1, q\row, q\q_0x0f
  #vbic    q\q_tmp0, q\row, q\q_0x0f @not necessary due to shift instruction.
  vtbl_qLo  \q_out0, \q_inv0, \q_tmp1
  vshr.u8 q\q_tmp0, q\row, #4
  
  vtbl_qHi  \q_out0, \q_inv0, \q_tmp1
  veor   q\row, q\q_tmp1, q\q_tmp0
  vtbl_q \q_out1, \q_inv1, \q_tmp0

  veor   q\q_out1, q\q_out1, q\q_out0

  vtbl_q \q_tmp1, \q_inv1, \row
  veor   q\q_tmp1, q\q_tmp1, q\q_out0

  vtbl_q \q_out0, \q_inv1, \q_out1
  veor   q\q_out0, q\q_out0, q\row

  vtbl_q \q_out1, \q_inv1, \q_tmp1
  veor   q\q_out1, q\q_out1, q\q_tmp0
.endm

#------------------------------------------------------------------------------
# Second part of the inverse computation
# Lookup step
#
# preq: sb0, sb1
# input: lookup_index0, lookup_index1
# output: out

.macro VPERM_Lookup lookup_index0:req lookup_index1:req q_out:req \
                    q_sb0:req q_sb1:req q_tmp0:req
 
 vtbl_q \q_out, \q_sb0, \lookup_index1
 vtbl_q \q_tmp0, \q_sb1, \lookup_index0
 veor q\q_out, q\q_tmp0, q\q_out
.endm


#-----------------------------------------------------------------------------
# 
# This macro processes one row, but reuses the previous pointers to
# TEMP_MUL{1,2}. The pointers get automatically incremented after usage
# params:
# row:        row to process
# Prequesits:
# q_0x0f:     q with 0x0f in
# q_inv0:     q with inversion0 loaded
# q_inv1:     q with inversion1 loaded
# q_t_ind0:   temp q for lookup index 0
# q_t_ind1:   temp q for lookup index 2
# q_t_store:  q used to store the result for saving
#
.macro SUB_MULTIPLY_ROW row:req q_0x0f:req q_inv0:req \
                        q_inv1:req q_t_ind0:req q_t_ind1:req q_t_store:req \
                        q_tmp0:req q_tmp1:req r_sb1:req 
  #Computes the lookup indices for the lookup step.
  VPERM_SUBSTITUTE_CORE \row, \q_t_ind0, \q_t_ind1, \q_inv0, \q_inv1, \q_0x0f, \q_t_store, \q_tmp0
 
  vldm r\r_sb1, {q\q_tmp0, q\q_tmp1} @loads vperm_sb1 to these q regs.
  

  #process x 1 and save to q register row.
  VPERM_Lookup \q_t_ind0, \q_t_ind1, \row, \q_tmp0, \q_tmp1, \q_t_store 
.endm


#------------------------------------------------------------------------------
# SubMultiply Macro
# This macro performs the Submultiply step.
#
# preq: q_0x0f, q_inv0, q_inv1
# inputs/outputs: a0-a7
#
.macro SUB_MULTIPLY a0:req a1:req a2:req a3:req a4:req a5:req a6:req a7:req q_0x0f:req q_inv0:req q_inv1:req \
                    q_tmp0:req q_tmp1:req q_tmp2:req q_tmp3:req q_tmp4:req \
                    r_sb1:req r_tmp0:req r_tmp1:req 

  VPERM_SUBSTITUTE_CORE_SET_CONST \r_tmp0, \q_0x0f, \q_inv0, \q_inv1

  ###Row processing##########

  ldr r\r_sb1, =vperm_sb1_0
 
  #Rows 0 to 7
  SUB_MULTIPLY_ROW \a0 \q_0x0f \q_inv0 \q_inv1 \q_tmp0 \q_tmp1 \q_tmp2 \q_tmp3 \q_tmp4 \r_sb1
  SUB_MULTIPLY_ROW \a1 \q_0x0f \q_inv0 \q_inv1 \q_tmp0 \q_tmp1 \q_tmp2 \q_tmp3 \q_tmp4 \r_sb1
  SUB_MULTIPLY_ROW \a2 \q_0x0f \q_inv0 \q_inv1 \q_tmp0 \q_tmp1 \q_tmp2 \q_tmp3 \q_tmp4 \r_sb1
  SUB_MULTIPLY_ROW \a3 \q_0x0f \q_inv0 \q_inv1 \q_tmp0 \q_tmp1 \q_tmp2 \q_tmp3 \q_tmp4 \r_sb1

  SUB_MULTIPLY_ROW \a4 \q_0x0f \q_inv0 \q_inv1 \q_tmp0 \q_tmp1 \q_tmp2 \q_tmp3 \q_tmp4 \r_sb1
  SUB_MULTIPLY_ROW \a5 \q_0x0f \q_inv0 \q_inv1 \q_tmp0 \q_tmp1 \q_tmp2 \q_tmp3 \q_tmp4 \r_sb1
  SUB_MULTIPLY_ROW \a6 \q_0x0f \q_inv0 \q_inv1 \q_tmp0 \q_tmp1 \q_tmp2 \q_tmp3 \q_tmp4 \r_sb1
  SUB_MULTIPLY_ROW \a7 \q_0x0f \q_inv0 \q_inv1 \q_tmp0 \q_tmp1 \q_tmp2 \q_tmp3 \q_tmp4 \r_sb1
.endm

#------------------------------------------------------------------------------
#Multiplication by factor 2.
#Splits into nibbles and does a lookup for multiplication by factor 2.
#
.macro VMUL2 q_dst:req, q_tmp0:req, q_tmp1:req, q_sb2_0:req, q_sb2_1:req, q_0x0f:req
  #split into nibbles
  vand    q\q_tmp1, q\q_dst, q\q_0x0f
  #vbic    q\q_tmp0, q\q_dst, q\q_0x0f @not necessary due to arms shift op.

  #Multiplication step
  vtbl_qLo  \q_tmp1, \q_sb2_0, \q_tmp1 @equals o vtbl_q, just interleaved
  vshr.u8   q\q_tmp0, q\q_dst, #4
  vtbl_qHi  \q_tmp1, \q_sb2_0, \q_tmp1 @interleaved vtbl
  vtbl_q \q_dst, \q_sb2_1, \q_tmp0
 
  veor q\q_dst, q\q_tmp1, q\q_dst      @merge results
  
.endm

#------------------------------------------------------------------------------
#MixByte step interleaved.
#
.macro MIX_BYTES a0:req a1:req a2:req a3:req a4:req a5:req a6:req a7:req \
                 b0:req b1:req b2:req b3:req b4:req b5:req b6:req b7:req \
                 r_tmp0 r_tmp1 
  ldr r\r_tmp0, =TEMP_Q

  vmov q\b6, q\a0
  vmov q\b0, q\a2
  vmov q\b1, q\a3
  vmov q\b2, q\a4
  ldr r\r_tmp1, =vperm_mul2_0
  vmov q\b7, q\a1

  
  /* t_i = a_i + a_{i+1} */
  veor q\a0, q\a0, q\a1
  vmov q\b5, q\a7
  veor q\a1, q\a1, q\a2
  vmov q\b4, q\a6
  veor q\a2, q\a2, q\a3
  vmov q\b3, q\a5
  veor q\a3, q\a3, q\a4
  veor q\a4, q\a4, q\a5
  veor q\a5, q\a5, q\a6
  veor q\a6, q\a6, q\a7
  veor q\a7, q\a7, q\b6


  /* build y4 y5 y6 ... in regs xmm8, xmm9, xmm10 by adding t_i*/
  veor q\b0, q\b0, q\a4
  veor q\b1, q\b1, q\a5
  veor q\b2, q\b2, q\a6
  veor q\b3, q\b3, q\a7
  veor q\b4, q\b4, q\a0
  veor q\b5, q\b5, q\a1
  veor q\b6, q\b6, q\a2
  veor q\b7, q\b7, q\a3

  veor q\b0, q\b0, q\a6
  veor q\b1, q\b1, q\a7
  veor q\b2, q\b2, q\a0
  veor q\b3, q\b3, q\a1
  veor q\b4, q\b4, q\a2
  veor q\b5, q\b5, q\a3
  veor q\b6, q\b6, q\a4
  vstm r\r_tmp0, {q\b0-q\b4} @Backup b0-b4 for usage as tmp.
  veor q\b7, q\b7, q\a5


  #Preserve a0-a2 for usage in next calculation
  vmov q\b0, q\a0
  vmov q\b1, q\a1
  vmov q\b2, q\a2


  /* compute x_i = t_i + t_{i+3} */
  veor q\a0, q\a0, q\a3
  veor q\a1, q\a1, q\a4
  veor q\a2, q\a2, q\a5
  vmov.i8 q\b4, #0x0f
  pld [r\r_tmp1]
  veor q\a4, q\a4, q\a7
  veor q\a7, q\a7, q\b2
  veor q\a5, q\a5, q\b0
  veor q\a3, q\a3, q\a6
  veor q\a6, q\a6, q\b1

  #Multiplication x2.
  vldm r\r_tmp1, {q\b2 - q\b3}      @Load vperm multiplication constants, used in VMUL2
  VMUL2 \a7, \b0, \b1, \b2, \b3, \b4
  VMUL2 \a6, \b0, \b1, \b2, \b3, \b4
  VMUL2 \a5, \b0, \b1, \b2, \b3, \b4
  VMUL2 \a4, \b0, \b1, \b2, \b3, \b4
  VMUL2 \a3, \b0, \b1, \b2, \b3, \b4
  pld [r\r_tmp0]
  VMUL2 \a2, \b0, \b1, \b2, \b3, \b4
  VMUL2 \a1, \b0, \b1, \b2, \b3, \b4
  VMUL2 \a0, \b0, \b1, \b2, \b3, \b4

  /* compute w_i :  add y_{i+4}*/
  vldm r\r_tmp0, {q\b0-q\b4}       @Restore b0-b4 from memory
  veor q\a5, q\a5, q\b5

  veor q\a2, q\a2, q\b2
  veor q\a3, q\a3, q\b3
  veor q\a0, q\a0, q\b0
  veor q\a1, q\a1, q\b1
  veor q\a4, q\a4, q\b4
  vmov.i8 q\b4, #0x0f
  veor q\a6, q\a6, q\b6
  vldm r\r_tmp1, {q\b2 - q\b3}     @Reload multiplication masks from memory.
  veor q\a7, q\a7, q\b7

  VMUL2 \a0, \b0, \b1, \b2, \b3, \b4
  VMUL2 \a1, \b0, \b1, \b2, \b3, \b4
  VMUL2 \a2, \b0, \b1, \b2, \b3, \b4
  VMUL2 \a3, \b0, \b1, \b2, \b3, \b4
  VMUL2 \a4, \b0, \b1, \b2, \b3, \b4
  VMUL2 \a5, \b0, \b1, \b2, \b3, \b4
  pld [r\r_tmp0]
  VMUL2 \a6, \b0, \b1, \b2, \b3, \b4
  VMUL2 \a7, \b0, \b1, \b2, \b3, \b4


  /* add to y_4 y_5 .. v3, v4, ... */

  veor q\b5, q\b5, q\a0
  vldm r\r_tmp0, {q\b0-q\b4}      @restore regs.
  veor q\b6, q\b6, q\a1
  veor q\b7, q\b7, q\a2

  veor q\b0, q\b0, q\a3
  veor q\b1, q\b1, q\a4
  veor q\b2, q\b2, q\a5
  veor q\b3, q\b3, q\a6
  veor q\b4, q\b4, q\a7


.endm

#------------------------------------------------------------------------------
#  This macro shifts a q vector containing P Q with the accoring shifting value.
#  This is done by two vext instructions.
.macro SHIFT_ROW row:req shift_p:req shift_q:req
  .P = 2 * \row
  .Q = 2 * \row + 1

  .altmacro
  concat_vext %.P, %.P, %.P, \shift_p
  .altmacro
  concat_vext %.Q, %.Q, %.Q, \shift_q
.endm

#------------------------------------------------------------------------------
# Performs shift bytes step.
.macro SHIFT_BYTES a0:req, a1:req, a2:req, a3:req, a4:req, a5:req, a6:req, a7:req
  SHIFT_ROW \a0, 0, 1
  SHIFT_ROW \a1, 1, 3
  SHIFT_ROW \a2, 2, 5
  SHIFT_ROW \a3, 3, 7
  SHIFT_ROW \a4, 4, 0
  SHIFT_ROW \a5, 5, 2
  SHIFT_ROW \a6, 6, 4
  SHIFT_ROW \a7, 7, 6
.endm

#------------------------------------------------------------------------------
#  This macro represents a single round.
#  uses all q registers and r 0-6

.macro ROUND a0:req a1:req a2:req a3:req a4:req a5:req a6:req a7:req \
             b0:req b1:req b2:req b3:req b4:req b5:req b6:req b7:req

  ####Add round constant####

  #Round const first line
  vld1q \b0, [RND_CONST_L0,:128]!

  #Round consts middle lines
  vld1q \b1, [RND_CONST_Lx,:128] @Loading RoundConst for Lx

  veor q\a0, q\a0, q\b0         @xor from first row, here to avoid pipeline stall

  veor q\a1, q\a1, q\b1
  veor q\a2, q\a2, q\b1
  vld1q \b2, [RND_CONST_L7,:128]! @load RoundConst for Line7, interleaved
  veor q\a3, q\a3, q\b1
  veor q\a4, q\a4, q\b1
  veor q\a5, q\a5, q\b1
  veor q\a6, q\a6, q\b1

  #Round const last line
  veor q\a7, q\a7, q\b2

  SHIFT_BYTES  \a0, \a1, \a2, \a3, \a4, \a5, \a6, \a7

  #The appended numbers are r temps used for temporary values (addr, constants, ...)
  SUB_MULTIPLY \a0 \a1 \a2 \a3 \a4 \a5 \a6 \a7 \b0 \b1 \b2 \b3 \b4 \b5 \b6 \b7 0 1 2 
  MIX_BYTES    \a0 \a1 \a2 \a3 \a4 \a5 \a6 \a7 \b0 \b1 \b2 \b3 \b4 \b5 \b6 \b7 3 4
.endm

#------------------------------------------------------------------------------
#Adds 0x15 to all registers.
#q_tmp: used for holding 0x15
#to_add: vararg, 0x15 gets added to each element.
#
.macro VPERM_ADD_CONSTANT q_tmp:req to_add:vararg
  vmov.i8 q\q_tmp, #0x15
  .irp q_val,\to_add               @loop through all args and xor them
    veor q\q_val, q\q_val, q\q_tmp
  .endr
.endm

#-----------------------------------------------------------------------------
# q0 - q7 : rows
# q8 - q15: tmp

.global
.type roundEven, %function
roundEven:
ROUND 0, 1,  2, 3 , 4 , 5 , 6 ,  7, 8, 9, 10, 11, 12, 13, 14, 15
bx lr
#Function end
.ltorg

#-----------------------------------------------------------------------------
# q0 - q7 : rows
# q8 - q15: tmp

.global
.type roundOdd, %function
roundOdd:
ROUND 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2 , 3 , 4 , 5 , 6 ,  7
bx lr
#Function end
.ltorg

#------------------------------------------------------------------------------
# This function engages all necessary round transformations.
.global pq_rounds
.type pq_rounds, %function
pq_rounds:
push {r0,r1, lr}

VPERM_ADD_CONSTANT 15 0 1 2 3 4 5 6 7


ldr RND_CONST_L0, =ROUND_CONST_L0
ldr RND_CONST_Lx, =ROUND_CONST_Lx
ldr RND_CONST_L7, =ROUND_CONST_L7

bl roundEven
bl roundOdd
bl roundEven
bl roundOdd
bl roundEven
bl roundOdd
bl roundEven
bl roundOdd
bl roundEven
bl roundOdd

pop {r0, r1, lr}
VPERM_ADD_CONSTANT 15 0 1 2 3 4 5 6 7


bx lr
#Function end

#------------------------------------------------------------------------------
# void TF512(u64* h, u64* m)
# Main transformation function

.global TF512
.type TF512, %function
TF512:

push {r4-r11, lr}
vldm r1, {q4-q7}

VPERM_TRANSFORM_STATE 4 5 6 7 0 1 2 3 8 9 10 11 12 3 4
MATRIX_TRANSPOSE_A 4 5 6 7

vldm r0, {q0-q3}@ load chaining

#xor chaining to message to get CV for P.
#CV +M
veor q0, q4, q0
veor q1, q5, q1
veor q2, q6, q2
veor q3, q7, q3

MATRIX_TRANSPOSE_B 0 1 2 3 4 5 6 7 

bl pq_rounds

pld [r0] @hint for data access.
MATRIX_TRANSPOSE_B_INV 0 1 2 3 4 5 6 7 

#xor output of P and Q
#result: P(CV+M) + Q(M)
veor q8, q0, q1
veor q9, q2, q3
veor q10, q4, q5
veor q11, q6, q7

#load chaining to q0..q3
vldm r0, {q0-q3} 

pld [r0]

#P (CV+M) + Q(M) + CV
veor q0, q0, q8
veor q1, q1, q9
veor q2, q2, q10
veor q3, q3, q11

pop {r4-r11, lr}
vstm r0, {q0-q3}

bx lr

#------------------------------------------------------------------------------
# void OF512(u64* h)
# This function performs the output transformation and is called from outside.
.global OF512
.type OF512, %function
OF512:


vldm r0, {q8-q11}
push {r4-r11, lr} 
MATRIX_SPLIT_TO_LOW 8 9 10 11 0 1 2 3 4 5 6 7
bl pq_rounds

vldm r0, {q8-q11}

MATRIX_MERGE_FROM_LOW 0 1 2 3 4 5 6 7 12 13 14 15
veor q12, q12, q8
veor q13, q13, q9
veor q14, q14, q10
veor q15, q15, q11

Matrix_TRANSPOSE_A 12, 13, 14, 15

VPERM_UNTRANSFORM_STATE  14 15 0 1 2 3 4 5 6 8 1 2

add r0, r0, #16*2  @To store just last two rows
pop {r4-r11, lr}
vstm r0, {q14,q15} @Store last two rows of the chaining.
bx lr

#------------------------------------------------------------------------------
# void INIT(u64* h)
# This function does all necessary initializations for groestl using vperm.

.global INIT
.type INIT, %function
INIT:
push {r4-r8,lr}

#Generates and transforms the round constants
#q_ipt0 and q_ipt1 is afterwards already in q10 and q11
#q9 is still 0x0f, so initialization of transform constants is not necessary
#anymore

#0-14: q_regs, 4-8: r_regs
VPERM_INIT_TRANSFORM_ROUND_CONST 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,\
                                 14, 4, 5, 6, 7, 8


#Transformation of chaining value.
#q_ipt0, q_ipt1 and q_0x0f are still in registers and get reused.

#Ptr to chaining value is in r0.

vldm r0, {q0-q3}
TRANSFORM_INPUT 0, 1, 9, 10, 11, 4, 5, 6, 7, 8 @Transform first two to rows.
TRANSFORM_INPUT 2, 3, 9, 10, 11, 4, 5, 6, 7, 8 @Transform third and fourth row.

MATRIX_TRANSPOSE_A 0 1 2 3
vstm r0, {q0-q3}

pop {r4-r8,lr}
bx lr

.end

/* vim: ft=gas :
*/
