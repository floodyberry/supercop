	.file	"mrcomba.c"
	.text
	.p2align 4,,15
.globl comba_negate
	.type	comba_negate, @function
comba_negate:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	8(%ebp), %esi
	movl	mr_mip, %eax
	cmpl	%esi, 12(%ebp)
	movl	316(%eax), %ebx
	je	.L9
	movl	12(%ebp), %edx
	movl	(%edx), %eax
	andl	$2147483647, %eax
	cmpl	$5, %eax
	jbe	.L10
	movl	12(%ebp), %edi
	movl	$5, %edx
	movl	4(%edi), %ecx
	.p2align 4,,7
.L5:
	movl	12(%ebp), %edi
	movl	$0, (%ecx,%edx,4)
	addl	$1, %edx
	movl	(%edi), %eax
	andl	$2147483647, %eax
	cmpl	%edx, %eax
	ja	.L5
.L2:
	movl	4(%ebx), %eax
	movl	%eax, -16(%ebp)
	movl	4(%esi), %eax
	movl	%ecx, -24(%ebp)
	movl	%eax, -20(%ebp)
#APP
	pushl %esi
pushl %edi
movl -16(%ebp),%esi
movl -20(%ebp),%ebx
movl -24(%ebp),%edi
movl (%esi),%eax
subl (%ebx),%eax
movl %eax,(%edi)
movl 4*1(%esi),%eax
sbbl 4*1(%ebx),%eax
movl %eax,4*1(%edi)
movl 4*2(%esi),%eax
sbbl 4*2(%ebx),%eax
movl %eax,4*2(%edi)
movl 4*3(%esi),%eax
sbbl 4*3(%ebx),%eax
movl %eax,4*3(%edi)
movl 4*4(%esi),%eax
sbbl 4*4(%ebx),%eax
movl %eax,4*4(%edi)
movl $0,%eax
adcl %eax,%eax
movl %eax,-28(%ebp)
popl %edi
popl %esi

#NO_APP
	movl	12(%ebp), %edi
	movl	4(%edi), %eax
	movl	$5, (%edi)
	movl	16(%eax), %eax
	testl	%eax, %eax
	jne	.L8
	movl	%edi, (%esp)
	call	mr_lzero
.L8:
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L9:
	movl	12(%ebp), %eax
	movl	4(%eax), %ecx
	jmp	.L2
.L10:
	movl	12(%ebp), %edx
	movl	4(%edx), %ecx
	jmp	.L2
	.size	comba_negate, .-comba_negate
	.p2align 4,,15
.globl comba_double_sub
	.type	comba_double_sub, @function
comba_double_sub:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	mr_mip, %eax
	movl	8(%ebp), %ebx
	cmpl	16(%ebp), %ebx
	movl	12(%ebp), %esi
	movl	316(%eax), %eax
	movl	%eax, -32(%ebp)
	je	.L23
	cmpl	%esi, 16(%ebp)
	je	.L24
	movl	16(%ebp), %edx
	movl	(%edx), %eax
	andl	$2147483647, %eax
	cmpl	$10, %eax
	jbe	.L25
	movl	16(%ebp), %edi
	movl	$10, %edx
	movl	4(%edi), %ecx
	.p2align 4,,7
.L17:
	movl	16(%ebp), %edi
	movl	$0, (%ecx,%edx,4)
	addl	$1, %edx
	movl	(%edi), %eax
	andl	$2147483647, %eax
	cmpl	%edx, %eax
	ja	.L17
.L14:
	movl	4(%ebx), %eax
	movl	%eax, -16(%ebp)
	movl	4(%esi), %eax
	movl	%ecx, -24(%ebp)
	movl	%eax, -20(%ebp)
#APP
	pushl %esi
