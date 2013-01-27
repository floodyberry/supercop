# Generated using Intel C++ Compiler 13.0 (icc -std=c99 -O3 -march=core-avx-i -S -masm=intel)
# This code is for research purposes only, and should not be used in the context of any commercial activity
	.file "blake2s.c"
	.text
..TXTST0:
       .align    16,0x90
	.globl crypto_hash_blake2s_avxicc
    .globl _crypto_hash_blake2s_avxicc
crypto_hash_blake2s_avxicc:
_crypto_hash_blake2s_avxicc:
..B1.1:                         
..___tag_value_crypto_hash.1:                                   
        xorl      %r11d, %r11d                                  
        xorl      %ecx, %ecx                                    
        movq      %rsi, %r9                                     
        vmovdqu   .L_2il0floatpacket.10(%rip), %xmm4            
        xorl      %eax, %eax                                    
        vmovdqu   .L_2il0floatpacket.7(%rip), %xmm0             
        vmovdqa   %xmm4, %xmm2                                  
        vmovdqu   .L_2il0floatpacket.8(%rip), %xmm1             
        movq      %rdx, %r8                                     
        vmovdqu   .L_2il0floatpacket.9(%rip), %xmm3             
        xorl      %r10d, %r10d                                  
        vmovdqu   .L_2il0floatpacket.11(%rip), %xmm5            
        cmpq      $64, %rdx                                     
        jbe       ..B1.5        
..B1.2:                         
        movq      %rbp, -104(%rsp)                              
        lea       -1(%rdx), %rsi                                
        sarq      $5, %rsi                                      
..___tag_value_crypto_hash.3:                                   
        movq      %rcx, %rbp                                    
        shrq      $58, %rsi                                     
        movq      %rax, %rcx                                    
        lea       -1(%rsi,%rdx), %rdx                           
        sarq      $6, %rdx                                      
        movq      %rdx, %rax                                                 
