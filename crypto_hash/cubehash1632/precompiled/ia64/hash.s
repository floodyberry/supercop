	.file	"hash.c"
	.pred.safe_across_calls p1-p5,p16-p63
	.text
	.align 16
	.global crypto_hash_cubehash1632_precompiled_ia64#
	.proc crypto_hash_cubehash1632_precompiled_ia64#
crypto_hash_cubehash1632_precompiled_ia64:
	.prologue
	.mmi
	alloc r16 = ar.pfs, 3, 69, 8, 0
	.fframe 16
	adds r12 = -16, r12
	.save ar.lc, r103
	mov r103 = ar.lc
	.body
	.mlx
	cmp.lt p8, p9 = 31, r34
	movl r53 = 719989345
	.mlx
	nop 0
	movl r88 = 1358206164
	.mlx
	nop 0
	movl r89 = 760449931
	.mlx
	nop 0
	movl r90 = 1097324606
	.mlx
	nop 0
	movl r91 = 1072571155
	.mlx
	nop 0
	movl r92 = -956182644
	.mlx
	nop 0
	movl r93 = -868641138
	.mlx
	nop 0
	movl r94 = 1353471637
	.mlx
	nop 0
	movl r95 = 1296222087
	.mlx
	nop 0
	movl r96 = -1505253197
	.mlx
	nop 0
	movl r97 = -1748038673
	.mlx
	nop 0
	movl r98 = -2107947721
	.mlx
	nop 0
	movl r99 = -285711150
	.mlx
	nop 0
	movl r100 = -232746812
	.mlx
	nop 0
	movl r101 = -790246093
	.mlx
	nop 0
	movl r102 = -1573318226
	.mlx
	nop 0
	movl r55 = -53241639
	.mlx
	nop 0
	movl r52 = 344974469
	.mlx
	nop 0
	movl r51 = 453082095
	.mlx
	nop 0
	movl r50 = -1237039822
	.mlx
	nop 0
	movl r49 = 1783849305
	.mlx
	nop 0
	movl r48 = 804616220
	.mlx
	nop 0
	movl r47 = -1845855948
	.mlx
	nop 0
	movl r46 = 230350505
	.mlx
	nop 0
	movl r45 = -698578389
	.mlx
	nop 0
	movl r44 = -1515778443
	.mlx
	nop 0
	movl r43 = -1312414634
	.mlx
	nop 0
	movl r42 = -1132894858
	.mlx
	nop 0
	movl r41 = 421644535
	.mlx
	nop 0
	movl r40 = -409429263
	.mlx
	nop 0
	movl r39 = 2006307398
	.mlx
	nop 0
	movl r38 = -734119100
	.bbb
	nop 0
	nop 0
	(p9) br.cond.dptk .L3
