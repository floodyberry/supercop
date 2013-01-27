# Generated using Intel C++ Compiler 13.0 (icc -std=c99 -O3 -march=core-avx-i -S -masm=intel)
# This code is for research purposes only, and should not be used in the context of any commercial activity
	.intel_syntax noprefix
	.file "blake2b.c"
	.text
..TXTST0:
       .align    16,0x90
	.globl crypto_hash_blake2b_avxicc
    .globl _crypto_hash_blake2b_avxicc
crypto_hash_blake2b_avxicc:
_crypto_hash_blake2b_avxicc:
..B1.1:                         
..___tag_value_crypto_hash.1:                                   
        sub       rsp, 552                                      
..___tag_value_crypto_hash.3:                                   
        xor       r11d, r11d                                    
        xor       ecx, ecx                                      
        mov       r9, rsi                                       
        vmovdqu   xmm2, XMMWORD PTR .L_2il0floatpacket.13[rip]  
        xor       eax, eax                                      
        vmovdqu   xmm3, XMMWORD PTR .L_2il0floatpacket.14[rip]  
        mov       r8, rdx                                       
        vmovdqu   xmm4, XMMWORD PTR .L_2il0floatpacket.15[rip]  
        xor       r10d, r10d                                    
        vmovdqu   xmm11, XMMWORD PTR .L_2il0floatpacket.16[rip] 
        vmovdqu   xmm1, XMMWORD PTR .L_2il0floatpacket.11[rip]  
        vmovdqu   xmm0, XMMWORD PTR .L_2il0floatpacket.12[rip]  
        vmovdqu   XMMWORD PTR [448+rsp], xmm2                   
        vmovdqu   XMMWORD PTR [464+rsp], xmm3                   
        vmovdqu   XMMWORD PTR [496+rsp], xmm4                   
        vmovdqu   XMMWORD PTR [480+rsp], xmm11                  
        vmovdqu   xmm5, XMMWORD PTR .L_2il0floatpacket.17[rip]  
        cmp       rdx, 128                                      
        jbe       ..B1.5        
                                
..B1.2:                         
        mov       QWORD PTR [rsp], rbp                          
        lea       rsi, QWORD PTR [-1+rdx]                       
        sar       rsi, 6                                        
..___tag_value_crypto_hash.4:                                   
        mov       rbp, rcx                                      
        shr       rsi, 57                                       
        mov       rcx, rax                                      
        lea       rdx, QWORD PTR [-1+rsi+rdx]                   
        sar       rdx, 7                                        
        mov       rax, rdx                                      
                                
..B1.3:                         
        vmovdqu   xmm13, XMMWORD PTR [rcx+r9]                   
        vmovdqu   xmm10, XMMWORD PTR [16+rcx+r9]                
        vmovdqu   xmm15, XMMWORD PTR [32+rcx+r9]                
        vmovdqu   xmm3, XMMWORD PTR [48+rcx+r9]                 
        vmovdqu   xmm6, XMMWORD PTR [112+rcx+r9]                
        vpunpcklqdq xmm7, xmm13, xmm10                          
        lea       r11, QWORD PTR [128+rcx]                      
        vpunpcklqdq xmm2, xmm15, xmm3                           
        vmovdqu   XMMWORD PTR [80+rsp], xmm7                    
        vpaddq    xmm7, xmm7, XMMWORD PTR [448+rsp]             
        vpaddq    xmm5, xmm2, XMMWORD PTR [464+rsp]             
        vmovdqu   xmm9, XMMWORD PTR [496+rsp]                   
        vmovd     xmm4, r11                                     
        vmovdqu   xmm12, XMMWORD PTR [480+rsp]                  
        vpaddq    xmm14, xmm7, xmm9                             
        vpaddq    xmm11, xmm5, xmm12                            
        vpxor     xmm8, xmm4, XMMWORD PTR .L_2il0floatpacket.15[rip] 
        vmovdqu   XMMWORD PTR [208+rsp], xmm2                   
        vpxor     xmm7, xmm8, xmm14                             
        vpxor     xmm2, xmm11, XMMWORD PTR .L_2il0floatpacket.16[rip] 
        vpshufd   xmm7, xmm7, 177                               
        vpshufd   xmm2, xmm2, 177                               
        vpaddq    xmm5, xmm7, XMMWORD PTR .L_2il0floatpacket.17[rip] 
        vpaddq    xmm4, xmm2, XMMWORD PTR .L_2il0floatpacket.14[rip] 
        vpxor     xmm9, xmm9, xmm5                              
        vpxor     xmm12, xmm12, xmm4                            
        vpshufb   xmm8, xmm9, xmm0                              
        vpshufb   xmm12, xmm12, xmm0                            
        vpunpckhqdq xmm10, xmm13, xmm10                         
        vpunpckhqdq xmm13, xmm15, xmm3                          
        vmovdqu   XMMWORD PTR [352+rsp], xmm3                   
        vpaddq    xmm3, xmm14, xmm10                            
        vpaddq    xmm14, xmm11, xmm13                           
        vpaddq    xmm3, xmm3, xmm8                              
        vpaddq    xmm14, xmm14, xmm12                           
        vmovdqu   XMMWORD PTR [304+rsp], xmm15                  
        vpxor     xmm15, xmm7, xmm3                             
        vpxor     xmm11, xmm2, xmm14                            
        vmovdqu   XMMWORD PTR [16+rsp], xmm10                   
        vmovdqu   XMMWORD PTR [128+rsp], xmm13                  
        vpshufb   xmm10, xmm15, xmm1                            
        vpshufb   xmm13, xmm11, xmm1                            
        vpaddq    xmm5, xmm5, xmm10                             
        vpaddq    xmm15, xmm4, xmm13                            
        vpxor     xmm7, xmm8, xmm5                              
        vpxor     xmm8, xmm12, xmm15                            
        vpaddq    xmm4, xmm7, xmm7                              
        vpaddq    xmm11, xmm8, xmm8                             
        vpsrlq    xmm2, xmm7, 63                                
        vpsrlq    xmm12, xmm8, 63                               
        vpor      xmm9, xmm2, xmm4                              
        vpor      xmm7, xmm12, xmm11                            
        vpalignr  xmm4, xmm7, xmm9, 8                           
        vpalignr  xmm11, xmm9, xmm7, 8                          
        vmovdqu   xmm7, XMMWORD PTR [80+rcx+r9]                 
        vmovdqu   xmm2, XMMWORD PTR [64+rcx+r9]                 
        vmovdqu   xmm9, XMMWORD PTR [96+rcx+r9]                 
        vpunpcklqdq xmm12, xmm2, xmm7                           
        vpunpcklqdq xmm8, xmm9, xmm6                            
        vpaddq    xmm3, xmm3, xmm12                             
        vpaddq    xmm14, xmm14, xmm8                            
        vpaddq    xmm3, xmm3, xmm4                              
        vmovdqu   XMMWORD PTR [240+rsp], xmm8                   
        vpaddq    xmm8, xmm14, xmm11                            
        vpalignr  xmm14, xmm10, xmm13, 8                        
        vpalignr  xmm10, xmm13, xmm10, 8                        
        vmovdqu   XMMWORD PTR [64+rsp], xmm12                   
        vpxor     xmm12, xmm14, xmm3                            
        vpxor     xmm13, xmm10, xmm8                            
        vpshufd   xmm12, xmm12, 177                             
        vpshufd   xmm10, xmm13, 177                             
        vpaddq    xmm13, xmm15, xmm12                           
        vpaddq    xmm14, xmm5, xmm10                            
        vpxor     xmm5, xmm4, xmm13                             
        vpxor     xmm4, xmm11, xmm14                            
        vpshufb   xmm5, xmm5, xmm0                              
        vpshufb   xmm15, xmm4, xmm0                             
        vpunpckhqdq xmm4, xmm2, xmm7                            
        vpunpckhqdq xmm11, xmm9, xmm6                           
        vpaddq    xmm3, xmm3, xmm4                              
        vpaddq    xmm8, xmm8, xmm11                             
        vmovdqu   XMMWORD PTR [48+rsp], xmm4                    
        vpaddq    xmm4, xmm3, xmm5                              
        vpaddq    xmm3, xmm8, xmm15                             
        vmovdqu   XMMWORD PTR [160+rsp], xmm11                  
        vpxor     xmm11, xmm12, xmm4                            
        vpxor     xmm10, xmm10, xmm3                            
        vpshufb   xmm12, xmm11, xmm1                            
        vpshufb   xmm10, xmm10, xmm1                            
        vpaddq    xmm13, xmm13, xmm12                           
        vpaddq    xmm11, xmm14, xmm10                           
        vpxor     xmm5, xmm5, xmm13                             
        vpxor     xmm15, xmm15, xmm11                           
        vpsrlq    xmm14, xmm5, 63                               
        vpsrlq    xmm8, xmm15, 63                               
        vpaddq    xmm5, xmm5, xmm5                              
        vpaddq    xmm15, xmm15, xmm15                           
        vpor      xmm5, xmm14, xmm5                             
        vpor      xmm14, xmm8, xmm15                            
        vpalignr  xmm15, xmm5, xmm14, 8                         
        vpalignr  xmm8, xmm14, xmm5, 8                          
        vmovdqu   xmm5, XMMWORD PTR [32+rcx+r9]                 
        vpunpckhqdq xmm9, xmm2, xmm9                            
        vpunpcklqdq xmm14, xmm6, xmm5                           
        vmovdqu   XMMWORD PTR [144+rsp], xmm9                   
        vpaddq    xmm9, xmm3, xmm9                              
        vpaddq    xmm4, xmm4, xmm14                             
        vmovdqu   XMMWORD PTR [192+rsp], xmm14                  
        vpaddq    xmm14, xmm9, xmm8                             
        vpaddq    xmm4, xmm4, xmm15                             
        vpalignr  xmm3, xmm10, xmm12, 8                         
        vpalignr  xmm12, xmm12, xmm10, 8                        
        vpxor     xmm9, xmm3, xmm4                              
        vpxor     xmm10, xmm12, xmm14                           
        vpshufd   xmm10, xmm10, 177                             
        vpshufd   xmm3, xmm9, 177                               
        vpaddq    xmm13, xmm13, xmm10                           
        vpaddq    xmm9, xmm11, xmm3                             
        vpxor     xmm11, xmm8, xmm13                            
        vpxor     xmm15, xmm15, xmm9                            
        vpunpcklqdq xmm8, xmm7, xmm2                            
        vmovdqu   xmm2, XMMWORD PTR [48+rcx+r9]                 
        vpaddq    xmm4, xmm4, xmm8                              
        vpshufb   xmm15, xmm15, xmm0                            
        vpshufb   xmm11, xmm11, xmm0                            
        vpalignr  xmm12, xmm2, xmm6, 8                          
        vpaddq    xmm14, xmm14, xmm12                           
        vmovdqu   XMMWORD PTR [176+rsp], xmm8                   
        vmovdqu   XMMWORD PTR [112+rsp], xmm12                  
        vpaddq    xmm8, xmm4, xmm15                             
        vpaddq    xmm12, xmm14, xmm11                           
        vpxor     xmm3, xmm3, xmm8                              
        vpxor     xmm10, xmm10, xmm12                           
        vpshufb   xmm3, xmm3, xmm1                              
        vpshufb   xmm4, xmm10, xmm1                             
        vpaddq    xmm10, xmm9, xmm3                             
        vpaddq    xmm14, xmm13, xmm4                            
        vpxor     xmm15, xmm15, xmm10                           
        vpxor     xmm13, xmm11, xmm14                           
        vpaddq    xmm9, xmm15, xmm15                            
        vpsrlq    xmm11, xmm15, 63                              
        vpsrlq    xmm15, xmm13, 63                              
        vpaddq    xmm13, xmm13, xmm13                           
        vpor      xmm11, xmm11, xmm9                            
        vpor      xmm9, xmm15, xmm13                            
        vpalignr  xmm13, xmm9, xmm11, 8                         
        vpalignr  xmm15, xmm11, xmm9, 8                         
        vpshufd   xmm11, XMMWORD PTR [rcx+r9], 78               
        vpunpckhqdq xmm9, xmm7, xmm5                            
        vpaddq    xmm8, xmm8, xmm11                             
        vpaddq    xmm12, xmm12, xmm9                            
        vmovdqu   XMMWORD PTR [32+rsp], xmm11                   
        vpaddq    xmm11, xmm8, xmm13                            
        vpaddq    xmm12, xmm12, xmm15                           
        vpalignr  xmm8, xmm3, xmm4, 8                           
        vpalignr  xmm4, xmm4, xmm3, 8                           
        vmovdqu   XMMWORD PTR [224+rsp], xmm9                   
        vpxor     xmm9, xmm8, xmm11                             
        vpxor     xmm3, xmm4, xmm12                             
        vpshufd   xmm8, xmm9, 177                               
        vpshufd   xmm3, xmm3, 177                               
        vpaddq    xmm9, xmm14, xmm8                             
        vpaddq    xmm4, xmm10, xmm3                             
        vmovdqu   xmm14, XMMWORD PTR [96+rcx+r9]                
        vpxor     xmm10, xmm13, xmm9                            
        vpxor     xmm13, xmm15, xmm4                            
        vpshufb   xmm15, xmm13, xmm0                            
        vmovdqu   xmm13, XMMWORD PTR [16+rcx+r9]                
        vpshufb   xmm10, xmm10, xmm0                            
        vpunpcklqdq xmm0, xmm14, xmm13                          
        vmovdqu   XMMWORD PTR [96+rsp], xmm0                    
        vpaddq    xmm0, xmm11, xmm0                             
        vpunpckhqdq xmm2, xmm2, xmm13                           
        vpaddq    xmm11, xmm0, xmm10                            
        vpaddq    xmm0, xmm12, xmm2                             
        vmovdqu   XMMWORD PTR [256+rsp], xmm2                   
        vpxor     xmm2, xmm8, xmm11                             
        vpaddq    xmm0, xmm0, xmm15                             
        vpshufb   xmm8, xmm2, xmm1                              
        vpxor     xmm2, xmm3, xmm0                              
        vpshufb   xmm3, xmm2, xmm1                              
        vpaddq    xmm9, xmm9, xmm8                              
        vpaddq    xmm4, xmm4, xmm3                              
        vpxor     xmm12, xmm10, xmm9                            
        vpxor     xmm10, xmm15, xmm4                            
        vpaddq    xmm2, xmm12, xmm12                            
        vpsrlq    xmm15, xmm12, 63                              
        vpor      xmm2, xmm15, xmm2                             
        vpsrlq    xmm15, xmm10, 63                              
        vpaddq    xmm10, xmm10, xmm10                           
        vpor      xmm12, xmm15, xmm10                           
        vpalignr  xmm15, xmm2, xmm12, 8                         
        vpalignr  xmm10, xmm12, xmm2, 8                         
        vpunpckhqdq xmm2, xmm5, xmm6                            
        vpalignr  xmm5, xmm14, xmm7, 8                          
        vpaddq    xmm5, xmm11, xmm5                             
        vpaddq    xmm0, xmm0, xmm2                              
        vpaddq    xmm11, xmm5, xmm15                            
        vpaddq    xmm12, xmm0, xmm10                            
        vmovdqu   XMMWORD PTR [288+rsp], xmm2                   
        vpalignr  xmm2, xmm3, xmm8, 8                           
        vpxor     xmm0, xmm2, xmm11                             
        vpshufd   xmm5, xmm0, 177                               
        vpalignr  xmm3, xmm8, xmm3, 8                           
        vpaddq    xmm4, xmm4, xmm5                              
        vpxor     xmm8, xmm3, xmm12                             
        vpxor     xmm2, xmm15, xmm4                             
        vpshufd   xmm8, xmm8, 177                               
        vmovdqu   xmm0, XMMWORD PTR .L_2il0floatpacket.12[rip]  
        vpaddq    xmm9, xmm9, xmm8                              
        vpshufb   xmm15, xmm2, xmm0                             
        vmovdqu   xmm2, XMMWORD PTR [64+rcx+r9]                 
        vpxor     xmm3, xmm10, xmm9                             
        vpshufb   xmm10, xmm3, xmm0                             
        vmovhpd   xmm3, xmm2, QWORD PTR [rcx+r9]                
        vpaddq    xmm11, xmm11, xmm3                            
        vpaddq    xmm3, xmm11, xmm15                            
        vpblendw  xmm11, xmm13, xmm14, 240                      
        vpxor     xmm5, xmm5, xmm3                              
        vpaddq    xmm12, xmm12, xmm11                           
        vpshufb   xmm11, xmm5, xmm1                             
        vpaddq    xmm12, xmm12, xmm10                           
        vpaddq    xmm4, xmm4, xmm11                             
        vpxor     xmm8, xmm8, xmm12                             
        vpshufb   xmm5, xmm8, xmm1                              
        vpaddq    xmm9, xmm9, xmm5                              
        vpxor     xmm8, xmm15, xmm4                             
        vpxor     xmm15, xmm10, xmm9                            
        vpsrlq    xmm10, xmm8, 63                               
        vpaddq    xmm8, xmm8, xmm8                              
        vpor      xmm10, xmm10, xmm8                            
        vpsrlq    xmm8, xmm15, 63                               
        vpaddq    xmm15, xmm15, xmm15                           
        vpblendw  xmm13, xmm7, xmm13, 240                       
        vpor      xmm8, xmm8, xmm15                             
        vpaddq    xmm3, xmm3, xmm13                             
        vpalignr  xmm15, xmm8, xmm10, 8                         
        vpaddq    xmm13, xmm3, xmm15                            
        vmovdqu   xmm3, XMMWORD PTR [48+rcx+r9]                 
        vpalignr  xmm10, xmm10, xmm8, 8                         
        vpunpckhqdq xmm8, xmm3, xmm2                            
        vpaddq    xmm12, xmm12, xmm8                            
        vpaddq    xmm8, xmm12, xmm10                            
        vpalignr  xmm12, xmm11, xmm5, 8                         
        vpxor     xmm12, xmm12, xmm13                           
        vpshufd   xmm12, xmm12, 177                             
        vpaddq    xmm9, xmm9, xmm12                             
        vpxor     xmm15, xmm15, xmm9                            
        vpalignr  xmm5, xmm5, xmm11, 8                          
        vpshufb   xmm15, xmm15, xmm0                            
        vpunpcklqdq xmm3, xmm6, xmm3                            
        vpxor     xmm11, xmm5, xmm8                             
        vpshufd   xmm11, xmm11, 177                             
        vpaddq    xmm13, xmm13, xmm3                            
        vpaddq    xmm4, xmm4, xmm11                             
        vpaddq    xmm5, xmm13, xmm15                            
        vmovdqu   xmm13, XMMWORD PTR [32+rcx+r9]                
        vmovdqu   xmm3, XMMWORD PTR [rcx+r9]                    
        vpxor     xmm10, xmm10, xmm4                            
        vpshufb   xmm10, xmm10, xmm0                            
        vpalignr  xmm13, xmm13, xmm3, 8                         
        vpaddq    xmm8, xmm8, xmm13                             
        vpaddq    xmm13, xmm8, xmm10                            
        vpxor     xmm8, xmm12, xmm5                             
        vpxor     xmm11, xmm11, xmm13                           
        vpshufb   xmm12, xmm8, xmm1                             
        vpaddq    xmm5, xmm5, XMMWORD PTR [256+rsp]             
        vpaddq    xmm9, xmm9, xmm12                             
        vpshufb   xmm11, xmm11, xmm1                            
        vpaddq    xmm4, xmm4, xmm11                             
        vpxor     xmm8, xmm15, xmm9                             
        vpxor     xmm10, xmm10, xmm4                            
        vpsrlq    xmm15, xmm8, 63                               
        vpaddq    xmm8, xmm8, xmm8                              
        vpor      xmm15, xmm15, xmm8                            
        vpsrlq    xmm8, xmm10, 63                               
        vpaddq    xmm10, xmm10, xmm10                           
        vpor      xmm8, xmm8, xmm10                             
        vpalignr  xmm10, xmm15, xmm8, 8                         
        vpunpckhqdq xmm14, xmm14, xmm7                          
        vpaddq    xmm5, xmm5, xmm10                             
        vpaddq    xmm13, xmm13, xmm14                           
        vpalignr  xmm15, xmm8, xmm15, 8                         
        vpalignr  xmm14, xmm11, xmm12, 8                        
        vpaddq    xmm13, xmm13, xmm15                           
        vpxor     xmm8, xmm14, xmm5                             
        vpalignr  xmm12, xmm12, xmm11, 8                        
        vpshufd   xmm14, xmm8, 177                              
        vpxor     xmm8, xmm12, xmm13                            
        vpaddq    xmm4, xmm4, xmm14                             
        vpshufd   xmm12, xmm8, 177                              
        vpxor     xmm10, xmm10, xmm4                            
        vpaddq    xmm9, xmm9, xmm12                             
        vpshufb   xmm10, xmm10, xmm0                            
        vpunpckhqdq xmm11, xmm2, xmm3                           
        vpxor     xmm15, xmm15, xmm9                            
        vpaddq    xmm5, xmm5, xmm11                             
        vpshufb   xmm15, xmm15, xmm0                            
        vpaddq    xmm11, xmm5, xmm10                            
        vpaddq    xmm5, xmm13, XMMWORD PTR [240+rsp]            
        vpaddq    xmm5, xmm5, xmm15                             
        vpxor     xmm13, xmm14, xmm11                           
        vpxor     xmm12, xmm12, xmm5                            
        vpshufb   xmm14, xmm13, xmm1                            
        vpshufb   xmm12, xmm12, xmm1                            
        vpaddq    xmm4, xmm4, xmm14                             
        vpaddq    xmm8, xmm9, xmm12                             
        vpxor     xmm9, xmm10, xmm4                             
        vpxor     xmm10, xmm15, xmm8                            
        vpaddq    xmm15, xmm9, xmm9                             
        vpsrlq    xmm13, xmm9, 63                               
        vpor      xmm9, xmm13, xmm15                            
        vpsrlq    xmm13, xmm10, 63                              
        vpaddq    xmm10, xmm10, xmm10                           
        vpor      xmm10, xmm13, xmm10                           
        vpalignr  xmm15, xmm10, xmm9, 8                         
        vpalignr  xmm10, xmm9, xmm10, 8                         
        vmovdqu   xmm9, XMMWORD PTR [32+rcx+r9]                 
        vmovdqu   XMMWORD PTR [320+rsp], xmm6                   
        vpblendw  xmm13, xmm9, xmm6, 240                        
        vmovdqu   xmm6, XMMWORD PTR [16+rcx+r9]                 
        vpaddq    xmm5, xmm5, xmm13                             
        vpblendw  xmm6, xmm6, xmm9, 240                         
        vpaddq    xmm11, xmm11, xmm6                            
        vpaddq    xmm5, xmm5, xmm10                             
        vpaddq    xmm6, xmm11, xmm15                            
        vmovdqu   XMMWORD PTR [368+rsp], xmm13                  
        vpalignr  xmm13, xmm14, xmm12, 8                        
        vpalignr  xmm14, xmm12, xmm14, 8                        
        vpxor     xmm11, xmm13, xmm6                            
        vpxor     xmm13, xmm14, xmm5                            
        vpshufd   xmm11, xmm11, 177                             
        vpshufd   xmm14, xmm13, 177                             
        vpaddq    xmm12, xmm8, xmm11                            
        vpaddq    xmm8, xmm4, xmm14                             
        vmovdqu   xmm13, XMMWORD PTR [48+rcx+r9]                
        vpxor     xmm4, xmm15, xmm12                            
        vpxor     xmm15, xmm10, xmm8                            
        vpshufb   xmm4, xmm4, xmm0                              
        vpshufb   xmm10, xmm15, xmm0                            
        vpunpcklqdq xmm13, xmm13, xmm7                          
        vpunpcklqdq xmm15, xmm3, xmm2                           
        vpaddq    xmm6, xmm6, xmm13                             
        vpaddq    xmm5, xmm5, xmm15                             
        vmovdqu   XMMWORD PTR [272+rsp], xmm13                  
        vpaddq    xmm13, xmm6, xmm4                             
        vpaddq    xmm6, xmm5, xmm10                             
        vmovdqu   XMMWORD PTR [336+rsp], xmm15                  
        vpxor     xmm15, xmm11, xmm13                           
        vpxor     xmm14, xmm14, xmm6                            
        vpshufb   xmm11, xmm15, xmm1                            
        vpshufb   xmm14, xmm14, xmm1                            
        vpaddq    xmm12, xmm12, xmm11                           
        vpaddq    xmm5, xmm8, xmm14                             
        vpxor     xmm4, xmm4, xmm12                             
        vpxor     xmm15, xmm10, xmm5                            
        vpaddq    xmm8, xmm4, xmm4                              
        vpsrlq    xmm10, xmm4, 63                               
        vpsrlq    xmm4, xmm15, 63                               
        vpaddq    xmm15, xmm15, xmm15                           
        vpunpckhqdq xmm9, xmm2, xmm9                            
        vpor      xmm10, xmm10, xmm8                            
        vpor      xmm8, xmm4, xmm15                             
        vpalignr  xmm4, xmm10, xmm8, 8                          
        vpalignr  xmm8, xmm8, xmm10, 8                          
        vpaddq    xmm10, xmm13, xmm9                            
        vpaddq    xmm9, xmm10, xmm4                             
        vmovdqu   xmm10, XMMWORD PTR [16+rcx+r9]                
        vpunpcklqdq xmm13, xmm10, xmm7                          
        vpaddq    xmm6, xmm6, xmm13                             
        vpalignr  xmm13, xmm14, xmm11, 8                        
        vpaddq    xmm6, xmm6, xmm8                              
        vpxor     xmm15, xmm13, xmm9                            
        vpalignr  xmm11, xmm11, xmm14, 8                        
        vpshufd   xmm13, xmm15, 177                             
        vpxor     xmm15, xmm11, xmm6                            
        vpaddq    xmm5, xmm5, xmm13                             
        vpaddq    xmm6, xmm6, XMMWORD PTR [368+rsp]             
        vpshufd   xmm11, xmm15, 177                             
        vpaddq    xmm15, xmm12, xmm11                           
        vpxor     xmm12, xmm4, xmm5                             
        vpxor     xmm14, xmm8, xmm15                            
        vpshufb   xmm4, xmm12, xmm0                             
        vmovdqu   xmm12, XMMWORD PTR [48+rcx+r9]                
        vpshufb   xmm8, xmm14, xmm0                             
        vpblendw  xmm14, xmm3, xmm12, 240                       
        vpaddq    xmm9, xmm9, xmm14                             
        vpaddq    xmm6, xmm6, xmm8                              
        vpaddq    xmm9, xmm9, xmm4                              
        vpxor     xmm13, xmm13, xmm9                            
        vpxor     xmm11, xmm11, xmm6                            
        vpshufb   xmm14, xmm13, xmm1                            
        vpshufb   xmm13, xmm11, xmm1                            
        vpaddq    xmm5, xmm5, xmm14                             
        vpaddq    xmm15, xmm15, xmm13                           
        vpxor     xmm4, xmm4, xmm5                              
        vpxor     xmm8, xmm8, xmm15                             
        vpsrlq    xmm11, xmm4, 63                               
        vpaddq    xmm4, xmm4, xmm4                              
        vpor      xmm11, xmm11, xmm4                            
        vpsrlq    xmm4, xmm8, 63                                
        vpaddq    xmm8, xmm8, xmm8                              
        vpor      xmm8, xmm4, xmm8                              
        vpalignr  xmm4, xmm8, xmm11, 8                          
        vpalignr  xmm8, xmm11, xmm8, 8                          
        vmovdqu   xmm11, XMMWORD PTR [112+rcx+r9]               
        vpblendw  xmm11, xmm11, xmm7, 240                       
        vpblendw  xmm12, xmm12, xmm10, 240                      
        vpaddq    xmm9, xmm9, xmm11                             
        vpaddq    xmm6, xmm6, xmm12                             
        vpaddq    xmm9, xmm9, xmm4                              
        vpaddq    xmm12, xmm6, xmm8                             
        vpalignr  xmm6, xmm14, xmm13, 8                         
        vpxor     xmm11, xmm6, xmm9                             
        vpshufd   xmm11, xmm11, 177                             
        vpalignr  xmm13, xmm13, xmm14, 8                        
        vpxor     xmm14, xmm13, xmm12                           
        vpaddq    xmm13, xmm15, xmm11                           
        vpxor     xmm15, xmm4, xmm13                            
        vpshufd   xmm6, xmm14, 177                              
        vpshufb   xmm4, xmm15, xmm0                             
        vpaddq    xmm5, xmm5, xmm6                              
        vmovdqu   xmm15, XMMWORD PTR [96+rcx+r9]                
        vpxor     xmm14, xmm8, xmm5                             
        vpalignr  xmm8, xmm15, xmm3, 8                          
        vpaddq    xmm9, xmm9, xmm8                              
        vpshufb   xmm14, xmm14, xmm0                            
        vpaddq    xmm8, xmm9, xmm4                              
        vpblendw  xmm9, xmm2, xmm15, 240                        
        vpxor     xmm11, xmm11, xmm8                            
        vpaddq    xmm12, xmm12, xmm9                            
        vpshufb   xmm9, xmm11, xmm1                             
        vpaddq    xmm12, xmm12, xmm14                           
                                