..B1.3:                         
        vmovdqu   (%rcx,%r9), %xmm9                             
        vmovdqu   16(%rcx,%r9), %xmm8                           
        vmovdqu   32(%rcx,%r9), %xmm7                           
        vmovdqu   48(%rcx,%r9), %xmm6                           
        vshufps   $136, %xmm8, %xmm9, %xmm5                     
        lea       -64(%r10,%r8), %rdx                           
        vpaddd    %xmm5, %xmm3, %xmm13                          
        lea       64(%rcx,%r9), %rsi                            
        vpaddd    %xmm2, %xmm13, %xmm14                         
        lea       64(%rcx), %r11                                
        vmovdqu   %xmm3, -40(%rsp)                              
        vmovdqu   %xmm2, -24(%rsp)                              
        vmovd     %r11, %xmm11                                  
        vpxor     .L_2il0floatpacket.10(%rip), %xmm11, %xmm10   
        vpxor     %xmm14, %xmm10, %xmm3                         
        vpshufb   %xmm1, %xmm3, %xmm4                           
        vpaddd    .L_2il0floatpacket.11(%rip), %xmm4, %xmm15    
        vpxor     %xmm15, %xmm2, %xmm2                          
        vshufps   $221, %xmm8, %xmm9, %xmm11                    
        vpsrld    $12, %xmm2, %xmm5                             
        vpslld    $20, %xmm2, %xmm13                            
        vpaddd    %xmm11, %xmm14, %xmm10                        
        vpxor     %xmm13, %xmm5, %xmm2                          
        vpaddd    %xmm2, %xmm10, %xmm12                         
        vpxor     %xmm12, %xmm4, %xmm3                          
        vpshufb   %xmm0, %xmm3, %xmm3                           
        vpaddd    %xmm3, %xmm15, %xmm5                          
        vpxor     %xmm5, %xmm2, %xmm4                           
        vpsrld    $7, %xmm4, %xmm15                             
        vpslld    $25, %xmm4, %xmm14                            
        vshufps   $136, %xmm6, %xmm7, %xmm11                    
        vpxor     %xmm14, %xmm15, %xmm13                        
        vpshufd   $57, %xmm13, %xmm10                           
        vpaddd    %xmm11, %xmm12, %xmm12                        
        vpshufd   $147, %xmm3, %xmm13                           
        vpaddd    %xmm10, %xmm12, %xmm11                        
        vpxor     %xmm11, %xmm13, %xmm3                         
        vpshufb   %xmm1, %xmm3, %xmm13                          
        vpshufd   $78, %xmm5, %xmm5                             
        vpaddd    %xmm13, %xmm5, %xmm5                          
        vpxor     %xmm5, %xmm10, %xmm10                         
        vshufps   $221, %xmm6, %xmm7, %xmm4                     
        vpsrld    $12, %xmm10, %xmm12                           
        vpslld    $20, %xmm10, %xmm2                            
        vpaddd    %xmm4, %xmm11, %xmm11                         
        vpxor     %xmm2, %xmm12, %xmm10                         
        vpaddd    %xmm10, %xmm11, %xmm11                        
        vpxor     %xmm11, %xmm13, %xmm15                        
        vpshufb   %xmm0, %xmm15, %xmm14                         
        vpaddd    %xmm14, %xmm5, %xmm13                         
        vpxor     %xmm13, %xmm10, %xmm5                         
        vpblendw  $12, %xmm7, %xmm8, %xmm4                      
        vpsrld    $7, %xmm5, %xmm3                              
        vpslld    $25, %xmm5, %xmm12                            
        vpslldq   $4, %xmm6, %xmm5                              
        vpxor     %xmm12, %xmm3, %xmm2                          
        vpblendw  $240, %xmm5, %xmm4, %xmm10                    
        vpshufd   $147, %xmm10, %xmm3                           
        vpshufd   $147, %xmm2, %xmm15                           
        vpaddd    %xmm3, %xmm11, %xmm11                         
        vpshufd   $57, %xmm14, %xmm14                           
        vpaddd    %xmm15, %xmm11, %xmm4                         
        vpxor     %xmm4, %xmm14, %xmm11                         
        vpshufb   %xmm1, %xmm11, %xmm2                          
        vpshufd   $78, %xmm13, %xmm13                           
        vpaddd    %xmm2, %xmm13, %xmm12                         
        vpshufd   $8, %xmm7, %xmm14                             
        vpxor     %xmm12, %xmm15, %xmm10                        
        vpblendw  $192, %xmm6, %xmm8, %xmm13                    
        vpsrld    $12, %xmm10, %xmm3                            
        vpblendw  $240, %xmm13, %xmm14, %xmm11                  
        vpslld    $20, %xmm10, %xmm15                           
        vpxor     %xmm15, %xmm3, %xmm10                         
        vpshufd   $177, %xmm11, %xmm3                           
        vpaddd    %xmm3, %xmm4, %xmm4                           
        vpaddd    %xmm10, %xmm4, %xmm3                          
        vpxor     %xmm3, %xmm2, %xmm2                           
        vpshufb   %xmm0, %xmm2, %xmm11                          
        vpslldq   $4, %xmm8, %xmm4                              
        vpaddd    %xmm11, %xmm12, %xmm13                        
        vpblendw  $48, %xmm4, %xmm7, %xmm15                     
        vpxor     %xmm13, %xmm10, %xmm12                        
        vpblendw  $240, %xmm15, %xmm9, %xmm14                   
        vpsrld    $7, %xmm12, %xmm10                            
        vpslld    $25, %xmm12, %xmm12                           
        vpxor     %xmm12, %xmm10, %xmm2                         
        vpshufd   $177, %xmm14, %xmm12                          
        vpshufd   $57, %xmm2, %xmm10                            
        vpaddd    %xmm12, %xmm3, %xmm3                          
        vpshufd   $147, %xmm11, %xmm11                          
        vpaddd    %xmm10, %xmm3, %xmm2                          
        vpxor     %xmm2, %xmm11, %xmm11                         
        vpshufb   %xmm1, %xmm11, %xmm12                         
        vpshufd   $78, %xmm13, %xmm13                           
        vpaddd    %xmm12, %xmm13, %xmm3                         
        vpxor     %xmm3, %xmm10, %xmm13                         
        vpsrld    $12, %xmm13, %xmm11                           
        vpslld    $20, %xmm13, %xmm10                           
        vpxor     %xmm10, %xmm11, %xmm11                        
        vpunpckhdq %xmm8, %xmm9, %xmm10                         
        vpblendw  $12, %xmm5, %xmm10, %xmm4                     
        vpshufd   $177, %xmm4, %xmm15                           
        vpaddd    %xmm15, %xmm2, %xmm2                          
        vpaddd    %xmm11, %xmm2, %xmm13                         
        vpxor     %xmm13, %xmm12, %xmm14                        
        vpshufb   %xmm0, %xmm14, %xmm14                         
        vpaddd    %xmm14, %xmm3, %xmm15                         
        vpxor     %xmm15, %xmm11, %xmm3                         
        vpsrld    $7, %xmm3, %xmm12                             
        vpslld    $25, %xmm3, %xmm11                            
        vpblendw  $12, %xmm8, %xmm6, %xmm2                      
        vpxor     %xmm11, %xmm12, %xmm3                         
        vpunpckhdq %xmm6, %xmm7, %xmm12                         
        vpblendw  $15, %xmm2, %xmm12, %xmm11                    
        vpshufd   $147, %xmm3, %xmm4                            
        vpshufd   $210, %xmm11, %xmm3                           
        vpaddd    %xmm3, %xmm13, %xmm13                         
        vpshufd   $57, %xmm14, %xmm14                           
        vpaddd    %xmm4, %xmm13, %xmm2                          
        vpxor     %xmm2, %xmm14, %xmm13                         
        vpshufb   %xmm1, %xmm13, %xmm12                         
        vpshufd   $78, %xmm15, %xmm15                           
        vpaddd    %xmm12, %xmm15, %xmm3                         
        vpxor     %xmm3, %xmm4, %xmm4                           
        vpsrld    $12, %xmm4, %xmm13                            
        vpslld    $20, %xmm4, %xmm11                            
        vpunpckldq %xmm9, %xmm7, %xmm4                          
        vpxor     %xmm11, %xmm13, %xmm11                        
        vpblendw  $240, %xmm9, %xmm4, %xmm15                    
        vpslldq   $8, %xmm6, %xmm14                             
        vpblendw  $192, %xmm14, %xmm15, %xmm13                  
        vpaddd    %xmm13, %xmm2, %xmm2                          
        vpaddd    %xmm11, %xmm2, %xmm13                         
        vpxor     %xmm13, %xmm12, %xmm12                        
        vpshufb   %xmm0, %xmm12, %xmm15                         
        vpaddd    %xmm15, %xmm3, %xmm14                         
        vpxor     %xmm14, %xmm11, %xmm3                         
        vpsrld    $7, %xmm3, %xmm11                             
        vpslld    $25, %xmm3, %xmm3                             
        vpblendw  $60, %xmm7, %xmm9, %xmm2                      
        vpxor     %xmm3, %xmm11, %xmm12                         
        vpsrldq   $12, %xmm8, %xmm11                            
        vpblendw  $3, %xmm11, %xmm2, %xmm3                      
        vpshufd   $57, %xmm12, %xmm4                            
        vpshufd   $78, %xmm3, %xmm12                            
        vpaddd    %xmm12, %xmm13, %xmm13                        
        vpshufd   $147, %xmm15, %xmm15                          
        vpaddd    %xmm4, %xmm13, %xmm12                         
        vpxor     %xmm12, %xmm15, %xmm13                        
        vpshufb   %xmm1, %xmm13, %xmm3                          
        vpshufd   $78, %xmm14, %xmm14                           
        vpaddd    %xmm3, %xmm14, %xmm11                         
        vpxor     %xmm11, %xmm4, %xmm4                          
        vpsrld    $12, %xmm4, %xmm13                            
        vpslld    $20, %xmm4, %xmm2                             
        vpblendw  $51, %xmm8, %xmm9, %xmm4                      
        vpxor     %xmm2, %xmm13, %xmm13                         
        vpblendw  $192, %xmm5, %xmm4, %xmm5                     
        vpshufd   $27, %xmm5, %xmm5                             
        vpaddd    %xmm5, %xmm12, %xmm12                         
        vpaddd    %xmm13, %xmm12, %xmm2                         
        vpxor     %xmm2, %xmm3, %xmm3                           
        vpshufb   %xmm0, %xmm3, %xmm12                          
        vpaddd    %xmm12, %xmm11, %xmm3                         
        vpunpckhdq %xmm7, %xmm10, %xmm14                        
        vpxor     %xmm3, %xmm13, %xmm13                         
        vpblendw  $12, %xmm6, %xmm14, %xmm5                     
        vpsrld    $7, %xmm13, %xmm11                            
        vpslld    $25, %xmm13, %xmm4                            
        vpshufd   $210, %xmm5, %xmm13                           
        vpxor     %xmm4, %xmm11, %xmm15                         
        vpshufd   $147, %xmm15, %xmm11                          
        vpaddd    %xmm13, %xmm2, %xmm2                          
        vpshufd   $57, %xmm12, %xmm5                            
        vpaddd    %xmm11, %xmm2, %xmm13                         
        vpxor     %xmm13, %xmm5, %xmm12                         
        vpshufb   %xmm1, %xmm12, %xmm5                          
        vpshufd   $78, %xmm3, %xmm3                             
        vpaddd    %xmm5, %xmm3, %xmm14                          
        vpxor     %xmm14, %xmm11, %xmm11                        
        vpslldq   $8, %xmm7, %xmm3                              
        vpsrld    $12, %xmm11, %xmm4                            
        vpslld    $20, %xmm11, %xmm15                           
        vpblendw  $12, %xmm9, %xmm6, %xmm11                     
        vpxor     %xmm15, %xmm4, %xmm15                         
        vpblendw  $192, %xmm3, %xmm11, %xmm12                   
        vpshufd   $135, %xmm12, %xmm2                           
        vpaddd    %xmm2, %xmm13, %xmm13                         
        vpaddd    %xmm15, %xmm13, %xmm4                         
        vpxor     %xmm4, %xmm5, %xmm5                           
        vpshufb   %xmm0, %xmm5, %xmm2                           
        vpaddd    %xmm2, %xmm14, %xmm11                         
        vpblendw  $15, %xmm8, %xmm9, %xmm12                     
        vpxor     %xmm11, %xmm15, %xmm14                        
        vpblendw  $192, %xmm6, %xmm12, %xmm15                   
        vpsrld    $7, %xmm14, %xmm5                             
        vpslld    $25, %xmm14, %xmm13                           
        vpshufd   $198, %xmm15, %xmm14                          
        vpxor     %xmm13, %xmm5, %xmm3                          
        vpshufd   $57, %xmm3, %xmm5                             
        vpaddd    %xmm14, %xmm4, %xmm4                          
        vpshufd   $147, %xmm2, %xmm2                            
        vpaddd    %xmm5, %xmm4, %xmm13                          
        vpxor     %xmm13, %xmm2, %xmm3                          
        vpshufb   %xmm1, %xmm3, %xmm12                          
        vpshufd   $78, %xmm11, %xmm11                           
        vpaddd    %xmm12, %xmm11, %xmm3                         
        vpxor     %xmm3, %xmm5, %xmm5                           
        vpsrld    $12, %xmm5, %xmm11                            
        vpslld    $20, %xmm5, %xmm2                             
        vpunpckldq %xmm7, %xmm9, %xmm4                          
        vpxor     %xmm2, %xmm11, %xmm5                          
        vpunpckhdq %xmm7, %xmm8, %xmm11                         
        vpunpcklqdq %xmm4, %xmm11, %xmm15                       
        vpaddd    %xmm15, %xmm13, %xmm13                        
        vpaddd    %xmm5, %xmm13, %xmm13                         
        vpxor     %xmm13, %xmm12, %xmm12                        
        vpshufb   %xmm0, %xmm12, %xmm14                         
        vpaddd    %xmm14, %xmm3, %xmm12                         
        vpxor     %xmm12, %xmm5, %xmm5                          
        vpsrld    $7, %xmm5, %xmm3                              
        vpslld    $25, %xmm5, %xmm2                             
        vpunpcklqdq %xmm7, %xmm8, %xmm5                         
        vpxor     %xmm2, %xmm3, %xmm15                          
        vpunpckhqdq %xmm7, %xmm9, %xmm3                         
        vpblendw  $51, %xmm3, %xmm5, %xmm2                      
        vpshufd   $135, %xmm2, %xmm3                            
        vpshufd   $147, %xmm15, %xmm15                          
        vpaddd    %xmm3, %xmm13, %xmm13                         
        vpshufd   $57, %xmm14, %xmm14                           
        vpaddd    %xmm15, %xmm13, %xmm3                         
        vpxor     %xmm3, %xmm14, %xmm13                         
        vpshufb   %xmm1, %xmm13, %xmm2                          
        vpshufd   $78, %xmm12, %xmm12                           
        vpaddd    %xmm2, %xmm12, %xmm12                         
        vpxor     %xmm12, %xmm15, %xmm15                        
        vpsrld    $12, %xmm15, %xmm14                           
        vpslld    $20, %xmm15, %xmm13                           
        vpunpckhqdq %xmm6, %xmm8, %xmm15                        
        vpxor     %xmm13, %xmm14, %xmm13                        
        vpunpcklqdq %xmm8, %xmm9, %xmm14                        
        vpblendw  $51, %xmm14, %xmm15, %xmm15                   
        vpaddd    %xmm15, %xmm3, %xmm3                          
        vpaddd    %xmm13, %xmm3, %xmm14                         
        vpxor     %xmm14, %xmm2, %xmm2                          
        vpshufb   %xmm0, %xmm2, %xmm3                           
        vpaddd    %xmm3, %xmm12, %xmm2                          
        vpxor     %xmm2, %xmm13, %xmm12                         
        vpsrld    $7, %xmm12, %xmm13                            
        vpslld    $25, %xmm12, %xmm12                           
        vpxor     %xmm12, %xmm13, %xmm15                        
        vpshufd   $57, %xmm15, %xmm12                           
        vpunpckhqdq %xmm9, %xmm7, %xmm13                        
        vpunpckhqdq %xmm8, %xmm6, %xmm15                        
        vpblendw  $51, %xmm15, %xmm13, %xmm13                   
        vpaddd    %xmm13, %xmm14, %xmm14                        
        vpshufd   $147, %xmm3, %xmm3                            
        vpaddd    %xmm12, %xmm14, %xmm14                        
        vpxor     %xmm14, %xmm3, %xmm13                         
        vpshufb   %xmm1, %xmm13, %xmm15                         
        vpshufd   $78, %xmm2, %xmm2                             
        vpaddd    %xmm15, %xmm2, %xmm2                          
        vpxor     %xmm2, %xmm12, %xmm3                          
        vpsrld    $12, %xmm3, %xmm12                            
        vpslld    $20, %xmm3, %xmm13                            
        vpblendw  $3, %xmm7, %xmm9, %xmm3                       
        vpxor     %xmm13, %xmm12, %xmm13                        
        vpslldq   $8, %xmm3, %xmm12                             
        vmovdqu   %xmm3, -72(%rsp)                              
        vpblendw  $15, %xmm6, %xmm12, %xmm3                     
        vpshufd   $99, %xmm3, %xmm12                            
        vpaddd    %xmm12, %xmm14, %xmm14                        
        vpaddd    %xmm13, %xmm14, %xmm3                         
        vpxor     %xmm3, %xmm15, %xmm15                         
        vpshufb   %xmm0, %xmm15, %xmm14                         
        vpaddd    %xmm14, %xmm2, %xmm15                         
        vpxor     %xmm15, %xmm13, %xmm2                         
        vpsrld    $7, %xmm2, %xmm13                             
        vpslld    $25, %xmm2, %xmm12                            
        vpunpcklqdq %xmm4, %xmm10, %xmm4                        
        vpxor     %xmm12, %xmm13, %xmm2                         
        vpshufd   $147, %xmm2, %xmm2                            
        vpaddd    %xmm4, %xmm3, %xmm13                          
        vpshufd   $57, %xmm14, %xmm12                           
        vpaddd    %xmm2, %xmm13, %xmm3                          
        vpxor     %xmm3, %xmm12, %xmm4                          
        vpshufb   %xmm1, %xmm4, %xmm13                          
        vpshufd   $78, %xmm15, %xmm15                           
        vpaddd    %xmm13, %xmm15, %xmm14                        
        vpxor     %xmm14, %xmm2, %xmm2                          
        vpsrld    $12, %xmm2, %xmm12                            
        vpslld    $20, %xmm2, %xmm2                             
        vpblendw  $3, %xmm6, %xmm9, %xmm4                       
        vpxor     %xmm2, %xmm12, %xmm15                         
        vpsrldq   $4, %xmm7, %xmm12                             
        vpblendw  $60, %xmm12, %xmm4, %xmm2                     
        vpaddd    %xmm2, %xmm3, %xmm3                           
        vpaddd    %xmm15, %xmm3, %xmm4                          
        vpxor     %xmm4, %xmm13, %xmm13                         
        vpshufb   %xmm0, %xmm13, %xmm12                         
        vpaddd    %xmm12, %xmm14, %xmm2                         
        vpxor     %xmm2, %xmm15, %xmm14                         
        vpsrld    $7, %xmm14, %xmm13                            
        vpslld    $25, %xmm14, %xmm3                            
        vpblendw  $12, %xmm9, %xmm8, %xmm14                     
        vpxor     %xmm3, %xmm13, %xmm15                         
        vpsrldq   $4, %xmm6, %xmm13                             
        vpshufd   $57, %xmm15, %xmm3                            
        vpblendw  $48, %xmm13, %xmm14, %xmm15                   
        vpshufd   $108, %xmm15, %xmm14                          
        vpaddd    %xmm14, %xmm4, %xmm4                          
        vpshufd   $147, %xmm12, %xmm12                          
        vpaddd    %xmm3, %xmm4, %xmm13                          
        vpxor     %xmm13, %xmm12, %xmm12                        
        vpshufb   %xmm1, %xmm12, %xmm14                         
        vpshufd   $78, %xmm2, %xmm2                             
        vpaddd    %xmm14, %xmm2, %xmm15                         
        vpxor     %xmm15, %xmm3, %xmm3                          
        vpsrld    $12, %xmm3, %xmm12                            
        vpslld    $20, %xmm3, %xmm2                             
        vpshufd   $33, %xmm6, %xmm3                             
        vpxor     %xmm2, %xmm12, %xmm4                          
        vpblendw  $51, %xmm3, %xmm5, %xmm12                     
        vpaddd    %xmm12, %xmm13, %xmm13                        
        vpaddd    %xmm4, %xmm13, %xmm2                          
        vpxor     %xmm2, %xmm14, %xmm14                         
        vpshufb   %xmm0, %xmm14, %xmm3                          
        vpaddd    %xmm3, %xmm15, %xmm13                         
        vpxor     %xmm13, %xmm4, %xmm4                          
        vpsrld    $7, %xmm4, %xmm15                             
        vpslld    $25, %xmm4, %xmm12                            
        vpslldq   $12, %xmm8, %xmm14                            
        vpxor     %xmm12, %xmm15, %xmm4                         
        vpblendw  $51, %xmm6, %xmm9, %xmm15                     
        vpshufd   $147, %xmm4, %xmm12                           
        vpblendw  $192, %xmm14, %xmm15, %xmm4                   
        vpaddd    %xmm4, %xmm2, %xmm2                           
        vpshufd   $57, %xmm3, %xmm3                             
        vpaddd    %xmm12, %xmm2, %xmm4                          
        vpxor     %xmm4, %xmm3, %xmm3                           
        vpshufb   %xmm1, %xmm3, %xmm3                           
        vpshufd   $78, %xmm13, %xmm13                           
        vpaddd    %xmm3, %xmm13, %xmm13                         
        vpxor     %xmm13, %xmm12, %xmm12                        
        vpsrld    $12, %xmm12, %xmm2                            
        vpslld    $20, %xmm12, %xmm15                           
        vpblendw  $48, %xmm7, %xmm6, %xmm14                     
        vpxor     %xmm15, %xmm2, %xmm15                         
        vpsrldq   $4, %xmm8, %xmm2                              
        vpblendw  $3, %xmm2, %xmm14, %xmm12                     
        vpshufd   $156, %xmm12, %xmm14                          
        vpaddd    %xmm14, %xmm4, %xmm4                          
        vpaddd    %xmm15, %xmm4, %xmm4                          
        vpxor     %xmm4, %xmm3, %xmm3                           
        vpshufb   %xmm0, %xmm3, %xmm3                           
        vpaddd    %xmm3, %xmm13, %xmm12                         
        vpxor     %xmm12, %xmm15, %xmm13                        
        vpsrld    $7, %xmm13, %xmm15                            
        vpslld    $25, %xmm13, %xmm13                           
        vpxor     %xmm13, %xmm15, %xmm14                        
        vpunpcklqdq %xmm7, %xmm9, %xmm15                        
        vpblendw  $12, %xmm2, %xmm15, %xmm2                     
        vpshufd   $180, %xmm2, %xmm2                            
        vpshufd   $57, %xmm14, %xmm13                           
        vpaddd    %xmm2, %xmm4, %xmm4                           
        vpshufd   $147, %xmm3, %xmm3                            
        vpaddd    %xmm13, %xmm4, %xmm14                         
        vpxor     %xmm14, %xmm3, %xmm2                          
        vpshufb   %xmm1, %xmm2, %xmm15                          
        vpshufd   $78, %xmm12, %xmm12                           
        vpaddd    %xmm15, %xmm12, %xmm2                         
        vmovdqu   %xmm11, -88(%rsp)                             
        vpxor     %xmm2, %xmm13, %xmm13                         
        vpunpckhqdq %xmm11, %xmm9, %xmm11                       
        vpsrld    $12, %xmm13, %xmm3                            
        vpslld    $20, %xmm13, %xmm12                           
        vpshufd   $198, %xmm11, %xmm13                          
        vpxor     %xmm12, %xmm3, %xmm4                          
        vpaddd    %xmm13, %xmm14, %xmm11                        
        vpaddd    %xmm4, %xmm11, %xmm11                         
        vpxor     %xmm11, %xmm15, %xmm14                        
        vpshufb   %xmm0, %xmm14, %xmm12                         
        vpaddd    %xmm12, %xmm2, %xmm3                          
        vpxor     %xmm3, %xmm4, %xmm4                           
        vpblendw  $15, %xmm6, %xmm10, %xmm10                    
        vpsrld    $7, %xmm4, %xmm15                             
        vpslld    $25, %xmm4, %xmm13                            
        vpshufd   $141, %xmm10, %xmm10                          
        vpxor     %xmm13, %xmm15, %xmm2                         
        vpshufd   $147, %xmm2, %xmm13                           
        vpaddd    %xmm10, %xmm11, %xmm11                        
        vpshufd   $57, %xmm12, %xmm2                            
        vpaddd    %xmm13, %xmm11, %xmm11                        
        vpxor     %xmm11, %xmm2, %xmm4                          
        vpshufb   %xmm1, %xmm4, %xmm10                          
        vpshufd   $78, %xmm3, %xmm3                             
        vpaddd    %xmm10, %xmm3, %xmm4                          
        vmovdqu   -24(%rsp), %xmm2                              
        vpxor     %xmm4, %xmm13, %xmm12                         
        vmovdqu   -40(%rsp), %xmm3                              
                                