.L4:
	.mmi
	mov r74 = r33
	adds r75 = 5, r33
	adds r73 = 9, r33
	.mmi
	adds r72 = 13, r33
	adds r71 = 17, r33
	adds r70 = 21, r33
	;;
	.mmi
	ld1 r61 = [r74], 1
	adds r69 = 25, r33
	adds r68 = 29, r33
	.mmi
	ld1 r30 = [r75]
	adds r29 = 2, r33
	adds r67 = 4, r33
	;;
	.mmi
	ld1 r26 = [r74]
	ld1 r64 = [r73]
	adds r66 = 6, r33
	.mmi
	adds r31 = 8, r33
	adds r65 = 10, r33
	adds r63 = 12, r33
	.mmi
	ld1 r24 = [r72]
	ld1 r59 = [r71]
	adds r62 = 14, r33
	.mmi
	adds r60 = 16, r33
	adds r22 = 18, r33
	adds r23 = 20, r33
	;;
	.mmi
	ld1 r108 = [r31]
	ld1 r58 = [r70]
	adds r57 = 22, r33
	.mmi
	adds r27 = 24, r33
	adds r56 = 26, r33
	adds r21 = 28, r33
	.mmi
	ld1 r9 = [r69]
	ld1 r2 = [r68]
	adds r54 = 30, r33
	.mmi
	adds r36 = 3, r33
	adds r37 = 7, r33
	adds r3 = 11, r33
	;;
	.mmi
	ld1 r75 = [r57]
	ld1 r35 = [r29]
	dep.z r20 = r30, 8, 24
	.mmi
	adds r107 = 15, r33
	adds r28 = 19, r33
	adds r86 = 23, r33
	.mmi
	ld1 r25 = [r67]
	ld1 r10 = [r66]
	dep.z r19 = r64, 8, 24
	.mmi
	adds r82 = 27, r33
	adds r81 = 31, r33
	adds r34 = -32, r34
	;;
	.mib
	nop 0
	dep.z r71 = r75, 16, 16
	nop 0
	.mmi
	ld1 r8 = [r60]
	ld1 r11 = [r23]
	xor r84 = r20, r25
	.mfi
	ld1 r87 = [r65]
	nop 0
	dep.z r18 = r24, 8, 24
	.mmi
	ld1 r111 = [r63]
	xor r79 = r19, r108
	adds r33 = 32, r33
	.mib
	nop 0
	dep.z r104 = r26, 8, 24
	nop 0
	.mmi
	ld1 r83 = [r62]
	ld1 r78 = [r22]
	addl r108 = 16, r0
	.mib
	nop 0
	dep.z r17 = r59, 8, 24
	nop 0
	.mmf
	ld1 r110 = [r27]
	ld1 r72 = [r56]
	nop 0
	;;
	.mmi
	xor r76 = r18, r111
	ld1 r109 = [r21]
	dep.z r16 = r58, 8, 24
	.mmi
	ld1 r69 = [r54]
	xor r105 = r104, r61
	xor r73 = r17, r8
	.mib
	nop 0
	dep.z r15 = r9, 8, 24
	nop 0
	.mmf
	ld1 r64 = [r36]
	ld1 r63 = [r37]
	nop 0
	;;
	.mii
	nop 0
	dep.z r66 = r69, 16, 16
	xor r70 = r16, r11
	.mmi
	ld1 r61 = [r3]
	xor r67 = r15, r110
	dep.z r14 = r2, 8, 24
	.mmb
	ld1 r58 = [r107]
	ld1 r56 = [r28]
	nop 0
	;;
	.mii
	nop 0
	dep.z r30 = r61, 24, 8
	xor r65 = r14, r109
	.mmi
	ld1 r37 = [r86]
	ld1 r36 = [r82]
	dep.z r106 = r35, 16, 16
	.mii
	ld1 r35 = [r81]
	xor r31 = r71, r70
	;;
	dep.z r20 = r37, 24, 8
	.mii
	xor r24 = r106, r105
	xor r8 = r66, r65
	dep.z r85 = r10, 16, 16
	;;
	.mii
	xor r10 = r20, r31
	dep.z r80 = r87, 16, 16
	xor r59 = r85, r84
	.mib
	nop 0
	dep.z r77 = r83, 16, 16
	nop 0
	;;
	.mmi
	nop 0
	xor r92 = r92, r10
	dep.z r74 = r78, 16, 16
	.mii
	xor r57 = r80, r79
	xor r54 = r77, r76
	dep.z r68 = r72, 16, 16
	;;
	.mmb
	xor r23 = r30, r57
	xor r29 = r74, r73
	nop 0
	.mii
	xor r11 = r68, r67
	dep.z r62 = r64, 24, 8
	dep.z r60 = r63, 24, 8
	;;
	.mmi
	nop 0
	xor r89 = r89, r23
	dep.z r25 = r58, 24, 8
	.mii
	xor r26 = r62, r24
	xor r27 = r60, r59
	dep.z r22 = r56, 24, 8
	;;
	.mii
	xor r53 = r53, r26
	dep.z r18 = r36, 24, 8
	xor r21 = r25, r54
	.mmi
	xor r19 = r22, r29
	xor r88 = r88, r27
	dep.z r9 = r35, 24, 8
	;;
	.mmi
	xor r3 = r18, r11
	xor r2 = r9, r8
	xor r90 = r90, r21
	.mmi
	xor r91 = r91, r19
	;;
	xor r93 = r93, r3
	xor r94 = r94, r2