pushl %edi
movl -16(%ebp),%esi
movl -20(%ebp),%ebx
movl -24(%ebp),%edi
movl (%esi),%eax
subl (%ebx),%eax
movl %eax,(%edi)
movl 4*1(%esi),%eax
sbbl 4*1(%ebx),%eax
movl %eax,4*1(%edi)
movl 4*2(%esi),%eax
sbbl 4*2(%ebx),%eax
movl %eax,4*2(%edi)
movl 4*3(%esi),%eax
sbbl 4*3(%ebx),%eax
movl %eax,4*3(%edi)
movl 4*4(%esi),%eax
sbbl 4*4(%ebx),%eax
movl %eax,4*4(%edi)
movl 4*5(%esi),%eax
sbbl 4*5(%ebx),%eax
movl %eax,4*5(%edi)
movl 4*6(%esi),%eax
sbbl 4*6(%ebx),%eax
movl %eax,4*6(%edi)
movl 4*7(%esi),%eax
sbbl 4*7(%ebx),%eax
movl %eax,4*7(%edi)
movl 4*8(%esi),%eax
sbbl 4*8(%ebx),%eax
movl %eax,4*8(%edi)
movl 4*9(%esi),%eax
sbbl 4*9(%ebx),%eax
movl %eax,4*9(%edi)
movl $0,%eax
adcl %eax,%eax
movl %eax,-28(%ebp)
popl %edi
popl %esi