..B1.24:                        
        vpsrld    $12, %xmm12, %xmm13                           
        vpslld    $20, %xmm12, %xmm15                           
        vpblendw  $48, %xmm6, %xmm7, %xmm12                     
        vpxor     %xmm15, %xmm13, %xmm14                        
        vpsrldq   $4, %xmm9, %xmm13                             
        incq      %rbp                                          
        vpblendw  $3, %xmm13, %xmm12, %xmm15                    
        addq      $-64, %r10                                    
        vpshufd   $75, %xmm15, %xmm12                           
        addq      $64, %rcx                                     
        vpaddd    %xmm12, %xmm11, %xmm11                        
        vpaddd    %xmm14, %xmm11, %xmm12                        
        vpxor     %xmm12, %xmm10, %xmm10                        
        vpshufb   %xmm0, %xmm10, %xmm11                         
        vpaddd    %xmm11, %xmm4, %xmm10                         
        vpxor     %xmm10, %xmm14, %xmm4                         
        vpunpckhqdq %xmm6, %xmm9, %xmm13                        
        vpsrld    $7, %xmm4, %xmm14                             
        vpslld    $25, %xmm4, %xmm4                             
        vpblendw  $60, %xmm5, %xmm13, %xmm5                     
        vpxor     %xmm4, %xmm14, %xmm14                         
        vpshufd   $57, %xmm14, %xmm4                            
        vpshufd   $45, %xmm5, %xmm14                            
        vpaddd    %xmm14, %xmm12, %xmm12                        
        vpshufd   $147, %xmm11, %xmm11                          
        vpaddd    %xmm4, %xmm12, %xmm15                         
        vpxor     %xmm15, %xmm11, %xmm13                        
        vpshufb   %xmm1, %xmm13, %xmm13                         
        vpshufd   $78, %xmm10, %xmm10                           
        vpaddd    %xmm13, %xmm10, %xmm14                        
        vpunpckldq %xmm8, %xmm9, %xmm10                         
        vpxor     %xmm14, %xmm4, %xmm4                          
        vmovhpd   -88(%rsp), %xmm10, %xmm11                     
        vpsrld    $12, %xmm4, %xmm5                             
        vpslld    $20, %xmm4, %xmm4                             
        vpaddd    %xmm11, %xmm15, %xmm15                        
        vpxor     %xmm4, %xmm5, %xmm12                          
        vpaddd    %xmm12, %xmm15, %xmm11                        
        vpxor     %xmm11, %xmm13, %xmm4                         
        vpshufb   %xmm0, %xmm4, %xmm10                          
        vpaddd    %xmm10, %xmm14, %xmm4                         
        vpxor     %xmm4, %xmm12, %xmm12                         
        vpsrld    $7, %xmm12, %xmm14                            
        vpslld    $25, %xmm12, %xmm13                           
        vpunpckhdq %xmm6, %xmm8, %xmm12                         
        vpxor     %xmm13, %xmm14, %xmm15                        
        vpunpcklqdq %xmm9, %xmm12, %xmm14                       
        vpblendw  $192, %xmm7, %xmm14, %xmm13                   
        vpshufd   $147, %xmm15, %xmm5                           
        vpshufhw  $78, %xmm13, %xmm15                           
        vpaddd    %xmm15, %xmm11, %xmm11                        
        vpshufd   $57, %xmm10, %xmm10                           
        vpaddd    %xmm5, %xmm11, %xmm13                         
        vpxor     %xmm13, %xmm10, %xmm10                        
        vpshufb   %xmm1, %xmm10, %xmm14                         
        vpshufd   $78, %xmm4, %xmm4                             
        vpaddd    %xmm14, %xmm4, %xmm12                         
        vpxor     %xmm12, %xmm5, %xmm5                          
        vpsrld    $12, %xmm5, %xmm4                             
        vpslld    $20, %xmm5, %xmm10                            
        vpunpckhdq %xmm6, %xmm9, %xmm5                          
        vpxor     %xmm10, %xmm4, %xmm11                         
        vpblendw  $240, %xmm5, %xmm7, %xmm15                    
        vpshufd   $39, %xmm15, %xmm4                            
        vpaddd    %xmm4, %xmm13, %xmm13                         
        vpaddd    %xmm11, %xmm13, %xmm10                        
        vpxor     %xmm10, %xmm14, %xmm14                        
        vpshufb   %xmm0, %xmm14, %xmm15                         
        vpaddd    %xmm15, %xmm12, %xmm4                         
        vpxor     %xmm4, %xmm11, %xmm11                         
        vpblendw  $12, %xmm9, %xmm7, %xmm14                     
        vpsrld    $7, %xmm11, %xmm12                            
        vpslld    $25, %xmm11, %xmm11                           
        vpxor     %xmm11, %xmm12, %xmm12                        
        vpslldq   $4, %xmm14, %xmm11                            
        vpshufd   $57, %xmm12, %xmm13                           
        vpblendw  $15, %xmm6, %xmm11, %xmm12                    
        vpaddd    %xmm12, %xmm10, %xmm10                        
        vpshufd   $147, %xmm15, %xmm15                          
        vpaddd    %xmm13, %xmm10, %xmm14                        
        vpxor     %xmm14, %xmm15, %xmm10                        
        vpshufb   %xmm1, %xmm10, %xmm12                         
        vpshufd   $78, %xmm4, %xmm4                             
        vpaddd    %xmm12, %xmm4, %xmm11                         
        vpxor     %xmm11, %xmm13, %xmm13                        
        vpsrld    $12, %xmm13, %xmm4                            
        vpslld    $20, %xmm13, %xmm10                           
        vpblendw  $48, %xmm9, %xmm8, %xmm13                     
        vpxor     %xmm10, %xmm4, %xmm10                         
        vpshufd   $78, %xmm13, %xmm15                           
        vpaddd    %xmm15, %xmm14, %xmm14                        
        vpaddd    %xmm10, %xmm14, %xmm4                         
        vpxor     %xmm4, %xmm12, %xmm12                         
        vpshufb   %xmm0, %xmm12, %xmm15                         
        vpaddd    %xmm15, %xmm11, %xmm13                        
        vpxor     %xmm13, %xmm10, %xmm11                        
        vpsrld    $7, %xmm11, %xmm10                            
        vpslld    $25, %xmm11, %xmm11                           
        vpxor     %xmm11, %xmm10, %xmm12                        
        vpblendw  $48, %xmm7, %xmm8, %xmm10                     
        vpblendw  $15, -72(%rsp), %xmm10, %xmm11                
        vpshufd   $147, %xmm12, %xmm14                          
        vpshufd   $114, %xmm11, %xmm12                          
        vpaddd    %xmm12, %xmm4, %xmm4                          
        vpshufd   $57, %xmm15, %xmm15                           
        vpaddd    %xmm14, %xmm4, %xmm12                         
        vpxor     %xmm12, %xmm15, %xmm4                         
        vpshufb   %xmm1, %xmm4, %xmm11                          
        vpshufd   $78, %xmm13, %xmm13                           
        vpaddd    %xmm11, %xmm13, %xmm10                        
        vpslldq   $4, %xmm9, %xmm13                             
        vpxor     %xmm10, %xmm14, %xmm14                        
        vpblendw  $192, %xmm13, %xmm8, %xmm8                    
        vpsrld    $12, %xmm14, %xmm4                            
        vpshufd   $99, %xmm8, %xmm8                             
        vpslld    $20, %xmm14, %xmm14                           
        vpxor     %xmm14, %xmm4, %xmm4                          
        vpaddd    %xmm8, %xmm12, %xmm12                         
        vpaddd    %xmm4, %xmm12, %xmm15                         
        vpxor     %xmm15, %xmm11, %xmm11                        
        vpshufb   %xmm0, %xmm11, %xmm13                         
        vpaddd    %xmm13, %xmm10, %xmm14                        
        vpxor     %xmm14, %xmm4, %xmm4                          
        vpsrld    $7, %xmm4, %xmm10                             
        vpslld    $25, %xmm4, %xmm8                             
        vpxor     %xmm8, %xmm10, %xmm4                          
        vpunpckldq %xmm6, %xmm7, %xmm10                         
        vpunpckhqdq %xmm10, %xmm5, %xmm5                        
        vpshufd   $201, %xmm5, %xmm8                            
        vpshufd   $57, %xmm4, %xmm12                            
        vpaddd    %xmm8, %xmm15, %xmm15                         
        vpshufd   $147, %xmm13, %xmm13                          
        vpaddd    %xmm12, %xmm15, %xmm11                        
        vpxor     %xmm11, %xmm13, %xmm8                         
        vpshufb   %xmm1, %xmm8, %xmm10                          
        vpshufd   $78, %xmm14, %xmm14                           
        vpaddd    %xmm10, %xmm14, %xmm4                         
        vpblendw  $192, %xmm7, %xmm6, %xmm7                     
        vpxor     %xmm4, %xmm12, %xmm8                          
        vpunpckldq %xmm6, %xmm9, %xmm6                          
        vpsrld    $12, %xmm8, %xmm5                             
        vpblendw  $15, %xmm6, %xmm7, %xmm9                      
        vpslld    $20, %xmm8, %xmm12                            
        vpxor     %xmm12, %xmm5, %xmm8                          
        vpshufd   $27, %xmm9, %xmm5                             
        vpaddd    %xmm5, %xmm11, %xmm6                          
        vpaddd    %xmm8, %xmm6, %xmm7                           
        vpxor     %xmm7, %xmm10, %xmm10                         
        vpshufb   %xmm0, %xmm10, %xmm15                         
        vpaddd    %xmm15, %xmm4, %xmm4                          
        vpxor     %xmm4, %xmm8, %xmm11                          
        vpsrld    $7, %xmm11, %xmm12                            
        vpslld    $25, %xmm11, %xmm13                           
        vpxor     %xmm13, %xmm12, %xmm14                        
        vpshufd   $78, %xmm4, %xmm8                             
        vpshufd   $147, %xmm14, %xmm4                           
        vpxor     %xmm8, %xmm7, %xmm9                           
        vpshufd   $57, %xmm15, %xmm5                            
        vpxor     %xmm9, %xmm3, %xmm3                           
        vpxor     %xmm5, %xmm4, %xmm6                           
        vpxor     %xmm6, %xmm2, %xmm2                           
        cmpq      %rax, %rbp                                    
        jb        ..B1.3        
                                
