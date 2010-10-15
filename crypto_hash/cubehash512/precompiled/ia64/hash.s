	.file	"hash.c"
	.pred.safe_across_calls p1-p5,p16-p63
	.text
	.align 16
	.global crypto_hash_cubehash512_precompiled_ia64#
	.proc crypto_hash_cubehash512_precompiled_ia64#
crypto_hash_cubehash512_precompiled_ia64:
	.prologue
	.mmi
	alloc r16 = ar.pfs, 3, 69, 8, 0
	.fframe 16
	adds r12 = -16, r12
	.save ar.lc, r103
	mov r103 = ar.lc
	.body
	.mlx
	cmp.ltu p8, p9 = 31, r34
	movl r63 = 2015330639
	.mlx
	mov r54 = r0
	movl r88 = 418666790
	.mlx
	nop 0
	movl r89 = -1725205216
	.mlx
	nop 0
	movl r90 = -937198089
	.mlx
	nop 0
	movl r91 = -454837624
	.mlx
	nop 0
	movl r92 = 2063627775
	.mlx
	nop 0
	movl r93 = 1368484226
	.mlx
	nop 0
	movl r94 = -1803787961
	.mlx
	nop 0
	movl r95 = -1648333046
	.mlx
	nop 0
	movl r96 = 1293516469
	.mlx
	nop 0
	movl r97 = -1226739164
	.mlx
	nop 0
	movl r98 = -1859249462
	.mlx
	nop 0
	movl r99 = 1383134689
	.mlx
	nop 0
	movl r100 = -638594836
	.mlx
	nop 0
	movl r101 = -251856952
	.mlx
	nop 0
	movl r102 = 550766415
	.mlx
	nop 0
	movl r53 = 357859310
	.mlx
	nop 0
	movl r52 = -192703725
	.mlx
	nop 0
	movl r51 = 24909980
	.mlx
	nop 0
	movl r50 = -1357106390
	.mlx
	nop 0
	movl r49 = -565347188
	.mlx
	nop 0
	movl r48 = -2070315284
	.mlx
	nop 0
	movl r47 = 1540913731
	.mlx
	nop 0
	movl r46 = -1227632555
	.mlx
	nop 0
	movl r45 = 987908016
	.mlx
	nop 0
	movl r44 = 730640550
	.mlx
	nop 0
	movl r43 = -640234955
	.mlx
	nop 0
	movl r42 = 1274096532
	.mlx
	nop 0
	movl r41 = -1745667503
	.mlx
	nop 0
	movl r40 = 1660650669
	.mlx
	nop 0
	movl r39 = 2121328147
	.mlx
	nop 0
	movl r38 = 1376546971
	.bbb
	nop 0
	nop 0
	(p9) br.cond.dptk .L3
