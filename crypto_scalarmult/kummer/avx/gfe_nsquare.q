stack64 stack_r11

int64 x0
int64 x1

int64 r0
int64 r1
int64 r2
int64 r3

int64 rax
int64 rdx

int64 t

int64 mask

int64 count

enter gfe_nsquare

  stack_r11 = caller_r11

  count = input_2
  x0 = mem64[input_1 + 0]
  x1 = mem64[input_1 + 8]
  mask = mem64[mask63]

loop:

  rax = x0
  (uint128) rdx rax = rax * x0
  r0 = rax
  r1 = rdx
  
  rax = x1
  (uint128) rdx rax = rax * x0
  carry? r1 += rax
  r2 = 0
  r2 += rdx + carry
  carry? r1 += rax
  r2 += rdx + carry

  rax = x1
  (uint128) rdx rax = rax * x1
  carry? r2 += rax
  rdx += 0 + carry

  rdx = (rdx.r2) << 1
  r2 = (r2.r1) << 1
  
  r1 &= mask
  carry? r0 += r2
  r1 += rdx + carry

  t = r1
  (uint64) t >>= 63
  r1 &= mask

  carry? r0 += t
  r1 += 0 + carry

  x0 = r0
  x1 = r1

             unsigned>? count -= 1
goto loop if unsigned>
 
  mem64[input_0 + 0] = x0
  mem64[input_0 + 8] = x1

  caller_r11 = stack_r11

return
