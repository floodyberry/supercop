        .syntax unified
        .thumb
        .section        .text.compress,"ax",%progbits
        .align  2
        .global compress
        .thumb
        .thumb_func
        .type   compress, %function
compress:
        
sub sp,sp,#256
cmp r2,#1
blo ._end
str r2,[sp,#128]
str r4,[sp,#132]
str r5,[sp,#136]
str r6,[sp,#140]
str r7,[sp,#144]
str r8,[sp,#148]
str r9,[sp,#152]
str r10,[sp,#156]
str r11,[sp,#160]
str r14,[sp,#164]
ldr r2,[r3,#0]
ldr r4,[r3,#4]
ldr r5,[r3,#8]
ldr r6,[r3,#12]
ldr r7,[r3,#16]
ldr r8,[r3,#20]
ldr r9,[r3,#24]
ldr r10,[r3,#28]
str r2,[sp,#168]
str r4,[sp,#172]
str r5,[sp,#176]
str r6,[sp,#180]
str r7,[sp,#184]
str r8,[sp,#188]
str r9,[sp,#192]
str r10,[sp,#196]
ldr r2,[r3,#32]
ldr r4,[r3,#36]
ldr r5,[r3,#40]
ldr r6,[r3,#44]
ldr r7,[r3,#48]
ldr r8,[r3,#52]
ldr r9,[r3,#56]
ldr r3,[r3,#60]
str r2,[sp,#200]
str r4,[sp,#204]
str r5,[sp,#208]
str r6,[sp,#212]
str r7,[sp,#216]
str r8,[sp,#220]
str r9,[sp,#224]
str r3,[sp,#228]
ldr r2,[r0,#0]
ldr r3,[r0,#4]
ldr r4,[r0,#8]
ldr r5,[r0,#12]
ldr r6,[r0,#16]
ldr r7,[r0,#20]
ldr r8,[r0,#24]
ldr r12,[r0,#28]
._mainloop:
mov r14,r8

/* 
* CWB: Cortex-M3 cannot switch endianess at runtime 
* using thumb-2 REV instruction instead.
* Also changed LDRD pairs to LDM, shaves off a few more cycles.
* Interleaved the STRDs with the REVs, does't matter on my M3 but
* might be faster on an A8.
*/

ldmia r1!,{r8-r11}
rev r8,r8
rev r9,r9
strd r8,[sp,#40]
rev r10,r10
rev r11,r11
strd r10,[sp,#48]

ldmia r1!,{r8-r11}
rev r8,r8
rev r9,r9
strd r8,[sp,#56]
rev r10,r10
rev r11,r11
strd r10,[sp,#64]

ldmia r1!,{r8-r11}
rev r8,r8
rev r9,r9
strd r8,[sp,#72]
rev r10,r10
rev r11,r11
strd r10,[sp,#80]

ldmia r1!,{r8-r11}
rev r8,r8
rev r9,r9
strd r8,[sp,#88]
rev r10,r10
rev r11,r11
strd r10,[sp,#96]

/* undo adjustment of r1 to LDM */
sub r1,#64

/* /CWB: from here on Peters code */
str r1,[sp,#232]
mov r1,r14
ldr r8,[r0,#48]
ldr r9,[r0,#52]
cmp r8,#-512
add r8,r8,#512
adc r9,r9,#0
str r8,[r0,#48]
str r9,[r0,#52]
ldr r8,[sp,#172]
ldr r9,[r0,#36]
ldr r11,[sp,#188]
ldr r14,[r0,#48]
eor r10,r9,r8
ldr r8,[sp,#176]
ldr r9,[r0,#40]
eor r11,r14,r11
strd r10,[sp,#104]
ldr r11,[sp,#192]
ldr r14,[r0,#52]
eor r10,r9,r8
ldr r8,[sp,#180]
ldr r9,[r0,#44]
eor r11,r14,r11
strd r10,[sp,#112]
ldr r11,[sp,#196]
ldr r14,[r0,#52]
eor r10,r9,r8
ldr r8,[sp,#168]
ldr r9,[r0,#32]
eor r11,r14,r11
strd r10,[sp,#120]
ldr r10,[sp,#184]
ldr r11,[r0,#48]
eor r8,r9,r8
ldr r9,[sp,#172]
ldr r14,[sp,#40]
eor r10,r11,r10
str r0,[sp,#236]
	
eor r0,r14,r9
add r2,r2,r6,ROR #0
add r0,r2,r0,ROR #0
ldr r2,[sp,#168]
eor r9,r10,r0,ROR #0
ldr r10,[sp,#44]
add r8,r8,r9,ROR #16
ldr r14,[sp,#180]
eor r6,r6,r8,ROR #0
eor r2,r10,r2
add r0,r0,r6,ROR #12
add r0,r0,r2,ROR #0
ldr r2,[sp,#48]
eor r9,r9,r0,ROR #16
str r9,[sp,#12]
add r8,r8,r9,ROR #24
str r8,[sp,#24]
eor r6,r6,r8,ROR #20
ldrd r10,[sp,#104]
eor r2,r2,r14
add r3,r3,r7,ROR #0
add r2,r3,r2,ROR #0
ldr r3,[sp,#176]
eor r8,r11,r2,ROR #0
ldr r9,[sp,#52]
add r10,r10,r8,ROR #16
ldr r14,[sp,#188]
eor r7,r7,r10,ROR #0
eor r3,r9,r3
add r2,r2,r7,ROR #12
add r2,r2,r3,ROR #0
ldr r3,[sp,#56]
eor r8,r8,r2,ROR #16
str r8,[sp,#28]
add r8,r10,r8,ROR #24
str r8,[sp,#32]
eor r7,r7,r8,ROR #20
ldrd r10,[sp,#112]
eor r3,r3,r14
add r4,r4,r1,ROR #0
add r3,r4,r3,ROR #0
ldr r4,[sp,#184]
eor r8,r11,r3,ROR #0
ldr r9,[sp,#60]
add r10,r10,r8,ROR #16
ldr r14,[sp,#196]
eor r1,r1,r10,ROR #0
eor r4,r9,r4
add r3,r3,r1,ROR #12
add r3,r3,r4,ROR #0
ldr r4,[sp,#64]
eor r8,r8,r3,ROR #16
str r8,[sp,#36]
add r8,r10,r8,ROR #24
add r5,r5,r12,ROR #0
eor r1,r1,r8,ROR #20
ldrd r10,[sp,#120]
eor r4,r4,r14
add r4,r5,r4,ROR #0
ldr r5,[sp,#192]
eor r9,r11,r4,ROR #0
ldr r11,[sp,#68]
add r10,r10,r9,ROR #16
ldr r14,[sp,#204]
eor r12,r12,r10,ROR #0
eor r5,r11,r5
add r4,r4,r12,ROR #12
add r4,r4,r5,ROR #0
ldr r5,[sp,#72]
eor r9,r9,r4,ROR #16
add r0,r0,r7,ROR #19
add r10,r10,r9,ROR #24
str r10,[sp,#8]
eor r12,r12,r10,ROR #20
eor r5,r5,r14
add r0,r0,r5,ROR #0
ldr r5,[sp,#200]
eor r9,r9,r0,ROR #8
ldr r10,[sp,#76]
add r8,r8,r9,ROR #8
ldr r14,[sp,#228]
eor r7,r7,r8,ROR #13
eor r5,r10,r5
add r0,r0,r7,ROR #31
add r0,r0,r5,ROR #0
ldr r5,[sp,#96]
eor r9,r9,r0,ROR #24
str r9,[sp,#124]
add r8,r8,r9,ROR #16
str r8,[sp,#112]
eor r7,r7,r8,ROR #1
ldrd r10,[sp,#32]
eor r5,r5,r14
add r4,r4,r6,ROR #19
add r4,r4,r5,ROR #0
ldr r5,[sp,#224]
eor r8,r11,r4,ROR #8
ldr r9,[sp,#100]
add r10,r10,r8,ROR #8
ldr r14,[sp,#220]
eor r6,r6,r10,ROR #13
eor r5,r9,r5
add r4,r4,r6,ROR #31
add r4,r4,r5,ROR #0
ldr r5,[sp,#88]
eor r8,r8,r4,ROR #24
str r8,[sp,#116]
add r8,r10,r8,ROR #16
str r8,[sp,#104]
eor r6,r6,r8,ROR #1
ldrd r10,[sp,#24]
eor r5,r5,r14
add r3,r3,r12,ROR #19
add r3,r3,r5,ROR #0
ldr r5,[sp,#216]
eor r8,r11,r3,ROR #8
ldr r9,[sp,#92]
add r10,r10,r8,ROR #8
ldr r14,[sp,#212]
eor r12,r12,r10,ROR #13
eor r5,r9,r5
add r3,r3,r12,ROR #31
add r3,r3,r5,ROR #0
ldr r5,[sp,#80]
eor r8,r8,r3,ROR #24
str r8,[sp,#108]
add r8,r10,r8,ROR #16
ldrd r10,[sp,#8]
eor r5,r5,r14
add r2,r2,r1,ROR #19
add r2,r2,r5,ROR #0
ldr r5,[sp,#208]
eor r9,r11,r2,ROR #8
ldr r11,[sp,#84]
add r10,r10,r9,ROR #8
eor r12,r12,r8,ROR #1
eor r1,r1,r10,ROR #13
eor r11,r11,r5
add r2,r2,r1,ROR #31
add r2,r2,r11,ROR #0
ldr r11,[sp,#96]
eor r9,r9,r2,ROR #24
add r0,r0,r6,ROR #6
add r10,r10,r9,ROR #16
str r10,[sp,#120]
eor r1,r1,r10,ROR #1
eor r5,r11,r5
add r0,r0,r5,ROR #0
ldr r5,[sp,#224]
eor r9,r9,r0,ROR #16
ldr r10,[sp,#80]
add r8,r8,r9,ROR #0
ldr r14,[sp,#200]
eor r6,r6,r8,ROR #26
eor r5,r10,r5
add r0,r0,r6,ROR #18
add r0,r0,r5,ROR #0
ldr r5,[sp,#56]
eor r9,r9,r0,ROR #0
str r9,[sp,#12]
add r8,r8,r9,ROR #8
str r8,[sp,#24]
eor r6,r6,r8,ROR #14
ldrd r10,[sp,#104]
eor r5,r5,r14
add r2,r2,r7,ROR #6
add r2,r2,r5,ROR #0
ldr r5,[sp,#184]
eor r8,r11,r2,ROR #16
ldr r9,[sp,#72]
add r10,r10,r8,ROR #0
ldr r14,[sp,#228]
eor r7,r7,r10,ROR #26
eor r5,r9,r5
add r2,r2,r7,ROR #18
add r2,r2,r5,ROR #0
ldr r5,[sp,#76]
eor r8,r8,r2,ROR #0
str r8,[sp,#28]
add r8,r10,r8,ROR #8
str r8,[sp,#32]
eor r7,r7,r8,ROR #14
ldrd r10,[sp,#112]
eor r5,r5,r14
add r3,r3,r1,ROR #6
add r3,r3,r5,ROR #0
ldr r5,[sp,#204]
eor r8,r11,r3,ROR #16
ldr r9,[sp,#100]
add r10,r10,r8,ROR #0
ldr r14,[sp,#192]
eor r1,r1,r10,ROR #26
eor r5,r9,r5
add r3,r3,r1,ROR #18
add r3,r3,r5,ROR #0
ldr r5,[sp,#92]
eor r8,r8,r3,ROR #0
str r8,[sp,#36]
add r8,r10,r8,ROR #8
ldrd r10,[sp,#120]
eor r5,r5,r14
add r4,r4,r12,ROR #6
add r4,r4,r5,ROR #0
ldr r5,[sp,#220]
eor r9,r11,r4,ROR #16
ldr r11,[sp,#64]
add r10,r10,r9,ROR #0
ldr r14,[sp,#216]
eor r12,r12,r10,ROR #26
eor r5,r11,r5
add r4,r4,r12,ROR #18
add r4,r4,r5,ROR #0
ldr r5,[sp,#44]
eor r9,r9,r4,ROR #0
eor r1,r1,r8,ROR #14
add r10,r10,r9,ROR #8
str r10,[sp,#8]
eor r12,r12,r10,ROR #14
eor r5,r5,r14
add r0,r0,r7,ROR #25
add r0,r0,r5,ROR #0
ldr r5,[sp,#172]
eor r9,r9,r0,ROR #24
ldr r10,[sp,#88]
add r8,r8,r9,ROR #24
ldr r14,[sp,#180]
eor r7,r7,r8,ROR #7
eor r5,r10,r5
add r0,r0,r7,ROR #5
add r0,r0,r5,ROR #0
ldr r5,[sp,#60]
eor r9,r9,r0,ROR #8
str r9,[sp,#124]
add r8,r8,r9,ROR #0
str r8,[sp,#112]
eor r7,r7,r8,ROR #27
ldrd r10,[sp,#32]
eor r5,r5,r14
add r4,r4,r6,ROR #25
add r4,r4,r5,ROR #0
ldr r5,[sp,#188]
eor r8,r11,r4,ROR #24
ldr r9,[sp,#52]
add r10,r10,r8,ROR #24
ldr r14,[sp,#196]
eor r6,r6,r10,ROR #7
eor r5,r9,r5
add r4,r4,r6,ROR #5
add r4,r4,r5,ROR #0
ldr r5,[sp,#84]
eor r8,r8,r4,ROR #8
str r8,[sp,#116]
add r8,r10,r8,ROR #0
str r8,[sp,#104]
eor r6,r6,r8,ROR #27
ldrd r10,[sp,#24]
eor r5,r5,r14
add r3,r3,r12,ROR #25
add r3,r3,r5,ROR #0
ldr r5,[sp,#212]
eor r8,r11,r3,ROR #24
ldr r9,[sp,#68]
add r10,r10,r8,ROR #24
ldr r14,[sp,#176]
eor r12,r12,r10,ROR #7
eor r5,r9,r5
add r3,r3,r12,ROR #5
add r3,r3,r5,ROR #0
ldr r5,[sp,#40]
eor r8,r8,r3,ROR #8
str r8,[sp,#108]
add r8,r10,r8,ROR #0
ldrd r10,[sp,#8]
eor r5,r5,r14
add r2,r2,r1,ROR #25
add r2,r2,r5,ROR #0
ldr r5,[sp,#168]
eor r9,r11,r2,ROR #24
ldr r11,[sp,#48]
add r10,r10,r9,ROR #24
ldr r14,[sp,#200]
eor r1,r1,r10,ROR #7
eor r5,r11,r5
add r2,r2,r1,ROR #5
add r2,r2,r5,ROR #0
ldr r5,[sp,#84]
eor r9,r9,r2,ROR #8
eor r12,r12,r8,ROR #27
add r10,r10,r9,ROR #0
str r10,[sp,#120]
eor r1,r1,r10,ROR #27
eor r5,r5,r14
add r0,r0,r6,ROR #12
add r0,r0,r5,ROR #0
ldr r5,[sp,#212]
eor r9,r9,r0,ROR #0
ldr r10,[sp,#72]
add r8,r8,r9,ROR #16
ldr r14,[sp,#168]
eor r6,r6,r8,ROR #20
eor r5,r10,r5
add r0,r0,r6,ROR #24
add r0,r0,r5,ROR #0
ldr r5,[sp,#88]
eor r9,r9,r0,ROR #16
str r9,[sp,#12]
add r8,r8,r9,ROR #24
str r8,[sp,#24]
eor r6,r6,r8,ROR #8
ldrd r10,[sp,#104]
eor r5,r5,r14
add r2,r2,r7,ROR #12
add r2,r2,r5,ROR #0
ldr r5,[sp,#216]
eor r8,r11,r2,ROR #0
ldr r9,[sp,#40]
add r10,r10,r8,ROR #16
ldr r14,[sp,#176]
eor r7,r7,r10,ROR #20
eor r5,r9,r5
add r2,r2,r7,ROR #24
add r2,r2,r5,ROR #0
ldr r5,[sp,#60]
eor r8,r8,r2,ROR #16
str r8,[sp,#28]
add r8,r10,r8,ROR #24
str r8,[sp,#32]
eor r7,r7,r8,ROR #8
ldrd r10,[sp,#112]
eor r5,r5,r14
add r3,r3,r1,ROR #12
add r3,r3,r5,ROR #0
ldr r5,[sp,#188]
eor r8,r11,r3,ROR #0
ldr r9,[sp,#48]
add r10,r10,r8,ROR #16
ldr r14,[sp,#220]
eor r1,r1,r10,ROR #20
eor r5,r9,r5
add r3,r3,r1,ROR #24
add r3,r3,r5,ROR #0
ldr r5,[sp,#100]
eor r8,r8,r3,ROR #16
str r8,[sp,#36]
add r8,r10,r8,ROR #24
ldrd r10,[sp,#120]
eor r5,r5,r14
add r4,r4,r12,ROR #12
add r4,r4,r5,ROR #0
ldr r5,[sp,#228]
eor r9,r11,r4,ROR #0
ldr r11,[sp,#92]
add r10,r10,r9,ROR #16
ldr r14,[sp,#224]
eor r12,r12,r10,ROR #20
eor r5,r11,r5
add r4,r4,r12,ROR #24
add r4,r4,r5,ROR #0
ldr r5,[sp,#80]
eor r9,r9,r4,ROR #16
eor r1,r1,r8,ROR #8
add r10,r10,r9,ROR #24
str r10,[sp,#8]
eor r12,r12,r10,ROR #8
eor r5,r5,r14
add r0,r0,r7,ROR #31
add r0,r0,r5,ROR #0
ldr r5,[sp,#208]
eor r9,r9,r0,ROR #8
ldr r10,[sp,#96]
add r8,r8,r9,ROR #8
ldr r14,[sp,#184]
eor r7,r7,r8,ROR #1
eor r5,r10,r5
add r0,r0,r7,ROR #11
add r0,r0,r5,ROR #0
ldr r5,[sp,#76]
eor r9,r9,r0,ROR #24
str r9,[sp,#124]
add r8,r8,r9,ROR #16
str r8,[sp,#112]
eor r7,r7,r8,ROR #21
ldrd r10,[sp,#32]
eor r5,r5,r14
add r4,r4,r6,ROR #31
add r4,r4,r5,ROR #0
ldr r5,[sp,#204]
eor r8,r11,r4,ROR #8
ldr r9,[sp,#56]
add r10,r10,r8,ROR #8
ldr r14,[sp,#172]
eor r6,r6,r10,ROR #1
eor r5,r9,r5
add r4,r4,r6,ROR #11
add r4,r4,r5,ROR #0
ldr r5,[sp,#68]
eor r8,r8,r4,ROR #24
str r8,[sp,#116]
add r8,r10,r8,ROR #16
str r8,[sp,#104]
eor r6,r6,r8,ROR #21
ldrd r10,[sp,#24]
eor r5,r5,r14
add r3,r3,r12,ROR #31
add r3,r3,r5,ROR #0
ldr r5,[sp,#196]
eor r8,r11,r3,ROR #8
ldr r9,[sp,#44]
add r10,r10,r8,ROR #8
ldr r14,[sp,#192]
eor r12,r12,r10,ROR #1
eor r5,r9,r5
add r3,r3,r12,ROR #11
add r3,r3,r5,ROR #0
ldr r5,[sp,#52]
eor r8,r8,r3,ROR #24
str r8,[sp,#108]
add r8,r10,r8,ROR #16
ldrd r10,[sp,#8]
eor r5,r5,r14
add r2,r2,r1,ROR #31
add r2,r2,r5,ROR #0
ldr r5,[sp,#180]
eor r9,r11,r2,ROR #8
ldr r11,[sp,#64]
add r10,r10,r9,ROR #8
ldr r14,[sp,#204]
eor r1,r1,r10,ROR #1
eor r5,r11,r5
add r2,r2,r1,ROR #11
add r2,r2,r5,ROR #0
ldr r5,[sp,#68]
eor r9,r9,r2,ROR #24
eor r12,r12,r8,ROR #21
add r10,r10,r9,ROR #16
str r10,[sp,#120]
eor r1,r1,r10,ROR #21
eor r5,r5,r14
add r0,r0,r6,ROR #18
add r0,r0,r5,ROR #0
ldr r5,[sp,#196]
eor r9,r9,r0,ROR #16
ldr r10,[sp,#76]
add r8,r8,r9,ROR #0
ldr r14,[sp,#172]
eor r6,r6,r8,ROR #14
eor r5,r10,r5
add r0,r0,r6,ROR #30
add r0,r0,r5,ROR #0
ldr r5,[sp,#52]
eor r9,r9,r0,ROR #0
str r9,[sp,#12]
add r8,r8,r9,ROR #8
str r8,[sp,#24]
eor r6,r6,r8,ROR #2
ldrd r10,[sp,#104]
eor r5,r5,r14
add r2,r2,r7,ROR #18
add r2,r2,r5,ROR #0
ldr r5,[sp,#180]
eor r8,r11,r2,ROR #16
ldr r9,[sp,#44]
add r10,r10,r8,ROR #0
ldr r14,[sp,#216]
eor r7,r7,r10,ROR #14
eor r5,r9,r5
add r2,r2,r7,ROR #30
add r2,r2,r5,ROR #0
ldr r5,[sp,#92]
eor r8,r8,r2,ROR #0
str r8,[sp,#28]
add r8,r10,r8,ROR #8
str r8,[sp,#32]
eor r7,r7,r8,ROR #2
ldrd r10,[sp,#112]
eor r5,r5,r14
add r3,r3,r1,ROR #18
add r3,r3,r5,ROR #0
ldr r5,[sp,#220]
eor r8,r11,r3,ROR #16
ldr r9,[sp,#88]
add r10,r10,r8,ROR #0
ldr r14,[sp,#224]
eor r1,r1,r10,ROR #14
eor r5,r9,r5
add r3,r3,r1,ROR #30
add r3,r3,r5,ROR #0
ldr r5,[sp,#84]
eor r8,r8,r3,ROR #0
str r8,[sp,#36]
add r8,r10,r8,ROR #8
ldrd r10,[sp,#120]
eor r5,r5,r14
add r4,r4,r12,ROR #18
add r4,r4,r5,ROR #0
ldr r5,[sp,#212]
eor r9,r11,r4,ROR #16
ldr r11,[sp,#96]
add r10,r10,r9,ROR #0
ldr r14,[sp,#192]
eor r12,r12,r10,ROR #14
eor r5,r11,r5
add r4,r4,r12,ROR #30
add r4,r4,r5,ROR #0
ldr r5,[sp,#48]
eor r9,r9,r4,ROR #0
eor r1,r1,r8,ROR #2
add r10,r10,r9,ROR #8
str r10,[sp,#8]
eor r12,r12,r10,ROR #2
eor r5,r5,r14
add r0,r0,r7,ROR #5
add r0,r0,r5,ROR #0
ldr r5,[sp,#176]
eor r9,r9,r0,ROR #24
ldr r10,[sp,#64]
add r8,r8,r9,ROR #24
ldr r14,[sp,#200]
eor r7,r7,r8,ROR #27
eor r5,r10,r5
add r0,r0,r7,ROR #17
add r0,r0,r5,ROR #0
ldr r5,[sp,#100]
eor r9,r9,r0,ROR #8
str r9,[sp,#124]
add r8,r8,r9,ROR #0
str r8,[sp,#112]
eor r7,r7,r8,ROR #15
ldrd r10,[sp,#32]
eor r5,r5,r14
add r4,r4,r6,ROR #5
add r4,r4,r5,ROR #0
ldr r5,[sp,#228]
eor r8,r11,r4,ROR #24
ldr r9,[sp,#72]
add r10,r10,r8,ROR #24
ldr r14,[sp,#168]
eor r6,r6,r10,ROR #27
eor r5,r9,r5
add r4,r4,r6,ROR #17
add r4,r4,r5,ROR #0
ldr r5,[sp,#56]
eor r8,r8,r4,ROR #8
str r8,[sp,#116]
add r8,r10,r8,ROR #0
str r8,[sp,#104]
eor r6,r6,r8,ROR #15
ldrd r10,[sp,#24]
eor r5,r5,r14
add r3,r3,r12,ROR #5
add r3,r3,r5,ROR #0
ldr r5,[sp,#184]
eor r8,r11,r3,ROR #24
ldr r9,[sp,#40]
add r10,r10,r8,ROR #24
ldr r14,[sp,#208]
eor r12,r12,r10,ROR #27
eor r5,r9,r5
add r3,r3,r12,ROR #17
add r3,r3,r5,ROR #0
ldr r5,[sp,#60]
eor r8,r8,r3,ROR #8
str r8,[sp,#108]
add r8,r10,r8,ROR #0
ldrd r10,[sp,#8]
eor r5,r5,r14
add r2,r2,r1,ROR #5
add r2,r2,r5,ROR #0
ldr r5,[sp,#188]
eor r9,r11,r2,ROR #24
ldr r11,[sp,#80]
add r10,r10,r9,ROR #24
ldr r14,[sp,#168]
eor r1,r1,r10,ROR #27
eor r5,r11,r5
add r2,r2,r1,ROR #17
add r2,r2,r5,ROR #0
ldr r5,[sp,#76]
eor r9,r9,r2,ROR #8
eor r12,r12,r8,ROR #15
add r10,r10,r9,ROR #0
str r10,[sp,#120]
eor r1,r1,r10,ROR #15
eor r5,r5,r14
add r0,r0,r6,ROR #24
add r0,r0,r5,ROR #0
ldr r5,[sp,#204]
eor r9,r9,r0,ROR #0
ldr r10,[sp,#40]
add r8,r8,r9,ROR #16
ldr r14,[sp,#196]
eor r6,r6,r8,ROR #8
eor r5,r10,r5
add r0,r0,r6,ROR #4
add r0,r0,r5,ROR #0
ldr r5,[sp,#60]
eor r9,r9,r0,ROR #16
str r9,[sp,#12]
add r8,r8,r9,ROR #24
str r8,[sp,#24]
eor r6,r6,r8,ROR #28
ldrd r10,[sp,#104]
eor r5,r5,r14
add r2,r2,r7,ROR #24
add r2,r2,r5,ROR #0
ldr r5,[sp,#188]
eor r8,r11,r2,ROR #0
ldr r9,[sp,#68]
add r10,r10,r8,ROR #16
ldr r14,[sp,#184]
eor r7,r7,r10,ROR #8
eor r5,r9,r5
add r2,r2,r7,ROR #4
add r2,r2,r5,ROR #0
ldr r5,[sp,#48]
eor r8,r8,r2,ROR #16
str r8,[sp,#28]
add r8,r10,r8,ROR #24
str r8,[sp,#32]
eor r7,r7,r8,ROR #28
ldrd r10,[sp,#112]
eor r5,r5,r14
add r3,r3,r1,ROR #24
add r3,r3,r5,ROR #0
ldr r5,[sp,#176]
eor r8,r11,r3,ROR #0
ldr r9,[sp,#56]
add r10,r10,r8,ROR #16
ldr r14,[sp,#228]
eor r1,r1,r10,ROR #8
eor r5,r9,r5
add r3,r3,r1,ROR #4
add r3,r3,r5,ROR #0
ldr r5,[sp,#80]
eor r8,r8,r3,ROR #16
str r8,[sp,#36]
add r8,r10,r8,ROR #24
ldrd r10,[sp,#120]
eor r5,r5,r14
add r4,r4,r12,ROR #24
add r4,r4,r5,ROR #0
ldr r5,[sp,#208]
eor r9,r11,r4,ROR #0
ldr r11,[sp,#100]
add r10,r10,r9,ROR #16
ldr r14,[sp,#172]
eor r12,r12,r10,ROR #8
eor r5,r11,r5
add r4,r4,r12,ROR #4
add r4,r4,r5,ROR #0
ldr r5,[sp,#96]
eor r9,r9,r4,ROR #16
eor r1,r1,r8,ROR #28
add r10,r10,r9,ROR #24
str r10,[sp,#8]
eor r12,r12,r10,ROR #28
eor r5,r5,r14
add r0,r0,r7,ROR #11
add r0,r0,r5,ROR #0
ldr r5,[sp,#224]
eor r9,r9,r0,ROR #8
ldr r10,[sp,#44]
add r8,r8,r9,ROR #8
ldr r14,[sp,#220]
eor r7,r7,r8,ROR #21
eor r5,r10,r5
add r0,r0,r7,ROR #23
add r0,r0,r5,ROR #0
ldr r5,[sp,#52]
eor r9,r9,r0,ROR #24
str r9,[sp,#124]
add r8,r8,r9,ROR #16
str r8,[sp,#112]
eor r7,r7,r8,ROR #9
ldrd r10,[sp,#32]
eor r5,r5,r14
add r4,r4,r6,ROR #11
add r4,r4,r5,ROR #0
ldr r5,[sp,#180]
eor r8,r11,r4,ROR #8
ldr r9,[sp,#92]
add r10,r10,r8,ROR #8
ldr r14,[sp,#200]
eor r6,r6,r10,ROR #21
eor r5,r9,r5
add r4,r4,r6,ROR #23
add r4,r4,r5,ROR #0
ldr r5,[sp,#64]
eor r8,r8,r4,ROR #24
str r8,[sp,#116]
add r8,r10,r8,ROR #16
str r8,[sp,#104]
eor r6,r6,r8,ROR #9
ldrd r10,[sp,#24]
eor r5,r5,r14
add r3,r3,r12,ROR #11
add r3,r3,r5,ROR #0
ldr r5,[sp,#192]
eor r8,r11,r3,ROR #8
ldr r9,[sp,#72]
add r10,r10,r8,ROR #8
ldr r14,[sp,#216]
eor r12,r12,r10,ROR #21
eor r5,r9,r5
add r3,r3,r12,ROR #23
add r3,r3,r5,ROR #0
ldr r5,[sp,#84]
eor r8,r8,r3,ROR #24
str r8,[sp,#108]
add r8,r10,r8,ROR #16
ldrd r10,[sp,#8]
eor r5,r5,r14
add r2,r2,r1,ROR #11
add r2,r2,r5,ROR #0
ldr r5,[sp,#212]
eor r9,r11,r2,ROR #8
ldr r11,[sp,#88]
add r10,r10,r9,ROR #8
ldr r14,[sp,#216]
eor r1,r1,r10,ROR #21
eor r5,r11,r5
add r2,r2,r1,ROR #23
add r2,r2,r5,ROR #0
ldr r5,[sp,#48]
eor r9,r9,r2,ROR #24
eor r12,r12,r8,ROR #9
add r10,r10,r9,ROR #16
str r10,[sp,#120]
eor r1,r1,r10,ROR #9
eor r5,r5,r14
add r0,r0,r6,ROR #30
add r0,r0,r5,ROR #0
ldr r5,[sp,#176]
eor r9,r9,r0,ROR #16
ldr r10,[sp,#88]
add r8,r8,r9,ROR #0
ldr r14,[sp,#208]
eor r6,r6,r8,ROR #2
eor r5,r10,r5
add r0,r0,r6,ROR #10
add r0,r0,r5,ROR #0
ldr r5,[sp,#64]
eor r9,r9,r0,ROR #0
str r9,[sp,#12]
add r8,r8,r9,ROR #8
str r8,[sp,#24]
eor r6,r6,r8,ROR #22
ldrd r10,[sp,#104]
eor r5,r5,r14
add r2,r2,r7,ROR #30
add r2,r2,r5,ROR #0
ldr r5,[sp,#192]
eor r8,r11,r2,ROR #16
ldr r9,[sp,#80]
add r10,r10,r8,ROR #0
ldr r14,[sp,#212]
eor r7,r7,r10,ROR #2
eor r5,r9,r5
add r2,r2,r7,ROR #10
add r2,r2,r5,ROR #0
ldr r5,[sp,#40]
eor r8,r8,r2,ROR #0
str r8,[sp,#28]
add r8,r10,r8,ROR #8
str r8,[sp,#32]
eor r7,r7,r8,ROR #22
ldrd r10,[sp,#112]
eor r5,r5,r14
add r3,r3,r1,ROR #30
add r3,r3,r5,ROR #0
ldr r5,[sp,#168]
eor r8,r11,r3,ROR #16
ldr r9,[sp,#84]
add r10,r10,r8,ROR #0
ldr r14,[sp,#180]
eor r1,r1,r10,ROR #2
eor r5,r9,r5
add r3,r3,r1,ROR #10
add r3,r3,r5,ROR #0
ldr r5,[sp,#72]
eor r8,r8,r3,ROR #0
str r8,[sp,#36]
add r8,r10,r8,ROR #8
ldrd r10,[sp,#120]
eor r5,r5,r14
add r4,r4,r12,ROR #30
add r4,r4,r5,ROR #0
ldr r5,[sp,#200]
eor r9,r11,r4,ROR #16
ldr r11,[sp,#52]
add r10,r10,r9,ROR #0
ldr r14,[sp,#220]
eor r12,r12,r10,ROR #2
eor r5,r11,r5
add r4,r4,r12,ROR #10
add r4,r4,r5,ROR #0
ldr r5,[sp,#56]
eor r9,r9,r4,ROR #0
eor r1,r1,r8,ROR #22
add r10,r10,r9,ROR #8
str r10,[sp,#8]
eor r12,r12,r10,ROR #22
eor r5,r5,r14
add r0,r0,r7,ROR #17
add r0,r0,r5,ROR #0
ldr r5,[sp,#184]
eor r9,r9,r0,ROR #24
ldr r10,[sp,#92]
add r8,r8,r9,ROR #24
ldr r14,[sp,#204]
eor r7,r7,r8,ROR #15
eor r5,r10,r5
add r0,r0,r7,ROR #29
add r0,r0,r5,ROR #0
ldr r5,[sp,#44]
eor r9,r9,r0,ROR #8
str r9,[sp,#124]
add r8,r8,r9,ROR #0
str r8,[sp,#112]
eor r7,r7,r8,ROR #3
ldrd r10,[sp,#32]
eor r5,r5,r14
add r4,r4,r6,ROR #17
add r4,r4,r5,ROR #0
ldr r5,[sp,#172]
eor r8,r11,r4,ROR #24
ldr r9,[sp,#76]
add r10,r10,r8,ROR #24
ldr r14,[sp,#224]
eor r6,r6,r10,ROR #15
eor r5,r9,r5
add r4,r4,r6,ROR #29
add r4,r4,r5,ROR #0
ldr r5,[sp,#100]
eor r8,r8,r4,ROR #8
str r8,[sp,#116]
add r8,r10,r8,ROR #0
str r8,[sp,#104]
eor r6,r6,r8,ROR #3
ldrd r10,[sp,#24]
eor r5,r5,r14
add r3,r3,r12,ROR #17
add r3,r3,r5,ROR #0
ldr r5,[sp,#228]
eor r8,r11,r3,ROR #24
ldr r9,[sp,#96]
add r10,r10,r8,ROR #24
ldr r14,[sp,#188]
eor r12,r12,r10,ROR #15
eor r5,r9,r5
add r3,r3,r12,ROR #29
add r3,r3,r5,ROR #0
ldr r5,[sp,#68]
eor r8,r8,r3,ROR #8
str r8,[sp,#108]
add r8,r10,r8,ROR #0
ldrd r10,[sp,#8]
eor r5,r5,r14
add r2,r2,r1,ROR #17
add r2,r2,r5,ROR #0
ldr r5,[sp,#196]
eor r9,r11,r2,ROR #24
ldr r11,[sp,#60]
add r10,r10,r9,ROR #24
ldr r14,[sp,#188]
eor r1,r1,r10,ROR #15
eor r5,r11,r5
add r2,r2,r1,ROR #29
add r2,r2,r5,ROR #0
ldr r5,[sp,#88]
eor r9,r9,r2,ROR #8
eor r12,r12,r8,ROR #3
add r10,r10,r9,ROR #0
str r10,[sp,#120]
eor r1,r1,r10,ROR #3
eor r5,r5,r14
add r0,r0,r6,ROR #4
add r0,r0,r5,ROR #0
ldr r5,[sp,#216]
eor r9,r9,r0,ROR #0
ldr r10,[sp,#60]
add r8,r8,r9,ROR #16
ldr r14,[sp,#228]
eor r6,r6,r8,ROR #28
eor r5,r10,r5
add r0,r0,r6,ROR #16
add r0,r0,r5,ROR #0
ldr r5,[sp,#44]
eor r9,r9,r0,ROR #16
str r9,[sp,#12]
add r8,r8,r9,ROR #24
str r8,[sp,#24]
eor r6,r6,r8,ROR #16
ldrd r10,[sp,#104]
eor r5,r5,r14
add r2,r2,r7,ROR #4
add r2,r2,r5,ROR #0
ldr r5,[sp,#172]
eor r8,r11,r2,ROR #0
ldr r9,[sp,#100]
add r10,r10,r8,ROR #16
ldr r14,[sp,#220]
eor r7,r7,r10,ROR #28
eor r5,r9,r5
add r2,r2,r7,ROR #16
add r2,r2,r5,ROR #0
ldr r5,[sp,#96]
eor r8,r8,r2,ROR #16
str r8,[sp,#28]
add r8,r10,r8,ROR #24
str r8,[sp,#32]
eor r7,r7,r8,ROR #16
ldrd r10,[sp,#112]
eor r5,r5,r14
add r3,r3,r1,ROR #4
add r3,r3,r5,ROR #0
ldr r5,[sp,#224]
eor r8,r11,r3,ROR #0
ldr r9,[sp,#92]
add r10,r10,r8,ROR #16
ldr r14,[sp,#208]
eor r1,r1,r10,ROR #28
eor r5,r9,r5
add r3,r3,r1,ROR #16
add r3,r3,r5,ROR #0
ldr r5,[sp,#56]
eor r8,r8,r3,ROR #16
str r8,[sp,#36]
add r8,r10,r8,ROR #24
ldrd r10,[sp,#120]
eor r5,r5,r14
add r4,r4,r12,ROR #4
add r4,r4,r5,ROR #0
ldr r5,[sp,#184]
eor r9,r11,r4,ROR #0
ldr r11,[sp,#80]
add r10,r10,r9,ROR #16
ldr r14,[sp,#196]
eor r12,r12,r10,ROR #28
eor r5,r11,r5
add r4,r4,r12,ROR #16
add r4,r4,r5,ROR #0
ldr r5,[sp,#40]
eor r9,r9,r4,ROR #16
eor r1,r1,r8,ROR #16
add r10,r10,r9,ROR #24
str r10,[sp,#8]
eor r12,r12,r10,ROR #16
eor r5,r5,r14
add r0,r0,r7,ROR #23
add r0,r0,r5,ROR #0
ldr r5,[sp,#168]
eor r9,r9,r0,ROR #8
ldr r10,[sp,#68]
add r8,r8,r9,ROR #8
ldr r14,[sp,#212]
eor r7,r7,r8,ROR #9
eor r5,r10,r5
add r0,r0,r7,ROR #3
add r0,r0,r5,ROR #0
ldr r5,[sp,#72]
eor r9,r9,r0,ROR #24
str r9,[sp,#124]
add r8,r8,r9,ROR #16
str r8,[sp,#112]
eor r7,r7,r8,ROR #29
ldrd r10,[sp,#32]
eor r5,r5,r14
add r4,r4,r6,ROR #23
add r4,r4,r5,ROR #0
ldr r5,[sp,#200]
eor r8,r11,r4,ROR #8
ldr r9,[sp,#84]
add r10,r10,r8,ROR #8
ldr r14,[sp,#176]
eor r6,r6,r10,ROR #9
eor r5,r9,r5
add r4,r4,r6,ROR #3
add r4,r4,r5,ROR #0
ldr r5,[sp,#76]
eor r8,r8,r4,ROR #24
str r8,[sp,#116]
add r8,r10,r8,ROR #16
str r8,[sp,#104]
eor r6,r6,r8,ROR #29
ldrd r10,[sp,#24]
eor r5,r5,r14
add r3,r3,r12,ROR #23
add r3,r3,r5,ROR #0
ldr r5,[sp,#204]
eor r8,r11,r3,ROR #8
ldr r9,[sp,#48]
add r10,r10,r8,ROR #8
ldr r14,[sp,#180]
eor r12,r12,r10,ROR #9
eor r5,r9,r5
add r3,r3,r12,ROR #3
add r3,r3,r5,ROR #0
ldr r5,[sp,#64]
eor r8,r8,r3,ROR #24
str r8,[sp,#108]
add r8,r10,r8,ROR #16
ldrd r10,[sp,#8]
eor r5,r5,r14
add r2,r2,r1,ROR #23
add r2,r2,r5,ROR #0
ldr r5,[sp,#192]
eor r9,r11,r2,ROR #8
ldr r11,[sp,#52]
add r10,r10,r9,ROR #8
ldr r14,[sp,#212]
eor r1,r1,r10,ROR #9
eor r5,r11,r5
add r2,r2,r1,ROR #3
add r2,r2,r5,ROR #0
ldr r5,[sp,#92]
eor r9,r9,r2,ROR #24
eor r12,r12,r8,ROR #29
add r10,r10,r9,ROR #16
str r10,[sp,#120]
eor r1,r1,r10,ROR #29
eor r5,r5,r14
add r0,r0,r6,ROR #10
add r0,r0,r5,ROR #0
ldr r5,[sp,#220]
eor r9,r9,r0,ROR #16
ldr r10,[sp,#84]
add r8,r8,r9,ROR #0
ldr r14,[sp,#224]
eor r6,r6,r8,ROR #22
eor r5,r10,r5
add r0,r0,r6,ROR #22
add r0,r0,r5,ROR #0
ldr r5,[sp,#68]
eor r9,r9,r0,ROR #0
str r9,[sp,#12]
add r8,r8,r9,ROR #8
str r8,[sp,#24]
eor r6,r6,r8,ROR #10
ldrd r10,[sp,#104]
eor r5,r5,r14
add r2,r2,r7,ROR #10
add r2,r2,r5,ROR #0
ldr r5,[sp,#196]
eor r8,r11,r2,ROR #16
ldr r9,[sp,#96]
add r10,r10,r8,ROR #0
ldr r14,[sp,#172]
eor r7,r7,r10,ROR #22
eor r5,r9,r5
add r2,r2,r7,ROR #22
add r2,r2,r5,ROR #0
ldr r5,[sp,#88]
eor r8,r8,r2,ROR #0
str r8,[sp,#28]
add r8,r10,r8,ROR #8
str r8,[sp,#32]
eor r7,r7,r8,ROR #10
ldrd r10,[sp,#112]
eor r5,r5,r14
add r3,r3,r1,ROR #10
add r3,r3,r5,ROR #0
ldr r5,[sp,#216]
eor r8,r11,r3,ROR #16
ldr r9,[sp,#44]
add r10,r10,r8,ROR #0
ldr r14,[sp,#204]
eor r1,r1,r10,ROR #22
eor r5,r9,r5
add r3,r3,r1,ROR #22
add r3,r3,r5,ROR #0
ldr r5,[sp,#52]
eor r8,r8,r3,ROR #0
str r8,[sp,#36]
add r8,r10,r8,ROR #8
ldrd r10,[sp,#120]
eor r5,r5,r14
add r4,r4,r12,ROR #10
add r4,r4,r5,ROR #0
ldr r5,[sp,#180]
eor r9,r11,r4,ROR #16
ldr r11,[sp,#76]
add r10,r10,r9,ROR #0
ldr r14,[sp,#168]
eor r12,r12,r10,ROR #22
eor r5,r11,r5
add r4,r4,r12,ROR #22
add r4,r4,r5,ROR #0
ldr r5,[sp,#60]
eor r9,r9,r4,ROR #0
eor r1,r1,r8,ROR #10
add r10,r10,r9,ROR #8
str r10,[sp,#8]
eor r12,r12,r10,ROR #10
eor r5,r5,r14
add r0,r0,r7,ROR #29
add r0,r0,r5,ROR #0
ldr r5,[sp,#188]
eor r9,r9,r0,ROR #24
ldr r10,[sp,#40]
add r8,r8,r9,ROR #24
ldr r14,[sp,#208]
eor r7,r7,r8,ROR #3
eor r5,r10,r5
add r0,r0,r7,ROR #9
add r0,r0,r5,ROR #0
ldr r5,[sp,#48]
eor r9,r9,r0,ROR #8
str r9,[sp,#124]
add r8,r8,r9,ROR #0
str r8,[sp,#112]
eor r7,r7,r8,ROR #23
ldrd r10,[sp,#32]
eor r5,r5,r14
add r4,r4,r6,ROR #29
add r4,r4,r5,ROR #0
ldr r5,[sp,#176]
eor r8,r11,r4,ROR #24
ldr r9,[sp,#80]
add r10,r10,r8,ROR #24
ldr r14,[sp,#192]
eor r6,r6,r10,ROR #3
eor r5,r9,r5
add r4,r4,r6,ROR #9
add r4,r4,r5,ROR #0
ldr r5,[sp,#72]
eor r8,r8,r4,ROR #8
str r8,[sp,#116]
add r8,r10,r8,ROR #0
str r8,[sp,#104]
eor r6,r6,r8,ROR #23
ldrd r10,[sp,#24]
eor r5,r5,r14
add r3,r3,r12,ROR #29
add r3,r3,r5,ROR #0
ldr r5,[sp,#200]
eor r8,r11,r3,ROR #24
ldr r9,[sp,#64]
add r10,r10,r8,ROR #24
ldr r14,[sp,#184]
eor r12,r12,r10,ROR #3
eor r5,r9,r5
add r3,r3,r12,ROR #9
add r3,r3,r5,ROR #0
ldr r5,[sp,#100]
eor r8,r8,r3,ROR #8
str r8,[sp,#108]
add r8,r10,r8,ROR #0
ldrd r10,[sp,#8]
eor r5,r5,r14
add r2,r2,r1,ROR #29
add r2,r2,r5,ROR #0
ldr r5,[sp,#228]
eor r9,r11,r2,ROR #24
ldr r11,[sp,#56]
add r10,r10,r9,ROR #24
eor r12,r12,r8,ROR #23
eor r1,r1,r10,ROR #3
eor r11,r11,r5
add r2,r2,r1,ROR #9
add r2,r2,r11,ROR #0
ldr r11,[sp,#64]
eor r9,r9,r2,ROR #8
add r0,r0,r6,ROR #16
add r10,r10,r9,ROR #0
str r10,[sp,#120]
eor r1,r1,r10,ROR #23
eor r5,r11,r5
add r0,r0,r5,ROR #0
ldr r5,[sp,#192]
eor r9,r9,r0,ROR #0
ldr r10,[sp,#100]
add r8,r8,r9,ROR #16
ldr r14,[sp,#204]
eor r6,r6,r8,ROR #16
eor r5,r10,r5
add r0,r0,r6,ROR #28
add r0,r0,r5,ROR #0
ldr r5,[sp,#96]
eor r9,r9,r0,ROR #16
str r9,[sp,#12]
add r8,r8,r9,ROR #24
str r8,[sp,#24]
eor r6,r6,r8,ROR #4
ldrd r10,[sp,#104]
eor r5,r5,r14
add r2,r2,r7,ROR #16
add r2,r2,r5,ROR #0
ldr r5,[sp,#224]
eor r8,r11,r2,ROR #0
ldr r9,[sp,#76]
add r10,r10,r8,ROR #16
ldr r14,[sp,#180]
eor r7,r7,r10,ROR #16
eor r5,r9,r5
add r2,r2,r7,ROR #28
add r2,r2,r5,ROR #0
ldr r5,[sp,#84]
eor r8,r8,r2,ROR #16
str r8,[sp,#28]
add r8,r10,r8,ROR #24
str r8,[sp,#32]
eor r7,r7,r8,ROR #4
ldrd r10,[sp,#112]
eor r5,r5,r14
add r3,r3,r1,ROR #16
add r3,r3,r5,ROR #0
ldr r5,[sp,#212]
eor r8,r11,r3,ROR #0
ldr r9,[sp,#52]
add r10,r10,r8,ROR #16
ldr r14,[sp,#200]
eor r1,r1,r10,ROR #16
eor r5,r9,r5
add r3,r3,r1,ROR #28
add r3,r3,r5,ROR #0
ldr r5,[sp,#40]
eor r8,r8,r3,ROR #16
str r8,[sp,#36]
add r8,r10,r8,ROR #24
ldrd r10,[sp,#120]
eor r5,r5,r14
add r4,r4,r12,ROR #16
add r4,r4,r5,ROR #0
ldr r5,[sp,#168]
eor r9,r11,r4,ROR #0
ldr r11,[sp,#72]
add r10,r10,r9,ROR #16
ldr r14,[sp,#176]
eor r12,r12,r10,ROR #16
eor r5,r11,r5
add r4,r4,r12,ROR #28
add r4,r4,r5,ROR #0
ldr r5,[sp,#88]
eor r9,r9,r4,ROR #16
eor r1,r1,r8,ROR #4
add r10,r10,r9,ROR #24
str r10,[sp,#8]
eor r12,r12,r10,ROR #4
eor r5,r5,r14
add r0,r0,r7,ROR #3
add r0,r0,r5,ROR #0
ldr r5,[sp,#216]
eor r9,r9,r0,ROR #8
ldr r10,[sp,#48]
add r8,r8,r9,ROR #8
ldr r14,[sp,#188]
eor r7,r7,r8,ROR #29
eor r5,r10,r5
add r0,r0,r7,ROR #15
add r0,r0,r5,ROR #0
ldr r5,[sp,#80]
eor r9,r9,r0,ROR #24
str r9,[sp,#124]
add r8,r8,r9,ROR #16
str r8,[sp,#112]
eor r7,r7,r8,ROR #17
ldrd r10,[sp,#32]
eor r5,r5,r14
add r4,r4,r6,ROR #3
add r4,r4,r5,ROR #0
ldr r5,[sp,#208]
eor r8,r11,r4,ROR #8
ldr r9,[sp,#60]
add r10,r10,r8,ROR #8
ldr r14,[sp,#184]
eor r6,r6,r10,ROR #29
eor r5,r9,r5
add r4,r4,r6,ROR #15
add r4,r4,r5,ROR #0
ldr r5,[sp,#44]
eor r8,r8,r4,ROR #24
str r8,[sp,#116]
add r8,r10,r8,ROR #16
str r8,[sp,#104]
eor r6,r6,r8,ROR #17
ldrd r10,[sp,#24]
eor r5,r5,r14
add r3,r3,r12,ROR #3
add r3,r3,r5,ROR #0
ldr r5,[sp,#172]
eor r8,r11,r3,ROR #8
ldr r9,[sp,#56]
add r10,r10,r8,ROR #8
ldr r14,[sp,#196]
eor r12,r12,r10,ROR #29
eor r5,r9,r5
add r3,r3,r12,ROR #15
add r3,r3,r5,ROR #0
ldr r5,[sp,#92]
eor r8,r8,r3,ROR #24
str r8,[sp,#108]
add r8,r10,r8,ROR #16
ldrd r10,[sp,#8]
eor r5,r5,r14
add r2,r2,r1,ROR #3
add r2,r2,r5,ROR #0
ldr r5,[sp,#220]
eor r9,r11,r2,ROR #8
ldr r11,[sp,#68]
add r10,r10,r9,ROR #8
ldr r14,[sp,#176]
eor r1,r1,r10,ROR #29
eor r5,r11,r5
add r2,r2,r1,ROR #15
add r2,r2,r5,ROR #0
ldr r5,[sp,#80]
eor r9,r9,r2,ROR #24
eor r12,r12,r8,ROR #17
add r10,r10,r9,ROR #16
str r10,[sp,#120]
eor r1,r1,r10,ROR #17
eor r5,r5,r14
add r0,r0,r6,ROR #22
add r0,r0,r5,ROR #0
ldr r5,[sp,#208]
eor r9,r9,r0,ROR #16
ldr r10,[sp,#48]
add r8,r8,r9,ROR #0
ldr r14,[sp,#184]
eor r6,r6,r8,ROR #10
eor r5,r10,r5
add r0,r0,r6,ROR #2
add r0,r0,r5,ROR #0
ldr r5,[sp,#72]
eor r9,r9,r0,ROR #0
str r9,[sp,#12]
add r8,r8,r9,ROR #8
str r8,[sp,#24]
eor r6,r6,r8,ROR #30
ldrd r10,[sp,#104]
eor r5,r5,r14
add r2,r2,r7,ROR #22
add r2,r2,r5,ROR #0
ldr r5,[sp,#200]
eor r8,r11,r2,ROR #16
ldr r9,[sp,#56]
add r10,r10,r8,ROR #0
ldr r14,[sp,#192]
eor r7,r7,r10,ROR #10
eor r5,r9,r5
add r2,r2,r7,ROR #2
add r2,r2,r5,ROR #0
ldr r5,[sp,#68]
eor r8,r8,r2,ROR #0
str r8,[sp,#28]
add r8,r10,r8,ROR #8
str r8,[sp,#32]
eor r7,r7,r8,ROR #30
ldrd r10,[sp,#112]
eor r5,r5,r14
add r3,r3,r1,ROR #22
add r3,r3,r5,ROR #0
ldr r5,[sp,#196]
eor r8,r11,r3,ROR #16
ldr r9,[sp,#64]
add r10,r10,r8,ROR #0
ldr r14,[sp,#188]
eor r1,r1,r10,ROR #10
eor r5,r9,r5
add r3,r3,r1,ROR #2
add r3,r3,r5,ROR #0
ldr r5,[sp,#44]
eor r8,r8,r3,ROR #0
str r8,[sp,#36]
add r8,r10,r8,ROR #8
ldrd r10,[sp,#120]
eor r5,r5,r14
add r4,r4,r12,ROR #22
add r4,r4,r5,ROR #0
ldr r5,[sp,#172]
eor r9,r11,r4,ROR #16
ldr r11,[sp,#60]
add r10,r10,r9,ROR #0
ldr r14,[sp,#212]
eor r12,r12,r10,ROR #10
eor r5,r11,r5
add r4,r4,r12,ROR #2
add r4,r4,r5,ROR #0
ldr r5,[sp,#100]
eor r9,r9,r4,ROR #0
eor r1,r1,r8,ROR #30
add r10,r10,r9,ROR #8
str r10,[sp,#8]
eor r12,r12,r10,ROR #30
eor r5,r5,r14
add r0,r0,r7,ROR #9
add r0,r0,r5,ROR #0
ldr r5,[sp,#228]
eor r9,r9,r0,ROR #24
ldr r10,[sp,#84]
add r8,r8,r9,ROR #24
ldr r14,[sp,#168]
eor r7,r7,r8,ROR #23
eor r5,r10,r5
add r0,r0,r7,ROR #21
add r0,r0,r5,ROR #0
ldr r5,[sp,#92]
eor r9,r9,r0,ROR #8
str r9,[sp,#124]
add r8,r8,r9,ROR #0
str r8,[sp,#112]
eor r7,r7,r8,ROR #11
ldrd r10,[sp,#32]
eor r5,r5,r14
add r4,r4,r6,ROR #9
add r4,r4,r5,ROR #0
ldr r5,[sp,#220]
eor r8,r11,r4,ROR #24
ldr r9,[sp,#40]
add r10,r10,r8,ROR #24
ldr r14,[sp,#216]
eor r6,r6,r10,ROR #23
eor r5,r9,r5
add r4,r4,r6,ROR #21
add r4,r4,r5,ROR #0
ldr r5,[sp,#52]
eor r8,r8,r4,ROR #8
str r8,[sp,#116]
add r8,r10,r8,ROR #0
str r8,[sp,#104]
eor r6,r6,r8,ROR #11
ldrd r10,[sp,#24]
eor r5,r5,r14
add r3,r3,r12,ROR #9
add r3,r3,r5,ROR #0
ldr r5,[sp,#180]
eor r8,r11,r3,ROR #24
ldr r9,[sp,#88]
add r10,r10,r8,ROR #24
ldr r14,[sp,#224]
eor r12,r12,r10,ROR #23
eor r5,r9,r5
add r3,r3,r12,ROR #21
add r3,r3,r5,ROR #0
ldr r5,[sp,#76]
eor r8,r8,r3,ROR #8
str r8,[sp,#108]
add r8,r10,r8,ROR #0
ldrd r10,[sp,#8]
eor r5,r5,r14
add r2,r2,r1,ROR #9
add r2,r2,r5,ROR #0
ldr r5,[sp,#204]
eor r9,r11,r2,ROR #24
ldr r11,[sp,#96]
add r10,r10,r9,ROR #24
ldr r14,[sp,#172]
eor r1,r1,r10,ROR #23
eor r5,r11,r5
add r2,r2,r1,ROR #21
add r2,r2,r5,ROR #0
ldr r5,[sp,#40]
eor r9,r9,r2,ROR #8
eor r12,r12,r8,ROR #11
add r10,r10,r9,ROR #0
str r10,[sp,#120]
eor r1,r1,r10,ROR #11
eor r5,r5,r14
add r0,r0,r6,ROR #28
add r0,r0,r5,ROR #0
ldr r5,[sp,#168]
eor r9,r9,r0,ROR #0
ldr r10,[sp,#44]
add r8,r8,r9,ROR #16
ldr r14,[sp,#180]
eor r6,r6,r8,ROR #4
eor r5,r10,r5
add r0,r0,r6,ROR #8
add r0,r0,r5,ROR #0
ldr r5,[sp,#48]
eor r9,r9,r0,ROR #16
str r9,[sp,#12]
add r8,r8,r9,ROR #24
str r8,[sp,#24]
eor r6,r6,r8,ROR #24
ldrd r10,[sp,#104]
eor r5,r5,r14
add r2,r2,r7,ROR #28
add r2,r2,r5,ROR #0
ldr r5,[sp,#176]
eor r8,r11,r2,ROR #0
ldr r9,[sp,#52]
add r10,r10,r8,ROR #16
ldr r14,[sp,#188]
eor r7,r7,r10,ROR #4
eor r5,r9,r5
add r2,r2,r7,ROR #8
add r2,r2,r5,ROR #0
ldr r5,[sp,#56]
eor r8,r8,r2,ROR #16
str r8,[sp,#28]
add r8,r10,r8,ROR #24
str r8,[sp,#32]
eor r7,r7,r8,ROR #24
ldrd r10,[sp,#112]
eor r5,r5,r14
add r3,r3,r1,ROR #28
add r3,r3,r5,ROR #0
ldr r5,[sp,#184]
eor r8,r11,r3,ROR #0
ldr r9,[sp,#60]
add r10,r10,r8,ROR #16
ldr r14,[sp,#196]
eor r1,r1,r10,ROR #4
eor r5,r9,r5
add r3,r3,r1,ROR #8
add r3,r3,r5,ROR #0
ldr r5,[sp,#64]
eor r8,r8,r3,ROR #16
str r8,[sp,#36]
add r8,r10,r8,ROR #24
ldrd r10,[sp,#120]
eor r5,r5,r14
add r4,r4,r12,ROR #28
add r4,r4,r5,ROR #0
ldr r5,[sp,#192]
eor r9,r11,r4,ROR #0
ldr r11,[sp,#68]
add r10,r10,r9,ROR #16
ldr r14,[sp,#204]
eor r12,r12,r10,ROR #4
eor r5,r11,r5
add r4,r4,r12,ROR #8
add r4,r4,r5,ROR #0
ldr r5,[sp,#72]
eor r9,r9,r4,ROR #16
eor r1,r1,r8,ROR #24
add r10,r10,r9,ROR #24
str r10,[sp,#8]
eor r12,r12,r10,ROR #24
eor r5,r5,r14
add r0,r0,r7,ROR #15
add r0,r0,r5,ROR #0
ldr r5,[sp,#200]
eor r9,r9,r0,ROR #8
ldr r10,[sp,#76]
add r8,r8,r9,ROR #8
ldr r14,[sp,#228]
eor r7,r7,r8,ROR #17
eor r5,r10,r5
add r0,r0,r7,ROR #27
add r0,r0,r5,ROR #0
ldr r5,[sp,#96]
eor r9,r9,r0,ROR #24
str r9,[sp,#124]
add r8,r8,r9,ROR #16
str r8,[sp,#112]
eor r7,r7,r8,ROR #5
ldrd r10,[sp,#32]
eor r5,r5,r14
add r4,r4,r6,ROR #15
add r4,r4,r5,ROR #0
ldr r5,[sp,#224]
eor r8,r11,r4,ROR #8
ldr r9,[sp,#100]
add r10,r10,r8,ROR #8
ldr r14,[sp,#220]
eor r6,r6,r10,ROR #17
eor r5,r9,r5
add r4,r4,r6,ROR #27
add r4,r4,r5,ROR #0
ldr r5,[sp,#88]
eor r8,r8,r4,ROR #24
str r8,[sp,#116]
add r8,r10,r8,ROR #16
str r8,[sp,#104]
eor r6,r6,r8,ROR #5
ldrd r10,[sp,#24]
eor r5,r5,r14
add r3,r3,r12,ROR #15
add r3,r3,r5,ROR #0
ldr r5,[sp,#216]
eor r8,r11,r3,ROR #8
ldr r9,[sp,#92]
add r10,r10,r8,ROR #8
ldr r14,[sp,#212]
eor r12,r12,r10,ROR #17
eor r5,r9,r5
add r3,r3,r12,ROR #27
add r3,r3,r5,ROR #0
ldr r5,[sp,#80]
eor r8,r8,r3,ROR #24
str r8,[sp,#108]
add r8,r10,r8,ROR #16
ldrd r10,[sp,#8]
eor r5,r5,r14
add r2,r2,r1,ROR #15
add r2,r2,r5,ROR #0
ldr r5,[sp,#208]
eor r9,r11,r2,ROR #8
ldr r11,[sp,#84]
add r10,r10,r9,ROR #8
eor r12,r12,r8,ROR #5
eor r1,r1,r10,ROR #17
eor r11,r11,r5
add r2,r2,r1,ROR #27
add r2,r2,r11,ROR #0
ldr r11,[sp,#96]
eor r9,r9,r2,ROR #24
add r0,r0,r6,ROR #2
add r10,r10,r9,ROR #16
str r10,[sp,#120]
eor r1,r1,r10,ROR #5
eor r5,r11,r5
add r0,r0,r5,ROR #0
ldr r5,[sp,#224]
eor r9,r9,r0,ROR #16
ldr r10,[sp,#80]
add r8,r8,r9,ROR #0
ldr r14,[sp,#200]
eor r6,r6,r8,ROR #30
eor r5,r10,r5
add r0,r0,r6,ROR #14
add r0,r0,r5,ROR #0
ldr r5,[sp,#56]
eor r9,r9,r0,ROR #0
str r9,[sp,#12]
add r8,r8,r9,ROR #8
str r8,[sp,#24]
eor r6,r6,r8,ROR #18
ldrd r10,[sp,#104]
eor r5,r5,r14
add r2,r2,r7,ROR #2
add r2,r2,r5,ROR #0
ldr r5,[sp,#184]
eor r8,r11,r2,ROR #16
ldr r9,[sp,#72]
add r10,r10,r8,ROR #0
ldr r14,[sp,#228]
eor r7,r7,r10,ROR #30
eor r5,r9,r5
add r2,r2,r7,ROR #14
add r2,r2,r5,ROR #0
ldr r5,[sp,#76]
eor r8,r8,r2,ROR #0
str r8,[sp,#28]
add r8,r10,r8,ROR #8
str r8,[sp,#32]
eor r7,r7,r8,ROR #18
ldrd r10,[sp,#112]
eor r5,r5,r14
add r3,r3,r1,ROR #2
add r3,r3,r5,ROR #0
ldr r5,[sp,#204]
eor r8,r11,r3,ROR #16
ldr r9,[sp,#100]
add r10,r10,r8,ROR #0
ldr r14,[sp,#192]
eor r1,r1,r10,ROR #30
eor r5,r9,r5
add r3,r3,r1,ROR #14
add r3,r3,r5,ROR #0
ldr r5,[sp,#92]
eor r8,r8,r3,ROR #0
str r8,[sp,#36]
add r8,r10,r8,ROR #8
ldrd r10,[sp,#120]
eor r5,r5,r14
add r4,r4,r12,ROR #2
add r4,r4,r5,ROR #0
ldr r5,[sp,#220]
eor r9,r11,r4,ROR #16
ldr r11,[sp,#64]
add r10,r10,r9,ROR #0
ldr r14,[sp,#216]
eor r12,r12,r10,ROR #30
eor r5,r11,r5
add r4,r4,r12,ROR #14
add r4,r4,r5,ROR #0
ldr r5,[sp,#44]
eor r9,r9,r4,ROR #0
eor r1,r1,r8,ROR #18
add r10,r10,r9,ROR #8
str r10,[sp,#8]
eor r12,r12,r10,ROR #18
eor r5,r5,r14
add r0,r0,r7,ROR #21
add r0,r0,r5,ROR #0
ldr r5,[sp,#172]
eor r9,r9,r0,ROR #24
ldr r10,[sp,#88]
add r8,r8,r9,ROR #24
ldr r14,[sp,#180]
eor r7,r7,r8,ROR #11
eor r5,r10,r5
add r0,r0,r7,ROR #1
add r0,r0,r5,ROR #0
ldr r5,[sp,#60]
eor r9,r9,r0,ROR #8
str r9,[sp,#124]
add r8,r8,r9,ROR #0
str r8,[sp,#112]
eor r7,r7,r8,ROR #31
ldrd r10,[sp,#32]
eor r5,r5,r14
add r4,r4,r6,ROR #21
add r4,r4,r5,ROR #0
ldr r5,[sp,#188]
eor r8,r11,r4,ROR #24
ldr r9,[sp,#52]
add r10,r10,r8,ROR #24
ldr r14,[sp,#196]
eor r6,r6,r10,ROR #11
eor r5,r9,r5
add r4,r4,r6,ROR #1
add r4,r4,r5,ROR #0
ldr r5,[sp,#84]
eor r8,r8,r4,ROR #8
str r8,[sp,#116]
add r8,r10,r8,ROR #0
str r8,[sp,#104]
eor r6,r6,r8,ROR #31
ldrd r10,[sp,#24]
eor r5,r5,r14
add r3,r3,r12,ROR #21
add r3,r3,r5,ROR #0
ldr r5,[sp,#212]
eor r8,r11,r3,ROR #24
ldr r9,[sp,#68]
add r10,r10,r8,ROR #24
ldr r14,[sp,#176]
eor r12,r12,r10,ROR #11
eor r5,r9,r5
add r3,r3,r12,ROR #1
add r3,r3,r5,ROR #0
ldr r5,[sp,#40]
eor r8,r8,r3,ROR #8
str r8,[sp,#108]
add r8,r10,r8,ROR #0
ldrd r10,[sp,#8]
eor r5,r5,r14
add r2,r2,r1,ROR #21
add r2,r2,r5,ROR #0
ldr r5,[sp,#168]
eor r9,r11,r2,ROR #24
ldr r11,[sp,#48]
add r10,r10,r9,ROR #24
ldr r14,[sp,#200]
eor r1,r1,r10,ROR #11
eor r5,r11,r5
add r2,r2,r1,ROR #1
add r2,r2,r5,ROR #0
ldr r5,[sp,#84]
eor r9,r9,r2,ROR #8
eor r12,r12,r8,ROR #31
add r10,r10,r9,ROR #0
str r10,[sp,#120]
eor r1,r1,r10,ROR #31
eor r5,r5,r14
add r0,r0,r6,ROR #8
add r0,r0,r5,ROR #0
ldr r5,[sp,#212]
eor r9,r9,r0,ROR #0
ldr r10,[sp,#72]
add r8,r8,r9,ROR #16
ldr r14,[sp,#168]
eor r6,r6,r8,ROR #24
eor r5,r10,r5
add r0,r0,r6,ROR #20
add r0,r0,r5,ROR #0
ldr r5,[sp,#88]
eor r9,r9,r0,ROR #16
str r9,[sp,#12]
add r8,r8,r9,ROR #24
str r8,[sp,#24]
eor r6,r6,r8,ROR #12
ldrd r10,[sp,#104]
eor r5,r5,r14
add r2,r2,r7,ROR #8
add r2,r2,r5,ROR #0
ldr r5,[sp,#216]
eor r8,r11,r2,ROR #0
ldr r9,[sp,#40]
add r10,r10,r8,ROR #16
ldr r14,[sp,#176]
eor r7,r7,r10,ROR #24
eor r5,r9,r5
add r2,r2,r7,ROR #20
add r2,r2,r5,ROR #0
ldr r5,[sp,#60]
eor r8,r8,r2,ROR #16
str r8,[sp,#28]
add r8,r10,r8,ROR #24
str r8,[sp,#32]
eor r7,r7,r8,ROR #12
ldrd r10,[sp,#112]
eor r5,r5,r14
add r3,r3,r1,ROR #8
add r3,r3,r5,ROR #0
ldr r5,[sp,#188]
eor r8,r11,r3,ROR #0
ldr r9,[sp,#48]
add r10,r10,r8,ROR #16
ldr r14,[sp,#220]
eor r1,r1,r10,ROR #24
eor r5,r9,r5
add r3,r3,r1,ROR #20
add r3,r3,r5,ROR #0
ldr r5,[sp,#100]
eor r8,r8,r3,ROR #16
str r8,[sp,#36]
add r8,r10,r8,ROR #24
ldrd r10,[sp,#120]
eor r5,r5,r14
add r4,r4,r12,ROR #8
add r4,r4,r5,ROR #0
ldr r5,[sp,#228]
eor r9,r11,r4,ROR #0
ldr r11,[sp,#92]
add r10,r10,r9,ROR #16
ldr r14,[sp,#224]
eor r12,r12,r10,ROR #24
eor r5,r11,r5
add r4,r4,r12,ROR #20
add r4,r4,r5,ROR #0
ldr r5,[sp,#80]
eor r9,r9,r4,ROR #16
eor r1,r1,r8,ROR #12
add r10,r10,r9,ROR #24
str r10,[sp,#8]
eor r12,r12,r10,ROR #12
eor r5,r5,r14
add r0,r0,r7,ROR #27
add r0,r0,r5,ROR #0
ldr r5,[sp,#208]
eor r9,r9,r0,ROR #8
ldr r10,[sp,#96]
add r8,r8,r9,ROR #8
ldr r14,[sp,#184]
eor r7,r7,r8,ROR #5
eor r5,r10,r5
add r0,r0,r7,ROR #7
add r0,r0,r5,ROR #0
ldr r5,[sp,#76]
eor r9,r9,r0,ROR #24
str r9,[sp,#124]
add r8,r8,r9,ROR #16
str r8,[sp,#112]
eor r7,r7,r8,ROR #25
ldrd r10,[sp,#32]
eor r5,r5,r14
add r4,r4,r6,ROR #27
add r4,r4,r5,ROR #0
ldr r5,[sp,#204]
eor r8,r11,r4,ROR #8
ldr r9,[sp,#56]
add r10,r10,r8,ROR #8
ldr r14,[sp,#172]
eor r6,r6,r10,ROR #5
eor r5,r9,r5
add r4,r4,r6,ROR #7
add r4,r4,r5,ROR #0
ldr r5,[sp,#68]
eor r8,r8,r4,ROR #24
str r8,[sp,#116]
add r8,r10,r8,ROR #16
str r8,[sp,#104]
eor r6,r6,r8,ROR #25
ldrd r10,[sp,#24]
eor r5,r5,r14
add r3,r3,r12,ROR #27
add r3,r3,r5,ROR #0
ldr r5,[sp,#196]
eor r8,r11,r3,ROR #8
ldr r9,[sp,#44]
add r10,r10,r8,ROR #8
ldr r14,[sp,#192]
eor r12,r12,r10,ROR #5
eor r5,r9,r5
add r3,r3,r12,ROR #7
add r3,r3,r5,ROR #0
ldr r5,[sp,#52]
eor r8,r8,r3,ROR #24
str r8,[sp,#108]
add r8,r10,r8,ROR #16
ldrd r10,[sp,#8]
eor r5,r5,r14
add r2,r2,r1,ROR #27
add r2,r2,r5,ROR #0
ldr r5,[sp,#180]
eor r9,r11,r2,ROR #8
ldr r11,[sp,#64]
add r10,r10,r9,ROR #8
ldr r14,[sp,#204]
eor r1,r1,r10,ROR #5
eor r5,r11,r5
add r2,r2,r1,ROR #7
add r2,r2,r5,ROR #0
ldr r5,[sp,#68]
eor r9,r9,r2,ROR #24
eor r12,r12,r8,ROR #25
add r10,r10,r9,ROR #16
str r10,[sp,#120]
eor r1,r1,r10,ROR #25
eor r5,r5,r14
add r0,r0,r6,ROR #14
add r0,r0,r5,ROR #0
ldr r5,[sp,#196]
eor r9,r9,r0,ROR #16
ldr r10,[sp,#76]
add r8,r8,r9,ROR #0
ldr r14,[sp,#172]
eor r6,r6,r8,ROR #18
eor r5,r10,r5
add r0,r0,r6,ROR #26
add r0,r0,r5,ROR #0
ldr r5,[sp,#52]
eor r9,r9,r0,ROR #0
str r9,[sp,#12]
add r8,r8,r9,ROR #8
str r8,[sp,#24]
eor r6,r6,r8,ROR #6
ldrd r10,[sp,#104]
eor r5,r5,r14
add r2,r2,r7,ROR #14
add r2,r2,r5,ROR #0
ldr r5,[sp,#180]
eor r8,r11,r2,ROR #16
ldr r9,[sp,#44]
add r10,r10,r8,ROR #0
ldr r14,[sp,#216]
eor r7,r7,r10,ROR #18
eor r5,r9,r5
add r2,r2,r7,ROR #26
add r2,r2,r5,ROR #0
ldr r5,[sp,#92]
eor r8,r8,r2,ROR #0
str r8,[sp,#28]
add r8,r10,r8,ROR #8
str r8,[sp,#32]
eor r7,r7,r8,ROR #6
ldrd r10,[sp,#112]
eor r5,r5,r14
add r3,r3,r1,ROR #14
add r3,r3,r5,ROR #0
ldr r5,[sp,#220]
eor r8,r11,r3,ROR #16
ldr r9,[sp,#88]
add r10,r10,r8,ROR #0
ldr r14,[sp,#224]
eor r1,r1,r10,ROR #18
eor r5,r9,r5
add r3,r3,r1,ROR #26
add r3,r3,r5,ROR #0
ldr r5,[sp,#84]
eor r8,r8,r3,ROR #0
str r8,[sp,#36]
add r8,r10,r8,ROR #8
str r8,[sp,#0]
eor r1,r1,r8,ROR #6
ldrd r10,[sp,#120]
eor r5,r5,r14
add r4,r4,r12,ROR #14
add r4,r4,r5,ROR #0
ldr r5,[sp,#212]
eor r8,r11,r4,ROR #16
ldr r9,[sp,#96]
add r10,r10,r8,ROR #0
ldr r11,[sp,#192]
eor r12,r12,r10,ROR #18
eor r5,r9,r5
add r4,r4,r12,ROR #26
add r4,r4,r5,ROR #0
ldr r5,[sp,#48]
eor r8,r8,r4,ROR #0
ldr r9,[sp,#0]
add r10,r10,r8,ROR #8
str r10,[sp,#8]
eor r12,r12,r10,ROR #6
eor r5,r5,r11
add r0,r0,r7,ROR #1
add r0,r0,r5,ROR #0
ldr r5,[sp,#176]
eor r8,r8,r0,ROR #24
ldr r10,[sp,#64]
add r9,r9,r8,ROR #24
ldr r14,[sp,#200]
eor r7,r7,r9,ROR #31
eor r5,r10,r5
add r0,r0,r7,ROR #13
add r5,r0,r5,ROR #0
ldr r0,[sp,#100]
eor r8,r8,r5,ROR #8
str r8,[sp,#124]
add r8,r9,r8,ROR #0
str r8,[sp,#112]
eor r7,r7,r8,ROR #19
ldrd r10,[sp,#32]
eor r0,r0,r14
add r4,r4,r6,ROR #1
add r0,r4,r0,ROR #0
ldr r4,[sp,#228]
eor r8,r11,r0,ROR #24
ldr r9,[sp,#72]
add r10,r10,r8,ROR #24
ldr r14,[sp,#168]
eor r6,r6,r10,ROR #31
eor r4,r9,r4
add r0,r0,r6,ROR #13
add r9,r0,r4,ROR #0
ldr r0,[sp,#56]
eor r4,r8,r9,ROR #8
str r4,[sp,#116]
add r4,r10,r4,ROR #0
str r4,[sp,#104]
eor r4,r6,r4,ROR #19
ldrd r10,[sp,#24]
eor r0,r0,r14
add r3,r3,r12,ROR #1
add r0,r3,r0,ROR #0
ldr r3,[sp,#184]
eor r6,r11,r0,ROR #24
ldr r8,[sp,#40]
add r10,r10,r6,ROR #24
ldr r14,[sp,#208]
eor r11,r12,r10,ROR #31
eor r3,r8,r3
add r0,r0,r11,ROR #13
add r8,r0,r3,ROR #0
ldr r0,[sp,#60]
eor r3,r6,r8,ROR #8
str r3,[sp,#108]
add r3,r10,r3,ROR #0
str r3,[sp,#16]
eor r3,r11,r3,ROR #19
ldrd r10,[sp,#8]
eor r0,r0,r14
add r2,r2,r1,ROR #1
add r0,r2,r0,ROR #0
ldr r2,[sp,#188]
eor r6,r11,r0,ROR #24
ldr r11,[sp,#80]
add r10,r10,r6,ROR #24
mov r4,r4,ROR #20
eor r1,r1,r10,ROR #31
eor r2,r11,r2
add r0,r0,r1,ROR #13
add r11,r0,r2,ROR #0
eor r0,r6,r11,ROR #8
str r0,[sp,#20]
add r0,r10,r0,ROR #0
str r0,[sp,#120]
eor r1,r1,r0,ROR #19
ldr r0,[sp,#236]
mov r7,r7,ROR #20
mov r1,r1,ROR #20
mov r10,r3,ROR #20
ldr r2,[r0,#0]
ldr r3,[r0,#32]
ldr r6,[sp,#16]
eor r2,r5,r2
eor r2,r2,r3
eor r2,r2,r6
ldr r5,[r0,#16]
ldr r6,[sp,#20]
eor r3,r4,r3
eor r3,r3,r5
eor r6,r3,r6
ldr r3,[r0,#4]
ldr r4,[r0,#36]
ldr r5,[sp,#104]
eor r3,r11,r3
eor r3,r3,r4
eor r3,r3,r5
ldr r5,[r0,#20]
ldr r11,[sp,#108]
eor r4,r7,r4
eor r4,r4,r5
eor r7,r4,r11
ldr r4,[r0,#8]
ldr r5,[r0,#40]
ldr r11,[sp,#112]
eor r4,r8,r4
eor r4,r4,r5
eor r4,r4,r11
ldr r8,[r0,#24]
ldr r11,[sp,#116]
eor r1,r1,r5
eor r1,r1,r8
eor r8,r1,r11
ldr r1,[r0,#12]
ldr r11,[r0,#44]
ldr r5,[sp,#120]
eor r1,r9,r1
eor r1,r1,r11
eor r5,r1,r5
ldr r1,[r0,#28]
ldr r9,[sp,#124]
eor r10,r10,r11
eor r1,r10,r1
eor r12,r1,r9
str r2,[r0,#0]
str r3,[r0,#4]
str r4,[r0,#8]
str r5,[r0,#12]
ldr r1,[sp,#232]
ldr r9,[sp,#128]
str r6,[r0,#16]
str r7,[r0,#20]
str r8,[r0,#24]
str r12,[r0,#28]
add r1,r1,#64
subs r9,r9,#1
str r9,[sp,#128]
bhi ._mainloop
ldr r4,[sp,#132]
ldr r5,[sp,#136]
ldr r6,[sp,#140]
ldr r7,[sp,#144]
ldr r8,[sp,#148]
ldr r9,[sp,#152]
ldr r10,[sp,#156]
ldr r11,[sp,#160]
ldr r14,[sp,#164]
._end:
add sp,sp,#256
bx lr