..B1.27:                        
        vmovdqu   XMMWORD PTR [512+rsp], xmm2                   
        vpxor     xmm2, xmm6, xmm12                             
        vpshufb   xmm2, xmm2, xmm1                              
        vpaddq    xmm13, xmm13, xmm9                            
        vpaddq    xmm5, xmm5, xmm2                              
        vpaddq    xmm12, xmm12, XMMWORD PTR [336+rsp]           
        vpxor     xmm11, xmm4, xmm13                            
        vpxor     xmm6, xmm14, xmm5                             
        vpaddq    xmm4, xmm11, xmm11                            
        vpsrlq    xmm14, xmm11, 63                              
        vpor      xmm4, xmm14, xmm4                             
        vpsrlq    xmm14, xmm6, 63                               
        vpaddq    xmm6, xmm6, xmm6                              
        vpor      xmm11, xmm14, xmm6                            
        vpalignr  xmm14, xmm4, xmm11, 8                         
        vpalignr  xmm6, xmm11, xmm4, 8                          
        vmovdqu   xmm4, XMMWORD PTR [352+rsp]                   
        vpunpcklqdq xmm11, xmm10, xmm4                          
        vpaddq    xmm8, xmm8, xmm11                             
        vpaddq    xmm12, xmm12, xmm6                            
        vpaddq    xmm8, xmm8, xmm14                             
        vpalignr  xmm11, xmm2, xmm9, 8                          
        vpalignr  xmm2, xmm9, xmm2, 8                           
        vpxor     xmm11, xmm11, xmm8                            
        vpxor     xmm9, xmm2, xmm12                             
        vpshufd   xmm11, xmm11, 177                             
        vpshufd   xmm2, xmm9, 177                               
        vpaddq    xmm9, xmm5, xmm11                             
        vpaddq    xmm5, xmm13, xmm2                             
        vpxor     xmm13, xmm14, xmm9                            
        vpxor     xmm6, xmm6, xmm5                              
        vpshufb   xmm14, xmm13, xmm0                            
        vpshufb   xmm6, xmm6, xmm0                              
        vmovdqu   XMMWORD PTR [432+rsp], xmm10                  
        vpunpcklqdq xmm13, xmm15, xmm7                          
        vpunpckhqdq xmm10, xmm7, xmm10                          
        vpaddq    xmm8, xmm8, xmm13                             
        vpaddq    xmm12, xmm12, xmm10                           
        vpaddq    xmm8, xmm8, xmm14                             
        vpaddq    xmm12, xmm12, xmm6                            
        vpxor     xmm10, xmm11, xmm8                            
        vpxor     xmm2, xmm2, xmm12                             
        vpshufb   xmm10, xmm10, xmm1                            
        vpshufb   xmm2, xmm2, xmm1                              
        vpaddq    xmm9, xmm9, xmm10                             
        vpaddq    xmm5, xmm5, xmm2                              
        vpxor     xmm14, xmm14, xmm9                            
        vpxor     xmm13, xmm6, xmm5                             
        vpsrlq    xmm6, xmm14, 63                               
        vpsrlq    xmm11, xmm13, 63                              
        vpaddq    xmm14, xmm14, xmm14                           
        vpaddq    xmm13, xmm13, xmm13                           
        vpor      xmm6, xmm6, xmm14                             
        vpor      xmm11, xmm11, xmm13                           
        vpalignr  xmm14, xmm11, xmm6, 8                         
        vpalignr  xmm11, xmm6, xmm11, 8                         
        vmovdqu   xmm6, XMMWORD PTR [304+rsp]                   
        vpblendw  xmm4, xmm6, xmm4, 240                         
        vpaddq    xmm4, xmm8, xmm4                              
        vpaddq    xmm8, xmm4, xmm14                             
        vmovdqu   xmm4, XMMWORD PTR [320+rsp]                   
        vpunpckhqdq xmm13, xmm4, xmm3                           
        vpaddq    xmm12, xmm12, xmm13                           
        vpaddq    xmm13, xmm12, xmm11                           
        vpalignr  xmm12, xmm10, xmm2, 8                         
        vpxor     xmm12, xmm12, xmm8                            
        vpshufd   xmm12, xmm12, 177                             
        vpaddq    xmm5, xmm5, xmm12                             
        vpalignr  xmm2, xmm2, xmm10, 8                          
        vpxor     xmm10, xmm2, xmm13                            
        vpxor     xmm2, xmm14, xmm5                             
        vpshufd   xmm10, xmm10, 177                             
        vpshufb   xmm14, xmm2, xmm0                             
        vpaddq    xmm9, xmm9, xmm10                             
        vpunpckhqdq xmm6, xmm15, xmm6                           
        vpxor     xmm11, xmm11, xmm9                            
        vpaddq    xmm8, xmm8, xmm6                              
        vpshufb   xmm11, xmm11, xmm0                            
        vpaddq    xmm6, xmm8, xmm14                             
        vmovdqu   xmm8, XMMWORD PTR [512+rsp]                   
        vpxor     xmm12, xmm12, xmm6                            
        vpblendw  xmm2, xmm4, xmm8, 240                         
        vpaddq    xmm13, xmm13, xmm2                            
        vpshufb   xmm12, xmm12, xmm1                            
        vpaddq    xmm13, xmm13, xmm11                           
        vpaddq    xmm5, xmm5, xmm12                             
        vpxor     xmm10, xmm10, xmm13                           
        vpxor     xmm14, xmm14, xmm5                            
        vpshufb   xmm10, xmm10, xmm1                            
        vpaddq    xmm13, xmm13, XMMWORD PTR [192+rsp]           
        vpaddq    xmm2, xmm9, xmm10                             
        vpsrlq    xmm9, xmm14, 63                               
        vpxor     xmm11, xmm11, xmm2                            
        vpaddq    xmm14, xmm14, xmm14                           
        vpor      xmm9, xmm9, xmm14                             
        vpsrlq    xmm14, xmm11, 63                              
        vpaddq    xmm11, xmm11, xmm11                           
        vpor      xmm14, xmm14, xmm11                           
        vpalignr  xmm11, xmm9, xmm14, 8                         
        vpalignr  xmm9, xmm14, xmm9, 8                          
        vpblendw  xmm14, xmm15, xmm3, 240                       
        vpaddq    xmm6, xmm6, xmm14                             
        vpaddq    xmm14, xmm13, xmm9                            
        vpaddq    xmm6, xmm6, xmm11                             
        vpalignr  xmm13, xmm10, xmm12, 8                        
        vpalignr  xmm10, xmm12, xmm10, 8                        
        vpxor     xmm13, xmm13, xmm6                            
        vpshufd   xmm13, xmm13, 177                             
        vpxor     xmm12, xmm10, xmm14                           
        vpshufd   xmm12, xmm12, 177                             
        vpaddq    xmm10, xmm2, xmm13                            
        vpaddq    xmm2, xmm5, xmm12                             
        vpaddq    xmm6, xmm6, XMMWORD PTR [288+rsp]             
        vpxor     xmm5, xmm11, xmm10                            
        vpxor     xmm9, xmm9, xmm2                              
        vpshufb   xmm5, xmm5, xmm0                              
        vpshufb   xmm9, xmm9, xmm0                              
        vpaddq    xmm6, xmm6, xmm5                              
        vpalignr  xmm11, xmm7, xmm15, 8                         
        vpxor     xmm13, xmm13, xmm6                            
        vpaddq    xmm14, xmm14, xmm11                           
        vpshufb   xmm13, xmm13, xmm1                            
        vpaddq    xmm14, xmm14, xmm9                            
        vpaddq    xmm10, xmm10, xmm13                           
        vpxor     xmm12, xmm12, xmm14                           
        vpxor     xmm5, xmm5, xmm10                             
        vpshufb   xmm12, xmm12, xmm1                            
        vpaddq    xmm2, xmm2, xmm12                             
        vpxor     xmm11, xmm9, xmm2                             
        vpsrlq    xmm9, xmm5, 63                                
        vpaddq    xmm5, xmm5, xmm5                              
        vpor      xmm9, xmm9, xmm5                              
        vpsrlq    xmm5, xmm11, 63                               
        vpaddq    xmm11, xmm11, xmm11                           
        vpor      xmm11, xmm5, xmm11                            
        vpalignr  xmm5, xmm11, xmm9, 8                          
        vpalignr  xmm11, xmm9, xmm11, 8                         
        vmovdqu   xmm9, XMMWORD PTR [352+rsp]                   
        vmovdqu   XMMWORD PTR [416+rsp], xmm3                   
        vpunpcklqdq xmm3, xmm3, xmm9                            
        vpaddq    xmm3, xmm6, xmm3                              
        vpshufd   xmm8, xmm8, 78                                
        vpaddq    xmm3, xmm3, xmm5                              
        vpaddq    xmm6, xmm14, xmm8                             
        vpalignr  xmm14, xmm13, xmm12, 8                        
        vpaddq    xmm8, xmm6, xmm11                             
        vpxor     xmm6, xmm14, xmm3                             
        vpshufd   xmm14, xmm6, 177                              
        vpalignr  xmm13, xmm12, xmm13, 8                        
        vpaddq    xmm2, xmm2, xmm14                             
        vpaddq    xmm3, xmm3, XMMWORD PTR [256+rsp]             
        vpxor     xmm12, xmm13, xmm8                            
        vpxor     xmm5, xmm5, xmm2                              
        vpshufd   xmm13, xmm12, 177                             
        vpaddq    xmm10, xmm10, xmm13                           
        vpshufb   xmm5, xmm5, xmm0                              
        vpxor     xmm11, xmm11, xmm10                           
        vmovdqu   xmm6, XMMWORD PTR [432+rsp]                   
        vpshufb   xmm11, xmm11, xmm0                            
        vpaddq    xmm12, xmm3, xmm5                             
        vpblendw  xmm3, xmm6, xmm7, 240                         
        vpxor     xmm14, xmm14, xmm12                           
        vpaddq    xmm8, xmm8, xmm3                              
        vpshufb   xmm14, xmm14, xmm1                            
        vpaddq    xmm3, xmm8, xmm11                             
        vpaddq    xmm2, xmm2, xmm14                             
        vpxor     xmm13, xmm13, xmm3                            
        vpxor     xmm8, xmm5, xmm2                              
        vpshufb   xmm13, xmm13, xmm1                            
        vpaddq    xmm10, xmm10, xmm13                           
        vpsrlq    xmm5, xmm8, 63                                
        vpxor     xmm11, xmm11, xmm10                           
        vpaddq    xmm8, xmm8, xmm8                              
        vpor      xmm5, xmm5, xmm8                              
        vpsrlq    xmm8, xmm11, 63                               
        vpaddq    xmm11, xmm11, xmm11                           
        vpor      xmm8, xmm8, xmm11                             
        vpalignr  xmm11, xmm5, xmm8, 8                          
        vpalignr  xmm5, xmm8, xmm5, 8                           
        vpunpckhqdq xmm8, xmm15, xmm9                           
        vmovdqu   XMMWORD PTR [400+rsp], xmm15                  
        vpblendw  xmm15, xmm15, xmm6, 240                       
        vpaddq    xmm12, xmm12, xmm8                            
        vpaddq    xmm3, xmm3, xmm15                             
        vpaddq    xmm12, xmm12, xmm11                           
        vpaddq    xmm15, xmm3, xmm5                             
        vpalignr  xmm3, xmm13, xmm14, 8                         
        vpxor     xmm8, xmm3, xmm12                             
        vpshufd   xmm3, xmm8, 177                               
        vpalignr  xmm13, xmm14, xmm13, 8                        
        vpaddq    xmm10, xmm10, xmm3                            
        vpxor     xmm14, xmm13, xmm15                           
        vpxor     xmm11, xmm11, xmm10                           
        vpshufd   xmm14, xmm14, 177                             
        vpaddq    xmm2, xmm2, xmm14                             
        vpshufb   xmm11, xmm11, xmm0                            
        vmovdqu   XMMWORD PTR [384+rsp], xmm7                   
        vpxor     xmm5, xmm5, xmm2                              
        vpalignr  xmm7, xmm4, xmm7, 8                           
        vmovdqu   XMMWORD PTR [528+rsp], xmm7                   
        vpaddq    xmm7, xmm12, xmm7                             
        vpshufb   xmm5, xmm5, xmm0                              
        vpaddq    xmm8, xmm7, xmm11                             
        vmovdqu   xmm12, XMMWORD PTR [416+rsp]                  
        vpxor     xmm3, xmm3, xmm8                              
        vmovdqu   xmm13, XMMWORD PTR [512+rsp]                  
        vpunpckhqdq xmm7, xmm12, xmm13                          
        vpaddq    xmm15, xmm15, xmm7                            
        vpshufb   xmm3, xmm3, xmm1                              
        vpaddq    xmm7, xmm15, xmm5                             
        vpaddq    xmm10, xmm10, xmm3                            
        vpxor     xmm14, xmm14, xmm7                            
        vpxor     xmm15, xmm11, xmm10                           
        vpshufb   xmm14, xmm14, xmm1                            
        vpaddq    xmm2, xmm2, xmm14                             
        vpxor     xmm11, xmm5, xmm2                             
        vpsrlq    xmm5, xmm15, 63                               
        vpaddq    xmm15, xmm15, xmm15                           
        vpor      xmm5, xmm5, xmm15                             
        vpsrlq    xmm15, xmm11, 63                              
        vpaddq    xmm11, xmm11, xmm11                           
        vpor      xmm15, xmm15, xmm11                           
        vpalignr  xmm11, xmm15, xmm5, 8                         
        vpalignr  xmm15, xmm5, xmm15, 8                         
        vpaddq    xmm5, xmm8, XMMWORD PTR [288+rsp]             
        vpunpcklqdq xmm8, xmm13, xmm6                           
        vpaddq    xmm5, xmm5, xmm11                             
        vpaddq    xmm7, xmm7, xmm8                              
        vpalignr  xmm8, xmm3, xmm14, 8                          
        vpaddq    xmm7, xmm7, xmm15                             
        vpxor     xmm8, xmm8, xmm5                              
        vpalignr  xmm3, xmm14, xmm3, 8                          
        vpshufd   xmm8, xmm8, 177                               
        vpxor     xmm14, xmm3, xmm7                             
        vpaddq    xmm2, xmm2, xmm8                              
        vpaddq    xmm7, xmm7, XMMWORD PTR [272+rsp]             
        vpshufd   xmm3, xmm14, 177                              
        vpxor     xmm14, xmm11, xmm2                            
        vpaddq    xmm10, xmm10, xmm3                            
        vpshufb   xmm11, xmm14, xmm0                            
        vmovhpd   xmm14, xmm12, QWORD PTR [304+rsp]             
        vpxor     xmm15, xmm15, xmm10                           
        vpaddq    xmm5, xmm5, xmm14                             
        vpshufb   xmm15, xmm15, xmm0                            
        vpaddq    xmm5, xmm5, xmm11                             
        vpaddq    xmm7, xmm7, xmm15                             
        vpxor     xmm8, xmm8, xmm5                              
        vpxor     xmm3, xmm3, xmm7                              
        vpshufb   xmm8, xmm8, xmm1                              
        vpshufb   xmm14, xmm3, xmm1                             
        vpaddq    xmm2, xmm2, xmm8                              
        vpaddq    xmm10, xmm10, xmm14                           
        vpxor     xmm3, xmm11, xmm2                             
        vpxor     xmm15, xmm15, xmm10                           
        vpsrlq    xmm11, xmm3, 63                               
        vpaddq    xmm3, xmm3, xmm3                              
        vpor      xmm3, xmm11, xmm3                             
        vpsrlq    xmm11, xmm15, 63                              
        vpaddq    xmm15, xmm15, xmm15                           
        vpunpcklqdq xmm9, xmm9, xmm4                            
        vpor      xmm15, xmm11, xmm15                           
        vpalignr  xmm11, xmm3, xmm15, 8                         
        vpalignr  xmm15, xmm15, xmm3, 8                         
        vpaddq    xmm3, xmm5, xmm9                              
        vmovdqu   xmm5, XMMWORD PTR [384+rsp]                   
        vpaddq    xmm9, xmm3, xmm11                             
        vpalignr  xmm3, xmm12, xmm5, 8                          
        vpaddq    xmm7, xmm7, xmm3                              
        vpaddq    xmm7, xmm7, xmm15                             
        vpalignr  xmm3, xmm14, xmm8, 8                          
        vpalignr  xmm14, xmm8, xmm14, 8                         
        vpxor     xmm3, xmm3, xmm9                              
        vpxor     xmm8, xmm14, xmm7                             
        vpshufd   xmm3, xmm3, 177                               
        vpshufd   xmm8, xmm8, 177                               
        vpaddq    xmm10, xmm10, xmm3                            
        vpaddq    xmm2, xmm2, xmm8                              
        vpxor     xmm11, xmm11, xmm10                           
        vpxor     xmm14, xmm15, xmm2                            
        vpshufb   xmm11, xmm11, xmm0                            
        vpshufb   xmm15, xmm14, xmm0                            
        vpunpckhqdq xmm14, xmm4, xmm13                          
        vpaddq    xmm4, xmm9, xmm14                             
        vpalignr  xmm9, xmm13, xmm6, 8                          
        vpaddq    xmm4, xmm4, xmm11                             
        vpaddq    xmm13, xmm7, xmm9                             
        vpaddq    xmm7, xmm13, xmm15                            
        vpxor     xmm3, xmm3, xmm4                              
        vpxor     xmm9, xmm8, xmm7                              
        vpshufb   xmm3, xmm3, xmm1                              
        vpaddq    xmm4, xmm4, XMMWORD PTR [400+rsp]             
        vpaddq    xmm10, xmm10, xmm3                            
        vpshufb   xmm8, xmm9, xmm1                              
        vpaddq    xmm2, xmm2, xmm8                              
        vpxor     xmm11, xmm11, xmm10                           
        vpxor     xmm13, xmm15, xmm2                            
        vpaddq    xmm9, xmm11, xmm11                            
        vpsrlq    xmm15, xmm11, 63                              
        vpor      xmm9, xmm15, xmm9                             
        vpsrlq    xmm15, xmm13, 63                              
        vpaddq    xmm13, xmm13, xmm13                           
        vpalignr  xmm5, xmm5, xmm12, 8                          
        vpor      xmm13, xmm15, xmm13                           
        vpaddq    xmm7, xmm7, xmm5                              
        vpalignr  xmm11, xmm13, xmm9, 8                         
        vpalignr  xmm15, xmm9, xmm13, 8                         
        vpaddq    xmm4, xmm4, xmm11                             
        vpaddq    xmm7, xmm7, xmm15                             
        vpalignr  xmm9, xmm3, xmm8, 8                           
        vpalignr  xmm8, xmm8, xmm3, 8                           
        vpxor     xmm5, xmm9, xmm4                              
        vpxor     xmm3, xmm8, xmm7                              
        vpshufd   xmm9, xmm5, 177                               
        vpshufd   xmm13, xmm3, 177                              
        vpaddq    xmm5, xmm2, xmm9                              
        vpaddq    xmm10, xmm10, xmm13                           
        vpxor     xmm2, xmm11, xmm5                             
        vpxor     xmm8, xmm15, xmm10                            
        vmovdqu   xmm15, XMMWORD PTR [352+rsp]                  
        vpshufb   xmm2, xmm2, xmm0                              
        vpshufb   xmm11, xmm8, xmm0                             
        vpblendw  xmm3, xmm6, xmm15, 240                        
        vpaddq    xmm4, xmm4, xmm3                              
        vmovdqu   xmm3, XMMWORD PTR [304+rsp]                   
        vpaddq    xmm7, xmm7, xmm3                              
        vpaddq    xmm8, xmm4, xmm2                              
        vpaddq    xmm4, xmm7, xmm11                             
        vpxor     xmm7, xmm9, xmm8                              
        vpxor     xmm13, xmm13, xmm4                            
        vpshufb   xmm9, xmm7, xmm1                              
        vpshufb   xmm13, xmm13, xmm1                            
        vpaddq    xmm7, xmm5, xmm9                              
        vpaddq    xmm5, xmm10, xmm13                            
        vpxor     xmm2, xmm2, xmm7                              
        vpxor     xmm10, xmm11, xmm5                            
        vpsrlq    xmm11, xmm2, 63                               
        vpaddq    xmm2, xmm2, xmm2                              
        vpor      xmm2, xmm11, xmm2                             
        vpsrlq    xmm11, xmm10, 63                              
        vpaddq    xmm10, xmm10, xmm10                           
        vpor      xmm10, xmm11, xmm10                           
        vpalignr  xmm11, xmm2, xmm10, 8                         
        vpalignr  xmm10, xmm10, xmm2, 8                         
        vpaddq    xmm2, xmm8, XMMWORD PTR [176+rsp]             
        vpaddq    xmm8, xmm2, xmm11                             
        vpunpckhqdq xmm2, xmm15, xmm12                          
        vpaddq    xmm4, xmm4, xmm2                              
        vpaddq    xmm4, xmm4, xmm10                             
        vpalignr  xmm2, xmm13, xmm9, 8                          
        vpalignr  xmm9, xmm9, xmm13, 8                          
        vpxor     xmm2, xmm2, xmm8                              
        vpxor     xmm9, xmm9, xmm4                              
        vpshufd   xmm2, xmm2, 177                               
        vpshufd   xmm9, xmm9, 177                               
        vpaddq    xmm5, xmm5, xmm2                              
        vpaddq    xmm7, xmm7, xmm9                              
        vpxor     xmm11, xmm11, xmm5                            
        vpxor     xmm10, xmm10, xmm7                            
        vpshufb   xmm13, xmm11, xmm0                            
        vpshufb   xmm10, xmm10, xmm0                            
        vpunpcklqdq xmm11, xmm6, xmm3                           
        vpblendw  xmm3, xmm15, xmm3, 240                        
        vpaddq    xmm8, xmm8, xmm11                             
        vpaddq    xmm15, xmm4, xmm3                             
        vpaddq    xmm8, xmm8, xmm13                             
        vpaddq    xmm4, xmm15, xmm10                            
        vpaddq    xmm14, xmm8, xmm14                            
        vpxor     xmm2, xmm2, xmm8                              
        vpxor     xmm9, xmm9, xmm4                              
        vpshufb   xmm3, xmm2, xmm1                              
        vpshufb   xmm15, xmm9, xmm1                             
        vpaddq    xmm5, xmm5, xmm3                              
        vpaddq    xmm7, xmm7, xmm15                             
        vpxor     xmm2, xmm13, xmm5                             
        vpxor     xmm13, xmm10, xmm7                            
        vpaddq    xmm10, xmm2, xmm2                             
        vpsrlq    xmm11, xmm13, 63                              
        vpsrlq    xmm9, xmm2, 63                                
        vpaddq    xmm13, xmm13, xmm13                           
        vmovdqu   xmm8, XMMWORD PTR [400+rsp]                   
        vpor      xmm9, xmm9, xmm10                             
        vpor      xmm2, xmm11, xmm13                            
        vpalignr  xmm13, xmm2, xmm9, 8                          
        vpunpckhqdq xmm6, xmm6, xmm8                            
        vpalignr  xmm10, xmm9, xmm2, 8                          
        vpaddq    xmm9, xmm14, xmm13                            
        vpaddq    xmm2, xmm4, xmm6                              
        vpalignr  xmm6, xmm3, xmm15, 8                          
        vpaddq    xmm4, xmm2, xmm10                             
        vpxor     xmm14, xmm6, xmm9                             
        vpalignr  xmm3, xmm15, xmm3, 8                          
        vpshufd   xmm14, xmm14, 177                             
        vpxor     xmm11, xmm3, xmm4                             
        vpaddq    xmm7, xmm7, xmm14                             
        vpaddq    xmm3, xmm9, XMMWORD PTR [528+rsp]             
        vpshufd   xmm6, xmm11, 177                              
        vpxor     xmm15, xmm13, xmm7                            
        vpaddq    xmm5, xmm5, xmm6                              
        vpshufb   xmm13, xmm15, xmm0                            
        vpxor     xmm2, xmm10, xmm5                             
        vpshufb   xmm10, xmm2, xmm0                             
        vpaddq    xmm2, xmm3, xmm13                             
        vpunpcklqdq xmm12, xmm8, xmm12                          
        vpxor     xmm9, xmm14, xmm2                             
        vpaddq    xmm3, xmm4, xmm12                             
        vpshufb   xmm9, xmm9, xmm1                              
        vpaddq    xmm3, xmm3, xmm10                             
        vpaddq    xmm7, xmm7, xmm9                              
        vpxor     xmm4, xmm6, xmm3                              
        vpshufb   xmm4, xmm4, xmm1                              
        vpaddq    xmm6, xmm5, xmm4                              
        vpxor     xmm5, xmm13, xmm7                             
        vpxor     xmm11, xmm10, xmm6                            
        vpaddq    xmm10, xmm5, xmm5                             
        vpsrlq    xmm8, xmm5, 63                                
        vpaddq    xmm5, xmm11, xmm11                            
        vpor      xmm10, xmm8, xmm10                            
        vpsrlq    xmm8, xmm11, 63                               
                                