.L4:
	.mmi
	mov r76 = r33
	adds r77 = 5, r33
	adds r75 = 9, r33
	.mmi
	adds r74 = 13, r33
	adds r73 = 17, r33
	adds r72 = 21, r33
	;;
	.mmi
	ld1 r61 = [r76], 1
	adds r71 = 25, r33
	adds r70 = 29, r33
	.mmi
	ld1 r30 = [r77]
	adds r29 = 2, r33
	adds r68 = 4, r33
	;;
	.mmi
	ld1 r69 = [r76]
	ld1 r65 = [r75]
	adds r67 = 6, r33
	.mmi
	adds r31 = 8, r33
	adds r66 = 10, r33
	adds r64 = 12, r33
	.mmi
	ld1 r24 = [r74]
	ld1 r59 = [r73]
	adds r62 = 14, r33
	.mmi
	adds r60 = 16, r33
	adds r22 = 18, r33
	adds r23 = 20, r33
	;;
	.mmi
	ld1 r108 = [r31]
	ld1 r58 = [r72]
	adds r57 = 22, r33
	.mmi
	adds r27 = 24, r33
	adds r56 = 26, r33
	adds r21 = 28, r33
	.mmi
	ld1 r9 = [r71]
	ld1 r2 = [r70]
	adds r25 = 30, r33
	.mmi
	adds r36 = 3, r33
	adds r55 = 7, r33
	adds r10 = 11, r33
	;;
	.mmi
	ld1 r76 = [r57]
	ld1 r35 = [r29]
	dep.z r20 = r30, 8, 24
	.mmi
	adds r107 = 15, r33
	adds r28 = 19, r33
	adds r87 = 23, r33
	.mmi
	ld1 r26 = [r68]
	ld1 r37 = [r67]
	dep.z r19 = r65, 8, 24
	.mmi
	adds r83 = 27, r33
	adds r82 = 31, r33
	adds r34 = -32, r34
	;;
	.mib
	nop 0
	dep.z r72 = r76, 16, 16
	nop 0
	.mmi
	ld1 r3 = [r66]
	ld1 r8 = [r60]
	xor r85 = r20, r26
	.mmi
	nop 0
	ld1 r11 = [r23]
	dep.z r18 = r24, 8, 24
	.mmi
	ld1 r111 = [r64]
	xor r80 = r19, r108
	adds r33 = 32, r33
	;;
	.mib
	nop 0
	dep.z r81 = r3, 16, 16
	nop 0
	.mmi
	ld1 r84 = [r62]
	ld1 r79 = [r22]
	xor r77 = r18, r111
	.mib
	nop 0
	dep.z r104 = r69, 8, 24
	nop 0
	.mmi
	ld1 r110 = [r27]
	ld1 r73 = [r56]
	addl r108 = 16, r0
	.mib
	nop 0
	dep.z r17 = r59, 8, 24
	nop 0
	.mmf
	ld1 r109 = [r21]
	ld1 r70 = [r25]
	nop 0
	;;
	.mii
	nop 0
	dep.z r78 = r84, 16, 16
	xor r105 = r104, r61
	.mmi
	xor r74 = r17, r8
	ld1 r65 = [r36]
	dep.z r16 = r58, 8, 24
	.mmi
	ld1 r64 = [r55]
	ld1 r61 = [r10]
	xor r57 = r81, r80
	.mib
	nop 0
	dep.z r15 = r9, 8, 24
	nop 0
	.mmf
	ld1 r58 = [r107]
	ld1 r56 = [r28]
	nop 0
	;;
	.mii
	xor r55 = r78, r77
	dep.z r14 = r2, 8, 24
	xor r71 = r16, r11
	.mmi
	xor r68 = r15, r110
	ld1 r36 = [r83]
	dep.z r106 = r35, 16, 16
	.mmi
	ld1 r35 = [r82]
	;;
	xor r31 = r72, r71
	dep.z r86 = r37, 16, 16
	.mmi
	xor r66 = r14, r109
	ld1 r37 = [r87]
	xor r24 = r106, r105
	.mii
	nop 0
	dep.z r75 = r79, 16, 16
	;;
	dep.z r20 = r37, 24, 8
	.mii
	xor r59 = r86, r85
	xor r29 = r75, r74
	dep.z r69 = r73, 16, 16
	;;
	.mii
	xor r10 = r20, r31
	dep.z r67 = r70, 16, 16
	xor r11 = r69, r68
	;;
	.mii
	xor r8 = r67, r66
	dep.z r62 = r65, 24, 8
	xor r92 = r92, r10
	.mib
	nop 0
	dep.z r60 = r64, 24, 8
	nop 0
	;;
	.mii
	xor r26 = r62, r24
	dep.z r30 = r61, 24, 8
	xor r27 = r60, r59
	.mib
	nop 0
	dep.z r25 = r58, 24, 8
	nop 0
	;;
	.mii
	xor r63 = r63, r26
	dep.z r22 = r56, 24, 8
	xor r23 = r30, r57
	.mmi
	xor r21 = r25, r55
	xor r88 = r88, r27
	dep.z r18 = r36, 24, 8
	;;
	.mmi
	nop 0
	xor r89 = r89, r23
	dep.z r9 = r35, 24, 8
	.mmi
	xor r19 = r22, r29
	xor r3 = r18, r11
	xor r90 = r90, r21
	;;
	.mmi
	nop 0
	xor r2 = r9, r8
	xor r91 = r91, r19
	.mmi
	xor r93 = r93, r3
	;;
	nop 0
	xor r94 = r94, r2
