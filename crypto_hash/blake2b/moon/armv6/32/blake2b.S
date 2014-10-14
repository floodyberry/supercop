#include "arm.inc"

SECTION_TEXT

.arch armv5

.p2align 3
blake2b_constants_armv6:
.quad 0x6a09e667f3bcc908
.quad 0xbb67ae8584caa73b
.quad 0x3c6ef372fe94f82b
.quad 0xa54ff53a5f1d36f1
.quad 0x510e527fade682d1
.quad 0x9b05688c2b3e6c1f
.quad 0x1f83d9abfb41bd6b
.quad 0x5be0cd19137e2179

.p2align 3
blake2b_sigma_armv6:
.byte 0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120
.byte 112,80,32,64,72,120,104,48,8,96,0,16,88,56,40,24
.byte 88,64,96,0,40,16,120,104,80,112,24,48,56,8,72,32
.byte 56,72,24,8,104,96,88,112,16,48,40,80,32,0,120,64
.byte 72,0,40,56,16,32,80,120,112,8,88,96,48,64,24,104
.byte 16,96,48,80,0,88,64,24,32,104,56,40,120,112,8,72
.byte 96,40,8,120,112,104,32,80,0,56,48,24,72,16,64,88
.byte 104,88,56,112,96,8,24,72,40,0,120,32,64,48,16,80
.byte 48,120,112,72,88,24,0,64,96,16,104,56,8,32,80,40
.byte 80,16,64,32,56,48,8,40,120,88,72,112,24,96,104,0
.byte 0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120
.byte 112,80,32,64,72,120,104,48,8,96,0,16,88,56,40,24

