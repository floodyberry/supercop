  
  .syntax unified
  .thumb                            



  .align	2
  .global	subBytesASM                 
  .thumb
  .thumb_func
  .type	subBytesASM, %function      
              
subBytesASM:
              push {r4-r6}
              adr r1, SBOX_
              movs r6, #0xff @mask to extract lowest byte
              movs r2, #0 @ 16 iterations (64 bytes = 16*4 Bytes)
loop:         ldr r3,[r0,r2] @load word              
              lsrs r4,r3,#24 @extract most significant byte to r4
              ldrb r5, [r1,r4] @load substitute value
              lsls r5, #8 @   shift to get space for next substituted byte
              lsrs r4, r3, #16   @extract second most significant byte
              ands r4, r6
              ldrb r4, [r1,r4] @load substitute value
              orrs r5, r4, r5 @add substituded value to result
              lsls r5, #8 @   shift to get space for next substituted byte
              lsrs r4, r3, #8   @extract second least significant byte
              ands r4, r6
              ldrb r4, [r1,r4] @load substitute value
              orrs r5, r4, r5 @add substituded value to result
              lsls r5, #8 @   shift to get space for next substituted byte
              ands r3, r6
              ldrb r4, [r1,r3] @load substitute value
              orrs r5, r4, r5 @add substituded value to result
              str r5,[r0,r2] 

              adds r2, #4    @increment loop variable
              cmp r2, #64
              blt loop
              
              pop {r4-r6}
              bx lr 
                         
                            
  .align 4
SBOX_:            
  .byte 0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5
  .byte 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76
  .byte 0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0
  .byte 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0
  .byte 0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc
  .byte 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15
  .byte 0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a
  .byte 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75
  .byte 0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0
  .byte 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84
  .byte 0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b
  .byte 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf
  .byte 0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85
  .byte 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8
  .byte 0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5
  .byte 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2
  .byte 0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17
  .byte 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73
  .byte 0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88
  .byte 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb
  .byte 0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c
  .byte 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79
  .byte 0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9
  .byte 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08
  .byte 0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6
  .byte 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a
  .byte 0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e
  .byte 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e
  .byte 0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94
  .byte 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf
  .byte 0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68
  .byte 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16




 
.macro        mul2 inreg:req, mmsbreg:req, tempreg1:req

              movs \tempreg1, \inreg
              ands \tempreg1, \mmsbreg     @set tempreg to only msb's
              mvns \mmsbreg, \mmsbreg     @make msb to mclmsb to clear msb
              ands \inreg, \mmsbreg    @clear msbs in inreg
              lsls \inreg, #1
              lsrs \tempreg1, #7
              lsls \mmsbreg, \tempreg1, #1
              orrs \tempreg1, \mmsbreg
              lsls \mmsbreg, \tempreg1, #3
              orrs \tempreg1, \mmsbreg
              eors \inreg, \tempreg1 @output is stored to inreg 
  .endm
              
       
.macro        mul2keepmmsb inreg:req, mmsbreg:req, tempreg1:req, tempreg2:req

              movs \tempreg1, \inreg
              ands \tempreg1, \mmsbreg     @set tempreg to only msb's
              mvns \tempreg2, \mmsbreg     @make msb to mclmsb to clear msb
              ands \inreg, \tempreg2    @clear msbs in inreg
              lsls \inreg, #1
              lsrs \tempreg1, #7
              lsls \tempreg2, \tempreg1, #1
              orrs \tempreg1, \tempreg2
              lsls \tempreg2, \tempreg1, #3
              orrs \tempreg1, \tempreg2
              eors \inreg, \tempreg1 @output is stored to inreg 
  .endm
              
                            