#NO_APP
	movl	-28(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L18
	movl	16(%ebp), %edx
	movl	-32(%ebp), %edi
	movl	4(%edx), %eax
	addl	$20, %eax
	movl	%eax, -16(%ebp)
	movl	4(%edi), %eax
	movl	%eax, -20(%ebp)
#APP
	pushl %edi
movl -16(%ebp),%edi
movl -20(%ebp),%ebx
movl (%ebx),%eax
addl %eax,(%edi)
movl 4*1(%ebx),%eax
adcl %eax,4*1(%edi)
movl 4*2(%ebx),%eax
adcl %eax,4*2(%edi)
movl 4*3(%ebx),%eax
adcl %eax,4*3(%edi)
movl 4*4(%ebx),%eax
adcl %eax,4*4(%edi)
movl $0,%eax
adcl %eax,%eax
movl %eax,-28(%ebp)
popl %edi

#NO_APP
.L18:
	movl	16(%ebp), %eax
	movl	$10, (%eax)
	movl	%eax, %edx
	movl	4(%eax), %eax
	movl	36(%eax), %ecx
	testl	%ecx, %ecx
	jne	.L22
	movl	%edx, (%esp)
	call	mr_lzero
.L22:
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L23:
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	jmp	.L14
.L24:
	movl	16(%ebp), %edx
	movl	4(%edx), %ecx
	jmp	.L14
.L25:
	movl	16(%ebp), %edi
	movl	4(%edi), %ecx
	jmp	.L14
	.size	comba_double_sub, .-comba_double_sub
	.p2align 4,,15
.globl comba_sub
	.type	comba_sub, @function
comba_sub:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	mr_mip, %eax
	movl	8(%ebp), %ebx
	cmpl	16(%ebp), %ebx
	movl	12(%ebp), %esi
	movl	316(%eax), %eax
	movl	%eax, -32(%ebp)
	je	.L37
	cmpl	%esi, 16(%ebp)
	je	.L38
	movl	16(%ebp), %edx
	movl	(%edx), %eax
	andl	$2147483647, %eax
	cmpl	$5, %eax
	jbe	.L39
	movl	16(%ebp), %edi
	movl	$5, %edx
	movl	4(%edi), %ecx
	.p2align 4,,7
.L31:
	movl	16(%ebp), %edi
	movl	$0, (%ecx,%edx,4)
	addl	$1, %edx
	movl	(%edi), %eax
	andl	$2147483647, %eax
	cmpl	%edx, %eax
	ja	.L31
.L28:
	movl	4(%ebx), %eax
	movl	%eax, -16(%ebp)
	movl	4(%esi), %eax
	movl	%ecx, -24(%ebp)
	movl	%eax, -20(%ebp)
#APP
	pushl %esi
pushl %edi
movl -16(%ebp),%esi
movl -20(%ebp),%ebx
movl -24(%ebp),%edi
movl (%esi),%eax
subl (%ebx),%eax
movl %eax,(%edi)
movl 4*1(%esi),%eax
sbbl 4*1(%ebx),%eax
movl %eax,4*1(%edi)
movl 4*2(%esi),%eax
sbbl 4*2(%ebx),%eax
movl %eax,4*2(%edi)
movl 4*3(%esi),%eax
sbbl 4*3(%ebx),%eax
movl %eax,4*3(%edi)
movl 4*4(%esi),%eax
sbbl 4*4(%ebx),%eax
movl %eax,4*4(%edi)
movl $0,%eax
adcl %eax,%eax
movl %eax,-28(%ebp)
popl %edi
popl %esi

#NO_APP
	movl	-28(%ebp), %edi
	testl	%edi, %edi
	je	.L32
	movl	16(%ebp), %edx
	movl	-32(%ebp), %edi
	movl	4(%edx), %eax
	movl	%eax, -16(%ebp)
	movl	4(%edi), %eax
	movl	%eax, -20(%ebp)
#APP
	pushl %edi
movl -16(%ebp),%edi
movl -20(%ebp),%ebx
movl (%ebx),%eax
addl %eax,(%edi)
movl 4*1(%ebx),%eax
adcl %eax,4*1(%edi)
movl 4*2(%ebx),%eax
adcl %eax,4*2(%edi)
movl 4*3(%ebx),%eax
adcl %eax,4*3(%edi)
movl 4*4(%ebx),%eax
adcl %eax,4*4(%edi)
movl $0,%eax
adcl %eax,%eax
movl %eax,-28(%ebp)
popl %edi

#NO_APP
.L32:
	movl	16(%ebp), %eax
	movl	$5, (%eax)
	movl	%eax, %edx
	movl	4(%eax), %eax
	movl	16(%eax), %esi
	testl	%esi, %esi
	jne	.L36
	movl	%edx, (%esp)
	call	mr_lzero
.L36:
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L37:
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	jmp	.L28
.L38:
	movl	16(%ebp), %edx
	movl	4(%edx), %ecx
	jmp	.L28
.L39:
	movl	16(%ebp), %edi
	movl	4(%edi), %ecx
	jmp	.L28
	.size	comba_sub, .-comba_sub
	.p2align 4,,15
.globl comba_square
	.type	comba_square, @function
comba_square:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	12(%ebp), %edx
	movl	(%edx), %eax
	andl	$2147483647, %eax
	cmpl	$10, %eax
	jle	.L48
	movl	12(%ebp), %ebx
	movl	$10, %edx
	movl	4(%ebx), %ecx
	.p2align 4,,7
.L44:
	movl	12(%ebp), %ebx
	movl	$0, (%ecx,%edx,4)
	addl	$1, %edx
	movl	(%ebx), %eax
	andl	$2147483647, %eax
	cmpl	%edx, %eax
	jg	.L44
.L42:
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	4(%eax), %eax
	movl	$10, (%edx)
	movl	%ecx, -20(%ebp)
	movl	%eax, -16(%ebp)
#APP
	pushl %edi
pushl %esi
movl -16(%ebp),%ebx
movl -20(%ebp),%esi
pxor %xmm0,%xmm0
movd 4*0(%ebx),%xmm1
pmuludq %xmm1,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*0(%esi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*0(%ebx),%xmm1
movd 4*1(%ebx),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
paddq %xmm1,%xmm0
movd %xmm0,4*1(%esi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*0(%ebx),%xmm1
movd 4*2(%ebx),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
paddq %xmm1,%xmm0
movd 4*1(%ebx),%xmm1
pmuludq %xmm1,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*2(%esi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*0(%ebx),%xmm1
movd 4*3(%ebx),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
paddq %xmm1,%xmm0
movd 4*1(%ebx),%xmm1
movd 4*2(%ebx),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
paddq %xmm1,%xmm0
movd %xmm0,4*3(%esi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*0(%ebx),%xmm1
movd 4*4(%ebx),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
paddq %xmm1,%xmm0
movd 4*1(%ebx),%xmm1
movd 4*3(%ebx),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
paddq %xmm1,%xmm0
movd 4*2(%ebx),%xmm1
pmuludq %xmm1,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*4(%esi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*1(%ebx),%xmm1
movd 4*4(%ebx),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
paddq %xmm1,%xmm0
movd 4*2(%ebx),%xmm1
movd 4*3(%ebx),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
paddq %xmm1,%xmm0
movd %xmm0,4*5(%esi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*2(%ebx),%xmm1
movd 4*4(%ebx),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
paddq %xmm1,%xmm0
movd 4*3(%ebx),%xmm1
pmuludq %xmm1,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*6(%esi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*3(%ebx),%xmm1
movd 4*4(%ebx),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
paddq %xmm1,%xmm0
movd %xmm0,4*7(%esi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*4(%ebx),%xmm1
pmuludq %xmm1,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*8(%esi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd %xmm0,4*9(%esi)
popl %esi
popl %edi

#NO_APP
	movl	4(%edx), %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	jne	.L47
	movl	%edx, (%esp)
	call	mr_lzero
.L47:
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L48:
	movl	12(%ebp), %eax
	movl	4(%eax), %ecx
	jmp	.L42
	.size	comba_square, .-comba_square
	.p2align 4,,15
.globl comba_mult
	.type	comba_mult, @function
comba_mult:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	16(%ebp), %edx
	movl	(%edx), %eax
	andl	$2147483647, %eax
	cmpl	$10, %eax
	jle	.L57
	movl	16(%ebp), %ebx
	movl	$10, %edx
	movl	4(%ebx), %ecx
	.p2align 4,,7
.L53:
	movl	16(%ebp), %ebx
	movl	$0, (%ecx,%edx,4)
	addl	$1, %edx
	movl	(%ebx), %eax
	andl	$2147483647, %eax
	cmpl	%edx, %eax
	jg	.L53
.L51:
	movl	8(%ebp), %eax
	movl	16(%ebp), %edx
	movl	4(%eax), %eax
	movl	$10, (%edx)
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%ecx, -24(%ebp)
	movl	%eax, -20(%ebp)
#APP
	pushl %edi
pushl %esi
movl -16(%ebp),%ebx
movl -20(%ebp),%esi
movl -24(%ebp),%edi
pxor %xmm0,%xmm0
movd 4*0(%ebx),%xmm1
movd 4*0(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*0(%edi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*0(%ebx),%xmm1
movd 4*1(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*1(%ebx),%xmm1
movd 4*0(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*1(%edi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*0(%ebx),%xmm1
movd 4*2(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*1(%ebx),%xmm1
movd 4*1(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*2(%ebx),%xmm1
movd 4*0(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*2(%edi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*0(%ebx),%xmm1
movd 4*3(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*1(%ebx),%xmm1
movd 4*2(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*2(%ebx),%xmm1
movd 4*1(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*3(%ebx),%xmm1
movd 4*0(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*3(%edi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*0(%ebx),%xmm1
movd 4*4(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*1(%ebx),%xmm1
movd 4*3(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*2(%ebx),%xmm1
movd 4*2(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*3(%ebx),%xmm1
movd 4*1(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*4(%ebx),%xmm1
movd 4*0(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*4(%edi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*1(%ebx),%xmm1
movd 4*4(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*2(%ebx),%xmm1
movd 4*3(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*3(%ebx),%xmm1
movd 4*2(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*4(%ebx),%xmm1
movd 4*1(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*5(%edi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*2(%ebx),%xmm1
movd 4*4(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*3(%ebx),%xmm1
movd 4*3(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*4(%ebx),%xmm1
movd 4*2(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*6(%edi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*3(%ebx),%xmm1
movd 4*4(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*4(%ebx),%xmm1
movd 4*3(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*7(%edi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*4(%ebx),%xmm1
movd 4*4(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*8(%edi)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd %xmm0,4*9(%edi)
popl %esi
popl %edi

#NO_APP
	movl	4(%edx), %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	jne	.L56
	movl	%edx, (%esp)
	call	mr_lzero
.L56:
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L57:
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	jmp	.L51
	.size	comba_mult, .-comba_mult
	.p2align 4,,15
.globl comba_double_add
	.type	comba_double_add, @function
comba_double_add:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	mr_mip, %eax
	movl	8(%ebp), %ebx
	cmpl	%ebx, 16(%ebp)
	movl	12(%ebp), %esi
	movl	320(%eax), %eax
	movl	%eax, -32(%ebp)
	je	.L72
	cmpl	%esi, 16(%ebp)
	je	.L73
	movl	16(%ebp), %edx
	movl	(%edx), %eax
	andl	$2147483647, %eax
	cmpl	$10, %eax
	jbe	.L74
	movl	16(%ebp), %edi
	movl	$10, %edx
	movl	4(%edi), %ecx
	.p2align 4,,7
.L63:
	movl	16(%ebp), %edi
	movl	$0, (%ecx,%edx,4)
	addl	$1, %edx
	movl	(%edi), %eax
	andl	$2147483647, %eax
	cmpl	%edx, %eax
	ja	.L63
.L60:
	movl	4(%ebx), %eax
	movl	%eax, -16(%ebp)
	movl	4(%esi), %eax
	movl	%ecx, -24(%ebp)
	movl	%eax, -20(%ebp)
#APP
	pushl %esi
pushl %edi
movl -16(%ebp),%esi
movl -20(%ebp),%ebx
movl -24(%ebp),%edi
movl (%esi),%eax
addl (%ebx),%eax
movl %eax,(%edi)
movl 4*1(%esi),%eax
adcl 4*1(%ebx),%eax
movl %eax,4*1(%edi)
movl 4*2(%esi),%eax
adcl 4*2(%ebx),%eax
movl %eax,4*2(%edi)
movl 4*3(%esi),%eax
adcl 4*3(%ebx),%eax
movl %eax,4*3(%edi)
movl 4*4(%esi),%eax
adcl 4*4(%ebx),%eax
movl %eax,4*4(%edi)
movl 4*5(%esi),%eax
adcl 4*5(%ebx),%eax
movl %eax,4*5(%edi)
movl 4*6(%esi),%eax
adcl 4*6(%ebx),%eax
movl %eax,4*6(%edi)
movl 4*7(%esi),%eax
adcl 4*7(%ebx),%eax
movl %eax,4*7(%edi)
movl 4*8(%esi),%eax
adcl 4*8(%ebx),%eax
movl %eax,4*8(%edi)
movl 4*9(%esi),%eax
adcl 4*9(%ebx),%eax
movl %eax,4*9(%edi)
movl $0,%eax
adcl %eax,%eax
movl %eax,-28(%ebp)
popl %edi
popl %esi

#NO_APP
	movl	-28(%ebp), %edx
	movl	16(%ebp), %eax
	testl	%edx, %edx
	movl	$10, (%eax)
	jne	.L64
	movl	-32(%ebp), %edx
	movl	4(%eax), %ecx
	movl	4(%edx), %eax
	movl	36(%eax), %eax
	cmpl	%eax, 36(%ecx)
	jbe	.L77
	.p2align 4,,7
.L64:
	movl	16(%ebp), %edx
	movl	-32(%ebp), %edi
	movl	4(%edx), %eax
	addl	$20, %eax
	movl	%eax, -16(%ebp)
	movl	4(%edi), %eax
	addl	$20, %eax
	movl	%eax, -20(%ebp)
#APP
	pushl %edi
movl -16(%ebp),%edi
movl -20(%ebp),%ebx
movl (%ebx),%eax
subl %eax,(%edi)
movl 4*1(%ebx),%eax
sbbl %eax,4*1(%edi)
movl 4*2(%ebx),%eax
sbbl %eax,4*2(%edi)
movl 4*3(%ebx),%eax
sbbl %eax,4*3(%edi)
movl 4*4(%ebx),%eax
sbbl %eax,4*4(%edi)
movl $0,%eax
adcl %eax,%eax
movl %eax,-28(%ebp)
popl %edi

#NO_APP
	movl	4(%edx), %ecx
.L67:
	movl	36(%ecx), %eax
	testl	%eax, %eax
	jne	.L71
	movl	16(%ebp), %edx
	movl	%edx, (%esp)
	call	mr_lzero
.L71:
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L77:
	jne	.L67
	movl	16(%ebp), %edi
	movl	%edx, 4(%esp)
	movl	%edi, (%esp)
	call	compare
	testl	%eax, %eax
	jns	.L64
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	jmp	.L67
	.p2align 4,,7
.L72:
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	jmp	.L60
.L73:
	movl	16(%ebp), %edx
	movl	4(%edx), %ecx
	jmp	.L60
.L74:
	movl	16(%ebp), %edi
	movl	4(%edi), %ecx
	jmp	.L60
	.size	comba_double_add, .-comba_double_add
	.p2align 4,,15
.globl comba_add
	.type	comba_add, @function
comba_add:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	mr_mip, %eax
	movl	8(%ebp), %ebx
	cmpl	%ebx, 16(%ebp)
	movl	12(%ebp), %esi
	movl	316(%eax), %eax
	movl	%eax, -32(%ebp)
	je	.L91
	cmpl	%esi, 16(%ebp)
	je	.L92
	movl	16(%ebp), %edx
	movl	(%edx), %eax
	andl	$2147483647, %eax
	cmpl	$5, %eax
	jbe	.L93
	movl	16(%ebp), %edi
	movl	$5, %edx
	movl	4(%edi), %ecx
	.p2align 4,,7
.L82:
	movl	16(%ebp), %edi
	movl	$0, (%ecx,%edx,4)
	addl	$1, %edx
	movl	(%edi), %eax
	andl	$2147483647, %eax
	cmpl	%edx, %eax
	ja	.L82
.L79:
	movl	4(%ebx), %eax
	movl	%eax, -16(%ebp)
	movl	4(%esi), %eax
	movl	%ecx, -24(%ebp)
	movl	%eax, -20(%ebp)
#APP
	pushl %esi
pushl %edi
movl -16(%ebp),%esi
movl -20(%ebp),%ebx
movl -24(%ebp),%edi
movl (%esi),%eax
addl (%ebx),%eax
movl %eax,(%edi)
movl 4*1(%esi),%eax
adcl 4*1(%ebx),%eax
movl %eax,4*1(%edi)
movl 4*2(%esi),%eax
adcl 4*2(%ebx),%eax
movl %eax,4*2(%edi)
movl 4*3(%esi),%eax
adcl 4*3(%ebx),%eax
movl %eax,4*3(%edi)
movl 4*4(%esi),%eax
adcl 4*4(%ebx),%eax
movl %eax,4*4(%edi)
movl $0,%eax
adcl %eax,%eax
movl %eax,-28(%ebp)
popl %edi
popl %esi

#NO_APP
	movl	-28(%ebp), %ebx
	movl	16(%ebp), %eax
	testl	%ebx, %ebx
	movl	$5, (%eax)
	jne	.L94
	movl	-32(%ebp), %edx
	movl	4(%eax), %ecx
	movl	4(%edx), %eax
	movl	16(%eax), %eax
	cmpl	%eax, 16(%ecx)
	jbe	.L97
	.p2align 4,,7
.L83:
	movl	-32(%ebp), %edx
	movl	%ecx, -16(%ebp)
	movl	4(%edx), %eax
	movl	%eax, -20(%ebp)
#APP
	pushl %edi
movl -16(%ebp),%edi
movl -20(%ebp),%ebx
movl (%ebx),%eax
subl %eax,(%edi)
movl 4*1(%ebx),%eax
sbbl %eax,4*1(%edi)
movl 4*2(%ebx),%eax
sbbl %eax,4*2(%edi)
movl 4*3(%ebx),%eax
sbbl %eax,4*3(%edi)
movl 4*4(%ebx),%eax
sbbl %eax,4*4(%edi)
movl $0,%eax
adcl %eax,%eax
movl %eax,-28(%ebp)
popl %edi

#NO_APP
	movl	16(%ebp), %edi
	movl	4(%edi), %ecx
.L86:
	movl	16(%ecx), %ecx
	testl	%ecx, %ecx
	jne	.L90
	movl	16(%ebp), %edx
	movl	%edx, (%esp)
	call	mr_lzero
.L90:
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L94:
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	jmp	.L83
.L97:
	.p2align 4,,2
	jne	.L86
	movl	16(%ebp), %edi
	movl	%edx, 4(%esp)
	movl	%edi, (%esp)
	call	compare
	testl	%eax, %eax
	js	.L95
	movl	4(%edi), %ecx
	jmp	.L83
.L91:
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	.p2align 4,,3
	jmp	.L79
.L92:
	movl	16(%ebp), %edx
	movl	4(%edx), %ecx
	jmp	.L79
.L93:
	movl	16(%ebp), %edi
	movl	4(%edi), %ecx
	jmp	.L79
.L95:
	movl	16(%ebp), %eax
	movl	4(%eax), %ecx
	jmp	.L86
	.size	comba_add, .-comba_add
	.p2align 4,,15
.globl comba_redc
	.type	comba_redc, @function
comba_redc:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	movl	mr_mip, %eax
	movl	8(%ebp), %ecx
	movl	316(%eax), %edx
	movl	%edx, -32(%ebp)
	movl	312(%eax), %edx
	movl	464(%eax), %eax
	movl	%edx, -16(%ebp)
	cmpl	%ecx, %eax
	movl	%eax, -36(%ebp)
	je	.L99
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	copy
.L99:
	movl	-36(%ebp), %ebx
	movl	-32(%ebp), %edx
	movl	4(%ebx), %eax
	movl	$11, (%ebx)
	movl	%eax, -24(%ebp)
	movl	4(%edx), %eax
	movl	%eax, -28(%ebp)
#APP
	pushl %edi
pushl %esi
movl -24(%ebp),%ebx
movl -28(%ebp),%esi
movd -16(%ebp),%xmm6
movd (%ebx),%xmm0
movq %xmm0,%xmm7
pmuludq %xmm6,%xmm7
movd %xmm7,4*0(%ebx)
movd (%esi),%xmm1
pmuludq %xmm7,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*(0+1)(%ebx),%xmm1
paddq %xmm1,%xmm0
movd 4*0(%ebx),%xmm1
movd 4*1(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movq %xmm0,%xmm7
pmuludq %xmm6,%xmm7
movd %xmm7,4*1(%ebx)
movd (%esi),%xmm1
pmuludq %xmm7,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*(1+1)(%ebx),%xmm1
paddq %xmm1,%xmm0
movd 4*0(%ebx),%xmm1
movd 4*2(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*1(%ebx),%xmm1
movd 4*1(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movq %xmm0,%xmm7
pmuludq %xmm6,%xmm7
movd %xmm7,4*2(%ebx)
movd (%esi),%xmm1
pmuludq %xmm7,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*(2+1)(%ebx),%xmm1
paddq %xmm1,%xmm0
movd 4*0(%ebx),%xmm1
movd 4*3(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*1(%ebx),%xmm1
movd 4*2(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*2(%ebx),%xmm1
movd 4*1(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movq %xmm0,%xmm7
pmuludq %xmm6,%xmm7
movd %xmm7,4*3(%ebx)
movd (%esi),%xmm1
pmuludq %xmm7,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*(3+1)(%ebx),%xmm1
paddq %xmm1,%xmm0
movd 4*0(%ebx),%xmm1
movd 4*4(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*1(%ebx),%xmm1
movd 4*3(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*2(%ebx),%xmm1
movd 4*2(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*3(%ebx),%xmm1
movd 4*1(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movq %xmm0,%xmm7
pmuludq %xmm6,%xmm7
movd %xmm7,4*4(%ebx)
movd (%esi),%xmm1
pmuludq %xmm7,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*(4+1)(%ebx),%xmm1
paddq %xmm1,%xmm0
movd 4*1(%ebx),%xmm1
movd 4*4(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*2(%ebx),%xmm1
movd 4*3(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*3(%ebx),%xmm1
movd 4*2(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*4(%ebx),%xmm1
movd 4*1(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*5(%ebx)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*(5+1)(%ebx),%xmm1
paddq %xmm1,%xmm0
movd 4*2(%ebx),%xmm1
movd 4*4(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*3(%ebx),%xmm1
movd 4*3(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*4(%ebx),%xmm1
movd 4*2(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*6(%ebx)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*(6+1)(%ebx),%xmm1
paddq %xmm1,%xmm0
movd 4*3(%ebx),%xmm1
movd 4*4(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd 4*4(%ebx),%xmm1
movd 4*3(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*7(%ebx)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*(7+1)(%ebx),%xmm1
paddq %xmm1,%xmm0
movd 4*4(%ebx),%xmm1
movd 4*4(%esi),%xmm2
pmuludq %xmm2,%xmm1
pshufd $0xd8,%xmm1,%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*8(%ebx)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd 4*(8+1)(%ebx),%xmm1
paddq %xmm1,%xmm0
movd %xmm0,4*9(%ebx)
movq %xmm0,%xmm7
psrlq $32,%xmm7
psrldq $8,%xmm0
paddq %xmm7,%xmm0
movd %xmm0,4*(9+1)(%ebx)
popl %esi
popl %edi

#NO_APP
	movl	12(%ebp), %ebx
	movl	(%ebx), %eax
	andl	$2147483647, %eax
	cmpl	$5, %eax
	jbe	.L115
	movl	4(%ebx), %ecx
	movl	$5, %edx
	.p2align 4,,7
.L103:
	movl	12(%ebp), %ebx
	movl	$0, (%ecx,%edx,4)
	addl	$1, %edx
	movl	(%ebx), %eax
	andl	$2147483647, %eax
	cmpl	%edx, %eax
	ja	.L103
.L101:
	movl	-36(%ebp), %eax
	movl	12(%ebp), %edx
	movl	4(%eax), %ebx
	movl	$5, (%edx)
	xorl	%edx, %edx
	.p2align 4,,7
.L104:
	movl	20(%ebx,%edx), %eax
	movl	%eax, (%ecx,%edx)
	addl	$4, %edx
	cmpl	$20, %edx
	jne	.L104
	movl	40(%ebx), %edi
	testl	%edi, %edi
	jne	.L106
	movl	16(%ecx), %edx
	testl	%edx, %edx
	je	.L108
	movl	-32(%ebp), %ebx
	movl	4(%ebx), %eax
	cmpl	16(%eax), %edx
	jbe	.L120
.L106:
	movl	-32(%ebp), %edx
	movl	%ecx, -24(%ebp)
	movl	4(%edx), %eax
	movl	%eax, -28(%ebp)
#APP
	pushl %edi
movl -24(%ebp),%edi
movl -28(%ebp),%ebx
movl (%ebx),%eax
subl %eax,(%edi)
movl 4*1(%ebx),%eax
sbbl %eax,4*1(%edi)
movl 4*2(%ebx),%eax
sbbl %eax,4*2(%edi)
movl 4*3(%ebx),%eax
sbbl %eax,4*3(%edi)
movl 4*4(%ebx),%eax
sbbl %eax,4*4(%edi)
movl $0,%eax
adcl %eax,%eax
movl %eax,-20(%ebp)
popl %edi

#NO_APP
	movl	12(%ebp), %ebx
	movl	4(%ebx), %eax
	movl	$5, (%ebx)
	movl	16(%eax), %esi
	testl	%esi, %esi
	je	.L121
.L114:
	addl	$44, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L121:
	movl	%ebx, (%esp)
	call	mr_lzero
	addl	$44, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L120:
	jne	.L114
	movl	%ebx, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	compare
	testl	%eax, %eax
	js	.L114
	movl	12(%ebp), %ebx
	movl	4(%ebx), %ecx
	jmp	.L106
.L108:
	movl	12(%ebp), %edx
	movl	%edx, (%esp)
	call	mr_lzero
	addl	$44, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.L115:
	movl	12(%ebp), %eax
	movl	4(%eax), %ecx
	jmp	.L101
	.size	comba_redc, .-comba_redc
	.ident	"GCC: (GNU) 4.1.2 20060928 (prerelease) (Ubuntu 4.1.1-13ubuntu5)"
	.section	.note.GNU-stack,"",@progbits