GLOBAL_HIDDEN_FN blake2b_blocks_armv6
stmfd sp!, {r4-r12, r14}
sub sp, sp, #384
mov r4, #128
cmp r2, #128
bhs blake2b_blocks_armv6_use128
mov r4, r2
blake2b_blocks_armv6_use128:
mov r14, r1
str r4, [sp, #288]
str r2, [sp, #292]
str r3, [sp, #296]
str r0, [sp, #300]
ldr r4, [r0, #80]
ldr r5, [r0, #84]
ands r4, r4, r5
beq blake2b_blocks_armv6_nocopymessage
cmp r2, #128
beq blake2b_blocks_armv6_nocopymessage
eor r4, r4, r4
eor r5, r5, r5
eor r6, r6, r6
eor r7, r7, r7
eor r8, r8, r8
eor r9, r9, r9
eor r10, r10, r10
eor r11, r11, r11
stmia sp!, {r4-r11}
stmia sp!, {r4-r11}
stmia sp!, {r4-r11}
stmia sp!, {r4-r11}
sub sp, sp, #128
mov r3, sp
tst r2, #64
beq blake2b_blocks_armv6_skip64
ldmia r14!, {r4-r11}
stmia r3!, {r4-r11}
ldmia r14!, {r4-r11}
stmia r3!, {r4-r11}
blake2b_blocks_armv6_skip64:
tst r2, #32
beq blake2b_blocks_armv6_skip32
ldmia r14!, {r4-r11}
stmia r3!, {r4-r11}
blake2b_blocks_armv6_skip32:
tst r2, #16
beq blake2b_blocks_armv6_skip16
ldmia r14!, {r4-r7}
stmia r3!, {r4-r7}
blake2b_blocks_armv6_skip16:
tst r2, #8
beq blake2b_blocks_armv6_skip8
ldmia r14!, {r4-r5}
stmia r3!, {r4-r5}
blake2b_blocks_armv6_skip8:
tst r2, #4
beq blake2b_blocks_armv6_skip4
ldr r4, [r14], #4
str r4, [r3], #4
blake2b_blocks_armv6_skip4:
tst r2, #2
beq blake2b_blocks_armv6_skip2
ldrh r4, [r14], #2
strh r4, [r3], #2
blake2b_blocks_armv6_skip2:
tst r2, #1
beq blake2b_blocks_armv6_skip1
ldrb r4, [r14]
strb r4, [r3]
blake2b_blocks_armv6_skip1:
mov r14, sp
blake2b_blocks_armv6_nocopymessage:
ldmia r0!, {r4-r11}
str r4, [sp, #128]
str r5, [sp, #132]
str r6, [sp, #160]
str r7, [sp, #164]
str r8, [sp, #192]
str r9, [sp, #196]
str r10, [sp, #224]
str r11, [sp, #228]
ldmia r0!, {r4-r11}
str r4, [sp, #136]
str r5, [sp, #140]
str r6, [sp, #168]
str r7, [sp, #172]
str r8, [sp, #200]
str r9, [sp, #204]
str r10, [sp, #232]
str r11, [sp, #236]
ldmia r0!, {r4-r7}
str r4, [sp, #256]
str r5, [sp, #260]
str r6, [sp, #264]
str r7, [sp, #268]
ldmia r0!, {r4-r7}
ldr r8, =blake2b_constants_armv6
add r8, r8, #48
ldm r8, {r8-r11}
eor r4, r4, r8
eor r5, r5, r9
eor r6, r6, r10
eor r7, r7, r11
str r4, [sp, #272]
str r5, [sp, #276]
str r6, [sp, #280]
str r7, [sp, #284]
blake2b_blocks_armv6_mainloop:
add r0, sp, #128
add r1, sp, #320
ldmia r0, {r4-r7}
stmia r1!, {r4-r7}
add r0, r0, #32
ldmia r0, {r4-r7}
stmia r1!, {r4-r7}
add r0, r0, #32
ldmia r0, {r4-r7}
stmia r1!, {r4-r7}
add r0, r0, #32
ldmia r0, {r4-r7}
stmia r1, {r4-r7}
ldr r0, [sp, #256]
ldr r1, [sp, #260]
ldr r2, [sp, #264]
ldr r3, [sp, #268]
ldr r12, [sp, #288]
adds r0, r0, r12
adcs r1, r1, #0
bne blake2b_blocks_armv6_nocarry
cmp r0, r12
bhs blake2b_blocks_armv6_nocarry
adds r2, r2, #1
adc r3, r3, #0
blake2b_blocks_armv6_nocarry:
str r0, [sp, #256]
str r1, [sp, #260]
str r2, [sp, #264]
str r3, [sp, #268]
ldr r4, =blake2b_constants_armv6
add r4, #32
ldm r4, {r4-r7}
eor r0, r0, r4
eor r1, r1, r5
eor r2, r2, r6
eor r3, r3, r7
str r0, [sp, #152]
str r1, [sp, #156]
str r2, [sp, #184]
str r3, [sp, #188]
ldr r0, =blake2b_constants_armv6
ldm r0, {r0-r7}
ldr r8, [sp, #272]
ldr r9, [sp, #276]
ldr r10, [sp, #280]
ldr r11, [sp, #284]
str r0, [sp, #144]
str r1, [sp, #148]
str r2, [sp, #176]
str r3, [sp, #180]
str r4, [sp, #208]
str r5, [sp, #212]
str r6, [sp, #240]
str r7, [sp, #244]
str r8, [sp, #216]
str r9, [sp, #220]
str r10, [sp, #248]
str r11, [sp, #252]
ldr r0, =blake2b_sigma_armv6
mov r1, #12
str r1, [sp, #304]
b blake2b_blocks_armv6_rounds

.ltorg

blake2b_blocks_armv6_rounds:
add r12, sp, #128
ldmia r12, {r4-r11}
ldrb r1, [r0, #((2*0)+0)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r10, r10, r4
eor r11, r11, r5
adds r8, r8, r11
adc r9, r9, r10
eor r6, r6, r8
eor r7, r7, r9
mov r12, r6, lsl #8
mov r3, r7, lsl #8
orr r7, r12, r7, lsr #24
orr r6, r3, r6, lsr #24
ldrb r1, [r0, #((2*0)+1)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r11, r11, r4
eor r10, r10, r5
mov r12, r11, lsr #16
mov r3, r10, lsr #16
orr r10, r12, r10, lsl #16
orr r11, r3, r11, lsl #16
adds r8, r8, r10
adc r9, r9, r11
eor r6, r6, r8
eor r3, r7, r9
adds r6, r6, r6
adc r7, r3, r3
orr r6, r6, r3, lsr #31
add r12, sp, #128
stmia r12!, {r4-r11}
ldmia r12, {r4-r11}
ldrb r1, [r0, #((2*1)+0)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r10, r10, r4
eor r11, r11, r5
adds r8, r8, r11
adc r9, r9, r10
eor r6, r6, r8
eor r7, r7, r9
mov r12, r6, lsl #8
mov r3, r7, lsl #8
orr r7, r12, r7, lsr #24
orr r6, r3, r6, lsr #24
ldrb r1, [r0, #((2*1)+1)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r11, r11, r4
eor r10, r10, r5
mov r12, r11, lsr #16
mov r3, r10, lsr #16
orr r10, r12, r10, lsl #16
orr r11, r3, r11, lsl #16
adds r8, r8, r10
adc r9, r9, r11
eor r6, r6, r8
eor r3, r7, r9
adds r6, r6, r6
adc r7, r3, r3
orr r6, r6, r3, lsr #31
add r12, sp, #160
stmia r12!, {r4-r11}
ldmia r12, {r4-r11}
ldrb r1, [r0, #((2*2)+0)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r10, r10, r4
eor r11, r11, r5
adds r8, r8, r11
adc r9, r9, r10
eor r6, r6, r8
eor r7, r7, r9
mov r12, r6, lsl #8
mov r3, r7, lsl #8
orr r7, r12, r7, lsr #24
orr r6, r3, r6, lsr #24
ldrb r1, [r0, #((2*2)+1)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r11, r11, r4
eor r10, r10, r5
mov r12, r11, lsr #16
mov r3, r10, lsr #16
orr r10, r12, r10, lsl #16
orr r11, r3, r11, lsl #16
adds r8, r8, r10
adc r9, r9, r11
eor r6, r6, r8
eor r3, r7, r9
adds r6, r6, r6
adc r7, r3, r3
orr r6, r6, r3, lsr #31
add r12, sp, #192
stmia r12!, {r4-r11}
ldmia r12, {r4-r11}
ldrb r1, [r0, #((2*3)+0)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r10, r10, r4
eor r11, r11, r5
adds r8, r8, r11
adc r9, r9, r10
eor r6, r6, r8
eor r7, r7, r9
mov r12, r6, lsl #8
mov r3, r7, lsl #8
orr r7, r12, r7, lsr #24
orr r6, r3, r6, lsr #24
ldrb r1, [r0, #((2*3)+1)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r11, r11, r4
eor r10, r10, r5
mov r12, r11, lsr #16
mov r3, r10, lsr #16
orr r10, r12, r10, lsl #16
orr r11, r3, r11, lsl #16
adds r8, r8, r10
adc r9, r9, r11
eor r6, r6, r8
eor r3, r7, r9
adds r6, r6, r6
adc r7, r3, r3
orr r6, r6, r3, lsr #31
add r12, sp, #224
stmia r12!, {r4-r11}
ldr r4, [sp, #128]
ldr r5, [sp, #132]
ldr r6, [sp, #168]
ldr r7, [sp, #172]
ldr r8, [sp, #208]
ldr r9, [sp, #212]
ldr r10, [sp, #248]
ldr r11, [sp, #252]
ldrb r1, [r0, #((2*4)+0)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r10, r10, r4
eor r11, r11, r5
adds r8, r8, r11
adc r9, r9, r10
eor r6, r6, r8
eor r7, r7, r9
mov r12, r6, lsl #8
mov r3, r7, lsl #8
orr r7, r12, r7, lsr #24
orr r6, r3, r6, lsr #24
ldrb r1, [r0, #((2*4)+1)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r11, r11, r4
eor r10, r10, r5
mov r12, r11, lsr #16
mov r3, r10, lsr #16
orr r10, r12, r10, lsl #16
orr r11, r3, r11, lsl #16
adds r8, r8, r10
adc r9, r9, r11
eor r6, r6, r8
eor r3, r7, r9
adds r6, r6, r6
adc r7, r3, r3
orr r6, r6, r3, lsr #31
str r4, [sp, #128]
str r5, [sp, #132]
str r6, [sp, #168]
str r7, [sp, #172]
str r8, [sp, #208]
str r9, [sp, #212]
str r10, [sp, #248]
str r11, [sp, #252]
ldr r4, [sp, #160]
ldr r5, [sp, #164]
ldr r6, [sp, #200]
ldr r7, [sp, #204]
ldr r8, [sp, #240]
ldr r9, [sp, #244]
ldr r10, [sp, #152]
ldr r11, [sp, #156]
ldrb r1, [r0, #((2*5)+0)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r10, r10, r4
eor r11, r11, r5
adds r8, r8, r11
adc r9, r9, r10
eor r6, r6, r8
eor r7, r7, r9
mov r12, r6, lsl #8
mov r3, r7, lsl #8
orr r7, r12, r7, lsr #24
orr r6, r3, r6, lsr #24
ldrb r1, [r0, #((2*5)+1)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r11, r11, r4
eor r10, r10, r5
mov r12, r11, lsr #16
mov r3, r10, lsr #16
orr r10, r12, r10, lsl #16
orr r11, r3, r11, lsl #16
adds r8, r8, r10
adc r9, r9, r11
eor r6, r6, r8
eor r3, r7, r9
adds r6, r6, r6
adc r7, r3, r3
orr r6, r6, r3, lsr #31
str r4, [sp, #160]
str r5, [sp, #164]
str r6, [sp, #200]
str r7, [sp, #204]
str r8, [sp, #240]
str r9, [sp, #244]
str r10, [sp, #152]
str r11, [sp, #156]
ldr r4, [sp, #192]
ldr r5, [sp, #196]
ldr r6, [sp, #232]
ldr r7, [sp, #236]
ldr r8, [sp, #144]
ldr r9, [sp, #148]
ldr r10, [sp, #184]
ldr r11, [sp, #188]
ldrb r1, [r0, #((2*6)+0)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r10, r10, r4
eor r11, r11, r5
adds r8, r8, r11
adc r9, r9, r10
eor r6, r6, r8
eor r7, r7, r9
mov r12, r6, lsl #8
mov r3, r7, lsl #8
orr r7, r12, r7, lsr #24
orr r6, r3, r6, lsr #24
ldrb r1, [r0, #((2*6)+1)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r11, r11, r4
eor r10, r10, r5
mov r12, r11, lsr #16
mov r3, r10, lsr #16
orr r10, r12, r10, lsl #16
orr r11, r3, r11, lsl #16
adds r8, r8, r10
adc r9, r9, r11
eor r6, r6, r8
eor r3, r7, r9
adds r6, r6, r6
adc r7, r3, r3
orr r6, r6, r3, lsr #31
str r4, [sp, #192]
str r5, [sp, #196]
str r6, [sp, #232]
str r7, [sp, #236]
str r8, [sp, #144]
str r9, [sp, #148]
str r10, [sp, #184]
str r11, [sp, #188]
ldr r4, [sp, #224]
ldr r5, [sp, #228]
ldr r6, [sp, #136]
ldr r7, [sp, #140]
ldr r8, [sp, #176]
ldr r9, [sp, #180]
ldr r10, [sp, #216]
ldr r11, [sp, #220]
ldrb r1, [r0, #((2*7)+0)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r10, r10, r4
eor r11, r11, r5
adds r8, r8, r11
adc r9, r9, r10
eor r6, r6, r8
eor r7, r7, r9
mov r12, r6, lsl #8
mov r3, r7, lsl #8
orr r7, r12, r7, lsr #24
orr r6, r3, r6, lsr #24
ldrb r1, [r0, #((2*7)+1)]
add r1, r1, r14
ldr r2, [r1, #0]
ldr r3, [r1, #4]
adds r4, r4, r2
adc r5, r5, r3
adds r4, r4, r6
adc r5, r5, r7
eor r11, r11, r4
eor r10, r10, r5
mov r12, r11, lsr #16
mov r3, r10, lsr #16
orr r10, r12, r10, lsl #16
orr r11, r3, r11, lsl #16
adds r8, r8, r10
adc r9, r9, r11
eor r6, r6, r8
eor r3, r7, r9
adds r6, r6, r6
adc r7, r3, r3
orr r6, r6, r3, lsr #31
str r4, [sp, #224]
str r5, [sp, #228]
str r6, [sp, #136]
str r7, [sp, #140]
str r8, [sp, #176]
str r9, [sp, #180]
str r10, [sp, #216]
str r11, [sp, #220]
ldr r1, [sp, #304]
subs r1, r1, #1
add r0, r0, #16
str r1, [sp, #304]
bne blake2b_blocks_armv6_rounds
add r12, sp, #128
add r9, sp, #320
ldm r12, {r0-r7}
eor r0, r4
eor r1, r5
eor r2, r6
eor r3, r7
ldmia r9!, {r4-r7}
eor r0, r4
eor r1, r5
eor r2, r6
eor r3, r7
stm r12, {r0-r3}
add r12, #32
ldm r12, {r0-r7}
eor r0, r4
eor r1, r5
eor r2, r6
eor r3, r7
ldmia r9!, {r4-r7}
eor r0, r4
eor r1, r5
eor r2, r6
eor r3, r7
stm r12, {r0-r3}
add r12, #32
ldm r12, {r0-r7}
eor r0, r4
eor r1, r5
eor r2, r6
eor r3, r7
ldmia r9!, {r4-r7}
eor r0, r4
eor r1, r5
eor r2, r6
eor r3, r7
stm r12, {r0-r3}
add r12, #32
ldm r12, {r0-r7}
eor r0, r4
eor r1, r5
eor r2, r6
eor r3, r7
ldmia r9, {r4-r7}
eor r0, r4
eor r1, r5
eor r2, r6
eor r3, r7
stm r12, {r0-r3}
ldr r0, [sp, #292]
cmp r0, #128
bls blake2b_blocks_armv6_done
ldr r1, [sp, #288]
sub r0, #128
add r14, r1
str r0, [sp, #292]
b blake2b_blocks_armv6_mainloop
blake2b_blocks_armv6_done:
ldr r14, [sp, #300]
ldr r0, [sp, #128]
ldr r1, [sp, #132]
ldr r8, [sp, #136]
ldr r9, [sp, #140]
ldr r2, [sp, #160]
ldr r3, [sp, #164]
ldr r10, [sp, #168]
ldr r11, [sp, #172]
ldr r4, [sp, #192]
ldr r5, [sp, #196]
ldr r6, [sp, #224]
ldr r7, [sp, #228]
stmia r14!, {r0-r11}
ldr r0, [sp, #200]
ldr r1, [sp, #204]
ldr r2, [sp, #232]
ldr r3, [sp, #236]
ldr r4, [sp, #256]
ldr r5, [sp, #260]
ldr r6, [sp, #264]
ldr r7, [sp, #268]
stmia r14, {r0-r7}
add sp, sp, #384
ldmfd sp!, {r4-r12, r14}
bx lr
FN_END blake2b_blocks_armv6