..B1.4:                         
        vmovdqu   .L_2il0floatpacket.11(%rip), %xmm5            
        vmovdqu   .L_2il0floatpacket.10(%rip), %xmm4            
        movq      -104(%rsp), %rbp                              
..___tag_value_crypto_hash.4:                                   
                                
..B1.5:                         
        testq     $64, %rdx                                     
        je        ..B1.7        
                                
..B1.6:                         
        vmovdqu   (%rsi), %xmm9                                 
        vmovdqu   16(%rsi), %xmm8                               
        vmovdqu   32(%rsi), %xmm7                               
        vmovdqu   48(%rsi), %xmm6                               
        jmp       ..B1.21       
                                
..B1.7:                         
        vpxor     %xmm6, %xmm6, %xmm6                           
        vmovups   %xmm6, -88(%rsp)                              
        vmovups   %xmm6, -72(%rsp)                              
        vmovups   %xmm6, -56(%rsp)                              
        vmovups   %xmm6, -104(%rsp)                             
                                
..B1.8:                         
        lea       -104(%rsp), %rcx                              
        testq     $32, %rdx                                     
        je        ..B1.10       
                                
..B1.9:                         
        vmovdqu   (%rsi), %xmm6                                 
        vmovdqu   16(%rsi), %xmm7                               
        vmovdqu   %xmm6, -104(%rsp)                             
        lea       -72(%rsp), %rcx                               
        vmovdqu   %xmm7, -88(%rsp)                              
        addq      $32, %rsi                                     
                                