.L13:
	.mii
	nop 0
	shr.u r78 = r108, 1
	cmp4.lt p8, p9 = 0, r108
	.bbb
	nop 0
	nop 0
	(p9) br.cond.dpnt .L49
	;;
	.mmi
	and r77 = 88, r78
	;;
	adds r76 = -1, r77
	nop 0
	;;
	.mib
	nop 0
	mov ar.lc = r76
	nop 0
.L76:
	.mii
	nop 0
	mix4.r r15 = r93, r93
	mix4.r r110 = r91, r91
	.mmb
	add r69 = r55, r53
	add r36 = r51, r89
	nop 0
	.mii
	nop 0
	mix4.r r14 = r97, r97
	mix4.r r109 = r95, r95
	.mmb
	add r18 = r45, r95
	add r23 = r43, r97
	nop 0
	.mii
	nop 0
	mix4.r r37 = r89, r89
	mix4.r r10 = r53, r53
	.mmb
	add r60 = r49, r91
	add r31 = r47, r93
	nop 0
	;;
	.mii
	nop 0
	shr.u r78 = r110, 25
	mix4.r r3 = r98, r98
	.mmb
	add r30 = r41, r99
	add r66 = r39, r101
	nop 0
	.mii
	nop 0
	mix4.r r107 = r96, r96
	mix4.r r106 = r90, r90
	.mmb
	add r8 = r52, r88
	add r35 = r50, r90
	nop 0
	;;
	.mii
	xor r59 = r30, r78
	mix4.r r105 = r88, r88
	mix4.r r87 = r101, r101
	.mmb
	add r65 = r44, r96
	add r111 = r42, r98
	nop 0
	.mmi
	add r54 = r48, r92
	add r2 = r46, r94
	mix4.r r28 = r99, r99
	.mmi
	add r9 = r40, r100
	add r27 = r38, r102
	mix4.r r84 = r102, r102
	.mii
	nop 0
	mix4.r r83 = r100, r100
	mix4.r r82 = r94, r94
	;;
	.mii
	nop 0
	shr.u r75 = r87, 25
	mix4.r r81 = r92, r92
	.mii
	nop 0
	shr.u r77 = r15, 25
	shr.u r79 = r14, 25
	;;
	.mii
	xor r62 = r31, r75
	shr.u r80 = r109, 25
	shr.u r85 = r37, 25
	.mmi
	xor r20 = r66, r77
	xor r68 = r36, r79
	shr.u r86 = r10, 25
	.mib
	nop 0
	shr.u r11 = r3, 25
	nop 0
	;;
	.mii
	xor r16 = r23, r85
	shr.u r72 = r107, 25
	shr.u r73 = r106, 25
	.mmb
	xor r29 = r18, r86
	xor r61 = r69, r80
	nop 0
	.mii
	nop 0
	shr.u r74 = r105, 25
	shr.u r76 = r28, 25
	.mmb
	nop 0
	xor r106 = r35, r11
	nop 0
	;;
	.mmi
	xor r64 = r111, r73
	xor r19 = r60, r76
	shr.u r22 = r84, 25
	.mmi
	xor r57 = r65, r74
	xor r87 = r8, r72
	shr.u r70 = r83, 25
	.mii
	nop 0
	shr.u r71 = r82, 25
	shr.u r21 = r81, 25
	;;
	.mmi
	xor r15 = r2, r22
	xor r14 = r27, r71
	mix4.r r56 = r68, r68
	.mmi
	xor r37 = r54, r70
	xor r3 = r9, r21
	mix4.r r104 = r16, r16
	.mii
	nop 0
	mix4.r r26 = r61, r61
	mix4.r r67 = r29, r29
	.mmb
	add r22 = r23, r29
	add r71 = r66, r59
	nop 0
	;;
	.mii
	add r29 = r54, r15
	mix4.r r63 = r64, r64
	mix4.r r24 = r62, r62
	.mmb
	add r23 = r18, r16
	add r21 = r27, r3
	nop 0
	.mii
	nop 0
	mix4.r r25 = r20, r20
	mix4.r r108 = r19, r19
	.mmb
	add r18 = r36, r61
	add r16 = r2, r37
	nop 0
	.mii
	nop 0
	mix4.r r58 = r59, r59
	mix4.r r17 = r57, r57
	.mmb
	add r36 = r69, r68
	add r59 = r35, r87
	nop 0
	;;
	.mii
	nop 0
	shr.u r72 = r24, 21
	mix4.r r110 = r15, r15
	.mmi
	add r61 = r9, r14
	add r35 = r8, r106
	mix4.r r109 = r14, r14
	.mii
	nop 0
	mix4.r r10 = r37, r37
	mix4.r r107 = r3, r3
	.mib
	nop 0
	mix4.r r105 = r106, r106
	nop 0
	;;
	.mii
	nop 0
	shr.u r11 = r110, 21
	mix4.r r28 = r87, r87
	.mii
	xor r87 = r36, r72
	shr.u r80 = r56, 21
	shr.u r82 = r104, 21
	.mii
	add r104 = r31, r19
	shr.u r84 = r26, 21
	shr.u r86 = r67, 21
	.mmb
	add r26 = r30, r20
	add r67 = r60, r62
	nop 0
	;;
	.mii
	xor r106 = r35, r11
	shr.u r81 = r63, 21
	shr.u r74 = r25, 21
	.mmb
	add r60 = r111, r57
	add r111 = r65, r64
	nop 0
	.mii
	nop 0
	shr.u r76 = r108, 21
	shr.u r78 = r58, 21
	.mmb
	xor r68 = r71, r86
	xor r19 = r104, r84
	nop 0
	;;
	.mii
	xor r64 = r61, r81
	shr.u r85 = r17, 21
	shr.u r73 = r109, 21
	.mmb
	xor r62 = r26, r82
	xor r31 = r67, r80
	nop 0
	.mmi
	xor r14 = r22, r78
	xor r2 = r18, r76
	shr.u r75 = r10, 21
	.mmi
	xor r17 = r23, r74
	add r11 = r21, r68
	shr.u r77 = r107, 21
	;;
	.mmi
	xor r70 = r21, r85
	xor r15 = r60, r77
	shr.u r79 = r105, 21
	.mmi
	xor r27 = r59, r75
	xor r58 = r111, r73
	shr.u r83 = r28, 21
	;;
	.mii
	xor r66 = r29, r79
	mix4.r r56 = r68, r68
	mix4.r r65 = r31, r31
	.mmb
	xor r20 = r16, r83
	add r21 = r71, r70
	nop 0
	.mii
	nop 0
	mix4.r r63 = r64, r64
	mix4.r r24 = r62, r62
	.mmb
	add r72 = r111, r17
	add r71 = r23, r58
	nop 0
	.mii
	nop 0
	mix4.r r69 = r70, r70
	mix4.r r108 = r19, r19
	.mmb
	add r70 = r29, r31
	add r74 = r35, r87
	nop 0
	;;
	.mii
	nop 0
	shr.u r84 = r65, 25
	mix4.r r30 = r66, r66
	.mii
	add r73 = r36, r106
	mix4.r r25 = r20, r20
	mix4.r r57 = r58, r58
	.mii
	nop 0
	mix4.r r8 = r17, r17
	mix4.r r9 = r27, r27
	;;
	.mii
	nop 0
	shr.u r83 = r30, 25
	mix4.r r54 = r2, r2
	.mii
	nop 0
	mix4.r r110 = r15, r15
	mix4.r r109 = r14, r14
	.mii
	nop 0
	mix4.r r105 = r106, r106
	mix4.r r28 = r87, r87
	;;
	.mii
	nop 0
	shr.u r80 = r54, 25
	shr.u r10 = r69, 25
	.mii
	add r69 = r67, r66
	shr.u r37 = r56, 25
	shr.u r85 = r63, 25
	.mmb
	add r56 = r16, r19
	add r16 = r104, r20
	nop 0
	.mmb
	add r19 = r60, r14
	add r104 = r61, r62
	nop 0
	.mmi
	add r20 = r59, r2
	add r61 = r26, r64
	shr.u r86 = r24, 25
	;;
	.mii
	xor r68 = r16, r10
	shr.u r107 = r25, 25
	shr.u r3 = r108, 25
	.mmb
	add r25 = r18, r27
	add r108 = r22, r15
	nop 0
	.mii
	nop 0
	shr.u r79 = r9, 25
	shr.u r81 = r110, 25
	.mmb
	xor r29 = r56, r37
	xor r35 = r69, r85
	nop 0
	;;
	.mmi
	xor r17 = r21, r107
	xor r27 = r11, r3
	shr.u r82 = r109, 25
	.mmi
	xor r37 = r70, r86
	xor r14 = r104, r84
	shr.u r77 = r57, 25
	.mmi
	xor r15 = r61, r83
	xor r64 = r25, r81
	shr.u r78 = r8, 25
	.mmi
	xor r31 = r19, r80
	xor r66 = r108, r79
	shr.u r75 = r105, 25
	;;
	.mmi
	xor r111 = r73, r77
	xor r62 = r20, r82
	shr.u r76 = r28, 25
	.mmi
	xor r58 = r74, r78
	xor r60 = r71, r75
	mix4.r r26 = r68, r68
	;;
	.mii
	xor r59 = r72, r76
	mix4.r r67 = r29, r29
	mix4.r r8 = r17, r17
	.mmb
	add r52 = r74, r62
	add r55 = r73, r64
	nop 0
	.mii
	nop 0
	mix4.r r30 = r66, r66
	mix4.r r65 = r31, r31
	.mmb
	add r44 = r72, r31
	add r45 = r71, r66
	nop 0
	;;
	.mii
	add r42 = r19, r59
	mix4.r r63 = r64, r64
	mix4.r r24 = r62, r62
	.mmb
	add r48 = r70, r29
	add r49 = r69, r68
	nop 0
	.mii
	nop 0
	mix4.r r22 = r60, r60
	mix4.r r18 = r59, r59
	.mmb
	add r40 = r104, r27
	add r41 = r61, r17
	nop 0
	.mii
	nop 0
	mix4.r r23 = r111, r111
	mix4.r r57 = r58, r58
	.mmb
	add r50 = r20, r58
	add r51 = r25, r111
	nop 0
	;;
	.mii
	nop 0
	shr.u r2 = r24, 21
	mix4.r r9 = r27, r27
	.mmb
	add r43 = r108, r60
	add r46 = r56, r37
	nop 0
	.mii
	add r47 = r16, r35
	mix4.r r110 = r15, r15
	mix4.r r109 = r14, r14
	.mmb
	add r38 = r11, r14
	add r39 = r21, r15
	nop 0
	;;
	.mii
	xor r91 = r48, r2
	mix4.r r36 = r35, r35
	mix4.r r10 = r37, r37
	.mii
	nop 0
	shr.u r105 = r26, 21
	shr.u r106 = r67, 21
	.mii
	nop 0
	shr.u r107 = r30, 21
	shr.u r3 = r65, 21
	;;
	.mii
	nop 0
	shr.u r82 = r10, 21
	shr.u r54 = r63, 21
	.mmb
	xor r99 = r40, r3
	xor r100 = r41, r107
	nop 0
	.mii
	nop 0
	shr.u r83 = r22, 21
	shr.u r84 = r18, 21
	.mmi
	xor r53 = r52, r106
	xor r88 = r55, r105
	shr.u r85 = r23, 21
	.mib
	nop 0
	shr.u r86 = r57, 21
	nop 0
	;;
	.mmi
	xor r101 = r38, r84
	xor r92 = r49, r54
	shr.u r28 = r8, 21
	.mmi
	xor r93 = r46, r86
	xor r94 = r47, r85
	shr.u r87 = r9, 21
	.mii
	nop 0
	shr.u r79 = r110, 21
	shr.u r80 = r109, 21
	.mmi
	xor r102 = r39, r83
	xor r89 = r50, r82
	shr.u r81 = r36, 21
	;;
	.mmi
	xor r95 = r44, r87
	xor r96 = r45, r28
	xor r90 = r51, r81
	.mmb
	xor r97 = r42, r80
	xor r98 = r43, r79
	br.cloop.sptk.few .L76
