#define GLOBAL2(n) .globl n##_ssse3; .globl _##n##_ssse3
#define GLOBAL(n) GLOBAL2(n)
#define FN2(n) .p2align 4,,15; n##_ssse3:; _##n##_ssse3:
#define FN(n) FN2(n)

/* linux/elf annotations and NX indicator */
#if defined(__linux__) && defined(__ELF__)
#define ENDFN(n) .size n##_ssse3, .-n##_ssse3; .type n##_ssse3, @function;
#define ENDFILE() .section .note.GNU-stack,"",%progbits
#else
#define ENDFN(n)
#define ENDFILE()
#endif

/* global offset table support */
#if (defined(_WIN32) || defined(__CYGWIN__)) || (!defined(__pic__) && !defined(__PIC__))
#define LOAD_GOTREG(reg)
#define REF_GOTVAR(var, reg) var
#define CALL_PLT(function) call function
#else
#define LOAD_GOTREG(reg) call 1f; 1:; popl reg; leal _GLOBAL_OFFSET_TABLE_ + 1(reg), reg;
#define REF_GOTVAR(var, reg) var##@GOTOFF(reg)
#define CALL_PLT(function) call function@PLT
#endif

.text

GLOBAL(chacha)
GLOBAL(xchacha)
GLOBAL(hchacha)
GLOBAL(chacha_blocks)