.macro        loadi destreg:req, number:req, baseaddress:req
              ldr \destreg,[\baseaddress,#(\number*2*4)]
  .endm
              

.macro        loadx destreg:req, number:req
              ldr \destreg,[SP,#(\number*4)]
  .endm              
              

.macro        loady destreg:req, number:req
              ldr \destreg,[SP,#(\number*4+4*8)]
  .endm 


  .align	2
  .global	mixBytesAsm                 
  .thumb
  .thumb_func
  .type	mixBytesAsm, %function              
              
                            
mixBytesAsm:
              push {r4-r7,lr}
              bl mixByteshalfStateAsm
              adds r0, r2, #4 @set r0 to address of second word in state (calc second half state)
              bl mixByteshalfStateAsm
              pop {r4-r7,pc}

              
              
mixByteshalfStateAsm:
              push {lr}
              mov lr,r0 @copy base address to lr
              loadi r1, 1, r0 @load i1 to r1
              loadi r2, 2, r0 @load i2 to r2              
              loadi r3, 3, r0 @load i3 to r3
              loadi r4, 4, r0 @load i4 to r4
              loadi r5, 5, r0 @load i5 to r5
              loadi r6, 6, r0 @load i6 to r6
              loadi r7, 7, r0 @load i7 to r7
              loadi r0, 0, r0 @load i0 to r0
              
              mov r10,r0 @temp copy of i0 in r10

              eors r0,r1 @calculate t0 in r0
              eors r1,r2 @calculate t1 in r1
              eors r2,r3 @calculate t2 in r2
              eors r3,r4 @calculate t3 in r3
              eors r4,r5 @calculate t4 in r4
              eors r5,r6 @calculate t5 in r5
              eors r6,r7 @calculate t6 in r6
              mov r8, r0 @temp copy of t0 in r8
              mov r0,r10 @get i0 out of r10 copied from above
              eors r7,r0 @calculate t7 in r7
              mov r0, r8 @get t0 back to r0

              push {r0-r7} @push t0-t7 on stack
              
              eors r0,r3 @calculate x0 in r0
              eors r3,r6 @calculate x3 in r3
              eors r6,r1 @calculate x6 in r6
              eors r1,r4 @calculate x1 in r1
              eors r4,r7 @calculate x4 in r4
              eors r7,r2 @calculate x7 in r7
              eors r2,r5 @calculate x2 in r2
              mov r9, r0 @temp copy of x0 in r9
              mov r0, r8 @get t0 out of r8
              eors r5,r0 @calculate x5 in r5
              mov r0, r9 @get x0 back in r0
              
              push {r4-r7} @push x4-x7
              ldr r4, MMSB
              
              mul2keepmmsb r0,r4,r5,r6  @calc x0*2
              mul2keepmmsb r3,r4,r5,r6  @calc x3*2
              mov r9,r0 @temp copy of x0 in r9
              push {r0-r3}   @x0 pushen nicht notwendig?...


              @calculate y' values(y without xored i values)
              add sp,#(4*8)
              pop {r0-r7} @pop t1-t7
              mov r0,r1 @temp copy of t1 in r0
              eors r1,r3 @calculate y1' in r1
              eors r3,r5 @calculate y3' in r3
              eors r5,r7 @calculate y5' in r5
              eors r7,r0 @calculate y7' in r7
              mov r11, r1 @temp copy of y1' in r11
              mov r12, r3 @temp copy of y3' in r12

              mov r0,r8 @get t0 out of r8 from above
              eors r0,r2 @calculate y0' in r0
              eors r2,r4 @calculate y2' in r2
              eors r4,r6 @calculate y4' in r4
              mov r1,r8  @get t0 out of r8 to r7
              eors r6,r1 @calculate y6' in r6
              
              @calculate y values
              mov r1,lr @load base address of input array to r1
              loadi r3, 6, r1 @load i6 to r3@
              eors r0,r3 @calculate y0 in r0
              mov r3,r10 @copy i0 from r10 to r3
              eors r2,r3 @calculate y2 in r2
              loadi r3, 2, r1 @load i2 to r3
              eors r4,r3 @calculate y4 in r4
              loadi r3, 3, r1 @load i3 to r3
              eors r5,r3 @calculate y5 in r5
              loadi r3, 4, r1 @load i4 to r3
              eors r6,r3 @calculate y6 in r6
              loadi r3, 5, r1 @load i5 to r3
              eors r7,r3 @calculate y7 in r7
              push {r4-r7} @push y4-y7 to stack

              @calculate y1 and y3
              loadi r3, 1, r1 @load i1 to r3
              mov r5,r12 @get copy of y3' in r12
              eors r3,r5 @calculate y3 in r3
              loadi r5, 7, r1 @load i7 to r3
              mov r1,r11 @get copy of y1' in r11
              eors r1,r5 @calculate y1 in r1
              push {r0-r3}
              mov r5, r9 @get x0 out of r9 to r5
              eors r5,r4 @calc t5
              ldr r6, MMSB @load mmsb mask into r6
              mul2keepmmsb r5,r6,r2,r3 @calc t5=t5*2
              mov r2,lr @get input base address from lr to r2
              eors r5,r1 @output[2*5] = t5^y1
              str r5, [r2,#(4*2*5)]
              
              
              sub sp,#(4*8) @set stack pointer to top of stack (x values)
              ldr r5, [sp,#(4*3)] @load x3 into r5
              eors r5,r7 @t0=x3^y7
              
              mul2 r5,r6,r3 @t0 = 2*t0
              eors r4, r5 @output[2*0] = t0^y4
              str r4, [r2,#(4*2*0)]

              ldr r6, MMSB @get mmsb mask
              @mul2keepmmsb \inreg,\mmsbreg,\tempreg1,\tempreg2
              loadx r5,4 @load x4 into r5
              mul2keepmmsb r5,r6,r3,r4 @calc t0=x4*2
              eors r5,r0 @calc t0^y0
              mul2keepmmsb r5,r6,r3,r4 @calc t0=(t0^y0)*2
              loady r4,5 @load y5 into r4
              eors r5,r4 @t0^y5
              str r5, [r2,#(4*2*1)] @output[2*1] = t0^y5

              loadx r5,5 @load x5 into r5
              mul2keepmmsb r5,r6,r3,r4 @calc t0=x5*2
              eors r5,r1 @calc t0^y1
              mul2keepmmsb r5,r6,r3,r4 @calc t0=(t0^y1)*2
              loady r4,6 @load y6 into r4
              eors r5,r4 @t0^y6
              str r5, [r2,#(4*2*2)] @output[2*2] = t0^y6

              loadx r5,2 @load x2 into r5
              mul2keepmmsb r5,r6,r3,r1 @calc t0=x2*2
              eors r5,r4 @calc t0^y6
              mul2keepmmsb r5,r6,r3,r1 @calc t0=(t0^y6)*2
              loady r4,3 @load y6 into r4
              eors r5,r4 @t0^y3
              str r5, [r2,#(4*2*7)] @output[2*7] = t0^y3

              loadx r5,7 @load x7 into r5
              mul2keepmmsb r5,r6,r3,r1 @calc t0=x7*2
              eors r5,r4 @calc t0^y3
              mul2keepmmsb r5,r6,r3,r1 @calc t0=(t0^y6)*2
              eors r5,r0 @t0^y0
              str r5, [r2,#(4*2*4)] @output[2*4] = t0^y0

              loadx r5,6 @load x6 into r5
              mul2keepmmsb r5,r6,r3,r1 @calc t0=x6*2
              loady r0,2 @load y2 into r0
              eors r5,r0 @calc t0^y2
              mul2keepmmsb r5,r6,r3,r1 @calc t0=(t0^y2)*2
              eors r5,r7 @t0^y7
              str r5, [r2,#(4*2*3)] @output[2*3] = t0^y7

              loadx r5,1 @load x1 into r5
              mul2keepmmsb r5,r6,r3,r1 @calc t0=x1*2
              loady r4,5 @load y5 into r4
              eors r5,r4 @calc t0^y5
              mul2keepmmsb r5,r6,r3,r1 @calc t0=(t0^y5)*2
              eors r5,r0 @t0^y2
              str r5, [r2,#(4*2*6)] @output[2*6] = t0^y2    
              
              add sp,#(2*8*4) @get stackpointer back to beginning

              pop {pc}

  .align 4
MMSB:         
  .word 0x80808080    
            