..B1.10:                        
        testq     $16, %rdx                                     
        je        ..B1.12       
                                
..B1.11:                        
        vmovdqu   (%rsi), %xmm6                                 
        vmovdqu   %xmm6, (%rcx)                                 
        addq      $16, %rcx                                     
        addq      $16, %rsi                                     
                                
..B1.12:                        
        testq     $8, %rdx                                      
        je        ..B1.14       
                                
..B1.13:                        
        movq      (%rsi), %rax                                  
        addq      $8, %rsi                                      
        movq      %rax, (%rcx)                                  
        addq      $8, %rcx                                      
                                
..B1.14:                        
        testq     $4, %rdx                                      
        je        ..B1.16      
                                
..B1.15:                        
        movl      (%rsi), %eax                                  
        addq      $4, %rsi                                      
        movl      %eax, (%rcx)                                  
        addq      $4, %rcx                                      
                                
..B1.16:                        
        testq     $2, %rdx                                      
        je        ..B1.18       
                                
..B1.17:                        
        movzwl    (%rsi), %eax                                  
        addq      $2, %rsi                                      
        movw      %ax, (%rcx)                                   
        addq      $2, %rcx                                      
                                
..B1.18:                        
        testq     $1, %rdx                                      
        je        ..B1.20       
                                
..B1.19:                        
        movb      (%rsi), %al                                   
        movb      %al, (%rcx)                                   
                                
..B1.20:                        
        vmovdqu   -104(%rsp), %xmm9                             
        vmovdqu   -88(%rsp), %xmm8                              
        vmovdqu   -72(%rsp), %xmm7                              
        vmovdqu   -56(%rsp), %xmm6                              
                                
