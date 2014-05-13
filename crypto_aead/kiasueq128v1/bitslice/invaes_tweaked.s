################################################################
### AES-128 Decryption                                       ###
### bitsliced implementation for Intel Core 2 processors     ###
### requires support of SSE extensions up to SSSE3           ###
### Original Author: Vinit Azad                              ###
### Original Date: Spring 2011                               ###
### Original Status: Public domain                           ###
### Modified by: Jeremy Jean, 2014-04-10 (tweaked AES)       ###
################################################################

.include "common.s"

################################################################################################
#.ifndef ADDROUNDKEYTWEAKED_S
#ADDROUNDKEYTWEAKED_S:

# Add round key
.macro AddRoundKeyTWEAKED x0, x1, x2, x3, x4, x5, x6, x7, i, k, tw

    ### Add the i-th round subkey
    pxor (128*(\i)    )(\k), \x0
    pxor (128*(\i)+ 16)(\k), \x1
    pxor (128*(\i)+ 32)(\k), \x2
    pxor (128*(\i)+ 48)(\k), \x3
    pxor (128*(\i)+ 64)(\k), \x4
    pxor (128*(\i)+ 80)(\k), \x5
    pxor (128*(\i)+ 96)(\k), \x6
    pxor (128*(\i)+112)(\k), \x7
	
    ### Add the tweak input
    pxor    (\tw), \x0
    pxor  16(\tw), \x1
    pxor  32(\tw), \x2
    pxor  48(\tw), \x3
    pxor  64(\tw), \x4
    pxor  80(\tw), \x5
    pxor  96(\tw), \x6
    pxor 112(\tw), \x7

    ### Counter for the permutations
    pxor CSTTWA,  \x0
    pxor CSTTWB,  \x1
    pxor CSTTWC,  \x2


.endm

#.endif

################################################################################################

#.ifndef INVSHIFTROWS_S
#INVSHIFTROWS_S:

# Inverse Shift Rows
.macro invShiftRows x0, x1, x2, x3, x4, x5, x6, x7, M

    pshufb \M, \x0
    pshufb \M, \x1
    pshufb \M, \x2
    pshufb \M, \x3
    pshufb \M, \x4
    pshufb \M, \x5
    pshufb \M, \x6
    pshufb \M, \x7

.endm

#.endif

################################################################################################

#.ifndef INVMIXCOLUMNS_S
#INVMIXCOLUMNS_S:

.macro invMixColumns x0, x1, x2, x3, x4, x5, x6, x7, t0, t1, t2, t3, t4, t5, t6, t7

    #load initial values
    movdqa \x5, \t0
    movdqa \x5, \t1
    movdqa \x6, \t2
    movdqa \x0, \t3
    movdqa \x1, \t4
    movdqa \x2, \t5
    movdqa \x3, \t6
    movdqa \x4, \t7

    #xor rest of A_i values
    pxor \x6, \t0
    pxor \x7, \t0

    pxor \x0, \t1

    pxor \x0, \t2
    pxor \x1, \t2

    pxor \x5, \t3
    pxor \x1, \t3
    pxor \x6, \t3
    pxor \x2, \t3

    pxor \x5, \t4
    pxor \x2, \t4
    pxor \x3, \t4

    pxor \x6, \t5
    pxor \x3, \t5
    pxor \x4, \t5

    pxor \x7, \t6
    pxor \x4, \t6
    pxor \x5, \t6

    pxor \x5, \t7
    pxor \x6, \t7

    # x <<< 32. x becomes A_i+1
    pshufd $0x93, \x0, \x0
    pshufd $0x93, \x1, \x1
    pshufd $0x93, \x2, \x2
    pshufd $0x93, \x3, \x3
    pshufd $0x93, \x4, \x4
    pshufd $0x93, \x5, \x5
    pshufd $0x93, \x6, \x6
    pshufd $0x93, \x7, \x7

    #xor with A_i+1
    pxor \x5, \t0
    pxor \x7, \t0
    pxor \x0, \t0

    pxor \x6, \t1
    pxor \x5, \t1
    pxor \x0, \t1
    pxor \x7, \t1
    pxor \x1, \t1

    pxor \x7, \t2
    pxor \x6, \t2
    pxor \x1, \t2
    pxor \x2, \t2

    pxor \x0, \t3
    pxor \x5, \t3
    pxor \x2, \t3
    pxor \x3, \t3

    pxor \x1, \t4
    pxor \x6, \t4
    pxor \x5, \t4
    pxor \x3, \t4
    pxor \x7, \t4
    pxor \x4, \t4

    pxor \x2, \t5
    pxor \x7, \t5
    pxor \x6, \t5
    pxor \x4, \t5
    pxor \x5, \t5

    pxor \x3, \t6
    pxor \x7, \t6
    pxor \x5, \t6
    pxor \x6, \t6

    pxor \x4, \t7
    pxor \x6, \t7
    pxor \x7, \t7


    # (x <<< 32) <<< 32 = x <<< 64. x becomes A_i+2
    pshufd $0x93, \x0, \x0
    pshufd $0x93, \x1, \x1
    pshufd $0x93, \x2, \x2
    pshufd $0x93, \x3, \x3
    pshufd $0x93, \x4, \x4
    pshufd $0x93, \x5, \x5
    pshufd $0x93, \x6, \x6
    pshufd $0x93, \x7, \x7

    #xor with A_i+2
    pxor \x0, \t0
    pxor \x5, \t0
    pxor \x6, \t0

    pxor \x1, \t1
    pxor \x7, \t1
    pxor \x5, \t1

    pxor \x0, \t2
    pxor \x2, \t2
    pxor \x6, \t2

    pxor \x0, \t3
    pxor \x1, \t3
    pxor \x3, \t3
    pxor \x5, \t3
    pxor \x6, \t3
    pxor \x7, \t3

    pxor \x1, \t4
    pxor \x2, \t4
    pxor \x4, \t4
    pxor \x5, \t4
    pxor \x7, \t4

    pxor \x2, \t5
    pxor \x3, \t5
    pxor \x5, \t5
    pxor \x6, \t5

    pxor \x3, \t6
    pxor \x4, \t6
    pxor \x6, \t6
    pxor \x7, \t6

    pxor \x4, \t7
    pxor \x5, \t7
    pxor \x7, \t7


    # (x <<< 64) <<< 32 = x <<< 96. x becomes A_i+3
    pshufd $0x93, \x0, \x0
    pshufd $0x93, \x1, \x1
    pshufd $0x93, \x2, \x2
    pshufd $0x93, \x3, \x3
    pshufd $0x93, \x4, \x4
    pshufd $0x93, \x5, \x5
    pshufd $0x93, \x6, \x6
    pshufd $0x93, \x7, \x7

    #xor with A_i+3
    pxor \x5, \t0
    pxor \x0, \t0

    pxor \x6, \t1
    pxor \x5, \t1
    pxor \x1, \t1

    pxor \x7, \t2
    pxor \x6, \t2
    pxor \x2, \t2

    pxor \x0, \t3
    pxor \x5, \t3
    pxor \x7, \t3
    pxor \x3, \t3

    pxor \x1, \t4
    pxor \x5, \t4
    pxor \x6, \t4
    pxor \x4, \t4

    pxor \x2, \t5
    pxor \x6, \t5
    pxor \x7, \t5
    pxor \x5, \t5

    pxor \x3, \t6
    pxor \x7, \t6
    pxor \x6, \t6

    pxor \x4, \t7
    pxor \x7, \t7

.endm

#.endif

################################################################################################

#.ifndef INVSUBBYTES_S
#INVSUBBYTES_S:

# Inverse sbox
# input in  lsb > [b0, b1, b2, b3, b4, b5, b6, b7] < msb
# output in lsb > [b5, b3, b7, b6, b2, b0, b4, b1] < msb
.macro invSbox b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, s0, s1, s2, s3

    #subtract
    pxor    ONE, \b6
    pxor    ONE, \b5
    pxor    ONE, \b1
    pxor    ONE, \b0

    invInBasisChange \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7
    # output in lsb > [b1, b3, b2, b7, b0, b4, b5, b6] < msb

    Inv_GF256 \b1, \b3, \b2, \b7, \b0, \b4, \b5, \b6, \t0, \t1, \t2, \t3, \s0, \s1, \s2, \s3
    # output lsb > [x4,x5,x6,x7,x0,x1,x2,x3] < msb

    invOutBasisChange \b0, \b4, \b5, \b6, \b1, \b3, \b2, \b7
    # output in lsb > [x2, x5, x7, x3, x6, x0, x1, x4] < msb

.endm


