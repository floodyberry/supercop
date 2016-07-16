#ifndef SHA256_AVX1
#define SHA256_AVX1

#if __APPLE__ && __MACH__
    DO NOT COMPILE
#endif

asm(".intel_syntax noprefix \n");
#if __APPLE__ && __MACH__
asm(".text\n\
    .align 5\n\
    _sha256_avx:\n");
#elif __gnu_linux__
asm(".section .text\n\
    .align 32\n\
    sha256_avx:\n");
#endif
asm("push rbx\n\
    push rbp\n\
    push r13\n\
    push r14\n\
    push r15\n\
    sub rsp,32\n\
    shl rdx, 6\n\
    jz done_hash\n\
    add rdx, rdi\n\
    mov [rsp + 0], rdx\n\
    mov eax,[4*0 + rsi]\n\
    mov ebx,[4*1 + rsi]\n\
    mov ecx,[4*2 + rsi]\n\
    mov r8d,[4*3 + rsi]\n\
    mov edx,[4*4 + rsi]\n\
    mov r9d,[4*5 + rsi]\n\
    mov r10d,[4*6 + rsi]\n\
    mov r11d,[4*7 + rsi]\n\
    vmovdqa xmm13, XMMWORD PTR [PSHUFFLE_BYTE_FLIP_MASK+rip]\n\
    vmovdqa xmm10, XMMWORD PTR [_SHUF_00BA+rip]\n\
    vmovdqa xmm12, XMMWORD PTR [_SHUF_DC00+rip]\n\
    loop0:\n\
    lea rbp,XMMWORD PTR [K256+rip]\n\
    vmovdqu xmm4, [rdi + 0*16]\n\
    vpshufb xmm4, xmm4, xmm13\n\
    vmovdqu xmm5, [rdi + 1*16]\n\
    vpshufb xmm5, xmm5, xmm13\n\
    vmovdqu xmm6, [rdi + 2*16]\n\
    vpshufb xmm6, xmm6, xmm13\n\
    vmovdqu xmm7, [rdi + 3*16]\n\
    vpshufb xmm7, xmm7, xmm13\n\
    mov [rsp + 8], rdi\n\
    mov rdi, 3\n\
    .align 16\n\
    loop1:\n\
    vpaddd xmm9, xmm4, [rbp + 0*16]\n\
    vmovdqa [rsp + 16], xmm9\n\
    mov r13d, edx\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, eax\n\
    vpalignr xmm0, xmm7, xmm6, 4\n\
    shld r14d,r14d,(32-((22-13)))\n\
    xor r13d, edx\n\
    mov r15d, r9d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r14d, eax\n\
    xor r15d, r10d\n\
    vpaddd xmm0, xmm0, xmm4\n\
    xor r13d, edx\n\
    and r15d, edx\n\
    shld r14d,r14d,(32-((13-2)))\n\
    vpalignr xmm1, xmm5, xmm4, 4\n\
    xor r14d, eax\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, r10d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, r13d\n\
    add r15d, [rsp + 16 + 0*4]\n\
    mov r13d, eax\n\
    add r11d, r15d\n\
    mov r15d, eax\n\
    vpsrld xmm2, xmm1, 7\n\
    or r13d, ecx\n\
    add r8d, r11d\n\
    and r15d, ecx\n\
    vpslld xmm3, xmm1, (32-7)\n\
    and r13d, ebx\n\
    add r11d, r14d\n\
    vpor xmm3, xmm3, xmm2\n\
    or r13d, r15d\n\
    add r11d, r13d\n\
    mov r13d, r8d\n\
    mov r14d, r11d\n\
    shld r13d,r13d,(32-((25-11)))\n\
    xor r13d, r8d\n\
    mov r15d, edx\n\
    shld r14d,r14d,(32-((22-13)))\n\
    vpsrld xmm2, xmm1,18\n\
    xor r14d, r11d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r15d, r9d\n\
    vpsrld xmm8, xmm1, 3\n\
    shld r14d,r14d,(32-((13-2)))\n\
    xor r13d, r8d\n\
    and r15d, r8d\n\
    shld r13d,r13d,(32-(6))\n\
    vpslld xmm1, xmm1, (32-18)\n\
    xor r14d, r11d\n\
    xor r15d, r9d\n\
    vpxor xmm3, xmm3, xmm1\n\
    add r15d, r13d\n\
    add r15d, [rsp + 16 + 1*4]\n\
    shld r14d,r14d,(32-(2))\n\
    vpxor xmm3, xmm3, xmm2\n\
    mov r13d, r11d\n\
    add r10d, r15d\n\
    mov r15d, r11d\n\
    vpxor xmm1, xmm3, xmm8\n\
    or r13d, ebx\n\
    add ecx, r10d\n\
    and r15d, ebx\n\
    vpshufd xmm2, xmm7, 0b11111010\n\
    and r13d, eax\n\
    add r10d, r14d\n\
    vpaddd xmm0, xmm0, xmm1\n\
    or r13d, r15d\n\
    add r10d, r13d\n\
    mov r13d, ecx\n\
    mov r14d, r10d\n\
    shld r13d,r13d,(32-((25-11)))\n\
    xor r13d, ecx\n\
    shld r14d,r14d,(32-((22-13)))\n\
    mov r15d, r8d\n\
    xor r14d, r10d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    vpsrld xmm8, xmm2, 10\n\
    xor r15d, edx\n\
    vpsrlq xmm3, xmm2, 19\n\
    xor r13d, ecx\n\
    and r15d, ecx\n\
    vpsrlq xmm2, xmm2, 17\n\
    shld r14d,r14d,(32-((13-2)))\n\
    xor r14d, r10d\n\
    xor r15d, edx\n\
    shld r13d,r13d,(32-(6))\n\
    vpxor xmm2, xmm2, xmm3\n\
    add r15d, r13d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, [rsp + 16 + 2*4]\n\
    vpxor xmm8, xmm8, xmm2\n\
    mov r13d, r10d\n\
    add r9d, r15d\n\
    mov r15d, r10d\n\
    vpshufb xmm8, xmm8, xmm10\n\
    or r13d, eax\n\
    add ebx, r9d\n\
    and r15d, eax\n\
    vpaddd xmm0, xmm0, xmm8\n\
    and r13d, r11d\n\
    add r9d, r14d\n\
    vpshufd xmm2, xmm0, 0b01010000\n\
    or r13d, r15d\n\
    add r9d, r13d\n\
    mov r13d, ebx\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, r9d\n\
    shld r14d,r14d,(32-((22-13)))\n\
    xor r13d, ebx\n\
    mov r15d, ecx\n\
    shld r13d,r13d,(32-((11-6)))\n\
    vpsrld xmm11, xmm2, 10\n\
    xor r14d, r9d\n\
    xor r15d, r8d\n\
    vpsrlq xmm3, xmm2, 19\n\
    xor r13d, ebx\n\
    and r15d, ebx\n\
    shld r14d,r14d,(32-((13-2)))\n\
    vpsrlq xmm2, xmm2, 17\n\
    xor r14d, r9d\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, r8d\n\
    vpxor xmm2, xmm2, xmm3\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, r13d\n\
    add r15d, [rsp + 16 + 3*4]\n\
    vpxor xmm11, xmm11, xmm2\n\
    mov r13d, r9d\n\
    add edx, r15d\n\
    mov r15d, r9d\n\
    vpshufb xmm11, xmm11, xmm12\n\
    or r13d, r11d\n\
    add eax, edx\n\
    and r15d, r11d\n\
    vpaddd xmm4, xmm11, xmm0\n\
    and r13d, r10d\n\
    add edx, r14d\n\
    or r13d, r15d\n\
    add edx, r13d\n\
    vpaddd xmm9, xmm5, [rbp + 1*16]\n\
    vmovdqa [rsp + 16], xmm9\n\
    mov r13d, eax\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, edx\n\
    vpalignr xmm0, xmm4, xmm7, 4\n\
    shld r14d,r14d,(32-((22-13)))\n\
    xor r13d, eax\n\
    mov r15d, ebx\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r14d, edx\n\
    xor r15d, ecx\n\
    vpaddd xmm0, xmm0, xmm5\n\
    xor r13d, eax\n\
    and r15d, eax\n\
    shld r14d,r14d,(32-((13-2)))\n\
    vpalignr xmm1, xmm6, xmm5, 4\n\
    xor r14d, edx\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, ecx\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, r13d\n\
    add r15d, [rsp + 16 + 0*4]\n\
    mov r13d, edx\n\
    add r8d, r15d\n\
    mov r15d, edx\n\
    vpsrld xmm2, xmm1, 7\n\
    or r13d, r10d\n\
    add r11d, r8d\n\
    and r15d, r10d\n\
    vpslld xmm3, xmm1, (32-7)\n\
    and r13d, r9d\n\
    add r8d, r14d\n\
    vpor xmm3, xmm3, xmm2\n\
    or r13d, r15d\n\
    add r8d, r13d\n\
    mov r13d, r11d\n\
    mov r14d, r8d\n\
    shld r13d,r13d,(32-((25-11)))\n\
    xor r13d, r11d\n\
    mov r15d, eax\n\
    shld r14d,r14d,(32-((22-13)))\n\
    vpsrld xmm2, xmm1,18\n\
    xor r14d, r8d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r15d, ebx\n\
    vpsrld xmm8, xmm1, 3\n\
    shld r14d,r14d,(32-((13-2)))\n\
    xor r13d, r11d\n\
    and r15d, r11d\n\
    shld r13d,r13d,(32-(6))\n\
    vpslld xmm1, xmm1, (32-18)\n\
    xor r14d, r8d\n\
    xor r15d, ebx\n\
    vpxor xmm3, xmm3, xmm1\n\
    add r15d, r13d\n\
    add r15d, [rsp + 16 + 1*4]\n\
    shld r14d,r14d,(32-(2))\n\
    vpxor xmm3, xmm3, xmm2\n\
    mov r13d, r8d\n\
    add ecx, r15d\n\
    mov r15d, r8d\n\
    vpxor xmm1, xmm3, xmm8\n\
    or r13d, r9d\n\
    add r10d, ecx\n\
    and r15d, r9d\n\
    vpshufd xmm2, xmm4, 0b11111010\n\
    and r13d, edx\n\
    add ecx, r14d\n\
    vpaddd xmm0, xmm0, xmm1\n\
    or r13d, r15d\n\
    add ecx, r13d\n\
    mov r13d, r10d\n\
    mov r14d, ecx\n\
    shld r13d,r13d,(32-((25-11)))\n\
    xor r13d, r10d\n\
    shld r14d,r14d,(32-((22-13)))\n\
    mov r15d, r11d\n\
    xor r14d, ecx\n\
    shld r13d,r13d,(32-((11-6)))\n\
    vpsrld xmm8, xmm2, 10\n\
    xor r15d, eax\n\
    vpsrlq xmm3, xmm2, 19\n\
    xor r13d, r10d\n\
    and r15d, r10d\n\
    vpsrlq xmm2, xmm2, 17\n\
    shld r14d,r14d,(32-((13-2)))\n\
    xor r14d, ecx\n\
    xor r15d, eax\n\
    shld r13d,r13d,(32-(6))\n\
    vpxor xmm2, xmm2, xmm3\n\
    add r15d, r13d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, [rsp + 16 + 2*4]\n\
    vpxor xmm8, xmm8, xmm2\n\
    mov r13d, ecx\n\
    add ebx, r15d\n\
    mov r15d, ecx\n\
    vpshufb xmm8, xmm8, xmm10\n\
    or r13d, edx\n\
    add r9d, ebx\n\
    and r15d, edx\n\
    vpaddd xmm0, xmm0, xmm8\n\
    and r13d, r8d\n\
    add ebx, r14d\n\
    vpshufd xmm2, xmm0, 0b01010000\n\
    or r13d, r15d\n\
    add ebx, r13d\n\
    mov r13d, r9d\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, ebx\n\
    shld r14d,r14d,(32-((22-13)))\n\
    xor r13d, r9d\n\
    mov r15d, r10d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    vpsrld xmm11, xmm2, 10\n\
    xor r14d, ebx\n\
    xor r15d, r11d\n\
    vpsrlq xmm3, xmm2, 19\n\
    xor r13d, r9d\n\
    and r15d, r9d\n\
    shld r14d,r14d,(32-((13-2)))\n\
    vpsrlq xmm2, xmm2, 17\n\
    xor r14d, ebx\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, r11d\n\
    vpxor xmm2, xmm2, xmm3\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, r13d\n\
    add r15d, [rsp + 16 + 3*4]\n\
    vpxor xmm11, xmm11, xmm2\n\
    mov r13d, ebx\n\
    add eax, r15d\n\
    mov r15d, ebx\n\
    vpshufb xmm11, xmm11, xmm12\n\
    or r13d, r8d\n\
    add edx, eax\n\
    and r15d, r8d\n\
    vpaddd xmm5, xmm11, xmm0\n\
    and r13d, ecx\n\
    add eax, r14d\n\
    or r13d, r15d\n\
    add eax, r13d\n\
    vpaddd xmm9, xmm6, [rbp + 2*16]\n\
    vmovdqa [rsp + 16], xmm9\n\
    mov r13d, edx\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, eax\n\
    vpalignr xmm0, xmm5, xmm4, 4\n\
    shld r14d,r14d,(32-((22-13)))\n\
    xor r13d, edx\n\
    mov r15d, r9d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r14d, eax\n\
    xor r15d, r10d\n\
    vpaddd xmm0, xmm0, xmm6\n\
    xor r13d, edx\n\
    and r15d, edx\n\
    shld r14d,r14d,(32-((13-2)))\n\
    vpalignr xmm1, xmm7, xmm6, 4\n\
    xor r14d, eax\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, r10d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, r13d\n\
    add r15d, [rsp + 16 + 0*4]\n\
    mov r13d, eax\n\
    add r11d, r15d\n\
    mov r15d, eax\n\
    vpsrld xmm2, xmm1, 7\n\
    or r13d, ecx\n\
    add r8d, r11d\n\
    and r15d, ecx\n\
    vpslld xmm3, xmm1, (32-7)\n\
    and r13d, ebx\n\
    add r11d, r14d\n\
    vpor xmm3, xmm3, xmm2\n\
    or r13d, r15d\n\
    add r11d, r13d\n\
    mov r13d, r8d\n\
    mov r14d, r11d\n\
    shld r13d,r13d,(32-((25-11)))\n\
    xor r13d, r8d\n\
    mov r15d, edx\n\
    shld r14d,r14d,(32-((22-13)))\n\
    vpsrld xmm2, xmm1,18\n\
    xor r14d, r11d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r15d, r9d\n\
    vpsrld xmm8, xmm1, 3\n\
    shld r14d,r14d,(32-((13-2)))\n\
    xor r13d, r8d\n\
    and r15d, r8d\n\
    shld r13d,r13d,(32-(6))\n\
    vpslld xmm1, xmm1, (32-18)\n\
    xor r14d, r11d\n\
    xor r15d, r9d\n\
    vpxor xmm3, xmm3, xmm1\n\
    add r15d, r13d\n\
    add r15d, [rsp + 16 + 1*4]\n\
    shld r14d,r14d,(32-(2))\n\
    vpxor xmm3, xmm3, xmm2\n\
    mov r13d, r11d\n\
    add r10d, r15d\n\
    mov r15d, r11d\n\
    vpxor xmm1, xmm3, xmm8\n\
    or r13d, ebx\n\
    add ecx, r10d\n\
    and r15d, ebx\n\
    vpshufd xmm2, xmm5, 0b11111010\n\
    and r13d, eax\n\
    add r10d, r14d\n\
    vpaddd xmm0, xmm0, xmm1\n\
    or r13d, r15d\n\
    add r10d, r13d\n\
    mov r13d, ecx\n\
    mov r14d, r10d\n\
    shld r13d,r13d,(32-((25-11)))\n\
    xor r13d, ecx\n\
    shld r14d,r14d,(32-((22-13)))\n\
    mov r15d, r8d\n\
    xor r14d, r10d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    vpsrld xmm8, xmm2, 10\n\
    xor r15d, edx\n\
    vpsrlq xmm3, xmm2, 19\n\
    xor r13d, ecx\n\
    and r15d, ecx\n\
    vpsrlq xmm2, xmm2, 17\n\
    shld r14d,r14d,(32-((13-2)))\n\
    xor r14d, r10d\n\
    xor r15d, edx\n\
    shld r13d,r13d,(32-(6))\n\
    vpxor xmm2, xmm2, xmm3\n\
    add r15d, r13d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, [rsp + 16 + 2*4]\n\
    vpxor xmm8, xmm8, xmm2\n\
    mov r13d, r10d\n\
    add r9d, r15d\n\
    mov r15d, r10d\n\
    vpshufb xmm8, xmm8, xmm10\n\
    or r13d, eax\n\
    add ebx, r9d\n\
    and r15d, eax\n\
    vpaddd xmm0, xmm0, xmm8\n\
    and r13d, r11d\n\
    add r9d, r14d\n\
    vpshufd xmm2, xmm0, 0b01010000\n\
    or r13d, r15d\n\
    add r9d, r13d\n\
    mov r13d, ebx\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, r9d\n\
    shld r14d,r14d,(32-((22-13)))\n\
    xor r13d, ebx\n\
    mov r15d, ecx\n\
    shld r13d,r13d,(32-((11-6)))\n\
    vpsrld xmm11, xmm2, 10\n\
    xor r14d, r9d\n\
    xor r15d, r8d\n\
    vpsrlq xmm3, xmm2, 19\n\
    xor r13d, ebx\n\
    and r15d, ebx\n\
    shld r14d,r14d,(32-((13-2)))\n\
    vpsrlq xmm2, xmm2, 17\n\
    xor r14d, r9d\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, r8d\n\
    vpxor xmm2, xmm2, xmm3\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, r13d\n\
    add r15d, [rsp + 16 + 3*4]\n\
    vpxor xmm11, xmm11, xmm2\n\
    mov r13d, r9d\n\
    add edx, r15d\n\
    mov r15d, r9d\n\
    vpshufb xmm11, xmm11, xmm12\n\
    or r13d, r11d\n\
    add eax, edx\n\
    and r15d, r11d\n\
    vpaddd xmm6, xmm11, xmm0\n\
    and r13d, r10d\n\
    add edx, r14d\n\
    or r13d, r15d\n\
    add edx, r13d\n\
    vpaddd xmm9, xmm7, [rbp + 3*16]\n\
    vmovdqa [rsp + 16], xmm9\n\
    add rbp, 4*16\n\
    mov r13d, eax\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, edx\n\
    vpalignr xmm0, xmm6, xmm5, 4\n\
    shld r14d,r14d,(32-((22-13)))\n\
    xor r13d, eax\n\
    mov r15d, ebx\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r14d, edx\n\
    xor r15d, ecx\n\
    vpaddd xmm0, xmm0, xmm7\n\
    xor r13d, eax\n\
    and r15d, eax\n\
    shld r14d,r14d,(32-((13-2)))\n\
    vpalignr xmm1, xmm4, xmm7, 4\n\
    xor r14d, edx\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, ecx\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, r13d\n\
    add r15d, [rsp + 16 + 0*4]\n\
    mov r13d, edx\n\
    add r8d, r15d\n\
    mov r15d, edx\n\
    vpsrld xmm2, xmm1, 7\n\
    or r13d, r10d\n\
    add r11d, r8d\n\
    and r15d, r10d\n\
    vpslld xmm3, xmm1, (32-7)\n\
    and r13d, r9d\n\
    add r8d, r14d\n\
    vpor xmm3, xmm3, xmm2\n\
    or r13d, r15d\n\
    add r8d, r13d\n\
    mov r13d, r11d\n\
    mov r14d, r8d\n\
    shld r13d,r13d,(32-((25-11)))\n\
    xor r13d, r11d\n\
    mov r15d, eax\n\
    shld r14d,r14d,(32-((22-13)))\n\
    vpsrld xmm2, xmm1,18\n\
    xor r14d, r8d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r15d, ebx\n\
    vpsrld xmm8, xmm1, 3\n\
    shld r14d,r14d,(32-((13-2)))\n\
    xor r13d, r11d\n\
    and r15d, r11d\n\
    shld r13d,r13d,(32-(6))\n\
    vpslld xmm1, xmm1, (32-18)\n\
    xor r14d, r8d\n\
    xor r15d, ebx\n\
    vpxor xmm3, xmm3, xmm1\n\
    add r15d, r13d\n\
    add r15d, [rsp + 16 + 1*4]\n\
    shld r14d,r14d,(32-(2))\n\
    vpxor xmm3, xmm3, xmm2\n\
    mov r13d, r8d\n\
    add ecx, r15d\n\
    mov r15d, r8d\n\
    vpxor xmm1, xmm3, xmm8\n\
    or r13d, r9d\n\
    add r10d, ecx\n\
    and r15d, r9d\n\
    vpshufd xmm2, xmm6, 0b11111010\n\
    and r13d, edx\n\
    add ecx, r14d\n\
    vpaddd xmm0, xmm0, xmm1\n\
    or r13d, r15d\n\
    add ecx, r13d\n\
    mov r13d, r10d\n\
    mov r14d, ecx\n\
    shld r13d,r13d,(32-((25-11)))\n\
    xor r13d, r10d\n\
    shld r14d,r14d,(32-((22-13)))\n\
    mov r15d, r11d\n\
    xor r14d, ecx\n\
    shld r13d,r13d,(32-((11-6)))\n\
    vpsrld xmm8, xmm2, 10\n\
    xor r15d, eax\n\
    vpsrlq xmm3, xmm2, 19\n\
    xor r13d, r10d\n\
    and r15d, r10d\n\
    vpsrlq xmm2, xmm2, 17\n\
    shld r14d,r14d,(32-((13-2)))\n\
    xor r14d, ecx\n\
    xor r15d, eax\n\
    shld r13d,r13d,(32-(6))\n\
    vpxor xmm2, xmm2, xmm3\n\
    add r15d, r13d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, [rsp + 16 + 2*4]\n\
    vpxor xmm8, xmm8, xmm2\n\
    mov r13d, ecx\n\
    add ebx, r15d\n\
    mov r15d, ecx\n\
    vpshufb xmm8, xmm8, xmm10\n\
    or r13d, edx\n\
    add r9d, ebx\n\
    and r15d, edx\n\
    vpaddd xmm0, xmm0, xmm8\n\
    and r13d, r8d\n\
    add ebx, r14d\n\
    vpshufd xmm2, xmm0, 0b01010000\n\
    or r13d, r15d\n\
    add ebx, r13d\n\
    mov r13d, r9d\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, ebx\n\
    shld r14d,r14d,(32-((22-13)))\n\
    xor r13d, r9d\n\
    mov r15d, r10d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    vpsrld xmm11, xmm2, 10\n\
    xor r14d, ebx\n\
    xor r15d, r11d\n\
    vpsrlq xmm3, xmm2, 19\n\
    xor r13d, r9d\n\
    and r15d, r9d\n\
    shld r14d,r14d,(32-((13-2)))\n\
    vpsrlq xmm2, xmm2, 17\n\
    xor r14d, ebx\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, r11d\n\
    vpxor xmm2, xmm2, xmm3\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, r13d\n\
    add r15d, [rsp + 16 + 3*4]\n\
    vpxor xmm11, xmm11, xmm2\n\
    mov r13d, ebx\n\
    add eax, r15d\n\
    mov r15d, ebx\n\
    vpshufb xmm11, xmm11, xmm12\n\
    or r13d, r8d\n\
    add edx, eax\n\
    and r15d, r8d\n\
    vpaddd xmm7, xmm11, xmm0\n\
    and r13d, ecx\n\
    add eax, r14d\n\
    or r13d, r15d\n\
    add eax, r13d\n\
    sub rdi, 1\n\
    jne loop1\n\
    mov rdi, 2\n\
    loop2:\n\
    vpaddd xmm9, xmm4, [rbp + 0*16]\n\
    vmovdqa [rsp + 16], xmm9\n\
    mov r13d, edx\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, eax\n\
    xor r13d, edx\n\
    shld r14d,r14d,(32-((22-13)))\n\
    mov r15d, r9d\n\
    xor r14d, eax\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r15d, r10d\n\
    xor r13d, edx\n\
    shld r14d,r14d,(32-((13-2)))\n\
    and r15d, edx\n\
    xor r14d, eax\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, r10d\n\
    add r15d, r13d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, [rsp + 16 + 0 * 4]\n\
    mov r13d, eax\n\
    add r11d, r15d\n\
    mov r15d, eax\n\
    or r13d, ecx\n\
    add r8d, r11d\n\
    and r15d, ecx\n\
    and r13d, ebx\n\
    add r11d, r14d\n\
    or r13d, r15d\n\
    add r11d, r13d\n\
    mov r13d, r8d\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, r11d\n\
    xor r13d, r8d\n\
    shld r14d,r14d,(32-((22-13)))\n\
    mov r15d, edx\n\
    xor r14d, r11d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r15d, r9d\n\
    xor r13d, r8d\n\
    shld r14d,r14d,(32-((13-2)))\n\
    and r15d, r8d\n\
    xor r14d, r11d\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, r9d\n\
    add r15d, r13d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, [rsp + 16 + 1 * 4]\n\
    mov r13d, r11d\n\
    add r10d, r15d\n\
    mov r15d, r11d\n\
    or r13d, ebx\n\
    add ecx, r10d\n\
    and r15d, ebx\n\
    and r13d, eax\n\
    add r10d, r14d\n\
    or r13d, r15d\n\
    add r10d, r13d\n\
    mov r13d, ecx\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, r10d\n\
    xor r13d, ecx\n\
    shld r14d,r14d,(32-((22-13)))\n\
    mov r15d, r8d\n\
    xor r14d, r10d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r15d, edx\n\
    xor r13d, ecx\n\
    shld r14d,r14d,(32-((13-2)))\n\
    and r15d, ecx\n\
    xor r14d, r10d\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, edx\n\
    add r15d, r13d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, [rsp + 16 + 2 * 4]\n\
    mov r13d, r10d\n\
    add r9d, r15d\n\
    mov r15d, r10d\n\
    or r13d, eax\n\
    add ebx, r9d\n\
    and r15d, eax\n\
    and r13d, r11d\n\
    add r9d, r14d\n\
    or r13d, r15d\n\
    add r9d, r13d\n\
    mov r13d, ebx\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, r9d\n\
    xor r13d, ebx\n\
    shld r14d,r14d,(32-((22-13)))\n\
    mov r15d, ecx\n\
    xor r14d, r9d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r15d, r8d\n\
    xor r13d, ebx\n\
    shld r14d,r14d,(32-((13-2)))\n\
    and r15d, ebx\n\
    xor r14d, r9d\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, r8d\n\
    add r15d, r13d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, [rsp + 16 + 3 * 4]\n\
    mov r13d, r9d\n\
    add edx, r15d\n\
    mov r15d, r9d\n\
    or r13d, r11d\n\
    add eax, edx\n\
    and r15d, r11d\n\
    and r13d, r10d\n\
    add edx, r14d\n\
    or r13d, r15d\n\
    add edx, r13d\n\
    vpaddd xmm9, xmm5, [rbp + 1*16]\n\
    vmovdqa [rsp + 16], xmm9\n\
    add rbp, 2*16\n\
    mov r13d, eax\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, edx\n\
    xor r13d, eax\n\
    shld r14d,r14d,(32-((22-13)))\n\
    mov r15d, ebx\n\
    xor r14d, edx\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r15d, ecx\n\
    xor r13d, eax\n\
    shld r14d,r14d,(32-((13-2)))\n\
    and r15d, eax\n\
    xor r14d, edx\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, ecx\n\
    add r15d, r13d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, [rsp + 16 + 0 * 4]\n\
    mov r13d, edx\n\
    add r8d, r15d\n\
    mov r15d, edx\n\
    or r13d, r10d\n\
    add r11d, r8d\n\
    and r15d, r10d\n\
    and r13d, r9d\n\
    add r8d, r14d\n\
    or r13d, r15d\n\
    add r8d, r13d\n\
    mov r13d, r11d\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, r8d\n\
    xor r13d, r11d\n\
    shld r14d,r14d,(32-((22-13)))\n\
    mov r15d, eax\n\
    xor r14d, r8d\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r15d, ebx\n\
    xor r13d, r11d\n\
    shld r14d,r14d,(32-((13-2)))\n\
    and r15d, r11d\n\
    xor r14d, r8d\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, ebx\n\
    add r15d, r13d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, [rsp + 16 + 1 * 4]\n\
    mov r13d, r8d\n\
    add ecx, r15d\n\
    mov r15d, r8d\n\
    or r13d, r9d\n\
    add r10d, ecx\n\
    and r15d, r9d\n\
    and r13d, edx\n\
    add ecx, r14d\n\
    or r13d, r15d\n\
    add ecx, r13d\n\
    mov r13d, r10d\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, ecx\n\
    xor r13d, r10d\n\
    shld r14d,r14d,(32-((22-13)))\n\
    mov r15d, r11d\n\
    xor r14d, ecx\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r15d, eax\n\
    xor r13d, r10d\n\
    shld r14d,r14d,(32-((13-2)))\n\
    and r15d, r10d\n\
    xor r14d, ecx\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, eax\n\
    add r15d, r13d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, [rsp + 16 + 2 * 4]\n\
    mov r13d, ecx\n\
    add ebx, r15d\n\
    mov r15d, ecx\n\
    or r13d, edx\n\
    add r9d, ebx\n\
    and r15d, edx\n\
    and r13d, r8d\n\
    add ebx, r14d\n\
    or r13d, r15d\n\
    add ebx, r13d\n\
    mov r13d, r9d\n\
    shld r13d,r13d,(32-((25-11)))\n\
    mov r14d, ebx\n\
    xor r13d, r9d\n\
    shld r14d,r14d,(32-((22-13)))\n\
    mov r15d, r10d\n\
    xor r14d, ebx\n\
    shld r13d,r13d,(32-((11-6)))\n\
    xor r15d, r11d\n\
    xor r13d, r9d\n\
    shld r14d,r14d,(32-((13-2)))\n\
    and r15d, r9d\n\
    xor r14d, ebx\n\
    shld r13d,r13d,(32-(6))\n\
    xor r15d, r11d\n\
    add r15d, r13d\n\
    shld r14d,r14d,(32-(2))\n\
    add r15d, [rsp + 16 + 3 * 4]\n\
    mov r13d, ebx\n\
    add eax, r15d\n\
    mov r15d, ebx\n\
    or r13d, r8d\n\
    add edx, eax\n\
    and r15d, r8d\n\
    and r13d, ecx\n\
    add eax, r14d\n\
    or r13d, r15d\n\
    add eax, r13d\n\
    vmovdqa xmm4, xmm6\n\
    vmovdqa xmm5, xmm7\n\
    sub rdi, 1\n\
    jne loop2\n\
    add eax, [4*0 + rsi]\n\
    mov [4*0 + rsi], eax\n\
    add ebx, [4*1 + rsi]\n\
    mov [4*1 + rsi], ebx\n\
    add ecx, [4*2 + rsi]\n\
    mov [4*2 + rsi], ecx\n\
    add r8d, [4*3 + rsi]\n\
    mov [4*3 + rsi], r8d\n\
    add edx, [4*4 + rsi]\n\
    mov [4*4 + rsi], edx\n\
    add r9d, [4*5 + rsi]\n\
    mov [4*5 + rsi], r9d\n\
    add r10d, [4*6 + rsi]\n\
    mov [4*6 + rsi], r10d\n\
    add r11d, [4*7 + rsi]\n\
    mov [4*7 + rsi], r11d\n\
    mov rdi, [rsp + 8]\n\
    add rdi, 64\n\
    cmp rdi, [rsp + 0]\n\
    jne loop0\n\
    done_hash:\n\
    add rsp, 32\n\
    pop r15\n\
    pop r14\n\
    pop r13\n\
    pop rbp\n\
    pop rbx\n\
    ret\n");