..B1.21:                        
        addq      %r11, %rdx                                    
        movq      $0x0ffffffff, %rax                            
        vshufps   $136, %xmm8, %xmm9, %xmm13                    
        vpaddd    %xmm13, %xmm3, %xmm11                         
        vmovdqu   %xmm3, -40(%rsp)                              
        vpaddd    %xmm2, %xmm11, %xmm14                         
        vmovd     %rdx, %xmm10                                  
        vpinsrq   $1, %rax, %xmm10, %xmm12                      
        vmovdqu   %xmm2, -24(%rsp)                              
        vshufps   $221, %xmm8, %xmm9, %xmm11                    
        vpaddd    %xmm11, %xmm14, %xmm10                        
        vshufps   $136, %xmm6, %xmm7, %xmm11                    
        vpxor     %xmm4, %xmm12, %xmm3                          
        vpxor     %xmm14, %xmm3, %xmm4                          
        vpshufb   %xmm1, %xmm4, %xmm15                          
        vpaddd    %xmm15, %xmm5, %xmm4                          
        vpxor     %xmm4, %xmm2, %xmm2                           
        vpsrld    $12, %xmm2, %xmm5                             
        vpslld    $20, %xmm2, %xmm13                            
        vpxor     %xmm13, %xmm5, %xmm2                          
        vpaddd    %xmm2, %xmm10, %xmm3                          
        vpxor     %xmm3, %xmm15, %xmm12                         
        vpaddd    %xmm11, %xmm3, %xmm3                          
        vpshufb   %xmm0, %xmm12, %xmm5                          
        vpaddd    %xmm5, %xmm4, %xmm12                          
        vpxor     %xmm12, %xmm2, %xmm4                          
        vpsrld    $7, %xmm4, %xmm15                             
        vpslld    $25, %xmm4, %xmm14                            
        vpxor     %xmm14, %xmm15, %xmm13                        
        vpshufd   $57, %xmm13, %xmm10                           
        vpshufd   $147, %xmm5, %xmm5                            
        vpaddd    %xmm10, %xmm3, %xmm11                         
        vpxor     %xmm11, %xmm5, %xmm13                         
        vpshufb   %xmm1, %xmm13, %xmm13                         
        vpshufd   $78, %xmm12, %xmm12                           
        vpaddd    %xmm13, %xmm12, %xmm5                         
        vpxor     %xmm5, %xmm10, %xmm10                         
        vshufps   $221, %xmm6, %xmm7, %xmm4                     
        vpsrld    $12, %xmm10, %xmm3                            
        vpslld    $20, %xmm10, %xmm2                            
        vpaddd    %xmm4, %xmm11, %xmm11                         
        vpxor     %xmm2, %xmm3, %xmm10                          
        vpaddd    %xmm10, %xmm11, %xmm11                        
        vpxor     %xmm11, %xmm13, %xmm15                        
        vpshufb   %xmm0, %xmm15, %xmm14                         
        vpaddd    %xmm14, %xmm5, %xmm13                         
        vpxor     %xmm13, %xmm10, %xmm5                         
        vpblendw  $12, %xmm7, %xmm8, %xmm4                      
        vpsrld    $7, %xmm5, %xmm12                             
        vpslld    $25, %xmm5, %xmm3                             
        vpslldq   $4, %xmm6, %xmm5                              
        vpxor     %xmm3, %xmm12, %xmm2                          
        vpblendw  $240, %xmm5, %xmm4, %xmm10                    
        vpshufd   $147, %xmm10, %xmm12                          
        vpshufd   $147, %xmm2, %xmm15                           
        vpaddd    %xmm12, %xmm11, %xmm11                        
        vpshufd   $57, %xmm14, %xmm14                           
        vpaddd    %xmm15, %xmm11, %xmm4                         
        vpxor     %xmm4, %xmm14, %xmm11                         
        vpshufb   %xmm1, %xmm11, %xmm2                          
        vpshufd   $78, %xmm13, %xmm13                           
        vpaddd    %xmm2, %xmm13, %xmm3                          
        vpshufd   $8, %xmm7, %xmm14                             
        vpxor     %xmm3, %xmm15, %xmm10                         
        vpblendw  $192, %xmm6, %xmm8, %xmm13                    
        vpsrld    $12, %xmm10, %xmm12                           
        vpslld    $20, %xmm10, %xmm15                           
        vpblendw  $240, %xmm13, %xmm14, %xmm10                  
        vpxor     %xmm15, %xmm12, %xmm11                        
        vpshufd   $177, %xmm10, %xmm12                          
        vpaddd    %xmm12, %xmm4, %xmm4                          
        vpaddd    %xmm11, %xmm4, %xmm12                         
        vpxor     %xmm12, %xmm2, %xmm2                          
        vpshufb   %xmm0, %xmm2, %xmm10                          
        vpslldq   $4, %xmm8, %xmm4                              
        vpaddd    %xmm10, %xmm3, %xmm13                         
        vpblendw  $48, %xmm4, %xmm7, %xmm15                     
        vpxor     %xmm13, %xmm11, %xmm3                         
        vpblendw  $240, %xmm15, %xmm9, %xmm14                   
        vpsrld    $7, %xmm3, %xmm11                             
        vpslld    $25, %xmm3, %xmm3                             
        vpxor     %xmm3, %xmm11, %xmm2                          
        vpshufd   $177, %xmm14, %xmm3                           
        vpshufd   $57, %xmm2, %xmm11                            
        vpaddd    %xmm3, %xmm12, %xmm12                         
        vpshufd   $147, %xmm10, %xmm10                          
        vpaddd    %xmm11, %xmm12, %xmm2                         
        vpxor     %xmm2, %xmm10, %xmm10                         
        vpshufb   %xmm1, %xmm10, %xmm3                          
        vpshufd   $78, %xmm13, %xmm13                           
        vpaddd    %xmm3, %xmm13, %xmm12                         
        vpxor     %xmm12, %xmm11, %xmm13                        
        vpsrld    $12, %xmm13, %xmm11                           
        vpslld    $20, %xmm13, %xmm10                           
        vpxor     %xmm10, %xmm11, %xmm10                        
        vpunpckhdq %xmm8, %xmm9, %xmm11                         
        vpblendw  $12, %xmm5, %xmm11, %xmm4                     
        vpshufd   $177, %xmm4, %xmm15                           
        vpaddd    %xmm15, %xmm2, %xmm2                          
        vpaddd    %xmm10, %xmm2, %xmm13                         
        vpxor     %xmm13, %xmm3, %xmm14                         
        vpshufb   %xmm0, %xmm14, %xmm14                         
        vpaddd    %xmm14, %xmm12, %xmm15                        
        vpxor     %xmm15, %xmm10, %xmm12                        
        vpsrld    $7, %xmm12, %xmm3                             
        vpslld    $25, %xmm12, %xmm10                           
        vpblendw  $12, %xmm8, %xmm6, %xmm2                      
        vpxor     %xmm10, %xmm3, %xmm12                         
        vpunpckhdq %xmm6, %xmm7, %xmm3                          
        vpblendw  $15, %xmm2, %xmm3, %xmm10                     
        vpshufd   $147, %xmm12, %xmm4                           
        vpshufd   $210, %xmm10, %xmm12                          
        vpaddd    %xmm12, %xmm13, %xmm13                        
        vpshufd   $57, %xmm14, %xmm14                           
        vpaddd    %xmm4, %xmm13, %xmm2                          
        vpxor     %xmm2, %xmm14, %xmm13                         
        vpshufb   %xmm1, %xmm13, %xmm3                          
        vpshufd   $78, %xmm15, %xmm15                           
        vpaddd    %xmm3, %xmm15, %xmm12                         
        vpxor     %xmm12, %xmm4, %xmm4                          
        vpsrld    $12, %xmm4, %xmm13                            
        vpslld    $20, %xmm4, %xmm10                            
        vpunpckldq %xmm9, %xmm7, %xmm4                          
        vpxor     %xmm10, %xmm13, %xmm10                        
        vpblendw  $240, %xmm9, %xmm4, %xmm15                    
        vpslldq   $8, %xmm6, %xmm14                             
        vpblendw  $192, %xmm14, %xmm15, %xmm13                  
        vpaddd    %xmm13, %xmm2, %xmm2                          
        vpaddd    %xmm10, %xmm2, %xmm13                         
        vpxor     %xmm13, %xmm3, %xmm3                          
        vpshufb   %xmm0, %xmm3, %xmm15                          
        vpaddd    %xmm15, %xmm12, %xmm14                        
        vpxor     %xmm14, %xmm10, %xmm12                        
        vpsrld    $7, %xmm12, %xmm10                            
        vpslld    $25, %xmm12, %xmm12                           
        vpblendw  $60, %xmm7, %xmm9, %xmm2                      
        vpxor     %xmm12, %xmm10, %xmm3                         
        vpsrldq   $12, %xmm8, %xmm10                            
        vpblendw  $3, %xmm10, %xmm2, %xmm12                     
        vpshufd   $57, %xmm3, %xmm4                             
        vpshufd   $78, %xmm12, %xmm3                            
        vpaddd    %xmm3, %xmm13, %xmm13                         
        vpshufd   $147, %xmm15, %xmm15                          
        vpaddd    %xmm4, %xmm13, %xmm3                          
        vpxor     %xmm3, %xmm15, %xmm13                         
        vpshufb   %xmm1, %xmm13, %xmm12                         
        vpshufd   $78, %xmm14, %xmm14                           
        vpaddd    %xmm12, %xmm14, %xmm10                        
        vpxor     %xmm10, %xmm4, %xmm4                          
        vpsrld    $12, %xmm4, %xmm13                            
        vpslld    $20, %xmm4, %xmm2                             
        vpblendw  $51, %xmm8, %xmm9, %xmm4                      
        vpxor     %xmm2, %xmm13, %xmm13                         
        vpblendw  $192, %xmm5, %xmm4, %xmm5                     
        vpshufd   $27, %xmm5, %xmm5                             
        vpaddd    %xmm5, %xmm3, %xmm3                           
        vpaddd    %xmm13, %xmm3, %xmm2                          
        vpxor     %xmm2, %xmm12, %xmm12                         
        vpshufb   %xmm0, %xmm12, %xmm3                          
        vpaddd    %xmm3, %xmm10, %xmm12                         
        vpunpckhdq %xmm7, %xmm11, %xmm14                        
        vpxor     %xmm12, %xmm13, %xmm13                        
        vpblendw  $12, %xmm6, %xmm14, %xmm5                     
        vpsrld    $7, %xmm13, %xmm10                            
        vpslld    $25, %xmm13, %xmm4                            
        vpshufd   $210, %xmm5, %xmm13                           
        vpxor     %xmm4, %xmm10, %xmm15                         
        vpshufd   $147, %xmm15, %xmm10                          
        vpaddd    %xmm13, %xmm2, %xmm2                          
        vpshufd   $57, %xmm3, %xmm5                             
        vpaddd    %xmm10, %xmm2, %xmm13                         
        vpxor     %xmm13, %xmm5, %xmm3                          
        vpshufb   %xmm1, %xmm3, %xmm5                           
        vpshufd   $78, %xmm12, %xmm12                           
        vpaddd    %xmm5, %xmm12, %xmm14                         
        vpxor     %xmm14, %xmm10, %xmm10                        
        vpslldq   $8, %xmm7, %xmm12                             
        vpsrld    $12, %xmm10, %xmm4                            
        vpslld    $20, %xmm10, %xmm15                           
        vpblendw  $12, %xmm9, %xmm6, %xmm10                     
        vpxor     %xmm15, %xmm4, %xmm15                         
        vpblendw  $192, %xmm12, %xmm10, %xmm3                   
        vpshufd   $135, %xmm3, %xmm2                            
        vpaddd    %xmm2, %xmm13, %xmm13                         
        vpaddd    %xmm15, %xmm13, %xmm4                         
        vpxor     %xmm4, %xmm5, %xmm5                           
        vpshufb   %xmm0, %xmm5, %xmm2                           
        vpaddd    %xmm2, %xmm14, %xmm10                         
        vpblendw  $15, %xmm8, %xmm9, %xmm3                      
        vpxor     %xmm10, %xmm15, %xmm14                        
        vpblendw  $192, %xmm6, %xmm3, %xmm15                    
        vpsrld    $7, %xmm14, %xmm5                             
        vpslld    $25, %xmm14, %xmm13                           
        vpshufd   $198, %xmm15, %xmm14                          
        vpxor     %xmm13, %xmm5, %xmm12                         
        vpshufd   $57, %xmm12, %xmm5                            
        vpaddd    %xmm14, %xmm4, %xmm4                          
        vpshufd   $147, %xmm2, %xmm2                            
        vpaddd    %xmm5, %xmm4, %xmm13                          
        vpxor     %xmm13, %xmm2, %xmm12                         
        vpshufb   %xmm1, %xmm12, %xmm3                          
        vpshufd   $78, %xmm10, %xmm10                           
        vpaddd    %xmm3, %xmm10, %xmm12                         
        vpxor     %xmm12, %xmm5, %xmm5                          
        vpsrld    $12, %xmm5, %xmm10                            
        vpslld    $20, %xmm5, %xmm2                             
        vpunpckldq %xmm7, %xmm9, %xmm4                          
        vpxor     %xmm2, %xmm10, %xmm5                          
        vpunpckhdq %xmm7, %xmm8, %xmm10                         
        vpunpcklqdq %xmm4, %xmm10, %xmm15                       
        vpaddd    %xmm15, %xmm13, %xmm13                        
        vpaddd    %xmm5, %xmm13, %xmm13                         
        vpxor     %xmm13, %xmm3, %xmm3                          
        vpshufb   %xmm0, %xmm3, %xmm14                          
        vpaddd    %xmm14, %xmm12, %xmm12                        
        vpxor     %xmm12, %xmm5, %xmm5                          
        vpsrld    $7, %xmm5, %xmm3                              
        vpslld    $25, %xmm5, %xmm2                             
        vpunpcklqdq %xmm7, %xmm8, %xmm5                         
        vpxor     %xmm2, %xmm3, %xmm15                          
        vpunpckhqdq %xmm7, %xmm9, %xmm3                         
        vpblendw  $51, %xmm3, %xmm5, %xmm2                      
        vpshufd   $135, %xmm2, %xmm3                            
        vpshufd   $147, %xmm15, %xmm15                          
        vpaddd    %xmm3, %xmm13, %xmm13                         
        vpshufd   $57, %xmm14, %xmm14                           
        vpaddd    %xmm15, %xmm13, %xmm3                         
        vpxor     %xmm3, %xmm14, %xmm13                         
        vpshufb   %xmm1, %xmm13, %xmm2                          
        vpshufd   $78, %xmm12, %xmm12                           
        vpaddd    %xmm2, %xmm12, %xmm12                         
        vpxor     %xmm12, %xmm15, %xmm15                        
        vpsrld    $12, %xmm15, %xmm14                           
        vpslld    $20, %xmm15, %xmm13                           
        vpunpckhqdq %xmm6, %xmm8, %xmm15                        
        vpxor     %xmm13, %xmm14, %xmm13                        
        vpunpcklqdq %xmm8, %xmm9, %xmm14                        
        vpblendw  $51, %xmm14, %xmm15, %xmm15                   
        vpaddd    %xmm15, %xmm3, %xmm3                          
        vpaddd    %xmm13, %xmm3, %xmm14                         
        vpxor     %xmm14, %xmm2, %xmm2                          
        vpshufb   %xmm0, %xmm2, %xmm3                           
        vpaddd    %xmm3, %xmm12, %xmm2                          
        vpxor     %xmm2, %xmm13, %xmm12                         
        vpsrld    $7, %xmm12, %xmm13                            
        vpslld    $25, %xmm12, %xmm12                           
        vpxor     %xmm12, %xmm13, %xmm15                        
        vpshufd   $57, %xmm15, %xmm12                           
        vpunpckhqdq %xmm9, %xmm7, %xmm13                        
        vpunpckhqdq %xmm8, %xmm6, %xmm15                        
        vpblendw  $51, %xmm15, %xmm13, %xmm13                   
        vpaddd    %xmm13, %xmm14, %xmm14                        
        vpshufd   $147, %xmm3, %xmm3                            
        vpaddd    %xmm12, %xmm14, %xmm14                        
        vpxor     %xmm14, %xmm3, %xmm13                         
        vpshufb   %xmm1, %xmm13, %xmm15                         
        vpshufd   $78, %xmm2, %xmm2                             
        vpaddd    %xmm15, %xmm2, %xmm2                          
        vpxor     %xmm2, %xmm12, %xmm12                         
        vpsrld    $12, %xmm12, %xmm3                            
        vpslld    $20, %xmm12, %xmm13                           
        vpblendw  $3, %xmm7, %xmm9, %xmm12                      
        vpxor     %xmm13, %xmm3, %xmm13                         
        vpslldq   $8, %xmm12, %xmm3                             
        vmovdqu   %xmm12, -88(%rsp)                             
        vpblendw  $15, %xmm6, %xmm3, %xmm12                     
        vpshufd   $99, %xmm12, %xmm3                            
        vpaddd    %xmm3, %xmm14, %xmm14                         
        vpaddd    %xmm13, %xmm14, %xmm3                         
        vpxor     %xmm3, %xmm15, %xmm15                         
        vpshufb   %xmm0, %xmm15, %xmm14                         
        vpaddd    %xmm14, %xmm2, %xmm15                         
        vpxor     %xmm15, %xmm13, %xmm2                         
        vpsrld    $7, %xmm2, %xmm13                             
        vpslld    $25, %xmm2, %xmm12                            
        vpunpcklqdq %xmm4, %xmm11, %xmm4                        
        vpxor     %xmm12, %xmm13, %xmm2                         
        vpshufd   $147, %xmm2, %xmm2                            
        vpaddd    %xmm4, %xmm3, %xmm13                          
        vpshufd   $57, %xmm14, %xmm3                            
        vpaddd    %xmm2, %xmm13, %xmm12                         
        vpxor     %xmm12, %xmm3, %xmm4                          
        vpshufb   %xmm1, %xmm4, %xmm13                          
        vpshufd   $78, %xmm15, %xmm15                           
        vpaddd    %xmm13, %xmm15, %xmm14                        
        vpxor     %xmm14, %xmm2, %xmm2                          
        vpsrld    $12, %xmm2, %xmm3                             
        vpslld    $20, %xmm2, %xmm2                             
        vpblendw  $3, %xmm6, %xmm9, %xmm4                       
        vpxor     %xmm2, %xmm3, %xmm15                          
        vpsrldq   $4, %xmm7, %xmm3                              
        vpblendw  $60, %xmm3, %xmm4, %xmm2                      
        vpaddd    %xmm2, %xmm12, %xmm12                         
        vpaddd    %xmm15, %xmm12, %xmm4                         
        vpxor     %xmm4, %xmm13, %xmm13                         
        vpshufb   %xmm0, %xmm13, %xmm3                          
        vpaddd    %xmm3, %xmm14, %xmm2                          
        vpxor     %xmm2, %xmm15, %xmm14                         
        vpsrld    $7, %xmm14, %xmm13                            
        vpslld    $25, %xmm14, %xmm12                           
        vpblendw  $12, %xmm9, %xmm8, %xmm14                     
        vpxor     %xmm12, %xmm13, %xmm15                        
        vpsrldq   $4, %xmm6, %xmm13                             
        vpshufd   $57, %xmm15, %xmm12                           
        vpblendw  $48, %xmm13, %xmm14, %xmm15                   
        vpshufd   $108, %xmm15, %xmm14                          
        vpaddd    %xmm14, %xmm4, %xmm4                          
        vpshufd   $147, %xmm3, %xmm3                            
        vpaddd    %xmm12, %xmm4, %xmm13                         
        vpxor     %xmm13, %xmm3, %xmm3                          
        vpshufb   %xmm1, %xmm3, %xmm14                          
        vpshufd   $78, %xmm2, %xmm2                             
        vpaddd    %xmm14, %xmm2, %xmm15                         
        vpxor     %xmm15, %xmm12, %xmm12                        
        vpsrld    $12, %xmm12, %xmm3                            
        vpslld    $20, %xmm12, %xmm2                            
        vpshufd   $33, %xmm6, %xmm12                            
        vpxor     %xmm2, %xmm3, %xmm4                           
        vpblendw  $51, %xmm12, %xmm5, %xmm3                     
        vpaddd    %xmm3, %xmm13, %xmm13                         
        vpaddd    %xmm4, %xmm13, %xmm2                          
        vpxor     %xmm2, %xmm14, %xmm14                         
        vpshufb   %xmm0, %xmm14, %xmm3                          
        vpaddd    %xmm3, %xmm15, %xmm13                         
        vpxor     %xmm13, %xmm4, %xmm4                          
        vpsrld    $7, %xmm4, %xmm15                             
        vpslld    $25, %xmm4, %xmm12                            
        vpslldq   $12, %xmm8, %xmm14                            
        vpxor     %xmm12, %xmm15, %xmm4                         
        vpblendw  $51, %xmm6, %xmm9, %xmm15                     
        vpshufd   $147, %xmm4, %xmm12                           
        vpblendw  $192, %xmm14, %xmm15, %xmm4                   
        vpaddd    %xmm4, %xmm2, %xmm2                           
        vpshufd   $57, %xmm3, %xmm3                             
        vpaddd    %xmm12, %xmm2, %xmm4                          
        vpxor     %xmm4, %xmm3, %xmm3                           
        vpshufb   %xmm1, %xmm3, %xmm3                           
        vpshufd   $78, %xmm13, %xmm13                           
        vpaddd    %xmm3, %xmm13, %xmm13                         
        vpxor     %xmm13, %xmm12, %xmm12                        
        vpsrld    $12, %xmm12, %xmm2                            
        vpslld    $20, %xmm12, %xmm15                           
        vpblendw  $48, %xmm7, %xmm6, %xmm14                     
        vpxor     %xmm15, %xmm2, %xmm15                         
        vpsrldq   $4, %xmm8, %xmm2                              
        vpblendw  $3, %xmm2, %xmm14, %xmm12                     
        vpshufd   $156, %xmm12, %xmm14                          
        vpaddd    %xmm14, %xmm4, %xmm4                          
        vpaddd    %xmm15, %xmm4, %xmm4                          
        vpxor     %xmm4, %xmm3, %xmm3                           
        vpshufb   %xmm0, %xmm3, %xmm3                           
        vpaddd    %xmm3, %xmm13, %xmm12                         
        vpxor     %xmm12, %xmm15, %xmm13                        
        vpsrld    $7, %xmm13, %xmm15                            
        vpslld    $25, %xmm13, %xmm13                           
        vpxor     %xmm13, %xmm15, %xmm14                        
        vpunpcklqdq %xmm7, %xmm9, %xmm15                        
        vpblendw  $12, %xmm2, %xmm15, %xmm2                     
        vpshufd   $180, %xmm2, %xmm2                            
        vpshufd   $57, %xmm14, %xmm13                           
        vpaddd    %xmm2, %xmm4, %xmm4                           
        vpshufd   $147, %xmm3, %xmm3                            
        vpaddd    %xmm13, %xmm4, %xmm14                         
        vpxor     %xmm14, %xmm3, %xmm2                          
        vpshufb   %xmm1, %xmm2, %xmm15                          
        vpshufd   $78, %xmm12, %xmm12                           
        vpaddd    %xmm15, %xmm12, %xmm2                         
        vmovdqu   %xmm10, -104(%rsp)                            
        vpxor     %xmm2, %xmm13, %xmm13                         
        vpunpckhqdq %xmm10, %xmm9, %xmm10                       
        vpsrld    $12, %xmm13, %xmm12                           
        vpslld    $20, %xmm13, %xmm3                            
        vpshufd   $198, %xmm10, %xmm13                          
        vpxor     %xmm3, %xmm12, %xmm4                          
        vpaddd    %xmm13, %xmm14, %xmm10                        
        vpaddd    %xmm4, %xmm10, %xmm3                          
        vpxor     %xmm3, %xmm15, %xmm12                         
        vpshufb   %xmm0, %xmm12, %xmm10                         
        vpaddd    %xmm10, %xmm2, %xmm12                         
        vpxor     %xmm12, %xmm4, %xmm4                          
        vpblendw  $15, %xmm6, %xmm11, %xmm11                    
        vpsrld    $7, %xmm4, %xmm14                             
        vpslld    $25, %xmm4, %xmm15                            
        vpshufd   $141, %xmm11, %xmm11                          
        vpxor     %xmm15, %xmm14, %xmm13                        
        vpshufd   $147, %xmm13, %xmm13                          
        vpaddd    %xmm11, %xmm3, %xmm2                          
        vpshufd   $57, %xmm10, %xmm3                            
        vpaddd    %xmm13, %xmm2, %xmm11                         
        vpxor     %xmm11, %xmm3, %xmm10                         
        vpshufb   %xmm1, %xmm10, %xmm10                         
        vpshufd   $78, %xmm12, %xmm2                            
        vpaddd    %xmm10, %xmm2, %xmm4                          
        vpxor     %xmm4, %xmm13, %xmm12                         
        vmovdqu   -24(%rsp), %xmm2                              
        vpsrld    $12, %xmm12, %xmm13                           
        vmovdqu   -40(%rsp), %xmm3                              
                                