.L49:
	.mib
	nop 0
	cmp.ge p10, p11 = 31, r34
	(p11) br.cond.dptk .L4
.L3:
	.mfi
	cmp.lt p14, p15 = 0, r34
	nop 0
	cmp.gt p12, p13 = r0, r34
	.mfb
	mov r19 = r0
	nop 0
	(p12) br.cond.dpnt .L20
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
	add r9 = r33, r16
	adds r19 = 1, r19
	add r54 = r12, r16
	;;
	.mii
	ld1 r2 = [r9]
	sxt4 r16 = r19
	;;
	nop 0
	.mmb
	st1 [r54] = r2
	cmp.gt p8, p9 = r34, r16
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
	sub r27 = 32, r19
	.mmb
	st1 [r33] = r34
	cmp4.ge p10, p11 = 31, r19
	(p11) br.cond.dpnt .L53
	;;
	.mib
	and r14 = 3, r27
	cmp4.le p12, p13 = 32, r15
	(p13) br.cond.dpnt .L77
.L57:
	.mii
	nop 0
	sxt4 r59 = r19
	adds r19 = 1, r19
	;;
	.mfi
	add r58 = r12, r59
	nop 0
	cmp4.ge p12, p13 = 31, r19
	;;
	.mfb
	st1 [r58] = r0
	nop 0
	(p13) br.cond.dptk .L53
