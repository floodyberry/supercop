
reg256 freeze_c
reg256 freeze_r0
reg256 freeze_r1
reg256 freeze_r2
reg256 freeze_r3
reg256 freeze_r4
reg256 freeze_r5

enter gfe4x3limb_freeze

  freeze_r0 aligned= mem256[input_1 +   0]
#  freeze_r1 aligned= mem256[input_1 +  32]
  freeze_r2 aligned= mem256[input_1 +  64]
#  freeze_r3 aligned= mem256[input_1 +  96]
  freeze_r4 aligned= mem256[input_1 + 128]
#  freeze_r5 aligned= mem256[input_1 + 160]

  4x freeze_c = approx freeze_r0 * mem256[_2pm43]
  4x freeze_c = round(freeze_c)
  4x freeze_c approx*= mem256[_2p43]
  4x freeze_r2 approx+= freeze_c
  4x freeze_r0 approx-= freeze_c

  4x freeze_c = approx freeze_r2 * mem256[_2pm85]
  4x freeze_c = round(freeze_c)
  4x freeze_c approx*= mem256[_2p85]
  4x freeze_r4 approx+= freeze_c
  4x freeze_r2 approx-= freeze_c

  4x freeze_c = approx freeze_r4 * mem256[_2pm127]
  4x freeze_c = round(freeze_c)
  4x freeze_r0 approx+= freeze_c
  4x freeze_c approx*= mem256[_2p127]
  4x freeze_r4 approx-= freeze_c


  4x freeze_r0 approx+= mem256[_2p44m2]
  4x freeze_c = approx freeze_r0 * mem256[_2pm43]
  4x freeze_c = trunc(freeze_c)
  4x freeze_c approx*= mem256[_2p43]
  4x freeze_r2 approx+= freeze_c
  4x freeze_r0 approx-= freeze_c

  4x freeze_r2 approx+= mem256[_2p86m2p44]
  4x freeze_c = approx freeze_r2 * mem256[_2pm85]
  4x freeze_c = trunc(freeze_c)
  4x freeze_c approx*= mem256[_2p85]
  4x freeze_r4 approx+= freeze_c
  4x freeze_r2 approx-= freeze_c

  4x freeze_r4 approx+= mem256[_2p128m2p86]
  4x freeze_c = approx freeze_r4 * mem256[_2pm127]
  4x freeze_c = trunc(freeze_c)
  4x freeze_r0 approx+= freeze_c
  4x freeze_c approx*= mem256[_2p127]
  4x freeze_r4 approx-= freeze_c


  4x freeze_c = approx freeze_r0 * mem256[_2pm43]
  4x freeze_c = trunc(freeze_c)
  4x freeze_c approx*= mem256[_2p43]
  4x freeze_r2 approx+= freeze_c
  4x freeze_r0 approx-= freeze_c

  4x freeze_c = approx freeze_r2 * mem256[_2pm85]
  4x freeze_c = trunc(freeze_c)
  4x freeze_c approx*= mem256[_2p85]
  4x freeze_r4 approx+= freeze_c
  4x freeze_r2 approx-= freeze_c

  4x freeze_c = approx freeze_r4 * mem256[_2pm127]
  4x freeze_c = trunc(freeze_c)
  4x freeze_r0 approx+= freeze_c
  4x freeze_c approx*= mem256[_2p127]
  4x freeze_r4 approx-= freeze_c

  4x freeze_r2 approx*= mem256[_2pm43]
  4x freeze_r4 approx*= mem256[_2pm85]

  mem256[input_0 +   0] aligned= freeze_r0
  mem256[input_0 +  64] aligned= freeze_r2
  mem256[input_0 + 128] aligned= freeze_r4

return