..B1.25:                        
        vpblendw  $48, %xmm6, %xmm7, %xmm14                     
        vpslld    $20, %xmm12, %xmm12                           
        vpsrldq   $4, %xmm9, %xmm15                             
        vpxor     %xmm12, %xmm13, %xmm13                        
        vpblendw  $3, %xmm15, %xmm14, %xmm12                    
        xorl      %eax, %eax                                    
        vpshufd   $75, %xmm12, %xmm14                           
        vpaddd    %xmm14, %xmm11, %xmm11                        
        vpaddd    %xmm13, %xmm11, %xmm11                        
        vpxor     %xmm11, %xmm10, %xmm10                        
        vpshufb   %xmm0, %xmm10, %xmm10                         
        vpaddd    %xmm10, %xmm4, %xmm4                          
        vpunpckhqdq %xmm6, %xmm9, %xmm14                        
        vpxor     %xmm4, %xmm13, %xmm13                         
        vpblendw  $60, %xmm5, %xmm14, %xmm5                     
        vpsrld    $7, %xmm13, %xmm15                            
        vpslld    $25, %xmm13, %xmm13                           
        vpxor     %xmm13, %xmm15, %xmm12                        
        vpshufd   $45, %xmm5, %xmm13                            
        vpshufd   $57, %xmm12, %xmm15                           
        vpaddd    %xmm13, %xmm11, %xmm11                        
        vpshufd   $147, %xmm10, %xmm10                          
        vpaddd    %xmm15, %xmm11, %xmm5                         
        vpxor     %xmm5, %xmm10, %xmm10                         
        vpshufb   %xmm1, %xmm10, %xmm14                         
        vpshufd   $78, %xmm4, %xmm4                             
        vpaddd    %xmm14, %xmm4, %xmm12                         
        vpxor     %xmm12, %xmm15, %xmm4                         
        vpunpckldq %xmm8, %xmm9, %xmm15                         
        vpsrld    $12, %xmm4, %xmm10                            
        vpslld    $20, %xmm4, %xmm11                            
        vmovhpd   -104(%rsp), %xmm15, %xmm4                     
        vpxor     %xmm11, %xmm10, %xmm13                        
        vpaddd    %xmm4, %xmm5, %xmm5                           
        vpaddd    %xmm13, %xmm5, %xmm11                         
        vpxor     %xmm11, %xmm14, %xmm14                        
        vpshufb   %xmm0, %xmm14, %xmm10                         
        vpaddd    %xmm10, %xmm12, %xmm4                         
        vpxor     %xmm4, %xmm13, %xmm12                         
        vpunpckhdq %xmm6, %xmm8, %xmm15                         
        vpsrld    $7, %xmm12, %xmm13                            
        vpslld    $25, %xmm12, %xmm12                           
        vpxor     %xmm12, %xmm13, %xmm14                        
        vpunpcklqdq %xmm9, %xmm15, %xmm13                       
        vpblendw  $192, %xmm7, %xmm13, %xmm12                   
        vpshufd   $147, %xmm14, %xmm5                           
        vpshufhw  $78, %xmm12, %xmm14                           
        vpaddd    %xmm14, %xmm11, %xmm11                        
        vpshufd   $57, %xmm10, %xmm10                           
        vpaddd    %xmm5, %xmm11, %xmm12                         
        vpxor     %xmm12, %xmm10, %xmm10                        
        vpshufb   %xmm1, %xmm10, %xmm13                         
        vpshufd   $78, %xmm4, %xmm4                             
        vpaddd    %xmm13, %xmm4, %xmm11                         
        vpxor     %xmm11, %xmm5, %xmm5                          
        vpsrld    $12, %xmm5, %xmm4                             
        vpslld    $20, %xmm5, %xmm10                            
        vpunpckhdq %xmm6, %xmm9, %xmm5                          
        vpxor     %xmm10, %xmm4, %xmm10                         
        vpblendw  $240, %xmm5, %xmm7, %xmm14                    
        vpshufd   $39, %xmm14, %xmm15                           
        vpaddd    %xmm15, %xmm12, %xmm12                        
        vpaddd    %xmm10, %xmm12, %xmm4                         
        vpxor     %xmm4, %xmm13, %xmm13                         
        vpshufb   %xmm0, %xmm13, %xmm14                         
        vpaddd    %xmm14, %xmm11, %xmm15                        
        vpxor     %xmm15, %xmm10, %xmm11                        
        vpsrld    $7, %xmm11, %xmm10                            
        vpslld    $25, %xmm11, %xmm11                           
        vpxor     %xmm11, %xmm10, %xmm13                        
        vpblendw  $12, %xmm9, %xmm7, %xmm10                     
        vpslldq   $4, %xmm10, %xmm11                            
        vpshufd   $57, %xmm13, %xmm12                           
        vpblendw  $15, %xmm6, %xmm11, %xmm13                    
        vpaddd    %xmm13, %xmm4, %xmm4                          
        vpshufd   $147, %xmm14, %xmm14                          
        vpaddd    %xmm12, %xmm4, %xmm13                         
        vpxor     %xmm13, %xmm14, %xmm4                         
        vpshufb   %xmm1, %xmm4, %xmm11                          
        vpshufd   $78, %xmm15, %xmm15                           
        vpaddd    %xmm11, %xmm15, %xmm10                        
        vpblendw  $48, %xmm9, %xmm8, %xmm14                     
        vpxor     %xmm10, %xmm12, %xmm12                        
        vpshufd   $78, %xmm14, %xmm15                           
        vpsrld    $12, %xmm12, %xmm4                            
        vpslld    $20, %xmm12, %xmm12                           
        vpaddd    %xmm15, %xmm13, %xmm13                        
        vpxor     %xmm12, %xmm4, %xmm4                          
        vpaddd    %xmm4, %xmm13, %xmm15                         
        vpxor     %xmm15, %xmm11, %xmm11                        
        vpshufb   %xmm0, %xmm11, %xmm14                         
        vpaddd    %xmm14, %xmm10, %xmm12                        
        vpxor     %xmm12, %xmm4, %xmm10                         
        vpsrld    $7, %xmm10, %xmm4                             
        vpslld    $25, %xmm10, %xmm10                           
        vpxor     %xmm10, %xmm4, %xmm11                         
        vpblendw  $48, %xmm7, %xmm8, %xmm4                      
        vpblendw  $15, -88(%rsp), %xmm4, %xmm10                 
        vpshufd   $147, %xmm11, %xmm13                          
        vpshufd   $114, %xmm10, %xmm11                          
        vpaddd    %xmm11, %xmm15, %xmm15                        
        vpshufd   $57, %xmm14, %xmm14                           
        vpaddd    %xmm13, %xmm15, %xmm11                        
        vpxor     %xmm11, %xmm14, %xmm4                         
        vpshufb   %xmm1, %xmm4, %xmm10                          
        vpshufd   $78, %xmm12, %xmm12                           
        vpslldq   $4, %xmm9, %xmm14                             
        vpaddd    %xmm10, %xmm12, %xmm4                         
        vpblendw  $192, %xmm14, %xmm8, %xmm8                    
        vpxor     %xmm4, %xmm13, %xmm13                         
        vpshufd   $99, %xmm8, %xmm8                             
        vpsrld    $12, %xmm13, %xmm12                           
        vpslld    $20, %xmm13, %xmm13                           
        vpaddd    %xmm8, %xmm11, %xmm11                         
        vpxor     %xmm13, %xmm12, %xmm15                        
        vpaddd    %xmm15, %xmm11, %xmm14                        
        vpxor     %xmm14, %xmm10, %xmm10                        
        vpshufb   %xmm0, %xmm10, %xmm12                         
        vpaddd    %xmm12, %xmm4, %xmm13                         
        vpunpckldq %xmm6, %xmm7, %xmm10                         
        vpxor     %xmm13, %xmm15, %xmm4                         
        vpunpckhqdq %xmm10, %xmm5, %xmm5                        
        vpsrld    $7, %xmm4, %xmm15                             
        vpslld    $25, %xmm4, %xmm8                             
        vpxor     %xmm8, %xmm15, %xmm4                          
        vpshufd   $201, %xmm5, %xmm8                            
        vpshufd   $57, %xmm4, %xmm11                            
        vpaddd    %xmm8, %xmm14, %xmm14                         
        vpshufd   $147, %xmm12, %xmm12                          
        vpaddd    %xmm11, %xmm14, %xmm10                        
        vpxor     %xmm10, %xmm12, %xmm8                         
        vpshufb   %xmm1, %xmm8, %xmm4                           
        vpshufd   $78, %xmm13, %xmm1                            
        vpaddd    %xmm4, %xmm1, %xmm8                           
        vpblendw  $192, %xmm7, %xmm6, %xmm7                     
        vpxor     %xmm8, %xmm11, %xmm1                          
        vpunpckldq %xmm6, %xmm9, %xmm6                          
        vpsrld    $12, %xmm1, %xmm5                             
        vpblendw  $15, %xmm6, %xmm7, %xmm9                      
        vpslld    $20, %xmm1, %xmm11                            
        vpxor     %xmm11, %xmm5, %xmm1                          
        vpshufd   $27, %xmm9, %xmm5                             
        vpaddd    %xmm5, %xmm10, %xmm6                          
        vpaddd    %xmm1, %xmm6, %xmm7                           
        vpxor     %xmm7, %xmm4, %xmm4                           
        vpshufb   %xmm0, %xmm4, %xmm4                           
        vpaddd    %xmm4, %xmm8, %xmm0                           
        vpxor     %xmm0, %xmm1, %xmm8                           
        vpshufd   $78, %xmm0, %xmm0                             
        vpxor     %xmm0, %xmm7, %xmm1                           
        vpxor     %xmm1, %xmm3, %xmm6                           
        vpsrld    $7, %xmm8, %xmm3                              
        vpslld    $25, %xmm8, %xmm8                             
        vpxor     %xmm8, %xmm3, %xmm3                           
        vpshufd   $147, %xmm3, %xmm0                            
        vpshufd   $57, %xmm4, %xmm1                             
        vpxor     %xmm1, %xmm0, %xmm5                           
        vpxor     %xmm5, %xmm2, %xmm2                           
        vmovdqu   %xmm6, (%rdi)                                 
        vmovdqu   %xmm2, 16(%rdi)                               
        ret                                                     
        .align    16,0x90