..B1.26:                        
        vpor      xmm13, xmm8, xmm5                             
        inc       rbp                                           
        vpaddq    xmm12, xmm2, XMMWORD PTR [80+rsp]             
        vpaddq    xmm3, xmm3, XMMWORD PTR [208+rsp]             
        vpalignr  xmm14, xmm10, xmm13, 8                        
        lea       rsi, QWORD PTR [128+rcx+r9]                   
        vpalignr  xmm5, xmm13, xmm10, 8                         
        lea       rdx, QWORD PTR [-128+r10+r8]                  
        vpaddq    xmm2, xmm12, xmm14                            
        vpaddq    xmm3, xmm3, xmm5                              
        vpalignr  xmm10, xmm4, xmm9, 8                          
        add       r10, -128                                     
        vpalignr  xmm4, xmm9, xmm4, 8                           
        vpxor     xmm15, xmm10, xmm2                            
        vpxor     xmm9, xmm4, xmm3                              
        add       rcx, 128                                      
        vpshufd   xmm8, xmm15, 177                              
        vpshufd   xmm4, xmm9, 177                               
        vpaddq    xmm6, xmm6, xmm8                              
        vpaddq    xmm7, xmm7, xmm4                              
        vpaddq    xmm2, xmm2, XMMWORD PTR [16+rsp]              
        vpaddq    xmm3, xmm3, XMMWORD PTR [128+rsp]             
        vpxor     xmm11, xmm14, xmm6                            
        vpxor     xmm14, xmm5, xmm7                             
        vpshufb   xmm9, xmm11, xmm0                             
        vpshufb   xmm15, xmm14, xmm0                            
        vpaddq    xmm10, xmm2, xmm9                             
        vpaddq    xmm11, xmm3, xmm15                            
        vpxor     xmm8, xmm8, xmm10                             
        vpxor     xmm4, xmm4, xmm11                             
        vpshufb   xmm14, xmm8, xmm1                             
        vpaddq    xmm10, xmm10, XMMWORD PTR [64+rsp]            
        vpaddq    xmm13, xmm6, xmm14                            
        vpaddq    xmm11, xmm11, XMMWORD PTR [240+rsp]           
        vpshufb   xmm12, xmm4, xmm1                             
        vpaddq    xmm7, xmm7, xmm12                             
        vpxor     xmm6, xmm9, xmm13                             
        vpxor     xmm9, xmm15, xmm7                             
        vpaddq    xmm4, xmm6, xmm6                              
        vpaddq    xmm8, xmm9, xmm9                              
        vpsrlq    xmm3, xmm6, 63                                
        vpsrlq    xmm15, xmm9, 63                               
        vpor      xmm6, xmm3, xmm4                              
        vpor      xmm5, xmm15, xmm8                             
        vpalignr  xmm8, xmm5, xmm6, 8                           
        vpalignr  xmm15, xmm6, xmm5, 8                          
        vpaddq    xmm10, xmm10, xmm8                            
        vpaddq    xmm11, xmm11, xmm15                           
        vpalignr  xmm2, xmm14, xmm12, 8                         
        vpalignr  xmm14, xmm12, xmm14, 8                        
        vpxor     xmm3, xmm2, xmm10                             
        vpxor     xmm12, xmm14, xmm11                           
        vpshufd   xmm9, xmm3, 177                               
        vpshufd   xmm14, xmm12, 177                             
        vpaddq    xmm12, xmm7, xmm9                             
        vpaddq    xmm13, xmm13, xmm14                           
        vpaddq    xmm10, xmm10, XMMWORD PTR [48+rsp]            
        vpxor     xmm7, xmm8, xmm12                             
        vpxor     xmm4, xmm15, xmm13                            
        vpshufb   xmm7, xmm7, xmm0                              
        vpaddq    xmm8, xmm11, XMMWORD PTR [160+rsp]            
        vpaddq    xmm15, xmm10, xmm7                            
        vpshufb   xmm5, xmm4, xmm0                              
        vpaddq    xmm6, xmm8, xmm5                              
        vpxor     xmm9, xmm9, xmm15                             
        vpxor     xmm11, xmm14, xmm6                            
        vpshufb   xmm3, xmm9, xmm1                              
        vpaddq    xmm15, xmm15, XMMWORD PTR [192+rsp]           
        vpaddq    xmm8, xmm12, xmm3                             
        vpaddq    xmm6, xmm6, XMMWORD PTR [144+rsp]             
        vpshufb   xmm4, xmm11, xmm1                             
        vpaddq    xmm11, xmm13, xmm4                            
        vpxor     xmm13, xmm7, xmm8                             
        vpxor     xmm7, xmm5, xmm11                             
        vpaddq    xmm10, xmm13, xmm13                           
        vpsrlq    xmm9, xmm13, 63                               
        vpsrlq    xmm14, xmm7, 63                               
        vpaddq    xmm13, xmm7, xmm7                             
        vpor      xmm12, xmm9, xmm10                            
        vpor      xmm5, xmm14, xmm13                            
        vpalignr  xmm10, xmm12, xmm5, 8                         
        vpalignr  xmm2, xmm5, xmm12, 8                          
        vpaddq    xmm5, xmm15, xmm10                            
        vpaddq    xmm6, xmm6, xmm2                              
        vpalignr  xmm9, xmm4, xmm3, 8                           
        vpalignr  xmm3, xmm3, xmm4, 8                           
        vpxor     xmm15, xmm9, xmm5                             
        vpshufd   xmm15, xmm15, 177                             
        vpxor     xmm4, xmm3, xmm6                              
        vpshufd   xmm3, xmm4, 177                               
        vpaddq    xmm4, xmm11, xmm15                            
        vpaddq    xmm8, xmm8, xmm3                              
        vpxor     xmm11, xmm10, xmm4                            
        vpxor     xmm2, xmm2, xmm8                              
        vpshufb   xmm7, xmm11, xmm0                             
        vpaddq    xmm10, xmm5, XMMWORD PTR [176+rsp]            
        vpaddq    xmm11, xmm6, XMMWORD PTR [112+rsp]            
        vpaddq    xmm5, xmm10, xmm7                             
        vpshufb   xmm9, xmm2, xmm0                              
        vpaddq    xmm2, xmm11, xmm9                             
        vpxor     xmm15, xmm15, xmm5                            
        vpxor     xmm3, xmm3, xmm2                              
        vpshufb   xmm12, xmm15, xmm1                            
        vpaddq    xmm5, xmm5, XMMWORD PTR [32+rsp]              
        vpaddq    xmm14, xmm4, xmm12                            
        vpaddq    xmm2, xmm2, XMMWORD PTR [224+rsp]             
        vpshufb   xmm13, xmm3, xmm1                             
        vpaddq    xmm4, xmm8, xmm13                             
        vpxor     xmm8, xmm7, xmm14                             
        vpxor     xmm6, xmm9, xmm4                              
        vpaddq    xmm7, xmm8, xmm8                              
        vpsrlq    xmm9, xmm8, 63                                
        vpsrlq    xmm3, xmm6, 63                                
        vpor      xmm10, xmm9, xmm7                             
        vpaddq    xmm9, xmm6, xmm6                              
        vpor      xmm15, xmm3, xmm9                             
        vpalignr  xmm3, xmm15, xmm10, 8                         
        vpalignr  xmm9, xmm10, xmm15, 8                         
        vpaddq    xmm11, xmm5, xmm3                             
        vpaddq    xmm10, xmm2, xmm9                             
        vpalignr  xmm15, xmm12, xmm13, 8                        
        vpalignr  xmm13, xmm13, xmm12, 8                        
        vpxor     xmm8, xmm15, xmm11                            
        vpxor     xmm12, xmm13, xmm10                           
        vpshufd   xmm2, xmm8, 177                               
        vpshufd   xmm12, xmm12, 177                             
        vpaddq    xmm13, xmm4, xmm2                             
        vpaddq    xmm14, xmm14, xmm12                           
        vpaddq    xmm11, xmm11, XMMWORD PTR [96+rsp]            
        vpaddq    xmm7, xmm10, XMMWORD PTR [256+rsp]            
        vpxor     xmm3, xmm3, xmm13                             
        vpxor     xmm4, xmm9, xmm14                             
        vpshufb   xmm5, xmm3, xmm0                              
        vpshufb   xmm6, xmm4, xmm0                              
        vpaddq    xmm11, xmm11, xmm5                            
        vpaddq    xmm15, xmm7, xmm6                             
        vpxor     xmm3, xmm2, xmm11                             
        vpxor     xmm4, xmm12, xmm15                            
        vpshufb   xmm3, xmm3, xmm1                              
        vpshufb   xmm4, xmm4, xmm1                              
        vpaddq    xmm8, xmm13, xmm3                             
        vpaddq    xmm7, xmm14, xmm4                             
        vpxor     xmm14, xmm5, xmm8                             
        vpxor     xmm2, xmm6, xmm7                              
        vpaddq    xmm10, xmm14, xmm14                           
        vpaddq    xmm6, xmm2, xmm2                              
        vpsrlq    xmm9, xmm14, 63                               
        vpsrlq    xmm5, xmm2, 63                                
        vpor      xmm9, xmm9, xmm10                             
        vpor      xmm10, xmm5, xmm6                             
        vpalignr  xmm13, xmm9, xmm10, 8                         
        vpxor     xmm8, xmm15, xmm8                             
        vpalignr  xmm14, xmm4, xmm3, 8                          
        vpxor     xmm7, xmm11, xmm7                             
        vpxor     xmm15, xmm13, xmm14                           
        vpalignr  xmm5, xmm10, xmm9, 8                          
        vpalignr  xmm3, xmm3, xmm4, 8                           
        vpxor     xmm2, xmm15, XMMWORD PTR [496+rsp]            
        vpxor     xmm4, xmm5, xmm3                              
        vmovdqu   XMMWORD PTR [496+rsp], xmm2                   
        vpxor     xmm11, xmm7, XMMWORD PTR [448+rsp]            
        vpxor     xmm12, xmm8, XMMWORD PTR [464+rsp]            
        vpxor     xmm2, xmm4, XMMWORD PTR [480+rsp]             
        vmovdqu   XMMWORD PTR [448+rsp], xmm11                  
        vmovdqu   XMMWORD PTR [464+rsp], xmm12                  
        vmovdqu   XMMWORD PTR [480+rsp], xmm2                   
        cmp       rbp, rax                                      
        jb        ..B1.3       
                                
