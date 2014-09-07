#ifndef SHA512_AVX1
#define SHA512_AVX1

#if __APPLE__ && __MACH__
    DO NOT COMPILE
#endif

asm(".intel_syntax noprefix \n");
#if __APPLE__ && __MACH__
asm(".text \n\
     _sha512_avx:");
#elif __gnu_linux__
asm(".section .text\n\
     sha512_avx:");
#endif
asm("cmp rdx, 0\n\
je .nowork\n\
sub rsp, 696\n\
mov [rsp + 656 + 8 * 0], rbx\n\
mov [rsp + 656 + 8 * 1], r12\n\
mov [rsp + 656 + 8 * 2], r13\n\
mov [rsp + 656 + 8 * 3], r14\n\
mov [rsp + 656 + 8 * 4], r15\n\
.updateblock:\n\
mov r9, [rsi + 8*(0)]\n\
mov r10, [rsi + 8*(1)]\n\
mov r11, [rsi + 8*(2)]\n\
mov r12, [rsi + 8*(3)]\n\
mov r13, [rsi + 8*(4)]\n\
mov r14, [rsi + 8*(5)]\n\
mov r15, [rsi + 8*(6)]\n\
mov rbx, [rsi + 8*(7)]\n\
vmovdqa xmm1, XMMWORD PTR [XMM_QWORD_BSWAP + rip]\n\
vmovdqu xmm0, [rdi + 8*(0)]\n\
vpshufb xmm0, xmm0, xmm1\n\
vmovdqa [rsp + 0 + 8*(0)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(0) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
vmovdqu xmm0, [rdi + 8*(2)]\n\
vpshufb xmm0, xmm0, xmm1\n\
mov rcx, r14\n\
mov rax, r13\n\
xor rcx, r15\n\
shld rax, rax, (64 - 23)\n\
and rcx, r13\n\
xor rax, r13\n\
xor rcx, r15\n\
add rcx, [rsp + 640 + 8*(0)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r13\n\
mov r8, r9\n\
add rcx, rbx\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r9\n\
xor r8, r11\n\
and rax, r11\n\
and r8, r10\n\
xor r8, rax\n\
mov rax, r9\n\
shld rax, rax, (64 - 5)\n\
xor rax, r9\n\
add r12, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r9\n\
lea rbx, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add rbx, rax\n\
vmovdqa [rsp + 0 + 8*(2)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(2) + rip]\n\
mov rcx, r13\n\
mov rax, r12\n\
xor rcx, r14\n\
shld rax, rax, (64 - 23)\n\
and rcx, r12\n\
xor rax, r12\n\
xor rcx, r14\n\
add rcx, [rsp + 640 + 8*(1)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r12\n\
mov r8, rbx\n\
add rcx, r15\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, rbx\n\
xor r8, r10\n\
and rax, r10\n\
and r8, r9\n\
xor r8, rax\n\
mov rax, rbx\n\
shld rax, rax, (64 - 5)\n\
xor rax, rbx\n\
add r11, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, rbx\n\
lea r15, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r15, rax\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
vmovdqu xmm0, [rdi + 8*(4)]\n\
vpshufb xmm0, xmm0, xmm1\n\
mov rcx, r12\n\
mov rax, r11\n\
xor rcx, r13\n\
shld rax, rax, (64 - 23)\n\
and rcx, r11\n\
xor rax, r11\n\
xor rcx, r13\n\
add rcx, [rsp + 640 + 8*(0)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r11\n\
mov r8, r15\n\
add rcx, r14\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r15\n\
xor r8, r9\n\
and rax, r9\n\
and r8, rbx\n\
xor r8, rax\n\
mov rax, r15\n\
shld rax, rax, (64 - 5)\n\
xor rax, r15\n\
add r10, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r15\n\
lea r14, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r14, rax\n\
vmovdqa [rsp + 0 + 8*(4)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(4) + rip]\n\
mov rcx, r11\n\
mov rax, r10\n\
xor rcx, r12\n\
shld rax, rax, (64 - 23)\n\
and rcx, r10\n\
xor rax, r10\n\
xor rcx, r12\n\
add rcx, [rsp + 640 + 8*(1)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r10\n\
mov r8, r14\n\
add rcx, r13\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r14\n\
xor r8, rbx\n\
and rax, rbx\n\
and r8, r15\n\
xor r8, rax\n\
mov rax, r14\n\
shld rax, rax, (64 - 5)\n\
xor rax, r14\n\
add r9, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r14\n\
lea r13, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r13, rax\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
vmovdqu xmm0, [rdi + 8*(6)]\n\
vpshufb xmm0, xmm0, xmm1\n\
mov rcx, r10\n\
mov rax, r9\n\
xor rcx, r11\n\
shld rax, rax, (64 - 23)\n\
and rcx, r9\n\
xor rax, r9\n\
xor rcx, r11\n\
add rcx, [rsp + 640 + 8*(0)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r9\n\
mov r8, r13\n\
add rcx, r12\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r13\n\
xor r8, r15\n\
and rax, r15\n\
and r8, r14\n\
xor r8, rax\n\
mov rax, r13\n\
shld rax, rax, (64 - 5)\n\
xor rax, r13\n\
add rbx, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r13\n\
lea r12, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r12, rax\n\
vmovdqa [rsp + 0 + 8*(6)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(6) + rip]\n\
mov rcx, r9\n\
mov rax, rbx\n\
xor rcx, r10\n\
shld rax, rax, (64 - 23)\n\
and rcx, rbx\n\
xor rax, rbx\n\
xor rcx, r10\n\
add rcx, [rsp + 640 + 8*(1)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, rbx\n\
mov r8, r12\n\
add rcx, r11\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r12\n\
xor r8, r14\n\
and rax, r14\n\
and r8, r13\n\
xor r8, rax\n\
mov rax, r12\n\
shld rax, rax, (64 - 5)\n\
xor rax, r12\n\
add r15, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r12\n\
lea r11, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r11, rax\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
vmovdqu xmm0, [rdi + 8*(8)]\n\
vpshufb xmm0, xmm0, xmm1\n\
mov rcx, rbx\n\
mov rax, r15\n\
xor rcx, r9\n\
shld rax, rax, (64 - 23)\n\
and rcx, r15\n\
xor rax, r15\n\
xor rcx, r9\n\
add rcx, [rsp + 640 + 8*(0)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r15\n\
mov r8, r11\n\
add rcx, r10\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r11\n\
xor r8, r13\n\
and rax, r13\n\
and r8, r12\n\
xor r8, rax\n\
mov rax, r11\n\
shld rax, rax, (64 - 5)\n\
xor rax, r11\n\
add r14, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r11\n\
lea r10, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r10, rax\n\
vmovdqa [rsp + 0 + 8*(8)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(8) + rip]\n\
mov rcx, r15\n\
mov rax, r14\n\
xor rcx, rbx\n\
shld rax, rax, (64 - 23)\n\
and rcx, r14\n\
xor rax, r14\n\
xor rcx, rbx\n\
add rcx, [rsp + 640 + 8*(1)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r14\n\
mov r8, r10\n\
add rcx, r9\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r10\n\
xor r8, r12\n\
and rax, r12\n\
and r8, r11\n\
xor r8, rax\n\
mov rax, r10\n\
shld rax, rax, (64 - 5)\n\
xor rax, r10\n\
add r13, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r10\n\
lea r9, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r9, rax\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
vmovdqu xmm0, [rdi + 8*(10)]\n\
vpshufb xmm0, xmm0, xmm1\n\
mov rcx, r14\n\
mov rax, r13\n\
xor rcx, r15\n\
shld rax, rax, (64 - 23)\n\
and rcx, r13\n\
xor rax, r13\n\
xor rcx, r15\n\
add rcx, [rsp + 640 + 8*(0)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r13\n\
mov r8, r9\n\
add rcx, rbx\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r9\n\
xor r8, r11\n\
and rax, r11\n\
and r8, r10\n\
xor r8, rax\n\
mov rax, r9\n\
shld rax, rax, (64 - 5)\n\
xor rax, r9\n\
add r12, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r9\n\
lea rbx, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add rbx, rax\n\
vmovdqa [rsp + 0 + 8*(10)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(10) + rip]\n\
mov rcx, r13\n\
mov rax, r12\n\
xor rcx, r14\n\
shld rax, rax, (64 - 23)\n\
and rcx, r12\n\
xor rax, r12\n\
xor rcx, r14\n\
add rcx, [rsp + 640 + 8*(1)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r12\n\
mov r8, rbx\n\
add rcx, r15\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, rbx\n\
xor r8, r10\n\
and rax, r10\n\
and r8, r9\n\
xor r8, rax\n\
mov rax, rbx\n\
shld rax, rax, (64 - 5)\n\
xor rax, rbx\n\
add r11, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, rbx\n\
lea r15, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r15, rax\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
vmovdqu xmm0, [rdi + 8*(12)]\n\
vpshufb xmm0, xmm0, xmm1\n\
mov rcx, r12\n\
mov rax, r11\n\
xor rcx, r13\n\
shld rax, rax, (64 - 23)\n\
and rcx, r11\n\
xor rax, r11\n\
xor rcx, r13\n\
add rcx, [rsp + 640 + 8*(0)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r11\n\
mov r8, r15\n\
add rcx, r14\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r15\n\
xor r8, r9\n\
and rax, r9\n\
and r8, rbx\n\
xor r8, rax\n\
mov rax, r15\n\
shld rax, rax, (64 - 5)\n\
xor rax, r15\n\
add r10, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r15\n\
lea r14, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r14, rax\n\
vmovdqa [rsp + 0 + 8*(12)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(12) + rip]\n\
mov rcx, r11\n\
mov rax, r10\n\
xor rcx, r12\n\
shld rax, rax, (64 - 23)\n\
and rcx, r10\n\
xor rax, r10\n\
xor rcx, r12\n\
add rcx, [rsp + 640 + 8*(1)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r10\n\
mov r8, r14\n\
add rcx, r13\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r14\n\
xor r8, rbx\n\
and rax, rbx\n\
and r8, r15\n\
xor r8, rax\n\
mov rax, r14\n\
shld rax, rax, (64 - 5)\n\
xor rax, r14\n\
add r9, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r14\n\
lea r13, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r13, rax\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
vmovdqu xmm0, [rdi + 8*(14)]\n\
vpshufb xmm0, xmm0, xmm1\n\
mov rcx, r10\n\
mov rax, r9\n\
xor rcx, r11\n\
shld rax, rax, (64 - 23)\n\
and rcx, r9\n\
xor rax, r9\n\
xor rcx, r11\n\
add rcx, [rsp + 640 + 8*(0)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r9\n\
mov r8, r13\n\
add rcx, r12\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r13\n\
xor r8, r15\n\
and rax, r15\n\
and r8, r14\n\
xor r8, rax\n\
mov rax, r13\n\
shld rax, rax, (64 - 5)\n\
xor rax, r13\n\
add rbx, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r13\n\
lea r12, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r12, rax\n\
vmovdqa [rsp + 0 + 8*(14)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(14) + rip]\n\
mov rcx, r9\n\
mov rax, rbx\n\
xor rcx, r10\n\
shld rax, rax, (64 - 23)\n\
and rcx, rbx\n\
xor rax, rbx\n\
xor rcx, r10\n\
add rcx, [rsp + 640 + 8*(1)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, rbx\n\
mov r8, r12\n\
add rcx, r11\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r12\n\
xor r8, r14\n\
and rax, r14\n\
and r8, r13\n\
xor r8, rax\n\
mov rax, r12\n\
shld rax, rax, (64 - 5)\n\
xor rax, r12\n\
add r15, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r12\n\
lea r11, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r11, rax\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
vmovdqa xmm4, [rsp + 0 + 8*(16-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(16-15)]\n\
mov rcx, rbx\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r15\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r9\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r15\n\
xor rax, r15\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r9\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r15\n\
mov r8, r11\n\
add rcx, r10\n\
vpxor xmm6, xmm6, xmm7\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r11\n\
xor r8, r13\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r13\n\
and r8, r12\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r11\n\
vpsllq xmm9, xmm5, (64-1)\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r11\n\
add r14, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r11\n\
vpxor xmm6, xmm6, xmm8\n\
lea r10, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r10, rax\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r15\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r14\n\
xor rcx, rbx\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(16-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(16- 7)]\n\
shld rax, rax, (64 - 23)\n\
and rcx, r14\n\
xor rax, r14\n\
xor rcx, rbx\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r14\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r10\n\
add rcx, r9\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(16)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(16) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r10\n\
xor r8, r12\n\
and rax, r12\n\
and r8, r11\n\
xor r8, rax\n\
mov rax, r10\n\
shld rax, rax, (64 - 5)\n\
xor rax, r10\n\
add r13, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r10\n\
lea r9, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r9, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(18-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(18-15)]\n\
mov rcx, r14\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r13\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r15\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r13\n\
xor rax, r13\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r15\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r13\n\
mov r8, r9\n\
add rcx, rbx\n\
vpxor xmm6, xmm6, xmm7\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r9\n\
xor r8, r11\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r11\n\
and r8, r10\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r9\n\
vpsllq xmm9, xmm5, (64-1)\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r9\n\
add r12, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r9\n\
vpxor xmm6, xmm6, xmm8\n\
lea rbx, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add rbx, rax\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r13\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r12\n\
xor rcx, r14\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(18-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(18- 7)]\n\
shld rax, rax, (64 - 23)\n\
and rcx, r12\n\
xor rax, r12\n\
xor rcx, r14\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r12\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, rbx\n\
add rcx, r15\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(18)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(18) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, rbx\n\
xor r8, r10\n\
and rax, r10\n\
and r8, r9\n\
xor r8, rax\n\
mov rax, rbx\n\
shld rax, rax, (64 - 5)\n\
xor rax, rbx\n\
add r11, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, rbx\n\
lea r15, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r15, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(20-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(20-15)]\n\
mov rcx, r12\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r11\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r13\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r11\n\
xor rax, r11\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r13\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r11\n\
mov r8, r15\n\
add rcx, r14\n\
vpxor xmm6, xmm6, xmm7\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r15\n\
xor r8, r9\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r9\n\
and r8, rbx\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r15\n\
vpsllq xmm9, xmm5, (64-1)\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r15\n\
add r10, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r15\n\
vpxor xmm6, xmm6, xmm8\n\
lea r14, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r14, rax\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r11\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r10\n\
xor rcx, r12\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(20-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(20- 7)]\n\
shld rax, rax, (64 - 23)\n\
and rcx, r10\n\
xor rax, r10\n\
xor rcx, r12\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r10\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r14\n\
add rcx, r13\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(20)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(20) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r14\n\
xor r8, rbx\n\
and rax, rbx\n\
and r8, r15\n\
xor r8, rax\n\
mov rax, r14\n\
shld rax, rax, (64 - 5)\n\
xor rax, r14\n\
add r9, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r14\n\
lea r13, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r13, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(22-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(22-15)]\n\
mov rcx, r10\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r9\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r11\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r9\n\
xor rax, r9\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r11\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r9\n\
mov r8, r13\n\
add rcx, r12\n\
vpxor xmm6, xmm6, xmm7\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r13\n\
xor r8, r15\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r15\n\
and r8, r14\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r13\n\
vpsllq xmm9, xmm5, (64-1)\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r13\n\
add rbx, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r13\n\
vpxor xmm6, xmm6, xmm8\n\
lea r12, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r12, rax\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r9\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, rbx\n\
xor rcx, r10\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(22-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(22- 7)]\n\
shld rax, rax, (64 - 23)\n\
and rcx, rbx\n\
xor rax, rbx\n\
xor rcx, r10\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, rbx\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r12\n\
add rcx, r11\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(22)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(22) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r12\n\
xor r8, r14\n\
and rax, r14\n\
and r8, r13\n\
xor r8, rax\n\
mov rax, r12\n\
shld rax, rax, (64 - 5)\n\
xor rax, r12\n\
add r15, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r12\n\
lea r11, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r11, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(24-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(24-15)]\n\
mov rcx, rbx\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r15\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r9\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r15\n\
xor rax, r15\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r9\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r15\n\
mov r8, r11\n\
add rcx, r10\n\
vpxor xmm6, xmm6, xmm7\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r11\n\
xor r8, r13\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r13\n\
and r8, r12\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r11\n\
vpsllq xmm9, xmm5, (64-1)\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r11\n\
add r14, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r11\n\
vpxor xmm6, xmm6, xmm8\n\
lea r10, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r10, rax\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r15\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r14\n\
xor rcx, rbx\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(24-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(24- 7)]\n\
shld rax, rax, (64 - 23)\n\
and rcx, r14\n\
xor rax, r14\n\
xor rcx, rbx\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r14\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r10\n\
add rcx, r9\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(24)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(24) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r10\n\
xor r8, r12\n\
and rax, r12\n\
and r8, r11\n\
xor r8, rax\n\
mov rax, r10\n\
shld rax, rax, (64 - 5)\n\
xor rax, r10\n\
add r13, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r10\n\
lea r9, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r9, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(26-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(26-15)]\n\
mov rcx, r14\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r13\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r15\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r13\n\
xor rax, r13\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r15\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r13\n\
mov r8, r9\n\
add rcx, rbx\n\
vpxor xmm6, xmm6, xmm7\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r9\n\
xor r8, r11\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r11\n\
and r8, r10\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r9\n\
vpsllq xmm9, xmm5, (64-1)\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8,xmm8, xmm9\n\
xor rax, r9\n\
add r12, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r9\n\
vpxor xmm6,xmm6, xmm8\n\
lea rbx, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add rbx, rax\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r13\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r12\n\
xor rcx, r14\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(26-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(26- 7)]\n\
shld rax, rax, (64 - 23)\n\
and rcx, r12\n\
xor rax, r12\n\
xor rcx, r14\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r12\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, rbx\n\
add rcx, r15\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(26)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(26) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, rbx\n\
xor r8, r10\n\
and rax, r10\n\
and r8, r9\n\
xor r8, rax\n\
mov rax, rbx\n\
shld rax, rax, (64 - 5)\n\
xor rax, rbx\n\
add r11, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, rbx\n\
lea r15, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r15, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(28-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(28-15)]\n\
mov rcx, r12\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r11\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r13\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r11\n\
xor rax, r11\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r13\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r11\n\
mov r8, r15\n\
add rcx, r14\n\
vpxor xmm6, xmm6, xmm7\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r15\n\
xor r8, r9\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r9\n\
and r8, rbx\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r15\n\
vpsllq xmm9, xmm5, (64-1)\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r15\n\
add r10, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r15\n\
vpxor xmm6, xmm6, xmm8\n\
lea r14, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r14, rax\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r11\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r10\n\
xor rcx, r12\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(28-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(28- 7)]\n\
shld rax, rax, (64 - 23)\n\
and rcx, r10\n\
xor rax, r10\n\
xor rcx, r12\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r10\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r14\n\
add rcx, r13\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(28)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(28) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r14\n\
xor r8, rbx\n\
and rax, rbx\n\
and r8, r15\n\
xor r8, rax\n\
mov rax, r14\n\
shld rax, rax, (64 - 5)\n\
xor rax, r14\n\
add r9, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r14\n\
lea r13, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r13, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(30-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(30-15)]\n\
mov rcx, r10\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r9\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r11\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r9\n\
xor rax, r9\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r11\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r9\n\
mov r8, r13\n\
add rcx, r12\n\
vpxor xmm6, xmm6, xmm7\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r13\n\
xor r8, r15\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r15\n\
and r8, r14\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r13\n\
vpsllq xmm9, xmm5, (64-1)\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r13\n\
add rbx, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r13\n\
vpxor xmm6, xmm6, xmm8\n\
lea r12, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r12, rax\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r9\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, rbx\n\
xor rcx, r10\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(30-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(30- 7)]\n\
shld rax, rax, (64 - 23)\n\
and rcx, rbx\n\
xor rax, rbx\n\
xor rcx, r10\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, rbx\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r12\n\
add rcx, r11\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(30)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(30) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r12\n\
xor r8, r14\n\
and rax, r14\n\
and r8, r13\n\
xor r8, rax\n\
mov rax, r12\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r12\n\
add r15, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r12\n\
lea r11, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r11, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(32-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(32-15)]\n\
mov rcx, rbx\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r15\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r9\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r15\n\
xor rax, r15\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r9\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r15\n\
mov r8, r11\n\
add rcx, r10\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r11\n\
xor r8, r13\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r13\n\
and r8, r12\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r11\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r11\n\
add r14, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r11\n\
vpxor xmm6, xmm6, xmm8\n\
lea r10, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r10, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r15\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r14\n\
xor rcx, rbx\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(32-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(32- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r14\n\
xor rax, r14\n\
xor rcx, rbx\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r14\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r10\n\
add rcx, r9\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(32)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR  [K512 + 8*(32) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r10\n\
xor r8, r12\n\
and rax, r12\n\
and r8, r11\n\
xor r8, rax\n\
mov rax, r10\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r10\n\
add r13, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r10\n\
lea r9, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r9, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(34-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(34-15)]\n\
mov rcx, r14\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r13\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r15\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r13\n\
xor rax, r13\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r15\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r13\n\
mov r8, r9\n\
add rcx, rbx\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r9\n\
xor r8, r11\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r11\n\
and r8, r10\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r9\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r9\n\
add r12, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r9\n\
vpxor xmm6, xmm6, xmm8\n\
lea rbx, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add rbx, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r13\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r12\n\
xor rcx, r14\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(34-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(34- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r12\n\
xor rax, r12\n\
xor rcx, r14\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r12\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, rbx\n\
add rcx, r15\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(34)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(34) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, rbx\n\
xor r8, r10\n\
and rax, r10\n\
and r8, r9\n\
xor r8, rax\n\
mov rax, rbx\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, rbx\n\
add r11, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, rbx\n\
lea r15, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r15, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(36-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(36-15)]\n\
mov rcx, r12\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r11\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r13\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r11\n\
xor rax, r11\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r13\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r11\n\
mov r8, r15\n\
add rcx, r14\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r15\n\
xor r8, r9\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r9\n\
and r8, rbx\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r15\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r15\n\
add r10, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r15\n\
vpxor xmm6, xmm6, xmm8\n\
lea r14, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r14, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r11\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r10\n\
xor rcx, r12\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(36-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(36- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r10\n\
xor rax, r10\n\
xor rcx, r12\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r10\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r14\n\
add rcx, r13\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(36)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(36) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r14\n\
xor r8, rbx\n\
and rax, rbx\n\
and r8, r15\n\
xor r8, rax\n\
mov rax, r14\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r14\n\
add r9, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r14\n\
lea r13, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r13, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(38-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(38-15)]\n\
mov rcx, r10\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r9\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r11\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r9\n\
xor rax, r9\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r11\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r9\n\
mov r8, r13\n\
add rcx, r12\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r13\n\
xor r8, r15\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r15\n\
and r8, r14\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r13\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r13\n\
add rbx, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r13\n\
vpxor xmm6, xmm6, xmm8\n\
lea r12, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r12, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r9\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, rbx\n\
xor rcx, r10\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(38-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(38- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, rbx\n\
xor rax, rbx\n\
xor rcx, r10\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, rbx\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r12\n\
add rcx, r11\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(38)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(38) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r12\n\
xor r8, r14\n\
and rax, r14\n\
and r8, r13\n\
xor r8, rax\n\
mov rax, r12\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r12\n\
add r15, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r12\n\
lea r11, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r11, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(40-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(40-15)]\n\
mov rcx, rbx\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r15\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r9\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r15\n\
xor rax, r15\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r9\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r15\n\
mov r8, r11\n\
add rcx, r10\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r11\n\
xor r8, r13\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r13\n\
and r8, r12\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r11\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r11\n\
add r14, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r11\n\
vpxor xmm6, xmm6, xmm8\n\
lea r10, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r10, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r15\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r14\n\
xor rcx, rbx\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(40-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(40- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r14\n\
xor rax, r14\n\
xor rcx, rbx\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r14\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r10\n\
add rcx, r9\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(40)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(40) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r10\n\
xor r8, r12\n\
and rax, r12\n\
and r8, r11\n\
xor r8, rax\n\
mov rax, r10\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r10\n\
add r13, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r10\n\
lea r9, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r9, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(42-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(42-15)]\n\
mov rcx, r14\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r13\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r15\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r13\n\
xor rax, r13\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r15\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r13\n\
mov r8, r9\n\
add rcx, rbx\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r9\n\
xor r8, r11\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r11\n\
and r8, r10\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r9\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r9\n\
add r12, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r9\n\
vpxor xmm6, xmm6, xmm8\n\
lea rbx, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add rbx, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r13\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r12\n\
xor rcx, r14\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(42-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(42- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r12\n\
xor rax, r12\n\
xor rcx, r14\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r12\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, rbx\n\
add rcx, r15\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(42)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(42) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, rbx\n\
xor r8, r10\n\
and rax, r10\n\
and r8, r9\n\
xor r8, rax\n\
mov rax, rbx\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, rbx\n\
add r11, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, rbx\n\
lea r15, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r15, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(44-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(44-15)]\n\
mov rcx, r12\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r11\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r13\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r11\n\
xor rax, r11\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r13\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r11\n\
mov r8, r15\n\
add rcx, r14\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r15\n\
xor r8, r9\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r9\n\
and r8, rbx\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r15\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r15\n\
add r10, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r15\n\
vpxor xmm6, xmm6, xmm8\n\
lea r14, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r14, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r11\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r10\n\
xor rcx, r12\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(44-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(44- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r10\n\
xor rax, r10\n\
xor rcx, r12\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r10\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r14\n\
add rcx, r13\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(44)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(44) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r14\n\
xor r8, rbx\n\
and rax, rbx\n\
and r8, r15\n\
xor r8, rax\n\
mov rax, r14\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r14\n\
add r9, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r14\n\
lea r13, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r13, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(46-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(46-15)]\n\
mov rcx, r10\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r9\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r11\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r9\n\
xor rax, r9\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r11\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r9\n\
mov r8, r13\n\
add rcx, r12\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r13\n\
xor r8, r15\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r15\n\
and r8, r14\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r13\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r13\n\
add rbx, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r13\n\
vpxor xmm6, xmm6, xmm8\n\
lea r12, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r12, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r9\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, rbx\n\
xor rcx, r10\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(46-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(46- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, rbx\n\
xor rax, rbx\n\
xor rcx, r10\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, rbx\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r12\n\
add rcx, r11\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(46)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(46) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r12\n\
xor r8, r14\n\
and rax, r14\n\
and r8, r13\n\
xor r8, rax\n\
mov rax, r12\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r12\n\
add r15, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r12\n\
lea r11, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r11, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(48-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(48-15)]\n\
mov rcx, rbx\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r15\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r9\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r15\n\
xor rax, r15\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r9\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r15\n\
mov r8, r11\n\
add rcx, r10\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r11\n\
xor r8, r13\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r13\n\
and r8, r12\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r11\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r11\n\
add r14, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r11\n\
vpxor xmm6, xmm6, xmm8\n\
lea r10, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r10, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r15\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r14\n\
xor rcx, rbx\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(48-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(48- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r14\n\
xor rax, r14\n\
xor rcx, rbx\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r14\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r10\n\
add rcx, r9\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(48)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(48) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r10\n\
xor r8, r12\n\
and rax, r12\n\
and r8, r11\n\
xor r8, rax\n\
mov rax, r10\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r10\n\
add r13, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r10\n\
lea r9, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r9, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(50-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(50-15)]\n\
mov rcx, r14\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r13\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r15\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r13\n\
xor rax, r13\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r15\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r13\n\
mov r8, r9\n\
add rcx, rbx\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r9\n\
xor r8, r11\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r11\n\
and r8, r10\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r9\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r9\n\
add r12, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r9\n\
vpxor xmm6, xmm6, xmm8\n\
lea rbx, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add rbx, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r13\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r12\n\
xor rcx, r14\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(50-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(50- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r12\n\
xor rax, r12\n\
xor rcx, r14\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r12\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, rbx\n\
add rcx, r15\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(50)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(50) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, rbx\n\
xor r8, r10\n\
and rax, r10\n\
and r8, r9\n\
xor r8, rax\n\
mov rax, rbx\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, rbx\n\
add r11, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, rbx\n\
lea r15, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r15, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(52-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(52-15)]\n\
mov rcx, r12\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r11\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r13\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r11\n\
xor rax, r11\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r13\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r11\n\
mov r8, r15\n\
add rcx, r14\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r15\n\
xor r8, r9\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r9\n\
and r8, rbx\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r15\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r15\n\
add r10, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r15\n\
vpxor xmm6, xmm6, xmm8\n\
lea r14, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r14, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r11\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r10\n\
xor rcx, r12\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(52-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(52- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r10\n\
xor rax, r10\n\
xor rcx, r12\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r10\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r14\n\
add rcx, r13\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(52)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(52) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r14\n\
xor r8, rbx\n\
and rax, rbx\n\
and r8, r15\n\
xor r8, rax\n\
mov rax, r14\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r14\n\
add r9, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r14\n\
lea r13, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r13, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(54-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(54-15)]\n\
mov rcx, r10\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r9\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r11\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r9\n\
xor rax, r9\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r11\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r9\n\
mov r8, r13\n\
add rcx, r12\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r13\n\
xor r8, r15\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r15\n\
and r8, r14\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r13\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r13\n\
add rbx, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r13\n\
vpxor xmm6, xmm6, xmm8\n\
lea r12, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r12, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r9\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, rbx\n\
xor rcx, r10\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(54-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(54- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, rbx\n\
xor rax, rbx\n\
xor rcx, r10\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, rbx\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r12\n\
add rcx, r11\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(54)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(54) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r12\n\
xor r8, r14\n\
and rax, r14\n\
and r8, r13\n\
xor r8, rax\n\
mov rax, r12\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r12\n\
add r15, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r12\n\
lea r11, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r11, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(56-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(56-15)]\n\
mov rcx, rbx\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r15\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r9\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r15\n\
xor rax, r15\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r9\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r15\n\
mov r8, r11\n\
add rcx, r10\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r11\n\
xor r8, r13\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r13\n\
and r8, r12\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r11\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r11\n\
add r14, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r11\n\
vpxor xmm6, xmm6, xmm8\n\
lea r10, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r10, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r15\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r14\n\
xor rcx, rbx\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(56-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(56- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r14\n\
xor rax, r14\n\
xor rcx, rbx\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r14\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r10\n\
add rcx, r9\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(56)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(56) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r10\n\
xor r8, r12\n\
and rax, r12\n\
and r8, r11\n\
xor r8, rax\n\
mov rax, r10\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r10\n\
add r13, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r10\n\
lea r9, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r9, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(58-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(58-15)]\n\
mov rcx, r14\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r13\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r15\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r13\n\
xor rax, r13\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r15\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r13\n\
mov r8, r9\n\
add rcx, rbx\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r9\n\
xor r8, r11\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r11\n\
and r8, r10\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r9\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r9\n\
add r12, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r9\n\
vpxor xmm6, xmm6, xmm8\n\
lea rbx, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add rbx, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r13\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r12\n\
xor rcx, r14\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(58-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(58- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r12\n\
xor rax, r12\n\
xor rcx, r14\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r12\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, rbx\n\
add rcx, r15\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(58)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(58) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, rbx\n\
xor r8, r10\n\
and rax, r10\n\
and r8, r9\n\
xor r8, rax\n\
mov rax, rbx\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, rbx\n\
add r11, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, rbx\n\
lea r15, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r15, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(60-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(60-15)]\n\
mov rcx, r12\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r11\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r13\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r11\n\
xor rax, r11\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r13\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r11\n\
mov r8, r15\n\
add rcx, r14\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r15\n\
xor r8, r9\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r9\n\
and r8, rbx\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r15\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r15\n\
add r10, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r15\n\
vpxor xmm6, xmm6, xmm8\n\
lea r14, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r14, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r11\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r10\n\
xor rcx, r12\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(60-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(60- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r10\n\
xor rax, r10\n\
xor rcx, r12\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r10\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r14\n\
add rcx, r13\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(60)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(60) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r14\n\
xor r8, rbx\n\
and rax, rbx\n\
and r8, r15\n\
xor r8, rax\n\
mov rax, r14\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r14\n\
add r9, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r14\n\
lea r13, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r13, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(62-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(62-15)]\n\
mov rcx, r10\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r9\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r11\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r9\n\
xor rax, r9\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r11\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r9\n\
mov r8, r13\n\
add rcx, r12\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r13\n\
xor r8, r15\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r15\n\
and r8, r14\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r13\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r13\n\
add rbx, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r13\n\
vpxor xmm6, xmm6, xmm8\n\
lea r12, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r12, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r9\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, rbx\n\
xor rcx, r10\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(62-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(62- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, rbx\n\
xor rax, rbx\n\
xor rcx, r10\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, rbx\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r12\n\
add rcx, r11\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(62)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(62) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r12\n\
xor r8, r14\n\
and rax, r14\n\
and r8, r13\n\
xor r8, rax\n\
mov rax, r12\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r12\n\
add r15, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r12\n\
lea r11, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r11, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(64-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(64-15)]\n\
mov rcx, rbx\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r15\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r9\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r15\n\
xor rax, r15\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r9\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r15\n\
mov r8, r11\n\
add rcx, r10\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r11\n\
xor r8, r13\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r13\n\
and r8, r12\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r11\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r11\n\
add r14, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r11\n\
vpxor xmm6, xmm6, xmm8\n\
lea r10, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r10, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r15\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r14\n\
xor rcx, rbx\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(64-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(64- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r14\n\
xor rax, r14\n\
xor rcx, rbx\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r14\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r10\n\
add rcx, r9\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(64)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(64) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r10\n\
xor r8, r12\n\
and rax, r12\n\
and r8, r11\n\
xor r8, rax\n\
mov rax, r10\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r10\n\
add r13, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r10\n\
lea r9, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r9, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(66-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(66-15)]\n\
mov rcx, r14\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r13\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r15\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r13\n\
xor rax, r13\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r15\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r13\n\
mov r8, r9\n\
add rcx, rbx\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r9\n\
xor r8, r11\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r11\n\
and r8, r10\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r9\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r9\n\
add r12, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r9\n\
vpxor xmm6, xmm6, xmm8\n\
lea rbx, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add rbx, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r13\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r12\n\
xor rcx, r14\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(66-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(66- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r12\n\
xor rax, r12\n\
xor rcx, r14\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r12\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, rbx\n\
add rcx, r15\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(66)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(66) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, rbx\n\
xor r8, r10\n\
and rax, r10\n\
and r8, r9\n\
xor r8, rax\n\
mov rax, rbx\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, rbx\n\
add r11, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, rbx\n\
lea r15, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r15, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(68-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(68-15)]\n\
mov rcx, r12\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r11\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r13\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r11\n\
xor rax, r11\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r13\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r11\n\
mov r8, r15\n\
add rcx, r14\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r15\n\
xor r8, r9\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r9\n\
and r8, rbx\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r15\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r15\n\
add r10, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r15\n\
vpxor xmm6, xmm6, xmm8\n\
lea r14, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r14, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r11\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r10\n\
xor rcx, r12\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(68-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(68- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r10\n\
xor rax, r10\n\
xor rcx, r12\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r10\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r14\n\
add rcx, r13\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(68)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(68) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r14\n\
xor r8, rbx\n\
and rax, rbx\n\
and r8, r15\n\
xor r8, rax\n\
mov rax, r14\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r14\n\
add r9, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r14\n\
lea r13, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r13, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(70-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(70-15)]\n\
mov rcx, r10\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r9\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r11\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r9\n\
xor rax, r9\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r11\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r9\n\
mov r8, r13\n\
add rcx, r12\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r13\n\
xor r8, r15\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r15\n\
and r8, r14\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r13\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r13\n\
add rbx, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r13\n\
vpxor xmm6, xmm6, xmm8\n\
lea r12, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r12, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r9\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, rbx\n\
xor rcx, r10\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(70-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(70- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, rbx\n\
xor rax, rbx\n\
xor rcx, r10\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, rbx\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r12\n\
add rcx, r11\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(70)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(70) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r12\n\
xor r8, r14\n\
and rax, r14\n\
and r8, r13\n\
xor r8, rax\n\
mov rax, r12\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r12\n\
add r15, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r12\n\
lea r11, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r11, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(72-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(72-15)]\n\
mov rcx, rbx\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r15\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r9\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r15\n\
xor rax, r15\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r9\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r15\n\
mov r8, r11\n\
add rcx, r10\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r11\n\
xor r8, r13\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r13\n\
and r8, r12\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r11\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r11\n\
add r14, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r11\n\
vpxor xmm6, xmm6, xmm8\n\
lea r10, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r10, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r15\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r14\n\
xor rcx, rbx\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(72-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(72- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r14\n\
xor rax, r14\n\
xor rcx, rbx\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r14\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r10\n\
add rcx, r9\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(72)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(72) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r10\n\
xor r8, r12\n\
and rax, r12\n\
and r8, r11\n\
xor r8, rax\n\
mov rax, r10\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, r10\n\
add r13, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r10\n\
lea r9, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r9, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(74-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(74-15)]\n\
mov rcx, r14\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r13\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r15\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r13\n\
xor rax, r13\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r15\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r13\n\
mov r8, r9\n\
add rcx, rbx\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r9\n\
xor r8, r11\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r11\n\
and r8, r10\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r9\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r9\n\
add r12, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r9\n\
vpxor xmm6, xmm6, xmm8\n\
lea rbx, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add rbx, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r13\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r12\n\
xor rcx, r14\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(74-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(74- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r12\n\
xor rax, r12\n\
xor rcx, r14\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r12\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, rbx\n\
add rcx, r15\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(74)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(74) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, rbx\n\
xor r8, r10\n\
and rax, r10\n\
and r8, r9\n\
xor r8, rax\n\
mov rax, rbx\n\
\n\
shld rax, rax, (64 - 5)\n\
xor rax, rbx\n\
add r11, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, rbx\n\
lea r15, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
add r15, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(76-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(76-15)]\n\
mov rcx, r12\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r11\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r13\n\
\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r11\n\
xor rax, r11\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r13\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r11\n\
mov r8, r15\n\
add rcx, r14\n\
vpxor xmm6, xmm6, xmm7\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r15\n\
xor r8, r9\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r9\n\
and r8, rbx\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r15\n\
vpsllq xmm9, xmm5, (64-1)\n\
\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r15\n\
add r10, rcx\n\
\n\
shld rax, rax, (64 - 6)\n\
xor rax, r15\n\
vpxor xmm6, xmm6, xmm8\n\
lea r14, [rcx + r8]\n\
\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r14, rax\n\
\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r11\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, r10\n\
xor rcx, r12\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(76-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(76- 7)]\n\
\n\
shld rax, rax, (64 - 23)\n\
and rcx, r10\n\
xor rax, r10\n\
xor rcx, r12\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, r10\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r14\n\
add rcx, r13\n\
\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(76)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(76) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r14\n\
xor r8, rbx\n\
and rax, rbx\n\
and r8, r15\n\
xor r8, rax\n\
mov rax, r14\n\
shld rax, rax, (64 - 5)\n\
xor rax, r14\n\
add r9, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r14\n\
lea r13, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r13, rax\n\
vmovdqa xmm4, [rsp + 0 + 8*(78-2)]\n\
vmovdqu xmm5, [rsp + 0 + 8*(78-15)]\n\
mov rcx, r10\n\
vpsrlq xmm0, xmm4, 61\n\
mov rax, r9\n\
vpsrlq xmm6, xmm5, 1\n\
xor rcx, r11\n\
shld rax, rax, (64 - 23)\n\
vpsrlq xmm1, xmm4, 19\n\
and rcx, r9\n\
xor rax, r9\n\
vpxor xmm0, xmm0, xmm1\n\
xor rcx, r11\n\
add rcx, [rsp + 640 + 8*(0)]\n\
vpsrlq xmm7, xmm5, 8\n\
shld rax, rax, (64 - 4)\n\
vpsrlq xmm2, xmm4, 6\n\
xor rax, r9\n\
mov r8, r13\n\
add rcx, r12\n\
vpxor xmm6, xmm6, xmm7\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vpsrlq xmm8, xmm5, 7\n\
mov rax, r13\n\
xor r8, r15\n\
vpsllq xmm3, xmm4, (64-61)\n\
and rax, r15\n\
and r8, r14\n\
vpxor xmm2, xmm2, xmm3\n\
xor r8, rax\n\
mov rax, r13\n\
vpsllq xmm9, xmm5, (64-1)\n\
shld rax, rax, (64 - 5)\n\
vpxor xmm8, xmm8, xmm9\n\
xor rax, r13\n\
add rbx, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r13\n\
vpxor xmm6, xmm6, xmm8\n\
lea r12, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
vpsllq xmm4, xmm4, (64-19)\n\
add r12, rax\n\
vpxor xmm0, xmm0, xmm4\n\
mov rcx, r9\n\
vpxor xmm0, xmm0, xmm2\n\
mov rax, rbx\n\
xor rcx, r10\n\
vpaddq xmm0, xmm0, [rsp + 0 + 8*(78-16)]\n\
vmovdqu xmm1, [rsp + 0 + 8*(78- 7)]\n\
shld rax, rax, (64 - 23)\n\
and rcx, rbx\n\
xor rax, rbx\n\
xor rcx, r10\n\
vpsllq xmm5, xmm5, (64-8)\n\
add rcx, [rsp + 640 + 8*(1)]\n\
vpxor xmm6, xmm6, xmm5\n\
shld rax, rax, (64 - 4)\n\
vpaddq xmm0, xmm0, xmm6\n\
xor rax, rbx\n\
vpaddq xmm0, xmm0, xmm1\n\
mov r8, r12\n\
add rcx, r11\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
vmovdqa [rsp + 0 + 8*(78)], xmm0\n\
vpaddq xmm0, xmm0, XMMWORD PTR [K512 + 8*(78) + rip]\n\
vmovdqa [rsp + 640 + 8*(0)], xmm0\n\
mov rax, r12\n\
xor r8, r14\n\
and rax, r14\n\
and r8, r13\n\
xor r8, rax\n\
mov rax, r12\n\
shld rax, rax, (64 - 5)\n\
xor rax, r12\n\
add r15, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r12\n\
lea r11, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r11, rax\n\
mov rcx, rbx\n\
mov rax, r15\n\
xor rcx, r9\n\
shld rax, rax, (64 - 23)\n\
and rcx, r15\n\
xor rax, r15\n\
xor rcx, r9\n\
add rcx, [rsp + 640 + 8*(0)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r15\n\
mov r8, r11\n\
add rcx, r10\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r11\n\
xor r8, r13\n\
and rax, r13\n\
and r8, r12\n\
xor r8, rax\n\
mov rax, r11\n\
shld rax, rax, (64 - 5)\n\
xor rax, r11\n\
add r14, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r11\n\
lea r10, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r10, rax\n\
mov rcx, r15\n\
mov rax, r14\n\
xor rcx, rbx\n\
shld rax, rax, (64 - 23)\n\
and rcx, r14\n\
xor rax, r14\n\
xor rcx, rbx\n\
add rcx, [rsp + 640 + 8*(1)]\n\
shld rax, rax, (64 - 4)\n\
xor rax, r14\n\
mov r8, r10\n\
add rcx, r9\n\
shld rax, rax, (64 - 14)\n\
add rcx, rax\n\
mov rax, r10\n\
xor r8, r12\n\
and rax, r12\n\
and r8, r11\n\
xor r8, rax\n\
mov rax, r10\n\
shld rax, rax, (64 - 5)\n\
xor rax, r10\n\
add r13, rcx\n\
shld rax, rax, (64 - 6)\n\
xor rax, r10\n\
lea r9, [rcx + r8]\n\
shld rax, rax, (64 - 28)\n\
add r9, rax\n\
add [rsi + 8*(0)], r9\n\
add [rsi + 8*(1)], r10\n\
add [rsi + 8*(2)], r11\n\
add [rsi + 8*(3)], r12\n\
add [rsi + 8*(4)], r13\n\
add [rsi + 8*(5)], r14\n\
add [rsi + 8*(6)], r15\n\
add [rsi + 8*(7)], rbx\n\
add rdi, 16*8\n\
dec rdx\n\
jnz .updateblock\n\
mov rbx, [rsp + 656 + 8 * 0]\n\
mov r12, [rsp + 656 + 8 * 1]\n\
mov r13, [rsp + 656 + 8 * 2]\n\
mov r14, [rsp + 656 + 8 * 3]\n\
mov r15, [rsp + 656 + 8 * 4]\n\
add rsp, 696\n\
.nowork:\n\
    ret\n");
#if __APPLE__ && __MACH__
    asm(".data \n");
#elif __gnu_linux__
    asm(".section .data\n");
#endif
asm(".align 16\n\
XMM_QWORD_BSWAP:\n\
    ");
#if __APPLE__ && __MACH__
asm(".quad 0x08090a0b0c0d0e0f,0x0001020304050607\n");
#elif __gnu_linux__
asm(".octa 0x08090a0b0c0d0e0f0001020304050607\n");
#endif
asm("\
K512:\n\
.quad 0x428a2f98d728ae22,0x7137449123ef65cd\n\
.quad 0xb5c0fbcfec4d3b2f,0xe9b5dba58189dbbc\n\
.quad 0x3956c25bf348b538,0x59f111f1b605d019\n\
.quad 0x923f82a4af194f9b,0xab1c5ed5da6d8118\n\
.quad 0xd807aa98a3030242,0x12835b0145706fbe\n\
.quad 0x243185be4ee4b28c,0x550c7dc3d5ffb4e2\n\
.quad 0x72be5d74f27b896f,0x80deb1fe3b1696b1\n\
.quad 0x9bdc06a725c71235,0xc19bf174cf692694\n\
.quad 0xe49b69c19ef14ad2,0xefbe4786384f25e3\n\
.quad 0x0fc19dc68b8cd5b5,0x240ca1cc77ac9c65\n\
.quad 0x2de92c6f592b0275,0x4a7484aa6ea6e483\n\
.quad 0x5cb0a9dcbd41fbd4,0x76f988da831153b5\n\
.quad 0x983e5152ee66dfab,0xa831c66d2db43210\n\
.quad 0xb00327c898fb213f,0xbf597fc7beef0ee4\n\
.quad 0xc6e00bf33da88fc2,0xd5a79147930aa725\n\
.quad 0x06ca6351e003826f,0x142929670a0e6e70\n\
.quad 0x27b70a8546d22ffc,0x2e1b21385c26c926\n\
.quad 0x4d2c6dfc5ac42aed,0x53380d139d95b3df\n\
.quad 0x650a73548baf63de,0x766a0abb3c77b2a8\n\
.quad 0x81c2c92e47edaee6,0x92722c851482353b\n\
.quad 0xa2bfe8a14cf10364,0xa81a664bbc423001\n\
.quad 0xc24b8b70d0f89791,0xc76c51a30654be30\n\
.quad 0xd192e819d6ef5218,0xd69906245565a910\n\
.quad 0xf40e35855771202a,0x106aa07032bbd1b8\n\
.quad 0x19a4c116b8d2d0c8,0x1e376c085141ab53\n\
.quad 0x2748774cdf8eeb99,0x34b0bcb5e19b48a8\n\
.quad 0x391c0cb3c5c95a63,0x4ed8aa4ae3418acb\n\
.quad 0x5b9cca4f7763e373,0x682e6ff3d6b2b8a3\n\
.quad 0x748f82ee5defb2fc,0x78a5636f43172f60\n\
.quad 0x84c87814a1f0ab72,0x8cc702081a6439ec\n\
.quad 0x90befffa23631e28,0xa4506cebde82bde9\n\
.quad 0xbef9a3f7b2c67915,0xc67178f2e372532b\n\
.quad 0xca273eceea26619c,0xd186b8c721c0c207\n\
.quad 0xeada7dd6cde0eb1e,0xf57d4f7fee6ed178\n\
.quad 0x06f067aa72176fba,0x0a637dc5a2c898a6\n\
.quad 0x113f9804bef90dae,0x1b710b35131c471b\n\
.quad 0x28db77f523047d84,0x32caab7b40c72493\n\
.quad 0x3c9ebe0a15c9bebc,0x431d67c49c100d4c\n\
.quad 0x4cc5d4becb3e42b6,0x597f299cfc657e2a\n\
.quad 0x5fcb6fab3ad6faec,0x6c44198c4a475817\n\
.att_syntax");
#endif