..___tag_value_crypto_hash.5:                                   
	.type	crypto_hash_blake2s_avxicc,@function
	.size	crypto_hash_blake2s_avxicc,.-crypto_hash_blake2s_avxicc
	.data

	.section .rodata, "a"
	.align 16
	.align 16
.L_2il0floatpacket.7:
	.long	0x00030201,0x04070605,0x080b0a09,0x0c0f0e0d
	.type	.L_2il0floatpacket.7,@object
	.size	.L_2il0floatpacket.7,16
	.align 16
.L_2il0floatpacket.8:
	.long	0x01000302,0x05040706,0x09080b0a,0x0d0c0f0e
	.type	.L_2il0floatpacket.8,@object
	.size	.L_2il0floatpacket.8,16
	.align 16
.L_2il0floatpacket.9:
	.long	0x6b08e647,0xbb67ae85,0x3c6ef372,0xa54ff53a
	.type	.L_2il0floatpacket.9,@object
	.size	.L_2il0floatpacket.9,16
	.align 16
.L_2il0floatpacket.10:
	.long	0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19
	.type	.L_2il0floatpacket.10,@object
	.size	.L_2il0floatpacket.10,16
	.align 16
.L_2il0floatpacket.11:
	.long	0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a
	.type	.L_2il0floatpacket.11,@object
	.size	.L_2il0floatpacket.11,16
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
	.4byte 0x00000024
	.4byte 0x0000001c
	.8byte ..___tag_value_crypto_hash.1
	.8byte ..___tag_value_crypto_hash.5-..___tag_value_crypto_hash.1
	.byte 0x04
	.4byte ..___tag_value_crypto_hash.3-..___tag_value_crypto_hash.1
	.2byte 0x0e86
	.byte 0x04
	.4byte ..___tag_value_crypto_hash.4-..___tag_value_crypto_hash.3
	.4byte 0x000000c6

