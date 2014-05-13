################################################################
### AES-128 in ECB mode                                      ###
### bitsliced implementation for Intel Core 2 processors     ###
### requires support of SSE extensions up to SSSE3           ###
### Original Author: Emilia Käsper                           ###
### Original Date: 2009-03-19                                ###
### Original Status: Public domain                           ###
### Modified by: Ted Krovetz, 2010-07-29                     ###
### Modified by: Jeremy Jean, 2014-04-04 (tweaked AES)       ###
################################################################

.include "common.s"
.include "invaes_tweaked.s"

.text

#####################
#AES_KEY* ctx in %rdi
#u8* in in %rsi
#u8* out in %rdx
#u32 blks in %rcx (lowest 32 bits, %ecx)
#TWEAK in %r8
#####################
.p2align 4
.globl kasper_ecb_encrypt
kasper_ecb_encrypt:

.ENC_BLOCK:
movdqa    (%rsi), %xmm0
movdqa  16(%rsi), %xmm1
movdqa  32(%rsi), %xmm2
movdqa  48(%rsi), %xmm3
movdqa  64(%rsi), %xmm4
movdqa  80(%rsi), %xmm5
movdqa  96(%rsi), %xmm6
movdqa 112(%rsi), %xmm7

pshufb M0, %xmm0
pshufb M0, %xmm1
pshufb M0, %xmm2
pshufb M0, %xmm3
pshufb M0, %xmm4
pshufb M0, %xmm5
pshufb M0, %xmm6
pshufb M0, %xmm7

aes128TWEAKED %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %rdi, %r8

pshufb M0, %xmm13
pshufb M0, %xmm11
pshufb M0, %xmm15
pshufb M0, %xmm14
pshufb M0, %xmm10
pshufb M0, %xmm8
pshufb M0, %xmm12
pshufb M0, %xmm9
	
movdqa  %xmm8,    (%rdx)      # lsb
movdqa  %xmm9,  16(%rdx)
movdqa  %xmm12, 32(%rdx)
movdqa  %xmm14, 48(%rdx)
movdqa  %xmm11, 64(%rdx)
movdqa  %xmm15, 80(%rdx)
movdqa  %xmm10, 96(%rdx)
movdqa  %xmm13, 112(%rdx)     #msb
addq	$128, %rdx
addq	$128, %rsi
subl	$8, %ecx
ja	.ENC_BLOCK	
ret



#####################
#AES_KEY* ctx in %rdi
#u8* in in %rsi
#u8* out in %rdx
#u32 blks in %rcx (lowest 32 bits, %ecx)
#TWEAK in %r8
#####################
.p2align 4
.globl jean_ecb_decrypt
jean_ecb_decrypt:

#.DEC_BLOCK:
movdqa    (%rsi), %xmm0
movdqa  16(%rsi), %xmm1
movdqa  32(%rsi), %xmm2
movdqa  48(%rsi), %xmm3
movdqa  64(%rsi), %xmm4
movdqa  80(%rsi), %xmm5
movdqa  96(%rsi), %xmm6
movdqa 112(%rsi), %xmm7

pshufb M0, %xmm0
pshufb M0, %xmm1
pshufb M0, %xmm2
pshufb M0, %xmm3
pshufb M0, %xmm4
pshufb M0, %xmm5
pshufb M0, %xmm6
pshufb M0, %xmm7

invAes128TWEAKED %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %rdi, %r8
# output in lsb > [xmm13, xmm11, xmm15, xmm14, xmm10, xmm8, xmm12, xmm9] < msb

pshufb M0, %xmm13
pshufb M0, %xmm11
pshufb M0, %xmm15
pshufb M0, %xmm14
pshufb M0, %xmm10
pshufb M0, %xmm8
pshufb M0, %xmm12
pshufb M0, %xmm9
	
movdqa  %xmm13,    (%rdx)       # lsb
movdqa  %xmm11,  16(%rdx)
movdqa  %xmm15,  32(%rdx)
movdqa  %xmm14,  48(%rdx)
movdqa  %xmm10,  64(%rdx)
movdqa  %xmm8,   80(%rdx)
movdqa  %xmm12,  96(%rdx)
movdqa  %xmm9,  112(%rdx)       # msb

#addq	$128, %rdx
#addq	$128, %rsi
#subl	$8, %ecx
#ja	.DEC_BLOCK	
ret








