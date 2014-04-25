reg256 r0
reg256 r1
reg256 r2
reg256 r3
reg256 r4
reg256 r5

reg256 s

enter gfe4x_znegate

s aligned= mem256[minusz]

4x r0 = approx s * mem256[input_0 + 0]
4x r1 = approx s * mem256[input_0 + 32]
4x r2 = approx s * mem256[input_0 + 64]
4x r3 = approx s * mem256[input_0 + 96]
4x r4 = approx s * mem256[input_0 + 128]
4x r5 = approx s * mem256[input_0 + 160]

mem256[input_0 +   0] aligned= r0
mem256[input_0 +  32] aligned= r1
mem256[input_0 +  64] aligned= r2
mem256[input_0 +  96] aligned= r3
mem256[input_0 + 128] aligned= r4
mem256[input_0 + 160] aligned= r5

return