.L56:
	.mii
	nop 0
	sub r20 = 32, r19
	;;
	extr.u r25 = r20, 2, 30
	;;
	.mmi
	adds r108 = -1, r25
	;;
	nop 0
	mov ar.lc = r108
.L74:
	.mmb
	adds r67 = 1, r19
	adds r66 = 2, r19
	nop 0
	.mii
	adds r31 = 3, r19
	sxt4 r30 = r19
	adds r19 = 4, r19
	;;
	.mii
	nop 0
	sxt4 r60 = r67
	sxt4 r111 = r66
	.mii
	add r65 = r12, r30
	nop 0
	sxt4 r64 = r31
	.mmi
	nop 0
	;;
	add r63 = r12, r60
	add r62 = r12, r111
	.mmb
	add r24 = r12, r64
	st1 [r65] = r0
	nop 0
	;;
	.mmb
	st1 [r63] = r0
	st1 [r62] = r0
	nop 0
	.mfb
	st1 [r24] = r0
	nop 0
	br.cloop.sptk.few .L74
.L53:
	.mib
	mov r33 = r12
	addl r34 = 31, r0
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
	(p11) sxt4 r35 = r19
	(p11) mov r19 = r15
	;;
	.mii
	nop 0
	sxt4 r57 = r19
	(p11) add r8 = r12, r35
	.mmi
	adds r19 = 1, r19
	;;
	add r17 = r12, r57
	nop 0
	.mii
	(p11) st1 [r8] = r0
	nop 0
	;;
	nop 0
	.mfb
	st1 [r17] = r0
	nop 0
	br .L57