..B1.4:                         
        vmovdqu   xmm5, XMMWORD PTR .L_2il0floatpacket.17[rip]  
        vmovdqu   xmm11, XMMWORD PTR .L_2il0floatpacket.16[rip] 
        vmovdqu   xmm4, XMMWORD PTR .L_2il0floatpacket.15[rip]  
        mov       rbp, QWORD PTR [rsp]                          
..___tag_value_crypto_hash.5:                                   
                                
..B1.5:                         
        test      rdx, 128                                      
        je        ..B1.7      
                                
..B1.6:                         
        vmovdqu   xmm2, XMMWORD PTR [32+rsi]                    
        vmovdqu   xmm7, XMMWORD PTR [48+rsi]                    
        vmovdqu   xmm3, XMMWORD PTR [112+rsi]                   
        vmovdqu   xmm13, XMMWORD PTR [96+rsi]                   
        vmovdqu   xmm6, XMMWORD PTR [rsi]                       
        vmovdqu   xmm9, XMMWORD PTR [16+rsi]                    
        vmovdqu   XMMWORD PTR [288+rsp], xmm2                   
        vmovdqu   XMMWORD PTR [336+rsp], xmm7                   
        vmovdqu   xmm2, XMMWORD PTR [64+rsi]                    
        vmovdqu   xmm7, XMMWORD PTR [80+rsi]                    
        vmovdqu   XMMWORD PTR [304+rsp], xmm3                   
        jmp       ..B1.23       
                                
..B1.7:                         
        vpxor     xmm2, xmm2, xmm2                              
        vmovups   XMMWORD PTR [16+rsp], xmm2                    
        vmovups   XMMWORD PTR [32+rsp], xmm2                    
        vmovups   XMMWORD PTR [48+rsp], xmm2                    
        vmovups   XMMWORD PTR [64+rsp], xmm2                    
        vmovups   XMMWORD PTR [80+rsp], xmm2                    
        vmovups   XMMWORD PTR [96+rsp], xmm2                    
        vmovups   XMMWORD PTR [112+rsp], xmm2                   
        vmovups   XMMWORD PTR [rsp], xmm2                       
                                
..B1.8:                         
        lea       rcx, QWORD PTR [rsp]                          
        test      rdx, 64                                       
        je        ..B1.10       
                                
..B1.9:                         
        vmovdqu   xmm2, XMMWORD PTR [rsi]                       
        vmovdqu   xmm3, XMMWORD PTR [16+rsi]                    
        vmovdqu   xmm6, XMMWORD PTR [32+rsi]                    
        vmovdqu   xmm7, XMMWORD PTR [48+rsi]                    
        vmovdqu   XMMWORD PTR [rsp], xmm2                       
        lea       rcx, QWORD PTR [64+rsp]                       
        vmovdqu   XMMWORD PTR [16+rsp], xmm3                    
        add       rsi, 64                                       
        vmovdqu   XMMWORD PTR [32+rsp], xmm6                    
        vmovdqu   XMMWORD PTR [48+rsp], xmm7                    
                                