.L13:
	.mii
	nop 0
	shr.u r80 = r108, 1
	cmp4.lt p8, p9 = 0, r108
	.bbb
	nop 0
	nop 0
	(p9) br.cond.dpnt .L49
	;;
	.mmi
	and r79 = 24, r80
	;;
	adds r78 = -1, r79
	nop 0
	;;
	.mib
	nop 0
	mov ar.lc = r78
	nop 0
.L76:
	.mii
	nop 0
	mix4.r r27 = r93, r93
	mix4.r r21 = r91, r91
	.mmb
	add r74 = r53, r63
	add r109 = r51, r89
	nop 0
	.mii
	nop 0
	mix4.r r2 = r97, r97
	mix4.r r25 = r95, r95
	.mmb
	add r22 = r45, r95
	add r18 = r43, r97
	nop 0
	.mii
	nop 0
	mix4.r r15 = r89, r89
	mix4.r r110 = r63, r63
	.mmb
	add r19 = r49, r91
	add r68 = r47, r93
	nop 0
	;;
	.mii
	nop 0
	shr.u r83 = r21, 25
	mix4.r r35 = r98, r98
	.mmb
	add r29 = r41, r99
	add r69 = r39, r101
	nop 0
	.mii
	nop 0
	mix4.r r36 = r96, r96
	mix4.r r55 = r90, r90
	.mmb
	add r58 = r52, r88
	add r14 = r50, r90
	nop 0
	;;
	.mii
	xor r26 = r29, r83
	mix4.r r37 = r88, r88
	mix4.r r10 = r101, r101
	.mmb
	add r67 = r44, r96
	add r59 = r42, r98
	nop 0
	.mii
	add r8 = r46, r94
	mix4.r r107 = r99, r99
	mix4.r r3 = r102, r102
	.mmi
	add r17 = r40, r100
	add r57 = r38, r102
	mix4.r r28 = r100, r100
	.mii
	nop 0
	mix4.r r87 = r94, r94
	;;
	shr.u r80 = r10, 25
	.mib
	nop 0
	mix4.r r86 = r92, r92
	nop 0
	.mii
	nop 0
	shr.u r82 = r27, 25
	shr.u r84 = r2, 25
	.mmb
	nop 0
	add r27 = r48, r92
	nop 0
	;;
	.mii
	xor r66 = r68, r80
	shr.u r85 = r25, 25
	shr.u r105 = r15, 25
	.mmi
	xor r64 = r69, r82
	xor r73 = r109, r84
	shr.u r106 = r110, 25
	.mib
	nop 0
	shr.u r76 = r35, 25
	nop 0
	;;
	.mii
	xor r9 = r18, r105
	shr.u r77 = r36, 25
	shr.u r78 = r55, 25
	.mmb
	xor r71 = r22, r106
	xor r24 = r74, r85
	nop 0
	.mii
	nop 0
	shr.u r79 = r37, 25
	shr.u r81 = r107, 25
	.mmb
	nop 0
	xor r37 = r14, r76
	nop 0
	;;
	.mmi
	xor r30 = r59, r78
	xor r61 = r19, r81
	shr.u r108 = r3, 25
	.mmi
	xor r111 = r67, r79
	xor r107 = r58, r77
	shr.u r75 = r28, 25
	.mii
	nop 0
	shr.u r11 = r87, 25
	shr.u r16 = r86, 25
	;;
	.mmi
	xor r21 = r8, r108
	xor r36 = r17, r16
	mix4.r r72 = r73, r73
	.mmi
	xor r25 = r57, r11
	xor r110 = r27, r75
	mix4.r r56 = r9, r9
	.mii
	nop 0
	mix4.r r104 = r24, r24
	mix4.r r70 = r71, r71
	.mmb
	add r108 = r18, r71
	add r75 = r69, r26
	nop 0
	;;
	.mii
	add r11 = r57, r36
	mix4.r r31 = r30, r30
	mix4.r r65 = r66, r66
	.mmb
	add r18 = r22, r9
	add r71 = r29, r64
	nop 0
	.mii
	nop 0
	mix4.r r62 = r64, r64
	mix4.r r20 = r61, r61
	.mmb
	add r22 = r109, r24
	add r69 = r19, r66
	nop 0
	.mii
	nop 0
	mix4.r r60 = r26, r26
	mix4.r r23 = r111, r111
	.mmb
	add r109 = r74, r73
	add r24 = r68, r61
	nop 0
	;;
	.mii
	nop 0
	shr.u r85 = r31, 21
	mix4.r r2 = r21, r21
	.mmi
	add r19 = r59, r111
	add r59 = r67, r30
	mix4.r r15 = r25, r25
	.mii
	nop 0
	mix4.r r35 = r110, r110
	mix4.r r55 = r36, r36
	.mii
	nop 0
	mix4.r r10 = r37, r37
	;;
	shr.u r16 = r2, 21
	.mib
	nop 0
	mix4.r r106 = r107, r107
	nop 0
	.mii
	nop 0
	shr.u r84 = r72, 21
	shr.u r86 = r56, 21
	.mii
	add r56 = r8, r110
	shr.u r28 = r104, 21
	shr.u r105 = r70, 21
	.mmb
	add r104 = r17, r25
	add r70 = r27, r21
	nop 0
	;;
	.mii
	xor r67 = r69, r84
	shr.u r76 = r65, 21
	shr.u r78 = r62, 21
	.mmb
	xor r72 = r75, r105
	xor r65 = r71, r86
	nop 0
	.mii
	nop 0
	shr.u r80 = r20, 21
	shr.u r82 = r60, 21
	.mmb
	add r60 = r14, r107
	add r14 = r58, r37
	nop 0
	;;
	.mii
	xor r58 = r18, r78
	shr.u r3 = r23, 21
	shr.u r77 = r15, 21
	.mmb
	xor r20 = r24, r28
	xor r15 = r108, r82
	nop 0
	.mii
	nop 0
	shr.u r79 = r35, 21
	shr.u r81 = r55, 21
	.mmb
	xor r27 = r22, r80
	xor r31 = r104, r85
	nop 0
	;;
	.mmi
	xor r74 = r11, r3
	xor r17 = r60, r79
	shr.u r83 = r10, 21
	.mmi
	xor r111 = r59, r77
	xor r10 = r14, r16
	shr.u r87 = r106, 21
	;;
	.mmi
	xor r29 = r70, r83
	xor r106 = r109, r76
	mix4.r r9 = r72, r72
	.mmi
	xor r62 = r56, r87
	xor r2 = r19, r81
	mix4.r r30 = r67, r67
	.mii
	nop 0
	mix4.r r66 = r31, r31
	mix4.r r64 = r65, r65
	.mmb
	add r16 = r11, r72
	add r76 = r109, r10
	nop 0
	;;
	.mii
	add r77 = r14, r106
	mix4.r r73 = r74, r74
	mix4.r r26 = r20, r20
	.mmb
	add r11 = r75, r74
	add r72 = r69, r29
	nop 0
	.mii
	nop 0
	mix4.r r68 = r29, r29
	mix4.r r61 = r62, r62
	.mmi
	add r75 = r59, r58
	add r74 = r18, r111
	mix4.r r23 = r111, r111
	.mib
	nop 0
	mix4.r r57 = r58, r58
	nop 0
	;;
	.mii
	nop 0
	shr.u r55 = r26, 25
	mix4.r r8 = r17, r17
	.mmi
	add r26 = r19, r15
	add r19 = r108, r2
	mix4.r r21 = r27, r27
	.mii
	nop 0
	mix4.r r25 = r2, r2
	mix4.r r110 = r15, r15
	.mib
	nop 0
	mix4.r r107 = r10, r10
	nop 0
	;;
	.mii
	nop 0
	shr.u r82 = r8, 25
	mix4.r r105 = r106, r106
	.mii
	xor r8 = r16, r55
	shr.u r36 = r73, 25
	shr.u r35 = r9, 25
	.mmi
	add r73 = r70, r67
	add r9 = r56, r20
	shr.u r86 = r68, 25
	.mmi
	add r56 = r24, r62
	add r20 = r22, r17
	add r24 = r104, r65
	;;
	.mii
	xor r69 = r9, r35
	shr.u r87 = r30, 25
	shr.u r28 = r66, 25
	.mmb
	add r104 = r71, r31
	xor r68 = r19, r82
	nop 0
	.mii
	nop 0
	shr.u r3 = r64, 25
	shr.u r37 = r61, 25
	.mmb
	add r61 = r60, r27
	xor r71 = r56, r36
	nop 0
	;;
	.mii
	add r45 = r74, r68
	shr.u r81 = r57, 25
	shr.u r83 = r21, 25
	.mmb
	xor r57 = r11, r37
	xor r36 = r73, r3
	nop 0
	.mii
	xor r109 = r72, r28
	shr.u r84 = r25, 25
	shr.u r85 = r110, 25
	.mmb
	xor r25 = r104, r86
	xor r110 = r24, r87
	nop 0
	;;
	.mmi
	add r41 = r104, r57
	xor r64 = r61, r85
	shr.u r80 = r23, 25
	.mmi
	xor r66 = r20, r84
	xor r30 = r26, r83
	shr.u r78 = r107, 25
	.mii
	xor r23 = r77, r81
	shr.u r79 = r105, 25
	mix4.r r70 = r71, r71
	.mmb
	add r48 = r73, r69
	add r49 = r72, r71
	nop 0
	;;
	.mmb
	xor r108 = r74, r78
	xor r18 = r76, r80
	nop 0
	.mii
	xor r22 = r75, r79
	mix4.r r29 = r69, r69
	mix4.r r67 = r68, r68
	.mii
	nop 0
	mix4.r r31 = r30, r30
	mix4.r r65 = r66, r66
	.mmb
	add r52 = r77, r64
	add r53 = r76, r66
	nop 0
	;;
	.mii
	add r42 = r26, r22
	mix4.r r62 = r64, r64
	mix4.r r58 = r23, r23
	.mmb
	add r44 = r75, r30
	add r40 = r24, r8
	nop 0
	.mii
	nop 0
	mix4.r r60 = r108, r108
	mix4.r r59 = r22, r22
	.mmb
	add r50 = r61, r23
	add r51 = r20, r18
	nop 0
	.mii
	nop 0
	mix4.r r111 = r18, r18
	mix4.r r17 = r57, r57
	.mmb
	add r43 = r19, r108
	add r46 = r9, r36
	nop 0
	;;
	.mii
	nop 0
	shr.u r28 = r58, 21
	mix4.r r27 = r8, r8
	.mmb
	add r47 = r56, r109
	add r38 = r16, r110
	nop 0
	.mii
	nop 0
	mix4.r r15 = r25, r25
	mix4.r r14 = r110, r110
	.mmi
	add r39 = r11, r25
	;;
	xor r93 = r46, r28
	mix4.r r35 = r109, r109
	.mii
	nop 0
	mix4.r r55 = r36, r36
	shr.u r106 = r70, 21
	.mii
	nop 0
	shr.u r107 = r29, 21
	shr.u r10 = r67, 21
	.mib
	nop 0
	shr.u r37 = r31, 21
	nop 0
	;;
	.mii
	nop 0
	shr.u r84 = r55, 21
	shr.u r2 = r65, 21
	.mmb
	xor r99 = r40, r37
	xor r100 = r41, r10
	nop 0
	.mii
	nop 0
	shr.u r21 = r62, 21
	shr.u r85 = r60, 21
	.mmi
	xor r63 = r52, r107
	xor r88 = r53, r106
	shr.u r86 = r59, 21
	.mib
	nop 0
	shr.u r87 = r111, 21
	nop 0
	;;
	.mmi
	xor r92 = r49, r2
	xor r91 = r48, r21
	shr.u r3 = r17, 21
	.mmi
	xor r94 = r47, r87
	xor r101 = r38, r86
	shr.u r105 = r27, 21
	.mii
	nop 0
	shr.u r81 = r15, 21
	shr.u r82 = r14, 21
	.mmi
	xor r102 = r39, r85
	xor r89 = r50, r84
	shr.u r83 = r35, 21
	;;
	.mmi
	xor r95 = r44, r105
	xor r96 = r45, r3
	xor r90 = r51, r83
	.mmb
	xor r97 = r42, r82
	xor r98 = r43, r81
	br.cloop.sptk.few .L76
