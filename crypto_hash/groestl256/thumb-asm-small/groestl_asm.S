  
  .syntax unified
  .thumb                         

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

              

              @Implementation of mixByteshalfState in assembler
              @EXPORT mixByteshalfStateAsm              
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
              ldr r6, MMSB
              mov r11,lr
              mov r5, r0
              bl mul2Function
              mov r0, r5
              mov r5, r3
              bl mul2Function
              mov r3, r5
              mov lr, r11
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
              mov r2,lr @get input base address from lr to r2
              sub sp,#(4*8)
              bl mul2Function
              add sp,#(4*8)              
              eors r5,r1 @output[2*5] = t5^y1
              str r5, [r2,#(4*2*5)]
              
              
              sub sp,#(4*8) @set stack pointer to top of stack (x values)
              ldr r5, [sp,#(4*3)] @load x3 into r5
              eors r5,r7 @t0=x3^y7
              
              bl mul2Function
              eors r4, r5 @output[2*0] = t0^y4
              str r4, [r2,#(4*2*0)]

              @mul2keepmmsb $inreg,$mmsbreg,$tempreg1,$tempreg2
              loadx r5,4 @load x4 into r5
              bl mul2Function
              eors r5,r0 @calc t0^y0
              bl mul2Function
              loady r4,5 @load y5 into r4
              eors r5,r4 @t0^y5
              str r5, [r2,#(4*2*1)] @output[2*1] = t0^y5

              loadx r5,5 @load x5 into r5
              bl mul2Function
              eors r5,r1 @calc t0^y1
              bl mul2Function
              loady r4,6 @load y6 into r4
              eors r5,r4 @t0^y6
              str r5, [r2,#(4*2*2)] @output[2*2] = t0^y6

              loadx r5,2 @load x2 into r5
              bl mul2Function
              eors r5,r4 @calc t0^y6
              bl mul2Function
              loady r4,3 @load y6 into r4
              eors r5,r4 @t0^y3
              str r5, [r2,#(4*2*7)] @output[2*7] = t0^y3

              loadx r5,7 @load x7 into r5
              bl mul2Function
              eors r5,r4 @calc t0^y3
              bl mul2Function
              eors r5,r0 @t0^y0
              str r5, [r2,#(4*2*4)] @output[2*4] = t0^y0

              loadx r5,6 @load x6 into r5
              bl mul2Function
              loady r0,2 @load y2 into r0
              eors r5,r0 @calc t0^y2
              bl mul2Function
              eors r5,r7 @t0^y7
              str r5, [r2,#(4*2*3)] @output[2*3] = t0^y7

              loadx r5,1 @load x1 into r5
              bl mul2Function
              loady r4,5 @load y5 into r4
              eors r5,r4 @calc t0^y5
              bl mul2Function
              eors r5,r0 @t0^y2
              str r5, [r2,#(4*2*6)] @output[2*6] = t0^y2    
              
              add sp,#(2*8*4) @get stackpointer back to beginning

              pop {pc}

              .align 4
MMSB:         .word 0x80808080    @Mask to get most significant bit of each single byte in a word
            
               
mul2Function:     @r6 must contain mmsb and r5 is the input and output register
              push {r3-r4}
              movs r4, r5
              ands r4, r6     @set tempreg to only msb's
              mvns r3, r6     @make msb to mclmsb to clear msb
              ands r5, r3    @clear msbs in inreg
              lsls r5, #1
              lsrs r4, #7
              lsls r3, r4, #1
              orrs r4, r3
              lsls r3, r4, #3
              orrs r4, r3
              eors r5, r4 @output is stored to inreg
              pop {r3-r4}
              bx lr