..B1.10:                        
        test      rdx, 32                                       
        je        ..B1.12       
                                
..B1.11:                        
        vmovdqu   xmm2, XMMWORD PTR [rsi]                       
        vmovdqu   xmm3, XMMWORD PTR [16+rsi]                    
        vmovdqu   XMMWORD PTR [rcx], xmm2                       
        add       rsi, 32                                       
        vmovdqu   XMMWORD PTR [16+rcx], xmm3                    
        add       rcx, 32                                       
                                
..B1.12:                        
        test      rdx, 16                                       
        je        ..B1.14       
                                
..B1.13:                        
        vmovdqu   xmm2, XMMWORD PTR [rsi]                       
        vmovdqu   XMMWORD PTR [rcx], xmm2                       
        add       rsi, 16                                       
        add       rcx, 16                                       
                                
..B1.14:                        
        test      rdx, 8                                        
        je        ..B1.16       
                                
..B1.15:                        
        mov       rax, QWORD PTR [rsi]                          
        add       rsi, 8                                        
        mov       QWORD PTR [rcx], rax                          
        add       rcx, 8                                        
                                
..B1.16:                        
        test      rdx, 4                                        
        je        ..B1.18       
                                
..B1.17:                        
        mov       eax, DWORD PTR [rsi]                          
        add       rsi, 4                                        
        mov       DWORD PTR [rcx], eax                          
        add       rcx, 4                                        
                                
..B1.18:                        
        test      rdx, 2                                        
        je        ..B1.20       
                                
..B1.19:                        
        movzx     eax, WORD PTR [rsi]                           
        add       rsi, 2                                        
        mov       WORD PTR [rcx], ax                            
        add       rcx, 2                                        
                                
..B1.20:                        
        test      rdx, 1                                        
        je        ..B1.22       
                                
..B1.21:                        
        mov       al, BYTE PTR [rsi]                            
        mov       BYTE PTR [rcx], al                            
                                
..B1.22:                        
        vmovdqu   xmm2, XMMWORD PTR [32+rsp]                    
        vmovdqu   xmm7, XMMWORD PTR [48+rsp]                    
        vmovdqu   xmm3, XMMWORD PTR [112+rsp]                   
        vmovdqu   xmm13, XMMWORD PTR [96+rsp]                   
        vmovdqu   xmm6, XMMWORD PTR [rsp]                       
        vmovdqu   xmm9, XMMWORD PTR [16+rsp]                    
        vmovdqu   XMMWORD PTR [288+rsp], xmm2                   
        vmovdqu   XMMWORD PTR [336+rsp], xmm7                   
        vmovdqu   xmm2, XMMWORD PTR [64+rsp]                    
        vmovdqu   xmm7, XMMWORD PTR [80+rsp]                    
        vmovdqu   XMMWORD PTR [304+rsp], xmm3                   
                                
..B1.23:                        
        vpunpcklqdq xmm3, xmm6, xmm9                            
        add       rdx, r11                                      
        vmovdqu   xmm8, XMMWORD PTR [288+rsp]                   
        mov       rax, -1                                       
        vmovdqu   xmm10, XMMWORD PTR [336+rsp]                  
        vpaddq    xmm14, xmm3, XMMWORD PTR [448+rsp]            
        vpunpcklqdq xmm12, xmm8, xmm10                          
        vmovdqu   XMMWORD PTR [48+rsp], xmm3                    
        vmovdqu   XMMWORD PTR [400+rsp], xmm13                  
        vmovdqu   xmm3, XMMWORD PTR [496+rsp]                   
        vpaddq    xmm13, xmm12, XMMWORD PTR [464+rsp]           
        vpaddq    xmm15, xmm14, xmm3                            
        vmovdqu   xmm14, XMMWORD PTR [480+rsp]                  
        vmovdqu   XMMWORD PTR [112+rsp], xmm12                  
        vpaddq    xmm12, xmm13, xmm14                           
        vmovd     xmm13, rdx                                    
        vpxor     xmm4, xmm13, xmm4                             
        vmovd     xmm13, rax                                    
        vpxor     xmm11, xmm13, xmm11                           
        vpxor     xmm4, xmm4, xmm15                             
        vpxor     xmm11, xmm11, xmm12                           
        vpshufd   xmm4, xmm4, 177                               
        vpshufd   xmm13, xmm11, 177                             
        vpaddq    xmm5, xmm5, xmm4                              
        vpaddq    xmm11, xmm13, XMMWORD PTR .L_2il0floatpacket.14[rip] 
        vpxor     xmm3, xmm3, xmm5                              
        vpxor     xmm14, xmm14, xmm11                           
        vpshufb   xmm3, xmm3, xmm0                              
        vpshufb   xmm14, xmm14, xmm0                            
        vmovdqu   XMMWORD PTR [384+rsp], xmm9                   
        vpunpckhqdq xmm9, xmm6, xmm9                            
        vpunpckhqdq xmm8, xmm8, xmm10                           
        vmovdqu   XMMWORD PTR [368+rsp], xmm6                   
        vpaddq    xmm10, xmm15, xmm9                            
        vpaddq    xmm6, xmm12, xmm8                             
        vmovdqu   XMMWORD PTR [rsp], xmm9                       
        vpaddq    xmm9, xmm10, xmm3                             
        vpaddq    xmm10, xmm6, xmm14                            
        vpxor     xmm12, xmm4, xmm9                             
        vpxor     xmm4, xmm13, xmm10                            
        vpshufb   xmm6, xmm12, xmm1                             
        vpshufb   xmm4, xmm4, xmm1                              
        vpaddq    xmm12, xmm5, xmm6                             
        vpaddq    xmm11, xmm11, xmm4                            
        vpxor     xmm5, xmm3, xmm12                             
        vpxor     xmm13, xmm14, xmm11                           
        vpaddq    xmm14, xmm5, xmm5                             
        vpsrlq    xmm3, xmm5, 63                                
        vpaddq    xmm5, xmm13, xmm13                            
        vmovdqu   XMMWORD PTR [160+rsp], xmm8                   
        vpsrlq    xmm8, xmm13, 63                               
        vpor      xmm15, xmm3, xmm14                            
        vpor      xmm14, xmm8, xmm5                             
        vmovdqu   xmm8, XMMWORD PTR [400+rsp]                   
        vmovdqu   xmm5, XMMWORD PTR [304+rsp]                   
        vpalignr  xmm3, xmm14, xmm15, 8                         
        vpalignr  xmm15, xmm15, xmm14, 8                        
        vpunpcklqdq xmm14, xmm2, xmm7                           
        vpunpcklqdq xmm13, xmm8, xmm5                           
        vpaddq    xmm9, xmm9, xmm14                             
        vpaddq    xmm10, xmm10, xmm13                           
        vpaddq    xmm9, xmm9, xmm3                              
        vpaddq    xmm10, xmm10, xmm15                           
        vmovdqu   XMMWORD PTR [224+rsp], xmm13                  
        vpalignr  xmm13, xmm6, xmm4, 8                          
        vpalignr  xmm6, xmm4, xmm6, 8                           
        vmovdqu   XMMWORD PTR [16+rsp], xmm14                   
        vpxor     xmm14, xmm13, xmm9                            
        vpxor     xmm6, xmm6, xmm10                             
        vpshufd   xmm14, xmm14, 177                             
        vpshufd   xmm6, xmm6, 177                               
        vpaddq    xmm11, xmm11, xmm14                           
        vpaddq    xmm13, xmm12, xmm6                            
        vpxor     xmm12, xmm3, xmm11                            
        vpxor     xmm3, xmm15, xmm13                            
        vpshufb   xmm4, xmm12, xmm0                             
        vpshufb   xmm12, xmm3, xmm0                             
        vpunpckhqdq xmm3, xmm2, xmm7                            
        vpunpckhqdq xmm15, xmm8, xmm5                           
        vmovdqu   XMMWORD PTR [80+rsp], xmm15                   
        vpaddq    xmm9, xmm9, xmm3                              
        vpaddq    xmm15, xmm10, xmm15                           
        vmovdqu   XMMWORD PTR [64+rsp], xmm3                    
        vpaddq    xmm3, xmm9, xmm4                              
        vpaddq    xmm10, xmm15, xmm12                           
        vpxor     xmm9, xmm14, xmm3                             
        vpxor     xmm6, xmm6, xmm10                             
        vpshufb   xmm14, xmm9, xmm1                             
        vpshufb   xmm9, xmm6, xmm1                              
        vpaddq    xmm6, xmm11, xmm14                            
        vpaddq    xmm13, xmm13, xmm9                            
        vpxor     xmm11, xmm4, xmm6                             
        vpxor     xmm12, xmm12, xmm13                           
        vpsrlq    xmm4, xmm11, 63                               
        vpsrlq    xmm15, xmm12, 63                              
        vpaddq    xmm11, xmm11, xmm11                           
        vpaddq    xmm12, xmm12, xmm12                           
        vpor      xmm4, xmm4, xmm11                             
        vpor      xmm11, xmm15, xmm12                           
        vpalignr  xmm12, xmm4, xmm11, 8                         
        vpalignr  xmm11, xmm11, xmm4, 8                         
        vmovdqu   xmm4, XMMWORD PTR [288+rsp]                   
        vpunpcklqdq xmm15, xmm5, xmm4                           
        vpunpckhqdq xmm8, xmm2, xmm8                            
        vpaddq    xmm3, xmm3, xmm15                             
        vpaddq    xmm10, xmm10, xmm8                            
        vpaddq    xmm3, xmm3, xmm12                             
        vmovdqu   XMMWORD PTR [96+rsp], xmm8                    
        vpalignr  xmm8, xmm9, xmm14, 8                          
        vmovdqu   XMMWORD PTR [176+rsp], xmm15                  
        vpaddq    xmm15, xmm10, xmm11                           
        vpalignr  xmm9, xmm14, xmm9, 8                          
        vpxor     xmm10, xmm8, xmm3                             
        vpshufd   xmm10, xmm10, 177                             
        vpxor     xmm14, xmm9, xmm15                            
        vpshufd   xmm14, xmm14, 177                             
        vpaddq    xmm9, xmm13, xmm10                            
        vpaddq    xmm13, xmm6, xmm14                            
        vpxor     xmm6, xmm12, xmm9                             
        vpshufb   xmm12, xmm6, xmm0                             
        vpxor     xmm6, xmm11, xmm13                            
        vpshufb   xmm11, xmm6, xmm0                             
        vmovdqu   xmm6, XMMWORD PTR [336+rsp]                   
        vmovdqu   XMMWORD PTR [352+rsp], xmm2                   
        vpunpcklqdq xmm8, xmm7, xmm2                            
        vpalignr  xmm2, xmm6, xmm5, 8                           
        vmovdqu   XMMWORD PTR [128+rsp], xmm2                   
        vpaddq    xmm3, xmm3, xmm8                              
        vpaddq    xmm2, xmm15, xmm2                             
        vmovdqu   XMMWORD PTR [192+rsp], xmm8                   
        vpaddq    xmm8, xmm3, xmm12                             
        vpaddq    xmm2, xmm2, xmm11                             
        vpxor     xmm15, xmm10, xmm8                            
        vpxor     xmm10, xmm14, xmm2                            
        vpshufb   xmm3, xmm15, xmm1                             
        vpshufb   xmm15, xmm10, xmm1                            
        vpaddq    xmm10, xmm9, xmm3                             
        vpaddq    xmm9, xmm13, xmm15                            
        vpxor     xmm13, xmm12, xmm10                           
        vpxor     xmm14, xmm11, xmm9                            
        vpaddq    xmm11, xmm13, xmm13                           
        vpsrlq    xmm12, xmm13, 63                              
        vpsrlq    xmm13, xmm14, 63                              
        vpaddq    xmm14, xmm14, xmm14                           
        vpor      xmm11, xmm12, xmm11                           
        vpor      xmm12, xmm13, xmm14                           
        vpalignr  xmm14, xmm12, xmm11, 8                        
        vpalignr  xmm13, xmm11, xmm12, 8                        
        vpshufd   xmm11, XMMWORD PTR [368+rsp], 78              
        vpunpckhqdq xmm12, xmm7, xmm4                           
        vpaddq    xmm8, xmm8, xmm11                             
        vpaddq    xmm2, xmm2, xmm12                             
        vmovdqu   XMMWORD PTR [32+rsp], xmm11                   
        vmovdqu   XMMWORD PTR [208+rsp], xmm12                  
        vpaddq    xmm11, xmm8, xmm14                            
        vpaddq    xmm12, xmm2, xmm13                            
        vpalignr  xmm2, xmm3, xmm15, 8                          
        vpalignr  xmm3, xmm15, xmm3, 8                          
        vpxor     xmm8, xmm2, xmm11                             
        vpxor     xmm2, xmm3, xmm12                             
        vpshufd   xmm8, xmm8, 177                               
        vpshufd   xmm2, xmm2, 177                               
        vpaddq    xmm9, xmm9, xmm8                              
        vpaddq    xmm3, xmm10, xmm2                             
        vpxor     xmm15, xmm14, xmm9                            
        vpxor     xmm14, xmm13, xmm3                            
        vpshufb   xmm10, xmm15, xmm0                            
        vpshufb   xmm15, xmm14, xmm0                            
        vmovdqu   xmm13, XMMWORD PTR [384+rsp]                  
        vmovdqu   xmm14, XMMWORD PTR [400+rsp]                  
        vpunpcklqdq xmm0, xmm14, xmm13                          
        vmovdqu   XMMWORD PTR [144+rsp], xmm0                   
        vpaddq    xmm0, xmm11, xmm0                             
        vpunpckhqdq xmm6, xmm6, xmm13                           
        vpaddq    xmm11, xmm0, xmm10                            
        vpaddq    xmm0, xmm12, xmm6                             
        vpaddq    xmm0, xmm0, xmm15                             
        vmovdqu   XMMWORD PTR [240+rsp], xmm6                   
        vpxor     xmm6, xmm8, xmm11                             
        vpxor     xmm2, xmm2, xmm0                              
        vpshufb   xmm8, xmm6, xmm1                              
        vpshufb   xmm2, xmm2, xmm1                              
        vpaddq    xmm9, xmm9, xmm8                              
        vpaddq    xmm3, xmm3, xmm2                              
        vpxor     xmm10, xmm10, xmm9                            
        vpxor     xmm12, xmm15, xmm3                            
        vpaddq    xmm15, xmm10, xmm10                           
        vpsrlq    xmm6, xmm10, 63                               
        vpsrlq    xmm10, xmm12, 63                              
        vpaddq    xmm12, xmm12, xmm12                           
        vpor      xmm6, xmm6, xmm15                             
        vpor      xmm12, xmm10, xmm12                           
        vpalignr  xmm15, xmm6, xmm12, 8                         
        vpalignr  xmm10, xmm12, xmm6, 8                         
        vpunpckhqdq xmm6, xmm4, xmm5                            
        vpalignr  xmm4, xmm14, xmm7, 8                          
        vpaddq    xmm12, xmm11, xmm4                            
        vpaddq    xmm0, xmm0, xmm6                              
        vpaddq    xmm11, xmm12, xmm15                           
        vpaddq    xmm12, xmm0, xmm10                            
        vmovdqu   XMMWORD PTR [272+rsp], xmm6                   
        vpalignr  xmm6, xmm2, xmm8, 8                           
        vpalignr  xmm8, xmm8, xmm2, 8                           
        vpxor     xmm4, xmm6, xmm11                             
        vpshufd   xmm4, xmm4, 177                               
        vpxor     xmm0, xmm8, xmm12                             
        vpshufd   xmm8, xmm0, 177                               
        vpaddq    xmm3, xmm3, xmm4                              
        vpaddq    xmm9, xmm9, xmm8                              
        vmovdqu   xmm0, XMMWORD PTR .L_2il0floatpacket.12[rip]  
        vpxor     xmm2, xmm15, xmm3                             
        vpshufb   xmm15, xmm2, xmm0                             
        vpxor     xmm2, xmm10, xmm9                             
        vpshufb   xmm10, xmm2, xmm0                             
        vmovdqu   xmm2, XMMWORD PTR [352+rsp]                   
        vmovhpd   xmm6, xmm2, QWORD PTR [368+rsp]               
        vpaddq    xmm11, xmm11, xmm6                            
        vpaddq    xmm6, xmm11, xmm15                            
        vpblendw  xmm11, xmm13, xmm14, 240                      
        vpxor     xmm4, xmm4, xmm6                              
        vpaddq    xmm12, xmm12, xmm11                           
        vpshufb   xmm11, xmm4, xmm1                             
        vpaddq    xmm12, xmm12, xmm10                           
        vpaddq    xmm3, xmm3, xmm11                             
        vpxor     xmm8, xmm8, xmm12                             
        vpshufb   xmm4, xmm8, xmm1                              
        vpaddq    xmm9, xmm9, xmm4                              
        vpxor     xmm8, xmm15, xmm3                             
        vpxor     xmm15, xmm10, xmm9                            
        vpsrlq    xmm10, xmm8, 63                               
        vpaddq    xmm8, xmm8, xmm8                              
        vpor      xmm10, xmm10, xmm8                            
        vpsrlq    xmm8, xmm15, 63                               
        vpaddq    xmm15, xmm15, xmm15                           
        vpblendw  xmm13, xmm7, xmm13, 240                       
        vpor      xmm8, xmm8, xmm15                             
        vpaddq    xmm6, xmm6, xmm13                             
        vpalignr  xmm15, xmm8, xmm10, 8                         
        vpaddq    xmm13, xmm6, xmm15                            
        vmovdqu   xmm6, XMMWORD PTR [336+rsp]                   
        vpalignr  xmm10, xmm10, xmm8, 8                         
        vpunpckhqdq xmm8, xmm6, xmm2                            
        vpaddq    xmm12, xmm12, xmm8                            
        vpaddq    xmm8, xmm12, xmm10                            
        vpalignr  xmm12, xmm11, xmm4, 8                         
        vpxor     xmm12, xmm12, xmm13                           
        vpshufd   xmm12, xmm12, 177                             
        vpaddq    xmm9, xmm9, xmm12                             
        vpalignr  xmm11, xmm4, xmm11, 8                         
        vpxor     xmm15, xmm15, xmm9                            
        vpxor     xmm4, xmm11, xmm8                             
        vpshufd   xmm11, xmm4, 177                              
        vpshufb   xmm15, xmm15, xmm0                            
        vpaddq    xmm3, xmm3, xmm11                             
        vpunpcklqdq xmm6, xmm5, xmm6                            
        vpxor     xmm10, xmm10, xmm3                            
        vpaddq    xmm13, xmm13, xmm6                            
        vpshufb   xmm10, xmm10, xmm0                            
        vpaddq    xmm4, xmm13, xmm15                            
        vmovdqu   xmm13, XMMWORD PTR [288+rsp]                  
        vpxor     xmm12, xmm12, xmm4                            
        vmovdqu   xmm6, XMMWORD PTR [368+rsp]                   
        vpalignr  xmm13, xmm13, xmm6, 8                         
        vpaddq    xmm8, xmm8, xmm13                             
        vpaddq    xmm4, xmm4, XMMWORD PTR [240+rsp]             
        vpaddq    xmm13, xmm8, xmm10                            
        vpshufb   xmm12, xmm12, xmm1                            
        vpxor     xmm11, xmm11, xmm13                           
        vpshufb   xmm11, xmm11, xmm1                            
        vpaddq    xmm9, xmm9, xmm12                             
        vpaddq    xmm3, xmm3, xmm11                             
        vpxor     xmm8, xmm15, xmm9                             
        vpxor     xmm10, xmm10, xmm3                            
        vpsrlq    xmm15, xmm8, 63                               
        vpaddq    xmm8, xmm8, xmm8                              
        vpor      xmm8, xmm15, xmm8                             
        vpsrlq    xmm15, xmm10, 63                              
        vpaddq    xmm10, xmm10, xmm10                           
        vpor      xmm15, xmm15, xmm10                           
        vpunpckhqdq xmm14, xmm14, xmm7                          
        vpalignr  xmm10, xmm8, xmm15, 8                         
        vpaddq    xmm14, xmm13, xmm14                           
        vpaddq    xmm4, xmm4, xmm10                             
        vpalignr  xmm15, xmm15, xmm8, 8                         
        vpalignr  xmm8, xmm11, xmm12, 8                         
        vpaddq    xmm13, xmm14, xmm15                           
        vpalignr  xmm12, xmm12, xmm11, 8                        
        vpxor     xmm14, xmm8, xmm4                             
        vpshufd   xmm14, xmm14, 177                             
        vpxor     xmm11, xmm12, xmm13                           
        vpshufd   xmm12, xmm11, 177                             
        vpaddq    xmm3, xmm3, xmm14                             
        vpaddq    xmm9, xmm9, xmm12                             
        vpaddq    xmm13, xmm13, XMMWORD PTR [224+rsp]           
        vpxor     xmm10, xmm10, xmm3                            
        vpxor     xmm15, xmm15, xmm9                            
        vpshufb   xmm10, xmm10, xmm0                            
        vpshufb   xmm15, xmm15, xmm0                            
        vpunpckhqdq xmm11, xmm2, xmm6                           
        vpaddq    xmm4, xmm4, xmm11                             
        vpaddq    xmm11, xmm4, xmm10                            
        vpaddq    xmm4, xmm13, xmm15                            
        vpxor     xmm14, xmm14, xmm11                           
        vpxor     xmm12, xmm12, xmm4                            
        vpshufb   xmm14, xmm14, xmm1                            
        vpshufb   xmm12, xmm12, xmm1                            
        vpaddq    xmm3, xmm3, xmm14                             
        vpaddq    xmm8, xmm9, xmm12                             
        vpxor     xmm10, xmm10, xmm3                            
        vpxor     xmm9, xmm15, xmm8                             
        vpaddq    xmm15, xmm10, xmm10                           
        vpsrlq    xmm13, xmm10, 63                              
        vpor      xmm10, xmm13, xmm15                           
        vpsrlq    xmm13, xmm9, 63                               
        vpaddq    xmm9, xmm9, xmm9                              
        vpor      xmm15, xmm13, xmm9                            
        vpalignr  xmm9, xmm15, xmm10, 8                         
        vpalignr  xmm10, xmm10, xmm15, 8                        
        vmovdqu   xmm15, XMMWORD PTR [288+rsp]                  
        vpblendw  xmm13, xmm15, xmm5, 240                       
        vmovdqu   xmm5, XMMWORD PTR [384+rsp]                   
        vpblendw  xmm5, xmm5, xmm15, 240                        
        vpaddq    xmm11, xmm11, xmm5                            
        vpaddq    xmm4, xmm4, xmm13                             
        vpaddq    xmm5, xmm11, xmm9                             
        vpaddq    xmm4, xmm4, xmm10                             
        vpalignr  xmm11, xmm14, xmm12, 8                        
        vpalignr  xmm12, xmm12, xmm14, 8                        
        vmovdqu   XMMWORD PTR [416+rsp], xmm13                  
        vpxor     xmm13, xmm11, xmm5                            
        vpxor     xmm14, xmm12, xmm4                            
        vpshufd   xmm11, xmm13, 177                             
        vpshufd   xmm14, xmm14, 177                             
        vpaddq    xmm12, xmm8, xmm11                            
        vpaddq    xmm8, xmm3, xmm14                             
        vpxor     xmm9, xmm9, xmm12                             
        vpxor     xmm10, xmm10, xmm8                            
        vpshufb   xmm3, xmm9, xmm0                              
        vpshufb   xmm10, xmm10, xmm0                            
        vmovdqu   xmm9, XMMWORD PTR [336+rsp]                   
        vpunpcklqdq xmm13, xmm9, xmm7                           
        vpunpcklqdq xmm9, xmm6, xmm2                            
        vpaddq    xmm5, xmm5, xmm13                             
        vpaddq    xmm4, xmm4, xmm9                              
        vmovdqu   XMMWORD PTR [256+rsp], xmm13                  
        vpaddq    xmm13, xmm5, xmm3                             
        vpaddq    xmm5, xmm4, xmm10                             
        vpxor     xmm11, xmm11, xmm13                           
        vpxor     xmm14, xmm14, xmm5                            
        vpshufb   xmm11, xmm11, xmm1                            
        vpshufb   xmm14, xmm14, xmm1                            
        vpaddq    xmm12, xmm12, xmm11                           
        vpaddq    xmm4, xmm8, xmm14                             
        vpxor     xmm3, xmm3, xmm12                             
        vpxor     xmm10, xmm10, xmm4                            
        vmovdqu   XMMWORD PTR [320+rsp], xmm9                   
        vpsrlq    xmm8, xmm3, 63                                
        vpaddq    xmm9, xmm3, xmm3                              
        vpsrlq    xmm3, xmm10, 63                               
        vpor      xmm9, xmm8, xmm9                              
        vpaddq    xmm10, xmm10, xmm10                           
        vpunpckhqdq xmm15, xmm2, xmm15                          
        vpor      xmm8, xmm3, xmm10                             
        vpalignr  xmm3, xmm9, xmm8, 8                           
        vpalignr  xmm8, xmm8, xmm9, 8                           
        vpaddq    xmm9, xmm13, xmm15                            
        vpaddq    xmm15, xmm9, xmm3                             
        vmovdqu   xmm9, XMMWORD PTR [384+rsp]                   
        vpunpcklqdq xmm10, xmm9, xmm7                           
        vpaddq    xmm13, xmm5, xmm10                            
        vpaddq    xmm5, xmm13, xmm8                             
        vpalignr  xmm10, xmm14, xmm11, 8                        
        vpalignr  xmm11, xmm11, xmm14, 8                        
        vpxor     xmm13, xmm10, xmm15                           
        vpxor     xmm14, xmm11, xmm5                            
        vpshufd   xmm13, xmm13, 177                             
        vpshufd   xmm11, xmm14, 177                             
        vpaddq    xmm4, xmm4, xmm13                             
        vpaddq    xmm12, xmm12, xmm11                           
        vpaddq    xmm5, xmm5, XMMWORD PTR [416+rsp]             
        vpxor     xmm10, xmm3, xmm4                             
        vpxor     xmm3, xmm8, xmm12                             
        vpshufb   xmm8, xmm3, xmm0                              
        vpshufb   xmm14, xmm10, xmm0                            
        vpaddq    xmm5, xmm5, xmm8                              
        vmovdqu   xmm3, XMMWORD PTR [336+rsp]                   
        vpxor     xmm11, xmm11, xmm5                            
        vpblendw  xmm10, xmm6, xmm3, 240                        
        vpaddq    xmm15, xmm15, xmm10                           
        vpaddq    xmm15, xmm15, xmm14                           
        vpxor     xmm13, xmm13, xmm15                           
        vpshufb   xmm10, xmm13, xmm1                            
        vpshufb   xmm13, xmm11, xmm1                            
        vpaddq    xmm4, xmm4, xmm10                             
        vpaddq    xmm12, xmm12, xmm13                           
        vpxor     xmm11, xmm14, xmm4                            
        vpxor     xmm14, xmm8, xmm12                            
        vpsrlq    xmm8, xmm11, 63                               
        vpaddq    xmm11, xmm11, xmm11                           
        vpor      xmm11, xmm8, xmm11                            
        vpsrlq    xmm8, xmm14, 63                               
        vpaddq    xmm14, xmm14, xmm14                           
        vpor      xmm8, xmm8, xmm14                             
        vpalignr  xmm14, xmm8, xmm11, 8                         
        vpalignr  xmm8, xmm11, xmm8, 8                          
        vmovdqu   xmm11, XMMWORD PTR [304+rsp]                  
        vpblendw  xmm11, xmm11, xmm7, 240                       
        vpblendw  xmm3, xmm3, xmm9, 240                         
        vpaddq    xmm15, xmm15, xmm11                           
        vpaddq    xmm5, xmm5, xmm3                              
        vpaddq    xmm15, xmm15, xmm14                           
        vpaddq    xmm5, xmm5, xmm8                              
        vpalignr  xmm11, xmm10, xmm13, 8                        
        vpalignr  xmm10, xmm13, xmm10, 8                        
        vpxor     xmm3, xmm11, xmm15                            
        vpxor     xmm13, xmm10, xmm5                            
        vpshufd   xmm11, xmm3, 177                              
        vpshufd   xmm3, xmm13, 177                              
        vpaddq    xmm12, xmm12, xmm11                           
        vpaddq    xmm10, xmm4, xmm3                             
        vmovdqu   xmm13, XMMWORD PTR [400+rsp]                  
        vpxor     xmm4, xmm14, xmm12                            
        vpxor     xmm14, xmm8, xmm10                            
        vpalignr  xmm8, xmm13, xmm6, 8                          
        vpshufb   xmm4, xmm4, xmm0                              
        vpaddq    xmm8, xmm15, xmm8                             
        vpshufb   xmm14, xmm14, xmm0                            
        vpaddq    xmm8, xmm8, xmm4                              
        vpblendw  xmm15, xmm2, xmm13, 240                       
        vpaddq    xmm5, xmm5, xmm15                             
        vpaddq    xmm5, xmm5, xmm14                             
                                