.L49:
	.mib
	nop 0
	cmp.geu p10, p11 = 31, r34
	(p11) br.cond.dptk .L4
.L3:
	.mfi
	cmp.ne p14, p15 = 0, r34
	nop 0
	cmp4.ne p12, p13 = 0, r54
	.mfb
	mov r19 = r0
	nop 0
	(p12) br.cond.dptk .L20
	;;
	.mib
	nop 0
	(p15) mov r16 = r0
	(p15) br.cond.dpnt .L51
	;;
	.mfb
	mov r16 = r0
	nop 0
	nop 0
	;;
.L25:
	.mmi
	add r17 = r33, r16
	adds r19 = 1, r19
	add r54 = r12, r16
	;;
	.mii
	ld1 r8 = [r17]
	sxt4 r16 = r19
	;;
	nop 0
	.mmb
	st1 [r54] = r8
	cmp.gtu p8, p9 = r34, r16
	(p8) br.cond.dptk .L25
.L51:
	.mmi
	adds r19 = 1, r19
	add r33 = r12, r16
	addl r34 = -128, r0
	;;
	.mmi
	nop 0
	adds r15 = 1, r19
	sub r57 = 32, r19
	.mmb
	st1 [r33] = r34
	cmp4.ge p10, p11 = 31, r19
	(p11) br.cond.dpnt .L53
	;;
	.mib
	and r14 = 3, r57
	cmp4.le p12, p13 = 32, r15
	(p13) br.cond.dpnt .L77