# Inverse InBasisChange
# input in  lsb > [b0, b1, b2, b3, b4, b5, b6, b7] < msb
# output in lsb > [b1, b3, b2, b7, b0, b4, b5, b6] < msb
.macro invInBasisChange b0, b1, b2, b3, b4, b5, b6, b7

    pxor \b5, \b2
    pxor \b7, \b2
    pxor \b6, \b0
    pxor \b6, \b4

    pxor \b0, \b3
    pxor \b4, \b3
    pxor \b4, \b7
    pxor \b7, \b6

    pxor \b0, \b1
    pxor \b5, \b1
    pxor \b4, \b1
    pxor \b7, \b1

    pxor \b6, \b1
    pxor \b1, \b5
    pxor \b3, \b0
    pxor \b5, \b0

    pxor \b7, \b0
    pxor \b6, \b0

.endm


# Inverse OutBasisChange
# input in  lsb > [b0, b1, b2, b3, b4, b5, b6, b7] < msb
# output in lsb > [b2, b5, b7, b3, b6, b0, b1, b4] < msb
.macro invOutBasisChange b0, b1, b2, b3, b4, b5, b6, b7

    pxor \b1, \b4
    pxor \b1, \b5
    pxor \b1, \b6
    pxor \b7, \b1

    pxor \b3, \b1
    pxor \b0, \b1
    pxor \b5, \b1
    pxor \b6, \b1

    pxor \b2, \b3
    pxor \b4, \b3
    pxor \b5, \b3
    pxor \b6, \b3

    pxor \b3, \b0
    pxor \b4, \b0
    pxor \b7, \b0
    pxor \b1, \b7

    pxor \b0, \b7
    pxor \b4, \b7
    pxor \b5, \b7
    pxor \b2, \b7

.endm

#.endif


################################################################################################

#.ifndef INVAES128_S
#INVAES128_S:

# AES-128 Decryption
# b0-b7 - input ciphertext
# t0-t7 - output plaintext
# k - key
# t - tweak
.macro invAes128TWEAKED b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, k, tw

    # bitslice input. t0 is temporary register
    bitslice \b7, \b6, \b5, \b4, \b3, \b2, \b1, \b0, \t0
	
    #initial key addition
    AddRoundKeyTWEAKED \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, 10, \k, \tw
    
    #begin AES rounds
    invAesRoundTWEAKED  9, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k, \tw
    invAesRoundTWEAKED  8, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k, \tw
    invAesRoundTWEAKED  7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k, \tw
    invAesRoundTWEAKED  6, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k, \tw
    invAesRoundTWEAKED  5, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k, \tw
    invAesRoundTWEAKED  4, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k, \tw
    invAesRoundTWEAKED  3, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k, \tw
    invAesRoundTWEAKED  2, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k, \tw
    invAesRoundTWEAKED  1, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \k, \tw
    invLastRoundTWEAKED    \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7, \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \k, \tw
    # output in lsb > [t5, t3, t7, t6, t2, t0, t4, t1] < msb

    # call bitslice again to invert bitslicing
    bitslice \t1, \t4, \t0, \t2, \t6, \t7, \t3, \t5, \b0


	


.endm

################################################################################################

# invAesRoundTWEAKED
.macro invAesRoundTWEAKED i, b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, k, tw

invShiftRows \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, ISR

invSbox \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7
# output in lsb > [b5, b3, b7, b6, b2, b0, b4, b1] < msb

AddRoundKeyTWEAKED \b5, \b3, \b7, \b6, \b2, \b0, \b4, \b1, \i, \k, \tw

invMixColumns \b5, \b3, \b7, \b6, \b2, \b0, \b4, \b1, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7
# output in lsb > [t0, t1, t2, t3, t4, t5, t6, t7] < msb

.endm

################################################################################################

# Last AES Round
.macro invLastRoundTWEAKED b0, b1, b2, b3, b4, b5, b6, b7, t0, t1, t2, t3, t4, t5, t6, t7, k, tw

invShiftRows \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, ISR

invSbox \b0, \b1, \b2, \b3, \b4, \b5, \b6, \b7, \t0, \t1, \t2, \t3, \t4, \t5, \t6, \t7
# output in lsb > [b5, b3, b7, b6, b2, b0, b4, b1] < msb

AddRoundKeyTWEAKED \b5, \b3, \b7, \b6, \b2, \b0, \b4, \b1, 0, \k, \tw

.endm

#.endif
################################################################################################