..B1.29:                        
        vmovdqu   XMMWORD PTR [352+rsp], xmm2                   
        vpxor     xmm2, xmm11, xmm8                             
        vpshufb   xmm2, xmm2, xmm1                              
        vpxor     xmm15, xmm3, xmm5                             
        vpshufb   xmm3, xmm15, xmm1                             
        vpaddq    xmm12, xmm12, xmm2                            
        vpaddq    xmm10, xmm10, xmm3                            
        vpaddq    xmm5, xmm5, XMMWORD PTR [320+rsp]             
        vpxor     xmm4, xmm4, xmm12                             
        vpxor     xmm11, xmm14, xmm10                           
        vpsrlq    xmm14, xmm4, 63                               
        vpaddq    xmm4, xmm4, xmm4                              
        vpor      xmm4, xmm14, xmm4                             
        vpsrlq    xmm14, xmm11, 63                              
        vpaddq    xmm11, xmm11, xmm11                           
        vpor      xmm15, xmm14, xmm11                           
        vpalignr  xmm14, xmm4, xmm15, 8                         
        vpalignr  xmm11, xmm15, xmm4, 8                         
        vmovdqu   xmm4, XMMWORD PTR [336+rsp]                   
        vpunpcklqdq xmm15, xmm9, xmm4                           
        vpaddq    xmm8, xmm8, xmm15                             
        vpaddq    xmm5, xmm5, xmm11                             
        vpaddq    xmm8, xmm8, xmm14                             
        vpalignr  xmm15, xmm3, xmm2, 8                          
        vpalignr  xmm2, xmm2, xmm3, 8                           
        vpxor     xmm15, xmm15, xmm8                            
        vpxor     xmm3, xmm2, xmm5                              
        vpshufd   xmm15, xmm15, 177                             
        vpshufd   xmm2, xmm3, 177                               
        vpaddq    xmm10, xmm10, xmm15                           
        vpaddq    xmm12, xmm12, xmm2                            
        vpxor     xmm3, xmm14, xmm10                            
        vpxor     xmm11, xmm11, xmm12                           
        vpshufb   xmm14, xmm3, xmm0                             
        vpshufb   xmm11, xmm11, xmm0                            
        vmovdqu   XMMWORD PTR [384+rsp], xmm9                   
        vpunpcklqdq xmm3, xmm13, xmm7                           
        vpunpckhqdq xmm9, xmm7, xmm9                            
        vpaddq    xmm8, xmm8, xmm3                              
        vpaddq    xmm5, xmm5, xmm9                              
        vpaddq    xmm8, xmm8, xmm14                             
        vpaddq    xmm5, xmm5, xmm11                             
        vpxor     xmm9, xmm15, xmm8                             
        vpxor     xmm2, xmm2, xmm5                              
        vpshufb   xmm9, xmm9, xmm1                              
        vpshufb   xmm2, xmm2, xmm1                              
        vpaddq    xmm10, xmm10, xmm9                            
        vpaddq    xmm12, xmm12, xmm2                            
        vpxor     xmm14, xmm14, xmm10                           
        vpxor     xmm3, xmm11, xmm12                            
        vpsrlq    xmm11, xmm14, 63                              
        vpsrlq    xmm15, xmm3, 63                               
        vpaddq    xmm14, xmm14, xmm14                           
        vpaddq    xmm3, xmm3, xmm3                              
        vpor      xmm11, xmm11, xmm14                           
        vpor      xmm15, xmm15, xmm3                            
        vpalignr  xmm14, xmm15, xmm11, 8                        
        vpalignr  xmm15, xmm11, xmm15, 8                        
        vmovdqu   xmm11, XMMWORD PTR [288+rsp]                  
        vpblendw  xmm4, xmm11, xmm4, 240                        
        vpaddq    xmm8, xmm8, xmm4                              
        vmovdqu   xmm4, XMMWORD PTR [304+rsp]                   
        vpunpckhqdq xmm3, xmm4, xmm6                            
        vpaddq    xmm5, xmm5, xmm3                              
        vpaddq    xmm8, xmm8, xmm14                             
        vpaddq    xmm3, xmm5, xmm15                             
        vpalignr  xmm5, xmm9, xmm2, 8                           
        vpxor     xmm5, xmm5, xmm8                              
        vpshufd   xmm5, xmm5, 177                               
        vpaddq    xmm12, xmm12, xmm5                            
        vpalignr  xmm2, xmm2, xmm9, 8                           
        vpxor     xmm9, xmm2, xmm3                              
        vpxor     xmm2, xmm14, xmm12                            
        vpshufd   xmm9, xmm9, 177                               
        vpshufb   xmm14, xmm2, xmm0                             
        vpaddq    xmm10, xmm10, xmm9                            
        vpunpckhqdq xmm11, xmm13, xmm11                         
        vpxor     xmm15, xmm15, xmm10                           
        vpaddq    xmm8, xmm8, xmm11                             
        vpshufb   xmm15, xmm15, xmm0                            
        vpaddq    xmm11, xmm8, xmm14                            
        vmovdqu   xmm8, XMMWORD PTR [352+rsp]                   
        vpxor     xmm5, xmm5, xmm11                             
        vpblendw  xmm2, xmm4, xmm8, 240                         
        vpaddq    xmm3, xmm3, xmm2                              
        vpshufb   xmm5, xmm5, xmm1                              
        vpaddq    xmm3, xmm3, xmm15                             
        vpaddq    xmm12, xmm12, xmm5                            
        vpxor     xmm9, xmm9, xmm3                              
        vpxor     xmm14, xmm14, xmm12                           
        vpshufb   xmm9, xmm9, xmm1                              
        vpaddq    xmm3, xmm3, XMMWORD PTR [176+rsp]             
        vpaddq    xmm2, xmm10, xmm9                             
        vpsrlq    xmm10, xmm14, 63                              
        vpxor     xmm15, xmm15, xmm2                            
        vpaddq    xmm14, xmm14, xmm14                           
        vpor      xmm14, xmm10, xmm14                           
        vpsrlq    xmm10, xmm15, 63                              
        vpaddq    xmm15, xmm15, xmm15                           
        vpor      xmm10, xmm10, xmm15                           
        vpalignr  xmm15, xmm14, xmm10, 8                        
        vpalignr  xmm10, xmm10, xmm14, 8                        
        vpblendw  xmm14, xmm13, xmm6, 240                       
        vpaddq    xmm11, xmm11, xmm14                           
        vpaddq    xmm14, xmm3, xmm10                            
        vpaddq    xmm11, xmm11, xmm15                           
        vpalignr  xmm3, xmm9, xmm5, 8                           
        vpalignr  xmm5, xmm5, xmm9, 8                           
        vpxor     xmm3, xmm3, xmm11                             
        vpshufd   xmm3, xmm3, 177                               
        vpxor     xmm9, xmm5, xmm14                             
        vpshufd   xmm5, xmm9, 177                               
        vpaddq    xmm9, xmm2, xmm3                              
        vpaddq    xmm2, xmm12, xmm5                             
        vpaddq    xmm11, xmm11, XMMWORD PTR [272+rsp]           
        vpxor     xmm12, xmm15, xmm9                            
        vpxor     xmm10, xmm10, xmm2                            
        vpshufb   xmm12, xmm12, xmm0                            
        vpshufb   xmm10, xmm10, xmm0                            
        vpaddq    xmm11, xmm11, xmm12                           
        vpalignr  xmm15, xmm7, xmm13, 8                         
        vpxor     xmm3, xmm3, xmm11                             
        vpaddq    xmm14, xmm14, xmm15                           
        vpshufb   xmm3, xmm3, xmm1                              
        vpaddq    xmm14, xmm14, xmm10                           
        vpaddq    xmm9, xmm9, xmm3                              
        vpxor     xmm5, xmm5, xmm14                             
        vpxor     xmm12, xmm12, xmm9                            
        vpshufb   xmm5, xmm5, xmm1                              
        vpaddq    xmm2, xmm2, xmm5                              
        vpxor     xmm15, xmm10, xmm2                            
        vpsrlq    xmm10, xmm12, 63                              
        vpaddq    xmm12, xmm12, xmm12                           
        vpor      xmm10, xmm10, xmm12                           
        vpsrlq    xmm12, xmm15, 63                              
        vpaddq    xmm15, xmm15, xmm15                           
        vpor      xmm15, xmm12, xmm15                           
        vpalignr  xmm12, xmm15, xmm10, 8                        
        vpalignr  xmm15, xmm10, xmm15, 8                        
        vmovdqu   xmm10, XMMWORD PTR [336+rsp]                  
        vmovdqu   XMMWORD PTR [368+rsp], xmm6                   
        vpunpcklqdq xmm6, xmm6, xmm10                           
        vpaddq    xmm6, xmm11, xmm6                             
        vpshufd   xmm8, xmm8, 78                                
        vpaddq    xmm8, xmm14, xmm8                             
        vpaddq    xmm6, xmm6, xmm12                             
        vpaddq    xmm8, xmm8, xmm15                             
        vpalignr  xmm11, xmm3, xmm5, 8                          
        vpxor     xmm14, xmm11, xmm6                            
        vpalignr  xmm5, xmm5, xmm3, 8                           
        vpshufd   xmm14, xmm14, 177                             
        vpxor     xmm3, xmm5, xmm8                              
        vpaddq    xmm2, xmm2, xmm14                             
        vpaddq    xmm5, xmm6, XMMWORD PTR [240+rsp]             
        vpshufd   xmm3, xmm3, 177                               
        vpxor     xmm12, xmm12, xmm2                            
        vpaddq    xmm9, xmm9, xmm3                              
        vpshufb   xmm12, xmm12, xmm0                            
        vpxor     xmm11, xmm15, xmm9                            
        vpshufb   xmm15, xmm11, xmm0                            
        vpaddq    xmm5, xmm5, xmm12                             
        vmovdqu   xmm11, XMMWORD PTR [384+rsp]                  
        vpxor     xmm14, xmm14, xmm5                            
        vpblendw  xmm6, xmm11, xmm7, 240                        
        vpaddq    xmm8, xmm8, xmm6                              
        vpshufb   xmm14, xmm14, xmm1                            
        vpaddq    xmm6, xmm8, xmm15                             
        vpaddq    xmm2, xmm2, xmm14                             
        vpxor     xmm3, xmm3, xmm6                              
        vpxor     xmm8, xmm12, xmm2                             
        vpshufb   xmm3, xmm3, xmm1                              
        vpaddq    xmm9, xmm9, xmm3                              
        vpsrlq    xmm12, xmm8, 63                               
        vpxor     xmm15, xmm15, xmm9                            
        vpaddq    xmm8, xmm8, xmm8                              
        vpor      xmm12, xmm12, xmm8                            
        vpsrlq    xmm8, xmm15, 63                               
        vpaddq    xmm15, xmm15, xmm15                           
        vpor      xmm8, xmm8, xmm15                             
        vpalignr  xmm15, xmm12, xmm8, 8                         
        vpalignr  xmm12, xmm8, xmm12, 8                         
        vpunpckhqdq xmm8, xmm13, xmm10                          
        vpaddq    xmm5, xmm5, xmm8                              
        vmovdqu   XMMWORD PTR [400+rsp], xmm13                  
        vpblendw  xmm13, xmm13, xmm11, 240                      
        vpaddq    xmm5, xmm5, xmm15                             
        vpaddq    xmm8, xmm6, xmm13                             
        vpalignr  xmm6, xmm3, xmm14, 8                          
        vpaddq    xmm13, xmm8, xmm12                            
        vpxor     xmm8, xmm6, xmm5                              
        vpshufd   xmm6, xmm8, 177                               
        vpaddq    xmm9, xmm9, xmm6                              
        vpalignr  xmm3, xmm14, xmm3, 8                          
        vpxor     xmm15, xmm15, xmm9                            
        vpxor     xmm14, xmm3, xmm13                            
        vpshufd   xmm14, xmm14, 177                             
        vpshufb   xmm15, xmm15, xmm0                            
        vpaddq    xmm2, xmm2, xmm14                             
        vmovdqu   XMMWORD PTR [416+rsp], xmm7                   
        vpxor     xmm12, xmm12, xmm2                            
        vpalignr  xmm7, xmm4, xmm7, 8                           
        vpaddq    xmm5, xmm5, xmm7                              
        vpshufb   xmm12, xmm12, xmm0                            
        vpaddq    xmm8, xmm5, xmm15                             
        vmovdqu   xmm5, XMMWORD PTR [368+rsp]                   
        vpxor     xmm6, xmm6, xmm8                              
        vmovdqu   xmm3, XMMWORD PTR [352+rsp]                   
        vmovdqu   XMMWORD PTR [432+rsp], xmm7                   
        vpunpckhqdq xmm7, xmm5, xmm3                            
        vpaddq    xmm13, xmm13, xmm7                            
        vpaddq    xmm8, xmm8, XMMWORD PTR [272+rsp]             
        vpaddq    xmm7, xmm13, xmm12                            
        vpshufb   xmm6, xmm6, xmm1                              
        vpxor     xmm14, xmm14, xmm7                            
        vpshufb   xmm14, xmm14, xmm1                            
        vpaddq    xmm9, xmm9, xmm6                              
        vpaddq    xmm2, xmm2, xmm14                             
        vpxor     xmm13, xmm15, xmm9                            
        vpxor     xmm15, xmm12, xmm2                            
        vpsrlq    xmm12, xmm13, 63                              
        vpaddq    xmm13, xmm13, xmm13                           
        vpor      xmm12, xmm12, xmm13                           
        vpsrlq    xmm13, xmm15, 63                              
        vpaddq    xmm15, xmm15, xmm15                           
        vpor      xmm13, xmm13, xmm15                           
        vpalignr  xmm15, xmm13, xmm12, 8                        
        vpalignr  xmm13, xmm12, xmm13, 8                        
        vpaddq    xmm12, xmm8, xmm15                            
        vpunpcklqdq xmm8, xmm3, xmm11                           
        vpaddq    xmm7, xmm7, xmm8                              
        vpaddq    xmm7, xmm7, xmm13                             
        vpalignr  xmm8, xmm6, xmm14, 8                          
        vpalignr  xmm6, xmm14, xmm6, 8                          
        vpxor     xmm8, xmm8, xmm12                             
        vpxor     xmm14, xmm6, xmm7                             
        vpshufd   xmm8, xmm8, 177                               
        vpshufd   xmm6, xmm14, 177                              
        vpaddq    xmm2, xmm2, xmm8                              
        vpaddq    xmm9, xmm9, xmm6                              
        vpaddq    xmm7, xmm7, XMMWORD PTR [256+rsp]             
        vpxor     xmm15, xmm15, xmm2                            
        vpxor     xmm14, xmm13, xmm9                            
        vpshufb   xmm15, xmm15, xmm0                            
        vpshufb   xmm13, xmm14, xmm0                            
        vmovhpd   xmm14, xmm5, QWORD PTR [288+rsp]              
        vpaddq    xmm12, xmm12, xmm14                           
        vpaddq    xmm7, xmm7, xmm13                             
        vpaddq    xmm12, xmm12, xmm15                           
        vpxor     xmm8, xmm8, xmm12                             
        vpxor     xmm6, xmm6, xmm7                              
        vpshufb   xmm8, xmm8, xmm1                              
        vpshufb   xmm14, xmm6, xmm1                             
        vpaddq    xmm2, xmm2, xmm8                              
        vpaddq    xmm9, xmm9, xmm14                             
        vpxor     xmm6, xmm15, xmm2                             
        vpxor     xmm13, xmm13, xmm9                            
        vpsrlq    xmm15, xmm6, 63                               
        vpaddq    xmm6, xmm6, xmm6                              
        vpor      xmm6, xmm15, xmm6                             
        vpsrlq    xmm15, xmm13, 63                              
        vpaddq    xmm13, xmm13, xmm13                           
        vpunpcklqdq xmm10, xmm10, xmm4                          
        vpor      xmm13, xmm15, xmm13                           
        vpaddq    xmm10, xmm12, xmm10                           
        vmovdqu   xmm12, XMMWORD PTR [416+rsp]                  
        vpalignr  xmm15, xmm6, xmm13, 8                         
        vpalignr  xmm13, xmm13, xmm6, 8                         
        vpalignr  xmm6, xmm5, xmm12, 8                          
        vpaddq    xmm7, xmm7, xmm6                              
        vpaddq    xmm10, xmm10, xmm15                           
        vpaddq    xmm7, xmm7, xmm13                             
        vpalignr  xmm6, xmm14, xmm8, 8                          
        vpalignr  xmm8, xmm8, xmm14, 8                          
        vpxor     xmm6, xmm6, xmm10                             
        vpxor     xmm14, xmm8, xmm7                             
        vpshufd   xmm6, xmm6, 177                               
        vpshufd   xmm8, xmm14, 177                              
        vpaddq    xmm9, xmm9, xmm6                              
        vpaddq    xmm2, xmm2, xmm8                              
        vpxor     xmm15, xmm15, xmm9                            
        vpxor     xmm14, xmm13, xmm2                            
        vpshufb   xmm15, xmm15, xmm0                            
        vpshufb   xmm13, xmm14, xmm0                            
        vpunpckhqdq xmm14, xmm4, xmm3                           
        vpaddq    xmm4, xmm10, xmm14                            
        vpalignr  xmm3, xmm3, xmm11, 8                          
        vpaddq    xmm4, xmm4, xmm15                             
        vpaddq    xmm10, xmm7, xmm3                             
        vpaddq    xmm7, xmm10, xmm13                            
        vpxor     xmm6, xmm6, xmm4                              
        vpxor     xmm8, xmm8, xmm7                              
        vpshufb   xmm6, xmm6, xmm1                              
        vpaddq    xmm4, xmm4, XMMWORD PTR [400+rsp]             
        vpaddq    xmm9, xmm9, xmm6                              
        vpshufb   xmm8, xmm8, xmm1                              
        vpaddq    xmm2, xmm2, xmm8                              
        vpxor     xmm15, xmm15, xmm9                            
        vpxor     xmm3, xmm13, xmm2                             
        vpaddq    xmm10, xmm15, xmm15                           
        vpsrlq    xmm13, xmm15, 63                              
        vpor      xmm10, xmm13, xmm10                           
        vpsrlq    xmm13, xmm3, 63                               
        vpaddq    xmm3, xmm3, xmm3                              
        vpalignr  xmm12, xmm12, xmm5, 8                         
        vpor      xmm3, xmm13, xmm3                             
        vpaddq    xmm7, xmm7, xmm12                             
        vpalignr  xmm15, xmm3, xmm10, 8                         
        vpalignr  xmm13, xmm10, xmm3, 8                         
        vpaddq    xmm4, xmm4, xmm15                             
        vpaddq    xmm7, xmm7, xmm13                             
        vpalignr  xmm10, xmm6, xmm8, 8                          
        vpalignr  xmm8, xmm8, xmm6, 8                           
        vpxor     xmm12, xmm10, xmm4                            
        vpxor     xmm6, xmm8, xmm7                              
        vpshufd   xmm10, xmm12, 177                             
        vpshufd   xmm3, xmm6, 177                               
        vpaddq    xmm12, xmm2, xmm10                            
        vpaddq    xmm9, xmm9, xmm3                              
        vpxor     xmm2, xmm15, xmm12                            
        vpxor     xmm15, xmm13, xmm9                            
        vmovdqu   xmm13, XMMWORD PTR [336+rsp]                  
        vpshufb   xmm2, xmm2, xmm0                              
        vpshufb   xmm15, xmm15, xmm0                            
        vpblendw  xmm8, xmm11, xmm13, 240                       
        vmovdqu   xmm6, XMMWORD PTR [288+rsp]                   
        vpaddq    xmm4, xmm4, xmm8                              
        vpaddq    xmm7, xmm7, xmm6                              
        vpaddq    xmm8, xmm4, xmm2                              
        vpaddq    xmm4, xmm7, xmm15                             
        vpxor     xmm10, xmm10, xmm8                            
        vpxor     xmm3, xmm3, xmm4                              
        vpshufb   xmm10, xmm10, xmm1                            
        vpshufb   xmm3, xmm3, xmm1                              
        vpaddq    xmm7, xmm12, xmm10                            
        vpaddq    xmm12, xmm9, xmm3                             
        vpxor     xmm2, xmm2, xmm7                              
        vpxor     xmm9, xmm15, xmm12                            
        vpsrlq    xmm15, xmm2, 63                               
        vpaddq    xmm2, xmm2, xmm2                              
        vpor      xmm2, xmm15, xmm2                             
        vpsrlq    xmm15, xmm9, 63                               
        vpaddq    xmm9, xmm9, xmm9                              
        vpor      xmm9, xmm15, xmm9                             
        vpalignr  xmm15, xmm2, xmm9, 8                          
        vpalignr  xmm9, xmm9, xmm2, 8                           
        vpaddq    xmm2, xmm8, XMMWORD PTR [192+rsp]             
        vpaddq    xmm8, xmm2, xmm15                             
        vpunpckhqdq xmm2, xmm13, xmm5                           
        vpaddq    xmm4, xmm4, xmm2                              
        vpaddq    xmm4, xmm4, xmm9                              
        vpalignr  xmm2, xmm3, xmm10, 8                          
        vpalignr  xmm10, xmm10, xmm3, 8                         
        vpxor     xmm2, xmm2, xmm8                              
        vpxor     xmm3, xmm10, xmm4                             
        vpshufd   xmm2, xmm2, 177                               
        vpshufd   xmm10, xmm3, 177                              
        vpaddq    xmm12, xmm12, xmm2                            
        vpaddq    xmm7, xmm7, xmm10                             
        vpxor     xmm15, xmm15, xmm12                           
        vpxor     xmm9, xmm9, xmm7                              
        vpshufb   xmm3, xmm15, xmm0                             
        vpshufb   xmm9, xmm9, xmm0                              
        vpunpcklqdq xmm15, xmm11, xmm6                          
        vpblendw  xmm6, xmm13, xmm6, 240                        
        vpaddq    xmm8, xmm8, xmm15                             
        vpaddq    xmm13, xmm4, xmm6                             
        vpaddq    xmm8, xmm8, xmm3                              
        vpaddq    xmm4, xmm13, xmm9                             
        vpaddq    xmm14, xmm8, xmm14                            
        vpxor     xmm2, xmm2, xmm8                              
        vpxor     xmm10, xmm10, xmm4                            
        vpshufb   xmm6, xmm2, xmm1                              
        vpshufb   xmm13, xmm10, xmm1                            
        vpaddq    xmm12, xmm12, xmm6                            
        vpaddq    xmm7, xmm7, xmm13                             
        vpxor     xmm2, xmm3, xmm12                             
        vpxor     xmm3, xmm9, xmm7                              
        vpaddq    xmm9, xmm2, xmm2                              
        vpsrlq    xmm15, xmm3, 63                               
        vpsrlq    xmm10, xmm2, 63                               
        vpaddq    xmm3, xmm3, xmm3                              
        vmovdqu   xmm8, XMMWORD PTR [400+rsp]                   
        vpor      xmm10, xmm10, xmm9                            
        vpor      xmm2, xmm15, xmm3                             
        vpunpckhqdq xmm11, xmm11, xmm8                          
        vpalignr  xmm3, xmm2, xmm10, 8                          
        vpalignr  xmm9, xmm10, xmm2, 8                          
        vpaddq    xmm2, xmm4, xmm11                             
        vpaddq    xmm10, xmm14, xmm3                            
        vpaddq    xmm4, xmm2, xmm9                              
        vpalignr  xmm11, xmm6, xmm13, 8                         
        vpalignr  xmm6, xmm13, xmm6, 8                          
        vpxor     xmm14, xmm11, xmm10                           
        vpshufd   xmm14, xmm14, 177                             
        vpxor     xmm13, xmm6, xmm4                             
        vpshufd   xmm11, xmm13, 177                             
        vpaddq    xmm7, xmm7, xmm14                             
        vpaddq    xmm12, xmm12, xmm11                           
        vpaddq    xmm10, xmm10, XMMWORD PTR [432+rsp]           
        vpxor     xmm2, xmm3, xmm7                              
        vpxor     xmm6, xmm9, xmm12                             
        vpshufb   xmm3, xmm2, xmm0                              
        vpshufb   xmm9, xmm6, xmm0                              
        vpaddq    xmm2, xmm10, xmm3                             
        vpunpcklqdq xmm5, xmm8, xmm5                            
        vpxor     xmm8, xmm14, xmm2                             
        vpaddq    xmm5, xmm4, xmm5                              
        vpshufb   xmm8, xmm8, xmm1                              
        vpaddq    xmm5, xmm5, xmm9                              
        vpaddq    xmm6, xmm7, xmm8                              
        vpxor     xmm4, xmm11, xmm5                             
        vpxor     xmm3, xmm3, xmm6                              
        vpshufb   xmm4, xmm4, xmm1                              
        vpaddq    xmm10, xmm12, xmm4                            
        vpxor     xmm11, xmm9, xmm10                            
        vpsrlq    xmm7, xmm3, 63                                
        vpaddq    xmm9, xmm3, xmm3                              
        vpor      xmm7, xmm7, xmm9                              
                                