.L57:
	.mii
	nop 0
	sxt4 r20 = r19
	adds r19 = 1, r19
	;;
	.mfi
	add r26 = r12, r20
	nop 0
	cmp4.ge p12, p13 = 31, r19
	;;
	.mfb
	st1 [r26] = r0
	nop 0
	(p13) br.cond.dptk .L53
.L56:
	.mii
	nop 0
	sub r64 = 32, r19
	;;
	extr.u r62 = r64, 2, 30
	;;
	.mmi
	adds r61 = -1, r62
	;;
	nop 0
	mov ar.lc = r61
.L74:
	.mmb
	adds r70 = 1, r19
	adds r69 = 2, r19
	nop 0
	.mii
	adds r68 = 3, r19
	sxt4 r29 = r19
	adds r19 = 4, r19
	;;
	.mii
	nop 0
	sxt4 r59 = r70
	sxt4 r67 = r69
	.mii
	add r30 = r12, r29
	nop 0
	sxt4 r31 = r68
	.mmi
	nop 0
	;;
	add r66 = r12, r59
	add r14 = r12, r67
	.mmb
	add r65 = r12, r31
	st1 [r30] = r0
	nop 0
	;;
	.mmb
	st1 [r66] = r0
	st1 [r14] = r0
	nop 0
	.mfb
	st1 [r65] = r0
	nop 0
	br.cloop.sptk.few .L74
