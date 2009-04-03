/ Code for F_p field arithmetic, p is 2^127-1, on a Core 2 (or any modern 64-bit Intel/AMD chip)
/ Parameters passed in rdi,rsi,rdx (which are pointers to 2-element arrays storing a field element, 2x64=128)

.text

.globl modmult
modmult:

  push %rbx
  movq %rdx,%rbx
  xorq %rcx,%rcx

/ multiplication 

  movq (%rsi),%rax
  mulq (%rdi)
  movq %rax,%r10
  movq %rdx,%r11

  movq 8(%rsi),%rax
  mulq 8(%rdi)
  movq %rax,%r8
  movq %rdx,%r9

  movq (%rsi),%rax
  mulq 8(%rdi)
  addq %rax,%r11
  adcq %rdx,%r8
  adcq %rcx,%r9

  movq 8(%rsi),%rax 
  mulq (%rdi)
  addq %rax,%r11
  adcq %rdx,%r8
  adcq %rcx,%r9

/ reduction 

  rclq $1,%r11
  rclq $1,%r8
  rclq $1,%r9
  shrq $1,%r11

  addq %r8,%r10
  adcq %r9,%r11

  rolq $1,%r11
  shrq $1,%r11
  adcq %rcx,%r10
  adcq %rcx,%r11

  movq %r10,(%rbx)
  movq %r11,8(%rbx)
  pop %rbx

  ret

.globl modsqr
modsqr:
  xorq %rcx,%rcx

/ squaring

  movq (%rdi),%rax
  mulq (%rdi)
  movq %rax,%r10
  movq %rdx,%r11

  movq 8(%rdi),%rax
  mulq 8(%rdi)
  movq %rax,%r8
  movq %rdx,%r9

  movq (%rdi),%rax
  mulq 8(%rdi)
  addq %rax,%r11
  adcq %rdx,%r8
  adcq %rcx,%r9
  addq %rax,%r11
  adcq %rdx,%r8
  adcq %rcx,%r9

/ reduction 

  rclq $1,%r11
  rclq $1,%r8
  rclq $1,%r9
  shrq $1,%r11

  addq %r8,%r10
  adcq %r9,%r11

  rolq $1,%r11
  shrq $1,%r11
  adcq %rcx,%r10
  adcq %rcx,%r11

  movq %r10,(%rsi)
  movq %r11,8(%rsi)

  ret

.globl modpmul
modpmul:

  xorq %rcx,%rcx
  movq (%rsi),%rax
  mulq %rdi
  movq %rax,%r8
  movq %rdx,%r9
  movq 8(%rsi),%rax
  mulq %rdi

  addq %rax,%r9
  adcq %rcx,%rdx

  rclq $1,%r9
  rclq $1,%rdx
  shrq $1,%r9
  addq %rdx,%r8
  adcq %rcx,%r9

  rolq $1,%r9
  shrq $1,%r9
  adcq %rcx,%r8
  adcq %rcx,%r9

  movq %r8,(%rsi)
  movq %r9,8(%rsi)

  ret

.globl modadd
modadd:
  xorq %rcx,%rcx
  movq (%rdi),%r8
  movq 8(%rdi),%r9

  addq (%rsi),%r8
  adcq 8(%rsi),%r9

  rolq $1,%r9
  shrq $1,%r9
  adcq %rcx,%r8
  adcq %rcx,%r9

  movq %r8,(%rdx)
  movq %r9,8(%rdx)

  ret

.globl modtim2
modtim2:

  xorq %rcx,%rcx
  movq (%rdi),%r8
  movq 8(%rdi),%r9

  add %r8,%r8
  adc %r9,%r9

  rolq $1,%r9
  shrq $1,%r9
  adcq %rcx,%r8
  adcq %rcx,%r9
  movq %r8,(%rdi)
  movq %r9,8(%rdi)

  ret

.globl modtim3
modtim3:
  xorq %rcx,%rcx
  movq (%rdi),%r8
  movq 8(%rdi),%r9

  add %r8,%r8
  adc %r9,%r9

  rolq $1,%r9
  shrq $1,%r9
  adcq %rcx,%r8
  adcq %rcx,%r9
  
  add (%rdi),%r8
  adc 8(%rdi),%r9

  rolq $1,%r9
  shrq $1,%r9
  adcq %rcx,%r8
  adcq %rcx,%r9
  movq %r8,(%rdi)
  movq %r9,8(%rdi)

ret

.globl modtim4
modtim4:
  xorq %rcx,%rcx
  movq (%rdi),%r8
  movq 8(%rdi),%r9

  add %r8,%r8
  adc %r9,%r9

  rolq $1,%r9
  shrq $1,%r9
  adcq %rcx,%r8
  adcq %rcx,%r9
  
  add %r8,%r8
  adc %r8,%r9

  rolq $1,%r9
  shrq $1,%r9
  adcq %rcx,%r8
  adcq %rcx,%r9
  movq %r8,(%rdi)
  movq %r9,8(%rdi)

ret

.globl modsub
modsub:

  xorq %rcx,%rcx
  movq (%rdi),%r8
  movq 8(%rdi),%r9

  subq (%rsi),%r8
  sbbq 8(%rsi),%r9

  rolq $1,%r9
  shrq $1,%r9
  sbbq %rcx,%r8
  sbbq %rcx,%r9

  movq %r8,(%rdx)
  movq %r9,8(%rdx)

  ret

.globl moddblsub
moddblsub:

  xorq %rcx,%rcx
  movq (%rdi),%r8
  movq 8(%rdi),%r9

  subq (%rsi),%r8
  sbbq 8(%rsi),%r9

  rolq $1,%r9
  shrq $1,%r9
  sbbq %rcx,%r8
  sbbq %rcx,%r9

  subq (%rdx),%r8
  sbbq 8(%rdx),%r9

  rolq $1,%r9
  shrq $1,%r9
  sbbq %rcx,%r8
  sbbq %rcx,%r9

  movq %r8,(%rdi)
  movq %r9,8(%rdi)

ret

/ modular divide by 2

.globl moddiv2
moddiv2:

  movq (%rdi),%r8
  movq 8(%rdi),%r9
  movq %r8,%rax
  shlq $63,%rax
  addq %rax,%r9
  rcrq $1,%r9
  rcrq $1,%r8
  movq %r8,(%rdi)
  movq %r9,8(%rdi)

  ret

/ modular negation

.globl modneg
modneg:
  notq (%rdi)
  notq 8(%rdi)
  shlq $1,8(%rdi)
  shrq $1,8(%rdi)

  ret