#if __APPLE__ && __MACH__
asm(".data\n\
    .align 6\n");
#elif __gnu_linux__
asm(".section .data\n\
    .align 64\n");
#endif
asm("K256:\n\
    .long 0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5\n\
    .long 0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5\n\
    .long 0xd807aa98,0x12835b01,0x243185be,0x550c7dc3\n\
    .long 0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174\n\
    .long 0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc\n\
    .long 0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da\n\
    .long 0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7\n\
    .long 0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967\n\
    .long 0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13\n\
    .long 0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85\n\
    .long 0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3\n\
    .long 0xd192e819,0xd6990624,0xf40e3585,0x106aa070\n\
    .long 0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5\n\
    .long 0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3\n\
    .long 0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208\n\
    .long 0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2\n");
#if __APPLE__ && __MACH__
asm("PSHUFFLE_BYTE_FLIP_MASK:\n\
    .quad 0x0c0d0e0f08090a0b, 0x0405060700010203\n\
    _SHUF_00BA:\n\
    .quad 0xFFFFFFFFFFFFFFFF, 0x0b0a090803020100\n\
    _SHUF_DC00:\n\
    .quad 0x0b0a090803020100, 0xFFFFFFFFFFFFFFFF\n\
    .att_syntax\n\
    .text\n");
#elif __gnu_linux__
asm("PSHUFFLE_BYTE_FLIP_MASK:\n\
    .octa 0x0c0d0e0f08090a0b0405060700010203\n\
    _SHUF_00BA:\n\
    .octa 0xFFFFFFFFFFFFFFFF0b0a090803020100\n\
    _SHUF_DC00:\n\
    .octa 0x0b0a090803020100FFFFFFFFFFFFFFFF\n\
    .att_syntax\n\
    .section .text\n");
#endif
#endif