.L53:
	.mmi
	nop 0
	mov r33 = r12
	addl r34 = 32, r0
	.mmb
	nop 0
	addl r54 = 1, r0
	br .L4
.L77:
	.mmi
	cmp4.ge p10, p11 = 2, r14
	cmp4.eq p14, p15 = 0, r14
	cmp4.ge p8, p9 = 1, r14
	.bbb
	nop 0
	(p14) br.cond.dpnt .L56
	(p8) br.cond.dpnt .L57
	;;
	.mii
	nop 0
	(p11) sxt4 r23 = r19
	(p11) mov r19 = r15
	;;
	.mii
	nop 0
	sxt4 r60 = r19
	(p11) add r58 = r12, r23
	.mmi
	adds r19 = 1, r19
	;;
	add r111 = r12, r60
	nop 0
	.mii
	(p11) st1 [r58] = r0
	nop 0
	;;
	nop 0
	.mfb
	st1 [r111] = r0
	nop 0
	br .L57
.L20:
	.mmi
	cmp4.ne p14, p15 = 1, r54
	mov r14 = r32
	extr.u r22 = r63, 24, 8
	.mmi
	adds r109 = 2, r32
	adds r8 = 3, r32
	adds r107 = 4, r32
	;;
	.mmi
	(p15) xor r38 = 1, r38
	(p15) addl r108 = 32, r0
	(p15) addl r54 = 2, r0
	.mmb
	adds r110 = 6, r32
	adds r19 = 8, r32
	(p15) br.cond.dpnt .L13
	;;
	.mib
	nop 0
	extr.u r38 = r93, 24, 8
	nop 0
	.mmi
	st1 [r14] = r63, 1
	adds r104 = 14, r32
	adds r105 = 15, r32
	.mmi
	adds r106 = 16, r32
	adds r11 = 20, r32
	extr.u r73 = r90, 24, 8
	.mmi
	adds r33 = 63, r32
	adds r15 = 5, r32
	adds r26 = 7, r32
	.mii
	nop 0
	extr.u r16 = r63, 8, 24
	adds r27 = 9, r32
	.mmb
	adds r28 = 10, r32
	adds r29 = 11, r32
	nop 0
	.mmi
	nop 0
	adds r30 = 12, r32
	extr.u r20 = r63, 16, 16
	.mmi
	adds r31 = 13, r32
	adds r9 = 17, r32
	adds r74 = 18, r32
	;;
	.mii
	st1 [r14] = r16
	extr.u r24 = r88, 16, 16
	adds r10 = 19, r32
	.mmi
	adds r2 = 21, r32
	adds r75 = 22, r32
	extr.u r18 = r90, 16, 16
	.mmi
	adds r35 = 23, r32
	adds r36 = 24, r32
	adds r37 = 25, r32
	;;
	.mmi
	st1 [r110] = r24
	adds r76 = 26, r32
	extr.u r25 = r88, 24, 8
	.mmi
	adds r39 = 27, r32
	adds r40 = 28, r32
	adds r41 = 29, r32
	.mmi
	adds r78 = 30, r32
	adds r43 = 31, r32
	extr.u r111 = r89, 24, 8
	.mmi
	adds r44 = 32, r32
	adds r53 = 33, r32
	adds r45 = 34, r32
	;;
	.mmi
	st1 [r40] = r94
	adds r46 = 35, r32
	extr.u r108 = r91, 24, 8
	.mmi
	adds r47 = 36, r32
	adds r48 = 37, r32
	adds r49 = 38, r32
	.mmi
	adds r50 = 39, r32
	adds r51 = 40, r32
	extr.u r3 = r92, 24, 8
	.mmi
	adds r52 = 41, r32
	adds r81 = 42, r32
	adds r55 = 43, r32
	;;
	.mmi
	st1 [r10] = r108
	adds r56 = 44, r32
	extr.u r42 = r94, 24, 8
	.mmi
	adds r57 = 45, r32
	adds r82 = 46, r32
	adds r59 = 47, r32
	.mmi
	adds r60 = 48, r32
	adds r61 = 49, r32
	adds r83 = 50, r32
	.mmi
	adds r70 = 51, r32
	adds r64 = 52, r32
	adds r77 = 53, r32
	;;
	.mmi
	st1 [r43] = r42
	adds r84 = 54, r32
	extr.u r23 = r88, 8, 24
	.mmi
	adds r66 = 55, r32
	adds r67 = 56, r32
	adds r68 = 57, r32
	.mmb
	adds r85 = 58, r32
	adds r34 = 59, r32
	nop 0
	.mii
	adds r71 = 60, r32
	extr.u r63 = r89, 8, 24
	adds r72 = 61, r32
	;;
	.mmi
	st1 [r15] = r23
	adds r86 = 62, r32
	extr.u r17 = r89, 16, 16
	.mmi
	st1 [r109] = r20
	st1 [r8] = r22
	extr.u r21 = r90, 8, 24
	.mii
	st1 [r107] = r88
	mov r8 = r0
	extr.u r107 = r91, 8, 24
	.mmb
	st1 [r19] = r89
	st1 [r104] = r18
	nop 0
	;;
	.mfi
	st1 [r31] = r21
	nop 0
	extr.u r19 = r91, 16, 16
	.mmi
	st1 [r105] = r73
	nop 0
	extr.u r22 = r92, 8, 24
	.mmb
	st1 [r106] = r91
	st1 [r11] = r92
	nop 0
	;;
	.mfi
	st1 [r74] = r19
	nop 0
	extr.u r109 = r92, 16, 16
	.mmi
	st1 [r27] = r63
	nop 0
	extr.u r79 = r95, 24, 8
	.mmb
	st1 [r30] = r90
	st1 [r39] = r38
	nop 0
	;;
	.mfi
	st1 [r75] = r109
	nop 0
	extr.u r73 = r93, 8, 24
	.mmi
	st1 [r44] = r95
	nop 0
	extr.u r24 = r93, 16, 16
	.mmb
	st1 [r26] = r25
	st1 [r28] = r17
	nop 0
	;;
	.mfi
	st1 [r37] = r73
	nop 0
	extr.u r104 = r94, 8, 24
	.mmi
	st1 [r29] = r111
	nop 0
	extr.u r32 = r94, 16, 16
	.mmb
	st1 [r9] = r107
	st1 [r2] = r22
	nop 0
	;;
	.mfi
	st1 [r41] = r104
	nop 0
	extr.u r92 = r95, 8, 24
	.mmi
	nop 0
	st1 [r35] = r3
	extr.u r91 = r95, 16, 16
	.mmi
	st1 [r36] = r93
	st1 [r76] = r24
	extr.u r80 = r96, 24, 8
	.mmi
	st1 [r78] = r32
	;;
	st1 [r53] = r92
	extr.u r54 = r97, 24, 8
	.mmi
	st1 [r45] = r91
	nop 0
	extr.u r58 = r98, 24, 8
	.mmb
	st1 [r46] = r79
	st1 [r47] = r96
	nop 0
	;;
	.mfi
	st1 [r55] = r54
	nop 0
	extr.u r62 = r99, 24, 8
	.mmi
	st1 [r50] = r80
	nop 0
	extr.u r65 = r100, 24, 8
	.mmb
	st1 [r51] = r97
	st1 [r56] = r98
	nop 0
	;;
	.mfi
	st1 [r70] = r62
	nop 0
	extr.u r69 = r101, 24, 8
	.mmi
	st1 [r59] = r58
	nop 0
	extr.u r87 = r102, 24, 8
	.mmb
	st1 [r60] = r99
	st1 [r64] = r100
	nop 0
	;;
	.mfi
	st1 [r34] = r69
	nop 0
	extr.u r90 = r96, 8, 24
	.mmi
	st1 [r66] = r65
	nop 0
	extr.u r89 = r96, 16, 16
	.mmb
	st1 [r67] = r101
	st1 [r71] = r102
	nop 0
	;;
	.mfi
	st1 [r48] = r90
	nop 0
	extr.u r88 = r97, 8, 24
	.mmi
	st1 [r49] = r89
	nop 0
	extr.u r53 = r97, 16, 16
	.mmi
	st1 [r33] = r87
	nop 0
	extr.u r63 = r98, 8, 24
	.mmi
	nop 0
	;;
	st1 [r81] = r53
	extr.u r46 = r98, 16, 16
	.mmi
	st1 [r52] = r88
	nop 0
	extr.u r45 = r99, 8, 24
	.mmi
	st1 [r57] = r63
	nop 0
	extr.u r44 = r99, 16, 16
	.mmi
	nop 0
	;;
	st1 [r61] = r45
	extr.u r43 = r100, 8, 24
	.mmi
	st1 [r82] = r46
	nop 0
	extr.u r42 = r100, 16, 16
	.mmi
	st1 [r83] = r44
	nop 0
	extr.u r41 = r101, 8, 24
	.mmi
	nop 0
	;;
	st1 [r84] = r42
	extr.u r40 = r101, 16, 16
	.mmi
	st1 [r77] = r43
	nop 0
	extr.u r39 = r102, 8, 24
	.mii
	st1 [r68] = r41
	extr.u r38 = r102, 16, 16
	;;
	nop 0
	.mmb
	st1 [r85] = r40
	st1 [r72] = r39
	nop 0
	.mmi
	nop 0
	st1 [r86] = r38
	mov ar.lc = r103
	.mmb
	nop 0
	.restore sp
	adds r12 = 16, r12
	br.ret.sptk.many b0
	.endp crypto_hash_cubehash512_precompiled_ia64#
	.ident	"GCC: (GNU) 3.2.3 20030502 (Red Hat Linux 3.2.3-52)"