#####################
#AES_KEY* ctx in %rdi
#userKey in in %rsi
#####################
.p2align 4
.globl  kasper_keysetup
kasper_keysetup:

# bitslice the master key
bitslicekey0 %rsi, %rdi

keyexp1  %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %rdi
keyexp   %xmm0, %xmm1, %xmm4, %xmm6, %xmm3, %xmm7, %xmm2, %xmm5, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %xmm1, 2, %rdi
keyexp   %xmm0, %xmm1, %xmm3, %xmm2, %xmm6, %xmm5, %xmm4, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %xmm6, 3, %rdi
keyexp   %xmm0, %xmm1, %xmm6, %xmm4, %xmm2, %xmm7, %xmm3, %xmm5, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %xmm3, 4, %rdi
keyexp   %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %xmm3, 5, %rdi
keyexp   %xmm0, %xmm1, %xmm4, %xmm6, %xmm3, %xmm7, %xmm2, %xmm5, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %xmm5, 6, %rdi
keyexp   %xmm0, %xmm1, %xmm3, %xmm2, %xmm6, %xmm5, %xmm4, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %xmm3, 7, %rdi
keyexp   %xmm0, %xmm1, %xmm6, %xmm4, %xmm2, %xmm7, %xmm3, %xmm5, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %xmm7, 8, %rdi
keyexp9  %xmm0, %xmm1, %xmm2, %xmm3, %xmm4, %xmm5, %xmm6, %xmm7, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %rdi
keyexp10 %xmm0, %xmm1, %xmm4, %xmm6, %xmm3, %xmm7, %xmm2, %xmm5, %xmm8, %xmm9, %xmm10, %xmm11, %xmm12, %xmm13, %xmm14, %xmm15, %rdi

ret


#####################
#allTweaks in %rdi
#tweak in %rsi
#####################
.p2align 4
.globl  jean_tweaksetup
jean_tweaksetup:

# bitslice the tweak input
bitslicekey0 %rsi, %rdi

ret

################################################################
.data

.globl RCON
.globl ROTB
.globl EXPB0
.globl ONE
.globl BS0
.globl BS1
.globl BS2
.globl M0
.globl SRM0
.globl ISRM0
.globl SR
.globl ISR
.globl CSTTWA
.globl CSTTWB
.globl CSTTWC
.globl CTRINC1
.globl CTRINC2
.globl CTRINC3
.globl CTRINC4
.globl CTRINC5
.globl CTRINC6
.globl CTRINC7
.p2align 4

RCON: .int 0x00000000, 0x00000000, 0x00000000, 0xffffffff
ROTB: .int 0x0c000000, 0x00000000, 0x04000000, 0x08000000
EXPB0: .int 0x03030303, 0x07070707, 0x0b0b0b0b, 0x0f0f0f0f
BS0: .quad 0x5555555555555555, 0x5555555555555555
BS1: .quad 0x3333333333333333, 0x3333333333333333
BS2: .quad 0x0f0f0f0f0f0f0f0f, 0x0f0f0f0f0f0f0f0f
ONE: .quad 0xffffffffffffffff, 0xffffffffffffffff
M0:  .quad 0x02060a0e03070b0f, 0x0004080c0105090d
SRM0:   .quad 0x0304090e00050a0f, 0x01060b0c0207080d
SR: .quad 0x0504070600030201, 0x0f0e0d0c0a09080b

CSTTWA: .quad 0x0000000000000000, 0x00000000000000aa
CSTTWB: .quad 0x0000000000000000, 0x00000000000000cc
CSTTWC: .quad 0x0000000000000000, 0x00000000000000f0

CTRINC1: .int 0x00000001, 0x00000000, 0x00000000, 0x00000000
CTRINC2: .int 0x00000002, 0x00000000, 0x00000000, 0x00000000
CTRINC3: .int 0x00000003, 0x00000000, 0x00000000, 0x00000000
CTRINC4: .int 0x00000004, 0x00000000, 0x00000000, 0x00000000
CTRINC5: .int 0x00000005, 0x00000000, 0x00000000, 0x00000000
CTRINC6: .int 0x00000006, 0x00000000, 0x00000000, 0x00000000
CTRINC7: .int 0x00000007, 0x00000000, 0x00000000, 0x00000000

ISRM0:  .quad 0x01040b0e0205080f, 0x0306090c00070a0d
ISR:    .quad 0x0504070602010003, 0x0f0e0d0c080b0a09 