..B1.28:                        
        vpsrlq    xmm13, xmm11, 63                              
        xor       eax, eax                                      
        vpaddq    xmm11, xmm11, xmm11                           
        vpaddq    xmm2, xmm2, XMMWORD PTR [48+rsp]              
        vpaddq    xmm12, xmm5, XMMWORD PTR [112+rsp]            
        vpor      xmm3, xmm13, xmm11                            
        vpalignr  xmm14, xmm7, xmm3, 8                          
        vpalignr  xmm3, xmm3, xmm7, 8                           
        vpaddq    xmm2, xmm2, xmm14                             
        vpaddq    xmm5, xmm12, xmm3                             
        vpalignr  xmm9, xmm4, xmm8, 8                           
        vpalignr  xmm8, xmm8, xmm4, 8                           
        vpxor     xmm7, xmm9, xmm2                              
        vpxor     xmm13, xmm8, xmm5                             
        vpshufd   xmm7, xmm7, 177                               
        vpshufd   xmm4, xmm13, 177                              
        vpaddq    xmm8, xmm10, xmm7                             
        vpaddq    xmm6, xmm6, xmm4                              
        vpaddq    xmm2, xmm2, XMMWORD PTR [rsp]                 
        vpaddq    xmm5, xmm5, XMMWORD PTR [160+rsp]             
        vpxor     xmm10, xmm14, xmm8                            
        vpxor     xmm15, xmm3, xmm6                             
        vpshufb   xmm9, xmm10, xmm0                             
        vpshufb   xmm15, xmm15, xmm0                            
        vpaddq    xmm10, xmm2, xmm9                             
        vpaddq    xmm11, xmm5, xmm15                            
        vpxor     xmm2, xmm7, xmm10                             
        vpxor     xmm4, xmm4, xmm11                             
        vpshufb   xmm14, xmm2, xmm1                             
        vpaddq    xmm10, xmm10, XMMWORD PTR [16+rsp]            
        vpaddq    xmm13, xmm8, xmm14                            
        vpaddq    xmm11, xmm11, XMMWORD PTR [224+rsp]           
        vpshufb   xmm12, xmm4, xmm1                             
        vpaddq    xmm7, xmm6, xmm12                             
        vpxor     xmm3, xmm9, xmm13                             
        vpxor     xmm8, xmm15, xmm7                             
        vpaddq    xmm6, xmm3, xmm3                              
        vpsrlq    xmm9, xmm3, 63                                
        vpsrlq    xmm2, xmm8, 63                                
        vpaddq    xmm3, xmm8, xmm8                              
        vpor      xmm9, xmm9, xmm6                              
        vpor      xmm5, xmm2, xmm3                              
        vpalignr  xmm4, xmm5, xmm9, 8                           
        vpalignr  xmm15, xmm9, xmm5, 8                          
        vpaddq    xmm10, xmm10, xmm4                            
        vpaddq    xmm11, xmm11, xmm15                           
        vpalignr  xmm6, xmm14, xmm12, 8                         
        vpalignr  xmm14, xmm12, xmm14, 8                        
        vpxor     xmm8, xmm6, xmm10                             
        vpxor     xmm12, xmm14, xmm11                           
        vpshufd   xmm9, xmm8, 177                               
        vpshufd   xmm14, xmm12, 177                             
        vpaddq    xmm12, xmm7, xmm9                             
        vpaddq    xmm13, xmm13, xmm14                           
        vpaddq    xmm10, xmm10, XMMWORD PTR [64+rsp]            
        vpaddq    xmm11, xmm11, XMMWORD PTR [80+rsp]            
        vpxor     xmm7, xmm4, xmm12                             
        vpxor     xmm2, xmm15, xmm13                            
        vpshufb   xmm6, xmm7, xmm0                              
        vpshufb   xmm2, xmm2, xmm0                              
        vpaddq    xmm15, xmm10, xmm6                            
        vpaddq    xmm8, xmm11, xmm2                             
        vpxor     xmm4, xmm9, xmm15                             
        vpxor     xmm14, xmm14, xmm8                            
        vpshufb   xmm7, xmm4, xmm1                              
        vpaddq    xmm15, xmm15, XMMWORD PTR [176+rsp]           
        vpaddq    xmm5, xmm12, xmm7                             
        vpaddq    xmm8, xmm8, XMMWORD PTR [96+rsp]              
        vpshufb   xmm4, xmm14, xmm1                             
        vpaddq    xmm13, xmm13, xmm4                            
        vpxor     xmm3, xmm6, xmm5                              
        vpxor     xmm6, xmm2, xmm13                             
        vpaddq    xmm9, xmm3, xmm3                              
        vpaddq    xmm14, xmm6, xmm6                             
        vpsrlq    xmm12, xmm3, 63                               
        vpsrlq    xmm2, xmm6, 63                                
        vpor      xmm11, xmm12, xmm9                            
        vpor      xmm10, xmm2, xmm14                            
        vpalignr  xmm14, xmm11, xmm10, 8                        
        vpalignr  xmm2, xmm10, xmm11, 8                         
        vpaddq    xmm3, xmm15, xmm14                            
        vpaddq    xmm8, xmm8, xmm2                              
        vpalignr  xmm10, xmm4, xmm7, 8                          
        vpalignr  xmm4, xmm7, xmm4, 8                           
        vpxor     xmm11, xmm10, xmm3                            
        vpxor     xmm7, xmm4, xmm8                              
        vpshufd   xmm15, xmm11, 177                             
        vpshufd   xmm7, xmm7, 177                               
        vpaddq    xmm4, xmm13, xmm15                            
        vpaddq    xmm5, xmm5, xmm7                              
        vpxor     xmm13, xmm14, xmm4                            
        vpxor     xmm2, xmm2, xmm5                              
        vpshufb   xmm6, xmm13, xmm0                             
        vpaddq    xmm14, xmm3, XMMWORD PTR [192+rsp]            
        vpaddq    xmm13, xmm8, XMMWORD PTR [128+rsp]            
        vpaddq    xmm3, xmm14, xmm6                             
        vpshufb   xmm9, xmm2, xmm0                              
        vpaddq    xmm2, xmm13, xmm9                             
        vpxor     xmm10, xmm15, xmm3                            
        vpxor     xmm11, xmm7, xmm2                             
        vpshufb   xmm14, xmm10, xmm1                            
        vpaddq    xmm3, xmm3, XMMWORD PTR [32+rsp]              
        vpaddq    xmm12, xmm4, xmm14                            
        vpaddq    xmm2, xmm2, XMMWORD PTR [208+rsp]             
        vpshufb   xmm13, xmm11, xmm1                            
        vpaddq    xmm5, xmm5, xmm13                             
        vpxor     xmm6, xmm6, xmm12                             
        vpxor     xmm7, xmm9, xmm5                              
        vpaddq    xmm4, xmm6, xmm6                              
        vpaddq    xmm15, xmm7, xmm7                             
        vpsrlq    xmm9, xmm6, 63                                
        vpsrlq    xmm8, xmm7, 63                                
        vpor      xmm10, xmm9, xmm4                             
        vpor      xmm11, xmm8, xmm15                            
        vpalignr  xmm6, xmm11, xmm10, 8                         
        vpalignr  xmm9, xmm10, xmm11, 8                         
        vpaddq    xmm11, xmm3, xmm6                             
        vpaddq    xmm10, xmm2, xmm9                             
        vpalignr  xmm3, xmm14, xmm13, 8                         
        vpalignr  xmm14, xmm13, xmm14, 8                        
        vpxor     xmm4, xmm3, xmm11                             
        vpxor     xmm13, xmm14, xmm10                           
        vpshufd   xmm2, xmm4, 177                               
        vpshufd   xmm14, xmm13, 177                             
        vpaddq    xmm13, xmm5, xmm2                             
        vpaddq    xmm12, xmm12, xmm14                           
        vpaddq    xmm11, xmm11, XMMWORD PTR [144+rsp]           
        vpaddq    xmm10, xmm10, XMMWORD PTR [240+rsp]           
        vpxor     xmm5, xmm6, xmm13                             
        vpxor     xmm4, xmm9, xmm12                             
        vpshufb   xmm3, xmm5, xmm0                              
        vpshufb   xmm0, xmm4, xmm0                              
        vpaddq    xmm11, xmm11, xmm3                            
        vpaddq    xmm10, xmm10, xmm0                            
        vpxor     xmm2, xmm2, xmm11                             
        vpxor     xmm14, xmm14, xmm10                           
        vpshufb   xmm2, xmm2, xmm1                              
        vpshufb   xmm14, xmm14, xmm1                            
        vpaddq    xmm13, xmm13, xmm2                            
        vpaddq    xmm6, xmm12, xmm14                            
        vpxor     xmm1, xmm3, xmm13                             
        vpxor     xmm3, xmm0, xmm6                              
        vpaddq    xmm5, xmm3, xmm3                              
        vpsrlq    xmm0, xmm1, 63                                
        vpsrlq    xmm4, xmm3, 63                                
        vpaddq    xmm1, xmm1, xmm1                              
        vpor      xmm0, xmm0, xmm1                              
        vpor      xmm12, xmm4, xmm5                             
        vpalignr  xmm7, xmm0, xmm12, 8                          
        vpxor     xmm11, xmm11, xmm6                            
        vpalignr  xmm8, xmm14, xmm2, 8                          
        vpxor     xmm13, xmm10, xmm13                           
        vpalignr  xmm0, xmm12, xmm0, 8                          
        vpxor     xmm9, xmm7, xmm8                              
        vpalignr  xmm2, xmm2, xmm14, 8                          
        vpxor     xmm14, xmm0, xmm2                             
        vpxor     xmm1, xmm11, XMMWORD PTR [448+rsp]            
        vpxor     xmm15, xmm13, XMMWORD PTR [464+rsp]           
        vpxor     xmm3, xmm9, XMMWORD PTR [496+rsp]             
        vpxor     xmm10, xmm14, XMMWORD PTR [480+rsp]           
        vmovdqu   XMMWORD PTR [rdi], xmm1                       
        vmovdqu   XMMWORD PTR [16+rdi], xmm15                   
        vmovdqu   XMMWORD PTR [32+rdi], xmm3                    
        vmovdqu   XMMWORD PTR [48+rdi], xmm10                   
        add       rsp, 552                                      