FN(chacha_blocks)
chacha_blocks_ssse3_local:
movl %esp,%eax
andl $31,%eax
addl $736,%eax
subl %eax,%esp
movl %eax,64(%esp)
movl %ebx,68(%esp)
movl %esi,72(%esp)
movl %edi,76(%esp)
movl %ebp,80(%esp)
movl 4(%esp,%eax),%ecx
movl %ecx,84(%esp)
movl 8(%esp,%eax),%esi
movl 12(%esp,%eax),%edx
movl 16(%esp,%eax),%eax
LOAD_GOTREG(%ebx)
movdqa REF_GOTVAR(C+0, %ebx), %xmm0
movdqa REF_GOTVAR(C+16, %ebx), %xmm5
movdqa REF_GOTVAR(C+32, %ebx), %xmm6
movdqa %xmm5, 128(%esp)
movdqa %xmm6, 144(%esp)
movdqu 0(%ecx),%xmm1
movdqu 16(%ecx),%xmm2
movdqu 32(%ecx),%xmm3
movdqa %xmm0,160(%esp)
movdqa %xmm1,176(%esp)
movdqa %xmm2,192(%esp)
movdqa %xmm3,208(%esp)
movl 48(%ecx),%ecx
movl %ecx,88(%esp)
cmpl $0,%eax
jbe chacha_blocks_ssse3_done
cmpl $256,%eax
jb chacha_blocks_ssse3_bytesbetween1and255
pshufd $0x00,%xmm0,%xmm4
pshufd $0x55,%xmm0,%xmm5
pshufd $0xaa,%xmm0,%xmm6
pshufd $0xff,%xmm0,%xmm0
movdqa %xmm4,224(%esp)
movdqa %xmm5,240(%esp)
movdqa %xmm6,256(%esp)
movdqa %xmm0,272(%esp)
pshufd $0x00,%xmm1,%xmm0
pshufd $0x55,%xmm1,%xmm4
pshufd $0xaa,%xmm1,%xmm5
pshufd $0xff,%xmm1,%xmm1
movdqa %xmm0,288(%esp)
movdqa %xmm4,304(%esp)
movdqa %xmm5,320(%esp)
movdqa %xmm1,336(%esp)
pshufd $0x00,%xmm2,%xmm0
pshufd $0x55,%xmm2,%xmm1
pshufd $0xaa,%xmm2,%xmm4
pshufd $0xff,%xmm2,%xmm2
movdqa %xmm0,352(%esp)
movdqa %xmm1,368(%esp)
movdqa %xmm4,384(%esp)
movdqa %xmm2,400(%esp)
pshufd $0xaa,%xmm3,%xmm0
pshufd $0xff,%xmm3,%xmm1
movdqa %xmm0,416(%esp)
movdqa %xmm1,432(%esp)
jmp chacha_blocks_ssse3_bytesatleast256
.p2align 6,,63
chacha_blocks_ssse3_bytesatleast256:
movl 208(%esp),%ecx
movl 4+208(%esp),%ebx
movl %ecx,448(%esp)
movl %ebx,464(%esp)
addl $1,%ecx
adcl $0,%ebx
movl %ecx,4+448(%esp)
movl %ebx,4+464(%esp)
addl $1,%ecx
adcl $0,%ebx
movl %ecx,8+448(%esp)
movl %ebx,8+464(%esp)
addl $1,%ecx
adcl $0,%ebx
movl %ecx,12+448(%esp)
movl %ebx,12+464(%esp)
addl $1,%ecx
adcl $0,%ebx
movl %ecx,208(%esp)
movl %ebx,4+208(%esp)
movl %eax,92(%esp)
movl 88(%esp),%eax
movdqa 304(%esp),%xmm0
movdqa 384(%esp),%xmm1
movdqa 432(%esp),%xmm2
movdqa 416(%esp),%xmm3
movdqa 272(%esp),%xmm4
movdqa 320(%esp),%xmm5
movdqa 400(%esp),%xmm6
movdqa 240(%esp),%xmm7
movdqa %xmm0,480(%esp)
movdqa %xmm1,496(%esp)
movdqa %xmm2,512(%esp)
movdqa %xmm3,528(%esp)
movdqa %xmm4,544(%esp)
movdqa %xmm5,560(%esp)
movdqa %xmm6,576(%esp)
movdqa %xmm7,592(%esp)
movdqa 336(%esp),%xmm4
movdqa 464(%esp),%xmm5
movdqa 256(%esp),%xmm6
movdqa 368(%esp),%xmm7
movdqa 224(%esp),%xmm0
movdqa 448(%esp),%xmm2
movdqa 288(%esp),%xmm3
movdqa 352(%esp),%xmm1
movdqa %xmm4,608(%esp)
movdqa %xmm5,624(%esp)
movdqa %xmm6,640(%esp)
movdqa %xmm7,656(%esp)
movdqa %xmm0,672(%esp)
movdqa %xmm2,688(%esp)
chacha_blocks_ssse3_mainloop1:
paddd %xmm3,%xmm0
pxor %xmm0,%xmm2
pshufb 128(%esp),%xmm2
paddd %xmm2,%xmm1
pxor %xmm1,%xmm3
movdqa %xmm3,%xmm4
pslld $12,%xmm3
psrld $20,%xmm4
pxor %xmm4,%xmm3
paddd %xmm3,%xmm0
movdqa %xmm0,672(%esp)
pxor %xmm0,%xmm2
movdqa 592(%esp),%xmm0
movdqa 480(%esp),%xmm4
movdqa 624(%esp),%xmm5
movdqa 656(%esp),%xmm6
paddd %xmm4,%xmm0
pxor %xmm0,%xmm5
pshufb 128(%esp),%xmm5
paddd %xmm5,%xmm6
pxor %xmm6,%xmm4
movdqa %xmm4,%xmm7
pslld $12,%xmm4
psrld $20,%xmm7
pxor %xmm7,%xmm4
paddd %xmm4,%xmm0
movdqa %xmm0,480(%esp)
pxor %xmm0,%xmm5
pshufb 144(%esp),%xmm2
movdqa %xmm2,592(%esp)
paddd %xmm2,%xmm1
movdqa %xmm1,624(%esp)
pxor %xmm1,%xmm3
movdqa %xmm3,%xmm0
pslld $7,%xmm3
psrld $25,%xmm0
pxor %xmm0,%xmm3
movdqa %xmm3,656(%esp)
pshufb 144(%esp),%xmm5
movdqa %xmm5,688(%esp)
paddd %xmm5,%xmm6
movdqa %xmm6,704(%esp)
pxor %xmm6,%xmm4
movdqa %xmm4,%xmm0
pslld $7,%xmm4
psrld $25,%xmm0
pxor %xmm0,%xmm4
movdqa %xmm4,720(%esp)
movdqa 640(%esp),%xmm0
movdqa 560(%esp),%xmm3
movdqa 496(%esp),%xmm1
movdqa 528(%esp),%xmm2
paddd %xmm3,%xmm0
pxor %xmm0,%xmm2
pshufb 128(%esp),%xmm2
paddd %xmm2,%xmm1
pxor %xmm1,%xmm3
movdqa %xmm3,%xmm4
pslld $12,%xmm3
psrld $20,%xmm4
pxor %xmm4,%xmm3
paddd %xmm3,%xmm0
movdqa %xmm0,528(%esp)
pxor %xmm0,%xmm2
movdqa 544(%esp),%xmm0
movdqa 608(%esp),%xmm4
movdqa 512(%esp),%xmm5
movdqa 576(%esp),%xmm6
paddd %xmm4,%xmm0
pxor %xmm0,%xmm5
pshufb 128(%esp),%xmm5
paddd %xmm5,%xmm6
pxor %xmm6,%xmm4
movdqa %xmm4,%xmm7
pslld $12,%xmm4
psrld $20,%xmm7
pxor %xmm7,%xmm4
paddd %xmm4,%xmm0
movdqa %xmm0,544(%esp)
pxor %xmm0,%xmm5
pshufb 144(%esp),%xmm2
movdqa %xmm2,608(%esp)
paddd %xmm2,%xmm1
pxor %xmm1,%xmm3
movdqa %xmm3,%xmm0
pslld $7,%xmm3
psrld $25,%xmm0
pxor %xmm0,%xmm3
movdqa %xmm3,496(%esp)
pshufb 144(%esp),%xmm5
paddd %xmm5,%xmm6
movdqa %xmm6,512(%esp)
pxor %xmm6,%xmm4
movdqa %xmm4,%xmm0
pslld $7,%xmm4
psrld $25,%xmm0
pxor %xmm0,%xmm4
movdqa %xmm4,640(%esp)
movdqa 672(%esp),%xmm0
movdqa 720(%esp),%xmm3
movdqa %xmm5,%xmm2
paddd %xmm3,%xmm0
pxor %xmm0,%xmm2
pshufb 128(%esp),%xmm2
paddd %xmm2,%xmm1
pxor %xmm1,%xmm3
movdqa %xmm3,%xmm4
pslld $12,%xmm3
psrld $20,%xmm4
pxor %xmm4,%xmm3
paddd %xmm3,%xmm0
movdqa %xmm0,672(%esp)
pxor %xmm0,%xmm2
movdqa 480(%esp),%xmm0
movdqa 496(%esp),%xmm4
movdqa 592(%esp),%xmm5
movdqa 512(%esp),%xmm6
paddd %xmm4,%xmm0
pxor %xmm0,%xmm5
pshufb 128(%esp),%xmm5
paddd %xmm5,%xmm6
pxor %xmm6,%xmm4
movdqa %xmm4,%xmm7
pslld $12,%xmm4
psrld $20,%xmm7
pxor %xmm7,%xmm4
paddd %xmm4,%xmm0
movdqa %xmm0,592(%esp)
pxor %xmm0,%xmm5
pshufb 144(%esp),%xmm2
movdqa %xmm2,512(%esp)
paddd %xmm2,%xmm1
movdqa %xmm1,496(%esp)
pxor %xmm1,%xmm3
movdqa %xmm3,%xmm0
pslld $7,%xmm3
psrld $25,%xmm0
pxor %xmm0,%xmm3
movdqa %xmm3,480(%esp)
pshufb 144(%esp),%xmm5
movdqa %xmm5,720(%esp)
paddd %xmm5,%xmm6
movdqa %xmm6,576(%esp)
pxor %xmm6,%xmm4
movdqa %xmm4,%xmm0
pslld $7,%xmm4
psrld $25,%xmm0
pxor %xmm0,%xmm4
movdqa %xmm4,560(%esp)
movdqa 528(%esp),%xmm0
movdqa 640(%esp),%xmm3
movdqa 624(%esp),%xmm1
movdqa 688(%esp),%xmm2
paddd %xmm3,%xmm0
pxor %xmm0,%xmm2
pshufb 128(%esp),%xmm2
paddd %xmm2,%xmm1
pxor %xmm1,%xmm3
movdqa %xmm3,%xmm4
pslld $12,%xmm3
psrld $20,%xmm4
pxor %xmm4,%xmm3
paddd %xmm3,%xmm0
movdqa %xmm0,640(%esp)
pxor %xmm0,%xmm2
movdqa 544(%esp),%xmm0
movdqa 656(%esp),%xmm4
movdqa 608(%esp),%xmm5
movdqa 704(%esp),%xmm6
paddd %xmm4,%xmm0
pxor %xmm0,%xmm5
pshufb 128(%esp),%xmm5
paddd %xmm5,%xmm6
pxor %xmm6,%xmm4
movdqa %xmm4,%xmm7
pslld $12,%xmm4
psrld $20,%xmm7
pxor %xmm7,%xmm4
paddd %xmm4,%xmm0
movdqa %xmm0,544(%esp)
pxor %xmm0,%xmm5
pshufb 144(%esp),%xmm2
movdqa %xmm2,624(%esp)
paddd %xmm2,%xmm1
pxor %xmm1,%xmm3
movdqa %xmm3,%xmm0
pslld $7,%xmm3
psrld $25,%xmm0
pxor %xmm0,%xmm3
movdqa %xmm3,608(%esp)
pshufb 144(%esp),%xmm5
movdqa %xmm5,528(%esp)
paddd %xmm5,%xmm6
movdqa %xmm6,656(%esp)
pxor %xmm6,%xmm4
movdqa %xmm4,%xmm0
pslld $7,%xmm4
psrld $25,%xmm0
pxor %xmm0,%xmm4
movdqa %xmm4,%xmm3
movdqa 672(%esp),%xmm0
movdqa 720(%esp),%xmm2
subl $2,%eax
ja chacha_blocks_ssse3_mainloop1
movdqa %xmm3,688(%esp)
movdqa %xmm1,704(%esp)
cmpl $0,%esi
jbe chacha_blocks_ssse3_noinput1
movdqa 672(%esp),%xmm0
movdqa 592(%esp),%xmm1
movdqa 640(%esp),%xmm2
movdqa 544(%esp),%xmm3
paddd 224(%esp),%xmm0
paddd 240(%esp),%xmm1
paddd 256(%esp),%xmm2
paddd 272(%esp),%xmm3
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
xorl 0(%esi),%eax
xorl 4(%esi),%ecx
xorl 8(%esi),%ebx
xorl 12(%esi),%edi
movl %eax,0(%edx)
movl %ecx,4(%edx)
movl %ebx,8(%edx)
movl %edi,12(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
xorl 64(%esi),%eax
xorl 68(%esi),%ecx
xorl 72(%esi),%ebx
xorl 76(%esi),%edi
movl %eax,64(%edx)
movl %ecx,68(%edx)
movl %ebx,72(%edx)
movl %edi,76(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
xorl 128(%esi),%eax
xorl 132(%esi),%ecx
xorl 136(%esi),%ebx
xorl 140(%esi),%edi
movl %eax,128(%edx)
movl %ecx,132(%edx)
movl %ebx,136(%edx)
movl %edi,140(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
xorl 192(%esi),%eax
xorl 196(%esi),%ecx
xorl 200(%esi),%ebx
xorl 204(%esi),%edi
movl %eax,192(%edx)
movl %ecx,196(%edx)
movl %ebx,200(%edx)
movl %edi,204(%edx)
movdqa 688(%esp),%xmm0
movdqa 480(%esp),%xmm1
movdqa 560(%esp),%xmm2
movdqa 608(%esp),%xmm3
paddd 288(%esp),%xmm0
paddd 304(%esp),%xmm1
paddd 320(%esp),%xmm2
paddd 336(%esp),%xmm3
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
xorl 16(%esi),%eax
xorl 20(%esi),%ecx
xorl 24(%esi),%ebx
xorl 28(%esi),%edi
movl %eax,16(%edx)
movl %ecx,20(%edx)
movl %ebx,24(%edx)
movl %edi,28(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
xorl 80(%esi),%eax
xorl 84(%esi),%ecx
xorl 88(%esi),%ebx
xorl 92(%esi),%edi
movl %eax,80(%edx)
movl %ecx,84(%edx)
movl %ebx,88(%edx)
movl %edi,92(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
xorl 144(%esi),%eax
xorl 148(%esi),%ecx
xorl 152(%esi),%ebx
xorl 156(%esi),%edi
movl %eax,144(%edx)
movl %ecx,148(%edx)
movl %ebx,152(%edx)
movl %edi,156(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
xorl 208(%esi),%eax
xorl 212(%esi),%ecx
xorl 216(%esi),%ebx
xorl 220(%esi),%edi
movl %eax,208(%edx)
movl %ecx,212(%edx)
movl %ebx,216(%edx)
movl %edi,220(%edx)
movdqa 704(%esp),%xmm0
movdqa 656(%esp),%xmm1
movdqa 496(%esp),%xmm2
movdqa 576(%esp),%xmm3
paddd 352(%esp),%xmm0
paddd 368(%esp),%xmm1
paddd 384(%esp),%xmm2
paddd 400(%esp),%xmm3
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
xorl 32(%esi),%eax
xorl 36(%esi),%ecx
xorl 40(%esi),%ebx
xorl 44(%esi),%edi
movl %eax,32(%edx)
movl %ecx,36(%edx)
movl %ebx,40(%edx)
movl %edi,44(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
xorl 96(%esi),%eax
xorl 100(%esi),%ecx
xorl 104(%esi),%ebx
xorl 108(%esi),%edi
movl %eax,96(%edx)
movl %ecx,100(%edx)
movl %ebx,104(%edx)
movl %edi,108(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
xorl 160(%esi),%eax
xorl 164(%esi),%ecx
xorl 168(%esi),%ebx
xorl 172(%esi),%edi
movl %eax,160(%edx)
movl %ecx,164(%edx)
movl %ebx,168(%edx)
movl %edi,172(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
xorl 224(%esi),%eax
xorl 228(%esi),%ecx
xorl 232(%esi),%ebx
xorl 236(%esi),%edi
movl %eax,224(%edx)
movl %ecx,228(%edx)
movl %ebx,232(%edx)
movl %edi,236(%edx)
movdqa 720(%esp),%xmm0
movdqa 624(%esp),%xmm1
movdqa 528(%esp),%xmm2
movdqa 512(%esp),%xmm3
paddd 448(%esp),%xmm0
paddd 464(%esp),%xmm1
paddd 416(%esp),%xmm2
paddd 432(%esp),%xmm3
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
xorl 48(%esi),%eax
xorl 52(%esi),%ecx
xorl 56(%esi),%ebx
xorl 60(%esi),%edi
movl %eax,48(%edx)
movl %ecx,52(%edx)
movl %ebx,56(%edx)
movl %edi,60(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
xorl 112(%esi),%eax
xorl 116(%esi),%ecx
xorl 120(%esi),%ebx
xorl 124(%esi),%edi
movl %eax,112(%edx)
movl %ecx,116(%edx)
movl %ebx,120(%edx)
movl %edi,124(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
xorl 176(%esi),%eax
xorl 180(%esi),%ecx
xorl 184(%esi),%ebx
xorl 188(%esi),%edi
movl %eax,176(%edx)
movl %ecx,180(%edx)
movl %ebx,184(%edx)
movl %edi,188(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
xorl 240(%esi),%eax
xorl 244(%esi),%ecx
xorl 248(%esi),%ebx
xorl 252(%esi),%edi
movl %eax,240(%edx)
movl %ecx,244(%edx)
movl %ebx,248(%edx)
movl %edi,252(%edx)
addl $256,%esi
jmp chacha_blocks_ssse3_mainloop1_cont
chacha_blocks_ssse3_noinput1:
movdqa 672(%esp),%xmm0
movdqa 592(%esp),%xmm1
movdqa 640(%esp),%xmm2
movdqa 544(%esp),%xmm3
paddd 224(%esp),%xmm0
paddd 240(%esp),%xmm1
paddd 256(%esp),%xmm2
paddd 272(%esp),%xmm3
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
movl %eax,0(%edx)
movl %ecx,4(%edx)
movl %ebx,8(%edx)
movl %edi,12(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
movl %eax,64(%edx)
movl %ecx,68(%edx)
movl %ebx,72(%edx)
movl %edi,76(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
movl %eax,128(%edx)
movl %ecx,132(%edx)
movl %ebx,136(%edx)
movl %edi,140(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
movl %eax,192(%edx)
movl %ecx,196(%edx)
movl %ebx,200(%edx)
movl %edi,204(%edx)
movdqa 688(%esp),%xmm0
movdqa 480(%esp),%xmm1
movdqa 560(%esp),%xmm2
movdqa 608(%esp),%xmm3
paddd 288(%esp),%xmm0
paddd 304(%esp),%xmm1
paddd 320(%esp),%xmm2
paddd 336(%esp),%xmm3
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
movl %eax,16(%edx)
movl %ecx,20(%edx)
movl %ebx,24(%edx)
movl %edi,28(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
movl %eax,80(%edx)
movl %ecx,84(%edx)
movl %ebx,88(%edx)
movl %edi,92(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
movl %eax,144(%edx)
movl %ecx,148(%edx)
movl %ebx,152(%edx)
movl %edi,156(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
movl %eax,208(%edx)
movl %ecx,212(%edx)
movl %ebx,216(%edx)
movl %edi,220(%edx)
movdqa 704(%esp),%xmm0
movdqa 656(%esp),%xmm1
movdqa 496(%esp),%xmm2
movdqa 576(%esp),%xmm3
paddd 352(%esp),%xmm0
paddd 368(%esp),%xmm1
paddd 384(%esp),%xmm2
paddd 400(%esp),%xmm3
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
movl %eax,32(%edx)
movl %ecx,36(%edx)
movl %ebx,40(%edx)
movl %edi,44(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
movl %eax,96(%edx)
movl %ecx,100(%edx)
movl %ebx,104(%edx)
movl %edi,108(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
movl %eax,160(%edx)
movl %ecx,164(%edx)
movl %ebx,168(%edx)
movl %edi,172(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
movl %eax,224(%edx)
movl %ecx,228(%edx)
movl %ebx,232(%edx)
movl %edi,236(%edx)
movdqa 720(%esp),%xmm0
movdqa 624(%esp),%xmm1
movdqa 528(%esp),%xmm2
movdqa 512(%esp),%xmm3
paddd 448(%esp),%xmm0
paddd 464(%esp),%xmm1
paddd 416(%esp),%xmm2
paddd 432(%esp),%xmm3
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
movl %eax,48(%edx)
movl %ecx,52(%edx)
movl %ebx,56(%edx)
movl %edi,60(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
movl %eax,112(%edx)
movl %ecx,116(%edx)
movl %ebx,120(%edx)
movl %edi,124(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
pshufd $0x39,%xmm0,%xmm0
pshufd $0x39,%xmm1,%xmm1
pshufd $0x39,%xmm2,%xmm2
pshufd $0x39,%xmm3,%xmm3
movl %eax,176(%edx)
movl %ecx,180(%edx)
movl %ebx,184(%edx)
movl %edi,188(%edx)
movd %xmm0,%eax
movd %xmm1,%ecx
movd %xmm2,%ebx
movd %xmm3,%edi
movl %eax,240(%edx)
movl %ecx,244(%edx)
movl %ebx,248(%edx)
movl %edi,252(%edx)
chacha_blocks_ssse3_mainloop1_cont:
movl 92(%esp),%eax
subl $256,%eax
addl $256,%edx
cmpl $256,%eax
jae chacha_blocks_ssse3_bytesatleast256
cmpl $0,%eax
jbe chacha_blocks_ssse3_done
chacha_blocks_ssse3_bytesbetween1and255:
cmpl $64,%eax
jae chacha_blocks_ssse3_nocopy
movl %edx,92(%esp)
cmpl $0,%esi
jbe chacha_blocks_ssse3_noinput2
leal 0(%esp),%edi
movl %eax,%ecx
rep movsb
leal 0(%esp),%esi
chacha_blocks_ssse3_noinput2:
leal 0(%esp),%edx
chacha_blocks_ssse3_nocopy:
movl %eax,96(%esp)
movdqa 128(%esp),%xmm0
movdqa 144(%esp),%xmm1
movdqa 160(%esp),%xmm2
movdqa 176(%esp),%xmm3
movdqa 192(%esp),%xmm4
movdqa 208(%esp),%xmm5
movl 88(%esp),%eax
chacha_blocks_ssse3_mainloop2:
paddd %xmm3,%xmm2
pxor %xmm2,%xmm5
pshufb %xmm0,%xmm5
paddd %xmm5,%xmm4
pxor %xmm4,%xmm3
movdqa %xmm3,%xmm6
pslld $12,%xmm3
psrld $20,%xmm6
pxor %xmm6,%xmm3
paddd %xmm3,%xmm2
pxor %xmm2,%xmm5
pshufb %xmm1,%xmm5
pshufd $0x93,%xmm2,%xmm2
paddd %xmm5,%xmm4
pshufd $0x4e,%xmm5,%xmm5
pxor %xmm4,%xmm3
pshufd $0x39,%xmm4,%xmm4
movdqa %xmm3,%xmm6
pslld $7,%xmm3
psrld $25,%xmm6
pxor %xmm6,%xmm3
subl $2,%eax
paddd %xmm3,%xmm2
pxor %xmm2,%xmm5
pshufb %xmm0,%xmm5
paddd %xmm5,%xmm4
pxor %xmm4,%xmm3
movdqa %xmm3,%xmm6
pslld $12,%xmm3
psrld $20,%xmm6
pxor %xmm6,%xmm3
paddd %xmm3,%xmm2
pxor %xmm2,%xmm5
pshufb %xmm1,%xmm5
pshufd $0x39,%xmm2,%xmm2
paddd %xmm5,%xmm4
pshufd $0x4e,%xmm5,%xmm5
pxor %xmm4,%xmm3
pshufd $0x93,%xmm4,%xmm4
movdqa %xmm3,%xmm6
pslld $7,%xmm3
psrld $25,%xmm6
pxor %xmm6,%xmm3
ja chacha_blocks_ssse3_mainloop2
paddd 160(%esp),%xmm2
paddd 176(%esp),%xmm3
paddd 192(%esp),%xmm4
paddd 208(%esp),%xmm5
cmpl $0,%esi
jbe chacha_blocks_ssse3_noinput3
movdqu 0(%esi),%xmm0
movdqu 16(%esi),%xmm1
movdqu 32(%esi),%xmm6
movdqu 48(%esi),%xmm7
pxor %xmm0,%xmm2
pxor %xmm1,%xmm3
pxor %xmm6,%xmm4
pxor %xmm7,%xmm5
addl $64,%esi
chacha_blocks_ssse3_noinput3:
movdqu %xmm2,0(%edx)
movdqu %xmm3,16(%edx)
movdqu %xmm4,32(%edx)
movdqu %xmm5,48(%edx)
movl 96(%esp),%eax
movl 208(%esp),%ecx
movl 4+208(%esp),%ebx
addl $1,%ecx
adcl $0,%ebx
movl %ecx,208(%esp)
movl %ebx,4+208(%esp)
cmpl $64,%eax
ja chacha_blocks_ssse3_bytesatleast65
jae chacha_blocks_ssse3_bytesatleast64
movl %edx,%esi
movl 92(%esp),%edi
movl %eax,%ecx
rep movsb
chacha_blocks_ssse3_bytesatleast64:
chacha_blocks_ssse3_done:
movl 84(%esp),%eax
movdqa 208(%esp),%xmm0
movdqu %xmm0,32(%eax)
movl 64(%esp),%eax
movl 68(%esp),%ebx
movl 72(%esp),%esi
movl 76(%esp),%edi
movl 80(%esp),%ebp
addl %eax,%esp
ret
chacha_blocks_ssse3_bytesatleast65:
subl $64,%eax
addl $64,%edx
jmp chacha_blocks_ssse3_bytesbetween1and255
ENDFN(chacha_blocks)



FN(hchacha)
hchacha_ssse3_local:
LOAD_GOTREG(%eax)
movdqa REF_GOTVAR(C+0, %eax), %xmm0
movdqa REF_GOTVAR(C+16, %eax), %xmm5
movdqa REF_GOTVAR(C+32, %eax), %xmm6
movl 4(%esp), %eax
movl 8(%esp), %edx
movdqu 0(%eax), %xmm1
movdqu 16(%eax), %xmm2
movdqu 0(%edx), %xmm3
movl 12(%esp), %edx
movl 16(%esp), %ecx
hchacha_ssse3_mainloop: 
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshufb %xmm5, %xmm3
paddd %xmm3, %xmm2
pxor %xmm2, %xmm1
movdqa %xmm1,%xmm4
pslld $12, %xmm1
psrld $20, %xmm4
pxor %xmm4, %xmm1
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshufb %xmm6, %xmm3
pshufd $0x93,%xmm0,%xmm0
paddd %xmm3, %xmm2
pshufd $0x4e,%xmm3,%xmm3
pxor %xmm2, %xmm1
pshufd $0x39,%xmm2,%xmm2
movdqa %xmm1,%xmm4
pslld $7, %xmm1
psrld $25, %xmm4
pxor %xmm4, %xmm1
subl $2, %ecx
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshufb %xmm5, %xmm3
paddd %xmm3, %xmm2
pxor %xmm2, %xmm1
movdqa %xmm1,%xmm4
pslld $12, %xmm1
psrld $20, %xmm4
pxor %xmm4, %xmm1
paddd %xmm1, %xmm0
pxor %xmm0, %xmm3
pshufb %xmm6, %xmm3
pshufd $0x39,%xmm0,%xmm0
paddd %xmm3, %xmm2
pshufd $0x4e,%xmm3,%xmm3
pxor %xmm2, %xmm1
pshufd $0x93,%xmm2,%xmm2
movdqa %xmm1,%xmm4
pslld $7, %xmm1
psrld $25, %xmm4
pxor %xmm4, %xmm1
ja hchacha_ssse3_mainloop
movdqu %xmm0, 0(%edx)
movdqu %xmm3, 16(%edx)
ret
ENDFN(hchacha)

FN(chacha)
pushl %ebp
pushl %ebx
movl %esp, %ebp
subl $64, %esp
andl $~63, %esp
movl %esp, %ebx
movl 12(%ebp), %ecx
xorl %edx, %edx
movdqu 0(%ecx), %xmm0
movdqu 16(%ecx), %xmm1
movdqa %xmm0, 0(%ebx)
movdqa %xmm1, 16(%ebx)
movl 16(%ebp), %ecx
movl %edx, 32(%ebx)
movl %edx, 36(%ebx)
movl 0(%ecx), %eax
movl 4(%ecx), %edx
movl %eax, 40(%ebx)
movl %edx, 44(%ebx)
movl 32(%ebp), %eax
movl %eax, 48(%ebx)
pushl 28(%ebp)
pushl 24(%ebp)
pushl 20(%ebp)
pushl %ebx
call chacha_blocks_ssse3_local
pxor %xmm0, %xmm0
movdqa %xmm0, 0(%ebx)
movdqa %xmm0, 16(%ebx)
movdqa %xmm0, 32(%ebx)
movl %ebp, %esp
popl %ebx
popl %ebp
ret
ENDFN(chacha)

FN(xchacha)
pushl %ebp
pushl %ebx
movl %esp, %ebp
subl $64, %esp
andl $~63, %esp
movl %esp, %ebx
pushl 32(%ebp)
pushl %ebx
pushl 16(%ebp)
pushl 12(%ebp)
call hchacha_ssse3_local
xorl %edx, %edx
movl 16(%ebp), %ecx
movl 32(%ebx), %edx
movl 36(%ebx), %edx
movl 16(%ecx), %eax
movl %eax, 40(%ebx)
movl 20(%ecx), %eax
movl %eax, 44(%ebx)
movl 32(%ebp), %eax
movl %eax, 48(%ebx)
pushl 28(%ebp)
pushl 24(%ebp)
pushl 20(%ebp)
pushl %ebx
call chacha_blocks_ssse3_local
pxor %xmm0, %xmm0
movdqa %xmm0, 0(%ebx)
movdqa %xmm0, 16(%ebx)
movdqa %xmm0, 32(%ebx)
movl %ebp, %esp
popl %ebx
popl %ebp
ret
ENDFN(xchacha)

.section .rodata, "a"
.p2align 6,,63;
C:
.long 0x61707865,0x3320646e,0x79622d32,0x6b206574 /* "expand 32-byte k" */
.byte 2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13       /* pshufb rotate by 16 */
.byte 3,0,1,2,7,4,5,6,11,8,9,10,15,12,13,14       /* pshufb rotate by 8 */

ENDFILE()