.L20:
	.mmi
	cmp.ne p14, p15 = -1, r34
	mov r14 = r32
	adds r23 = 4, r32
	.mmi
	adds r19 = 6, r32
	adds r104 = 8, r32
	adds r30 = 9, r32
	;;
	.mmi
	(p15) xor r38 = 1, r38
	(p15) addl r108 = 160, r0
	(p15) addl r34 = -2, r0
	.mmb
	adds r105 = 12, r32
	adds r109 = 16, r32
	(p15) br.cond.dpnt .L13
	;;
	.mmb
	adds r38 = 27, r32
	st1 [r14] = r53, 1
	nop 0
	.mii
	adds r10 = 20, r32
	extr.u r16 = r53, 8, 24
	adds r33 = 63, r32
	.mmi
	adds r20 = 2, r32
	adds r8 = 3, r32
	extr.u r26 = r88, 16, 16
	.mmi
	adds r15 = 5, r32
	adds r28 = 7, r32
	adds r55 = 10, r32
	;;
	.mmi
	st1 [r14] = r16
	adds r48 = 11, r32
	extr.u r29 = r89, 8, 24
	.mmi
	adds r106 = 13, r32
	adds r56 = 14, r32
	adds r108 = 15, r32
	.mib
	nop 0
	extr.u r24 = r53, 24, 8
	nop 0
	.mmi
	adds r110 = 17, r32
	adds r57 = 18, r32
	adds r9 = 19, r32
	;;
	.mmi
	st1 [r30] = r29
	adds r11 = 21, r32
	extr.u r27 = r88, 24, 8
	.mmi
	adds r58 = 22, r32
	adds r3 = 23, r32
	adds r35 = 24, r32
	.mmi
	adds r36 = 25, r32
	adds r59 = 26, r32
	extr.u r31 = r89, 24, 8
	.mmi
	adds r39 = 28, r32
	adds r40 = 29, r32
	adds r60 = 30, r32
	;;
	.mmi
	st1 [r35] = r93
	adds r51 = 31, r32
	extr.u r107 = r90, 24, 8
	.mmi
	adds r42 = 32, r32
	adds r43 = 33, r32
	adds r44 = 34, r32
	.mmi
	adds r45 = 35, r32
	adds r46 = 36, r32
	extr.u r111 = r91, 24, 8
	.mmi
	adds r47 = 37, r32
	adds r62 = 38, r32
	adds r50 = 39, r32
	;;
	.mmi
	st1 [r108] = r107
	adds r67 = 40, r32
	extr.u r2 = r92, 24, 8
	.mmi
	adds r64 = 41, r32
	adds r63 = 42, r32
	adds r65 = 43, r32
	.mmi
	adds r66 = 44, r32
	adds r34 = 45, r32
	extr.u r41 = r94, 24, 8
	.mmi
	adds r82 = 46, r32
	adds r69 = 47, r32
	adds r70 = 48, r32
	;;
	.mmb
	st1 [r3] = r2
	adds r71 = 49, r32
	nop 0
	.mmi
	adds r83 = 50, r32
	adds r73 = 51, r32
	extr.u r21 = r53, 16, 16
	.mmb
	adds r74 = 52, r32
	adds r75 = 53, r32
	nop 0
	.mii
	adds r84 = 54, r32
	extr.u r25 = r88, 8, 24
	adds r77 = 55, r32
	;;
	.mmi
	st1 [r20] = r21
	adds r78 = 56, r32
	adds r79 = 57, r32
	.mmi
	adds r85 = 58, r32
	adds r81 = 59, r32
	adds r53 = 60, r32
	.mmi
	adds r54 = 61, r32
	adds r86 = 62, r32
	extr.u r17 = r89, 16, 16
	.mmi
	st1 [r23] = r88
	st1 [r19] = r26
	extr.u r22 = r90, 8, 24
	.mmb
	st1 [r104] = r89
	st1 [r105] = r90
	nop 0
	;;
	.mfi
	st1 [r55] = r17
	nop 0
	extr.u r18 = r90, 16, 16
	.mmi
	st1 [r109] = r91
	nop 0
	extr.u r23 = r91, 8, 24
	.mmi
	st1 [r10] = r92
	st1 [r8] = r24
	mov r8 = r0
	.mib
	nop 0
	extr.u r19 = r91, 16, 16
	nop 0
	.mmf
	st1 [r48] = r31
	st1 [r39] = r94
	nop 0
	;;
	.mfi
	st1 [r110] = r23
	nop 0
	extr.u r16 = r92, 8, 24
	.mmi
	st1 [r51] = r41
	nop 0
	extr.u r104 = r92, 16, 16
	.mmb
	st1 [r42] = r95
	st1 [r15] = r25
	nop 0
	;;
	.mfi
	st1 [r11] = r16
	nop 0
	extr.u r37 = r93, 24, 8
	.mmi
	st1 [r28] = r27
	nop 0
	extr.u r61 = r95, 24, 8
	.mmb
	st1 [r106] = r22
	st1 [r56] = r18
	nop 0
	;;
	.mfi
	st1 [r38] = r37
	nop 0
	extr.u r26 = r93, 8, 24
	.mmi
	st1 [r57] = r19
	nop 0
	extr.u r29 = r93, 16, 16
	.mmb
	st1 [r9] = r111
	st1 [r58] = r104
	nop 0
	;;
	.mfi
	st1 [r36] = r26
	nop 0
	extr.u r32 = r94, 8, 24
	.mmi
	st1 [r59] = r29
	nop 0
	extr.u r92 = r94, 16, 16
	.mmi
	nop 0
	;;
	st1 [r40] = r32
	extr.u r91 = r95, 8, 24
	.mmi
	st1 [r60] = r92
	nop 0
	extr.u r90 = r95, 16, 16
	.mmi
	nop 0
	;;
	st1 [r43] = r91
	extr.u r49 = r96, 24, 8
	.mmi
	st1 [r44] = r90
	nop 0
	extr.u r52 = r97, 24, 8
	.mmb
	st1 [r45] = r61
	st1 [r46] = r96
	nop 0
	;;
	.mfi
	st1 [r50] = r49
	nop 0
	extr.u r68 = r98, 24, 8
	.mmi
	st1 [r67] = r97
	nop 0
	extr.u r72 = r99, 24, 8
	.mmb
	st1 [r65] = r52
	st1 [r66] = r98
	nop 0
	;;
	.mfi
	st1 [r69] = r68
	nop 0
	extr.u r76 = r100, 24, 8
	.mmi
	st1 [r70] = r99
	nop 0
	extr.u r80 = r101, 24, 8
	.mmb
	st1 [r73] = r72
	st1 [r74] = r100
	nop 0
	;;
	.mfi
	st1 [r77] = r76
	nop 0
	extr.u r87 = r102, 24, 8
	.mmi
	nop 0
	st1 [r78] = r101
	extr.u r89 = r96, 8, 24
	.mmi
	st1 [r81] = r80
	st1 [r53] = r102
	extr.u r48 = r96, 16, 16
	.mmi
	nop 0
	;;
	st1 [r33] = r87
	extr.u r51 = r97, 8, 24
	.mmi
	st1 [r47] = r89
	nop 0
	extr.u r88 = r97, 16, 16
	.mmi
	st1 [r62] = r48
	nop 0
	extr.u r55 = r98, 8, 24
	.mmi
	nop 0
	;;
	st1 [r63] = r88
	extr.u r46 = r98, 16, 16
	.mmi
	st1 [r64] = r51
	nop 0
	extr.u r45 = r99, 8, 24
	.mmi
	st1 [r34] = r55
	nop 0
	extr.u r44 = r99, 16, 16
	.mmi
	nop 0
	;;
	st1 [r71] = r45
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
	st1 [r75] = r43
	nop 0
	extr.u r39 = r102, 8, 24
	.mii
	st1 [r79] = r41
	extr.u r38 = r102, 16, 16
	;;
	nop 0
	.mmb
	st1 [r85] = r40
	st1 [r54] = r39
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
	.endp crypto_hash_cubehash1632_precompiled_ia64#
	.ident	"GCC: (GNU) 3.2.3 20030502 (Red Hat Linux 3.2.3-52)"