..___tag_value_crypto_hash.6:                                   
        ret                                                     
        .align    16,0x90
..___tag_value_crypto_hash.7:                                   
	.type	crypto_hash_blake2b_avxicc,@function
	.size	crypto_hash_blake2b_avxicc,.-crypto_hash_blake2b_avxicc
	.data
	.section .rodata, "a"
	.align 16
	.align 16
.L_2il0floatpacket.11:
	.long	0x05040302,0x01000706,0x0d0c0b0a,0x09080f0e
	.type	.L_2il0floatpacket.11,@object
	.size	.L_2il0floatpacket.11,16
	.align 16
.L_2il0floatpacket.12:
	.long	0x06050403,0x02010007,0x0e0d0c0b,0x0a09080f
	.type	.L_2il0floatpacket.12,@object
	.size	.L_2il0floatpacket.12,16
	.align 16
.L_2il0floatpacket.13:
	.long	0xf2bdc948,0x6a09e667,0x84caa73b,0xbb67ae85
	.type	.L_2il0floatpacket.13,@object
	.size	.L_2il0floatpacket.13,16
	.align 16
.L_2il0floatpacket.14:
	.long	0xfe94f82b,0x3c6ef372,0x5f1d36f1,0xa54ff53a
	.type	.L_2il0floatpacket.14,@object
	.size	.L_2il0floatpacket.14,16
	.align 16
.L_2il0floatpacket.15:
	.long	0xade682d1,0x510e527f,0x2b3e6c1f,0x9b05688c
	.type	.L_2il0floatpacket.15,@object
	.size	.L_2il0floatpacket.15,16
	.align 16
.L_2il0floatpacket.16:
	.long	0xfb41bd6b,0x1f83d9ab,0x137e2179,0x5be0cd19
	.type	.L_2il0floatpacket.16,@object
	.size	.L_2il0floatpacket.16,16
	.align 16
.L_2il0floatpacket.17:
	.long	0xf3bcc908,0x6a09e667,0x84caa73b,0xbb67ae85
	.type	.L_2il0floatpacket.17,@object
	.size	.L_2il0floatpacket.17,16
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
	.4byte 0x00000014
	.8byte 0x7801000100000000
	.8byte 0x0000019008070c10
	.4byte 0x00000000
	.4byte 0x00000034
	.4byte 0x0000001c
	.8byte ..___tag_value_crypto_hash.1
	.8byte ..___tag_value_crypto_hash.7-..___tag_value_crypto_hash.1
	.byte 0x04
	.4byte ..___tag_value_crypto_hash.3-..___tag_value_crypto_hash.1
	.4byte 0x0404b00e
	.4byte ..___tag_value_crypto_hash.4-..___tag_value_crypto_hash.3
	.2byte 0x4686
	.byte 0x04
	.4byte ..___tag_value_crypto_hash.5-..___tag_value_crypto_hash.4
	.2byte 0x04c6
	.4byte ..___tag_value_crypto_hash.6-..___tag_value_crypto_hash.5
	.4byte 0x0000080e
	.2byte 0x0000

