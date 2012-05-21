/**
 * 8-bit implementation of Groestl-256 for Atmel AVRs
 *
 * Author: Johannes Feichtner
 * Email: johannes.feichtner@student.tugraz.at
 */

; 16-bit registers
#define XL r26
#define XH r27
#define YL r28
#define YH r29
#define ZL r30
#define ZH r31

; Argument registers for function calls
#define ARG1_L r24
#define ARG2_L r22
#define ARG3_L r20
#define ARG3_H r21

; Only crypto_hash_groestl256_avr8asm_lowram192b is callable externally
.global crypto_hash_groestl256_avr8asm_lowram192b

.text

/**
 * push_registers macro:
 *
 * Pushes a given range of registers in ascending order
 * To be called like: push_registers 0,15
 */
.macro push_registers from:req, to:req
  push \from
  .if \to-\from
    push_registers "(\from+1)",\to
  .endif
.endm

/**
 * pop_registers macro:
 *
 * Pops a given range of registers in descending order
 * To be called like: pop_registers 0,15
 */
.macro pop_registers from:req, to:req
  pop \to
  .if \to-\from
    pop_registers \from,"(\to-1)"
  .endif
.endm

/**
 * permQ_Iteration macro:
 *
 * Performs the permQ iteration for one round
 */
.macro permQ_Iteration
  ldd r0, Y+8  ; r0 = read[8] ^ 0xFF;
  com r0
  ldd r1, Y+25 ; r1 = read[25] ^ 0xFF;
  com r1
  ldd r2, Y+42 ; r2 = read[42] ^ 0xFF;
  com r2
  ldd r3, Y+59 ; r3 = read[59] ^ 0xFF;
  com r3
  ldd r4, Y+4  ; r4 = read[4] ^ 0xFF;
  com r4
  ldd r5, Y+21 ; r5 = read[21] ^ 0xFF;
  com r5
  ldd r6, Y+38 ; r6 = read[38] ^ 0xFF;
  com r6
  ldd r7, Y+55 ; r7 = read[55] ^ 0x9F ^ round;
  ldi ZL, 0x9f
  eor r7, ZL
  eor r7, r19
  rcall mixBytes

  ldd r0, Y+16 ; r0 = read[16] ^ 0xFF;
  com r0
  ldd r1, Y+33 ; r1 = read[33] ^ 0xFF;
  com r1
  ldd r2, Y+50 ; r2 = read[50] ^ 0xFF;
  com r2
  ldd r3, Y+3  ; r3 = read[3] ^ 0xFF;
  com r3
  ldd r4, Y+12 ; r4 = read[12] ^ 0xFF;
  com r4
  ldd r5, Y+29 ; r5 = read[29] ^ 0xFF;
  com r5
  ldd r6, Y+46 ; r6 = read[46] ^ 0xFF;
  com r6
  ldd r7, Y+63 ; r7 = read[63] ^ 0x8F ^ round;
  ldi ZL, 0x8f
  eor r7, ZL
  eor r7, r19
  rcall mixBytes

  ldd r0, Y+24 ; r0 = read[24] ^ 0xFF;
  com r0
  ldd r1, Y+41 ; r1 = read[41] ^ 0xFF;
  com r1
  ldd r2, Y+58 ; r2 = read[58] ^ 0xFF;
  com r2
  ldd r3, Y+11 ; r3 = read[11] ^ 0xFF;
  com r3
  ldd r4, Y+20 ; r4 = read[20] ^ 0xFF;
  com r4
  ldd r5, Y+37 ; r5 = read[37] ^ 0xFF;
  com r5
  ldd r6, Y+54 ; r6 = read[54] ^ 0xFF;
  com r6
  ldd r7, Y+7  ; r7 = read[7] ^ 0xFF ^ round;
  com r7
  eor r7, r19
  rcall mixBytes

  ldd r0, Y+32 ; r0 = read[32] ^ 0xFF;
  com r0
  ldd r1, Y+49 ; r1 = read[49] ^ 0xFF;
  com r1
  ldd r2, Y+2  ; r2 = read[2] ^ 0xFF;
  com r2
  ldd r3, Y+19 ; r3 = read[19] ^ 0xFF;
  com r3
  ldd r4, Y+28 ; r4 = read[28] ^ 0xFF;
  com r4
  ldd r5, Y+45 ; r5 = read[45] ^ 0xFF;
  com r5
  ldd r6, Y+62 ; r6 = read[62] ^ 0xFF;
  com r6
  ldd r7, Y+15 ; r7 = read[15] ^ 0xEF ^ round;
  ldi ZL, 0xef
  eor r7, ZL
  eor r7, r19
  rcall mixBytes

  ldd r0, Y+40 ; r0 = read[40] ^ 0xFF;
  com r0
  ldd r1, Y+57 ; r1 = read[57] ^ 0xFF;
  com r1
  ldd r2, Y+10 ; r2 = read[10] ^ 0xFF;
  com r2
  ldd r3, Y+27 ; r3 = read[27] ^ 0xFF;
  com r3
  ldd r4, Y+36 ; r4 = read[36] ^ 0xFF;
  com r4
  ldd r5, Y+53 ; r5 = read[53] ^ 0xFF;
  com r5
  ldd r6, Y+6  ; r6 = read[6] ^ 0xFF;
  com r6
  ldd r7, Y+23 ; r7 = read[23] ^ 0xDF ^ round;
  ldi ZL, 0xdf
  eor r7, ZL
  eor r7, r19
  rcall mixBytes

  ldd r0, Y+48 ; r0 = read[48] ^ 0xFF;
  com r0
  ldd r1, Y+1  ; r1 = read[1] ^ 0xFF;
  com r1
  ldd r2, Y+18 ; r2 = read[18] ^ 0xFF;
  com r2
  ldd r3, Y+35 ; r3 = read[35] ^ 0xFF;
  com r3
  ldd r4, Y+44 ; r4 = read[44] ^ 0xFF;
  com r4
  ldd r5, Y+61 ; r5 = read[61] ^ 0xFF;
  com r5
  ldd r6, Y+14 ; r6 = read[14] ^ 0xFF;
  com r6
  ldd r7, Y+31 ; r7 = read[31] ^ 0xCF ^ round;
  ldi ZL, 0xcf
  eor r7, ZL
  eor r7, r19
  rcall mixBytes

  ldd r0, Y+56 ; r0 = read[56] ^ 0xFF;
  com r0
  ldd r1, Y+9  ; r1 = read[9] ^ 0xFF;
  com r1
  ldd r2, Y+26 ; r2 = read[26] ^ 0xFF;
  com r2
  ldd r3, Y+43 ; r3 = read[43] ^ 0xFF;
  com r3
  ldd r4, Y+52 ; r4 = read[52] ^ 0xFF;
  com r4
  ldd r5, Y+5  ; r5 = read[5] ^ 0xFF;
  com r5
  ldd r6, Y+22 ; r6 = read[22] ^ 0xFF;
  com r6
  ldd r7, Y+39 ; r7 = read[39] ^ 0xBF ^ round;
  ldi ZL, 0xbf
  eor r7, ZL
  eor r7, r19
  rcall mixBytes

  ld r0, Y     ; r0 = read[0] ^ 0xFF;
  com r0
  ldd r1, Y+17 ; r1 = read[17] ^ 0xFF;
  com r1
  ldd r2, Y+34 ; r2 = read[34] ^ 0xFF;
  com r2
  ldd r3, Y+51 ; r3 = read[51] ^ 0xFF;
  com r3
  ldd r4, Y+60 ; r4 = read[60] ^ 0xFF;
  com r4
  ldd r5, Y+13 ; r5 = read[13] ^ 0xFF;
  com r5
  ldd r6, Y+30 ; r6 = read[30] ^ 0xFF;
  com r6
  ldd r7, Y+47 ; r7 = read[47] ^ 0xAF ^ round;
  ldi ZL, 0xaf
  eor r7, ZL
  eor r7, r19
  rcall mixBytes

  ; The temp_state pointer reaches the end, so it's reset:
  subi XL, 64
  sbci XH, 0

  ; After each round, Y and X need to be swapped. This is done using
  ; the XOR swap algorithm in order to evade a temporary variable.
  eor YL, XL
  eor XL, YL
  eor YL, XL
.endm

/**
 * permP_Iteration macro:
 *
 * Performs the permQ iteration for one round
 */
.macro permP_Iteration
  ld r0, Y     ; r0 = read[0] ^ round;
  eor r0, r19
  ldd r1, Y+9  ; r1 = read[9];
  ldd r2, Y+18 ; r2 = read[18];
  ldd r3, Y+27 ; r3 = read[27];
  ldd r4, Y+36 ; r4 = read[36];
  ldd r5, Y+45 ; r5 = read[45];
  ldd r6, Y+54 ; r6 = read[54];
  ldd r7, Y+63 ; r7 = read[63];
  rcall mixBytes

  ldd r0, Y+8  ; r0 = read[8] ^ 0x10 ^ round;
  ldi ZL, 0x10
  eor r0, ZL
  eor r0, r19
  ldd r1, Y+17 ; r1 = read[17];
  ldd r2, Y+26 ; r2 = read[26];
  ldd r3, Y+35 ; r3 = read[35];
  ldd r4, Y+44 ; r4 = read[44];
  ldd r5, Y+53 ; r5 = read[53];
  ldd r6, Y+62 ; r6 = read[62];
  ldd r7, Y+7  ; r7 = read[7];
  rcall mixBytes

  ldd r0, Y+16 ; r0 = read[16] ^ 0x20 ^ round;
  ldi ZL, 0x20
  eor r0, ZL
  eor r0, r19
  ldd r1, Y+25 ; r1 = read[25];
  ldd r2, Y+34 ; r2 = read[34];
  ldd r3, Y+43 ; r3 = read[43];
  ldd r4, Y+52 ; r4 = read[52];
  ldd r5, Y+61 ; r5 = read[61];
  ldd r6, Y+6  ; r6 = read[6];
  ldd r7, Y+15 ; r7 = read[15];
  rcall mixBytes

  ldd r0, Y+24 ; r0 = read[24] ^ 0x30 ^ round;
  ldi ZL, 0x30
  eor r0, ZL
  eor r0, r19
  ldd r1, Y+33 ; r1 = read[33];
  ldd r2, Y+42 ; r2 = read[42];
  ldd r3, Y+51 ; r3 = read[51];
  ldd r4, Y+60 ; r4 = read[60];
  ldd r5, Y+5  ; r5 = read[5];
  ldd r6, Y+14 ; r6 = read[14];
  ldd r7, Y+23 ; r7 = read[23];
  rcall mixBytes

  ldd r0, Y+32  ; r0 = read[32] ^ 0x40 ^ round;
  ldi ZL, 0x40
  eor r0, ZL
  eor r0, r19
  ldd r1, Y+41 ; r1 = read[41];
  ldd r2, Y+50 ; r2 = read[50];
  ldd r3, Y+59 ; r3 = read[59];
  ldd r4, Y+4  ; r4 = read[4];
  ldd r5, Y+13 ; r5 = read[13];
  ldd r6, Y+22 ; r6 = read[22];
  ldd r7, Y+31 ; r7 = read[31];
  rcall mixBytes

  ldd r0, Y+40 ; r0 = read[40] ^ 0x50 ^ round;
  ldi ZL, 0x50
  eor r0, ZL
  eor r0, r19
  ldd r1, Y+49 ; r1 = read[49];
  ldd r2, Y+58 ; r2 = read[58];
  ldd r3, Y+3  ; r3 = read[3];
  ldd r4, Y+12 ; r4 = read[12];
  ldd r5, Y+21 ; r5 = read[21];
  ldd r6, Y+30 ; r6 = read[30];
  ldd r7, Y+39 ; r7 = read[39];
  rcall mixBytes

  ldd r0, Y+48 ; r0 = read[48] ^ 0x60 ^ round;
  ldi ZL, 0x60
  eor r0, ZL
  eor r0, r19
  ldd r1, Y+57 ; r1 = read[57];
  ldd r2, Y+2  ; r2 = read[2];
  ldd r3, Y+11 ; r3 = read[11];
  ldd r4, Y+20 ; r4 = read[20];
  ldd r5, Y+29 ; r5 = read[29];
  ldd r6, Y+38 ; r6 = read[38];
  ldd r7, Y+47 ; r7 = read[47];
  rcall mixBytes

  ldd r0, Y+56  ; r0 = read[56] ^ 0x70 ^ round;
  ldi ZL, 0x70
  eor r0, ZL
  eor r0, r19
  ldd r1, Y+1  ; r1 = read[1];
  ldd r2, Y+10 ; r2 = read[10];
  ldd r3, Y+19 ; r3 = read[19];
  ldd r4, Y+28 ; r4 = read[28];
  ldd r5, Y+37 ; r5 = read[37];
  ldd r6, Y+46 ; r6 = read[46];
  ldd r7, Y+55 ; r7 = read[55];
  rcall mixBytes

  ; The temp_state pointer reaches the end, so it's reset:
  subi XL, 64
  sbci XH, 0

  ; After each round, Y and X need to be swapped. This is done using
  ; the XOR swap algorithm in order to evade a temporary variable.
  eor YL, XL
  eor XL, YL
  eor YL, XL
.endm

/**
 * mixBytes:
 *
 * Handed-over registers:
 * r0-r7: input values
 * r17: irreducible polynomial
 * Z: sbox
 *
 * Used registers:
 * r8-r15: temporary buffer
 * Z: pointer for sbox, temporary variable
 */
mixBytes:
  ; First do the subBytes operation
  mov ZL, r0
  lpm r0, Z
  mov ZL, r1
  lpm r1, Z
  mov ZL, r2
  lpm r2, Z
  mov ZL, r3
  lpm r3, Z
  mov ZL, r4
  lpm r4, Z
  mov ZL, r5
  lpm r5, Z
  mov ZL, r6
  lpm r6, Z
  mov ZL, r7
  lpm r7, Z

  mov r8, r0  ; t0 = i0 ^ i1;
  eor r8, r1
  mov r9, r1  ; t1 = i1 ^ i2;
  eor r9, r2
  mov r10, r2 ; t2 = i2 ^ i3;
  eor r10, r3
  mov r11, r3 ; t3 = i3 ^ i4;
  eor r11, r4
  mov r12, r4 ; t4 = i4 ^ i5;
  eor r12, r5
  mov r13, r5 ; t5 = i5 ^ i6;
  eor r13, r6
  mov r14, r6 ; t6 = i6 ^ i7;
  eor r14, r7
  mov r15, r7 ; t7 = i7 ^ i0;
  eor r15, r0

  eor r6, r8  ; y0 = t0 ^ t2 ^ i6;
  eor r6, r10
  eor r7, r9  ; y1 = t1 ^ t3 ^ i7;
  eor r7, r11
  eor r0, r10 ; y2 = t2 ^ t4 ^ i0;
  eor r0, r12
  eor r1, r11 ; y3 = t3 ^ t5 ^ i1;
  eor r1, r13
  eor r2, r12 ; y4 = t4 ^ t6 ^ i2;
  eor r2, r14
  eor r3, r13 ; y5 = t5 ^ t7 ^ i3;
  eor r3, r15
  eor r4, r14 ; y6 = t6 ^ t0 ^ i4;
  eor r4, r8
  eor r5, r15 ; y7 = t7 ^ t1 ^ i5;
  eor r5, r9

  mov ZL, r8   ; i = t0;
  eor r8, r11  ; t0 ^= t3;
  eor r11, r14 ; t3 ^= t6;
  eor r14, r9  ; t6 ^= t1;
  eor r9, r12  ; t1 ^= t4;
  eor r12, r15 ; t4 ^= t7;
  eor r15, r10 ; t7 ^= t2;
  eor r10, r13 ; t2 ^= t5;
  eor r13, ZL  ; t5 ^= i;

  add r11, r11 ; output[0] = xtime(xtime(t3) ^ y7) ^ y4;
  brcc .+2
  eor r11, r17
  eor r11, r5
  add r11, r11
  brcc .+2
  eor r11, r17
  eor r11, r2
  st X+, r11

  add r12, r12 ; output[1] = xtime(xtime(t4) ^ y0) ^ y5;
  brcc .+2
  eor r12, r17
  eor r12, r6
  add r12, r12
  brcc .+2
  eor r12, r17
  eor r12, r3
  st X+, r12

  add r13, r13 ; output[2] = xtime(xtime(t5) ^ y1) ^ y6;
  brcc .+2
  eor r13, r17
  eor r13, r7
  add r13, r13
  brcc .+2
  eor r13, r17
  eor r13, r4
  st X+, r13

  add r14, r14 ; output[3] = xtime(xtime(t6) ^ y2) ^ y7;
  brcc .+2
  eor r14, r17
  eor r14, r0
  add r14, r14
  brcc .+2
  eor r14, r17
  eor r14, r5
  st X+, r14

  add r15, r15 ; output[4] = xtime(xtime(t7) ^ y3) ^ y0;
  brcc .+2
  eor r15, r17
  eor r15, r1
  add r15, r15
  brcc .+2
  eor r15, r17
  eor r15, r6
  st X+, r15

  add r8, r8   ; output[5] = xtime(xtime(t0) ^ y4) ^ y1;
  brcc .+2
  eor r8, r17
  eor r8, r2
  add r8, r8
  brcc .+2
  eor r8, r17
  eor r8, r7
  st X+, r8

  add r9, r9   ; output[6] = xtime(xtime(t1) ^ y5) ^ y2;
  brcc .+2
  eor r9, r17
  eor r9, r3
  add r9, r9
  brcc .+2
  eor r9, r17
  eor r9, r0
  st X+, r9

  add r10, r10 ; output[7] = xtime(xtime(t2) ^ y6) ^ y3;
  brcc .+2
  eor r10, r17
  eor r10, r4
  add r10, r10
  brcc .+2
  eor r10, r17
  eor r10, r1
  st X+, r10

  ret

/**
 * permP:
 *
 * Permutes P with input given in Y.
 *
 * Handed-over registers:
 * r17: irreducible polynomial
 * r19: permP loop/round counter
 * Y: holds the input and the output after execution (due to swapping)
 *
 * Used registers:
 * r0-r8: the input for mixBytes
 * X: temporary state matrix; not of further interest (temp_state)
 * Z: temporary variable and register for sbox lookups
 */
permP:
  ldi XH, hi8(temp_state)
  ldi XL, lo8(temp_state)
  ldi ZH, hi8(sbox)

  ; Note: the round counter in r19 starts with 0
  loop_permP:
    permP_Iteration

    ; Increment the round counter and abort after 10 rounds
    cpi r19, 9
    breq loop_permP_end

    inc r19
    rjmp loop_permP
  loop_permP_end:

  ret

/**
 * permQ:
 *
 * Permutes Q with input from buffer.
 * After execution, buffer also holds the desired output (due to swapping).
 *
 * Handed-over registers:
 * r17: irreducible polynomial
 * X: every time permQ is called, X already holds temp_state,
 *    so it doesn't need to be loaded in again
 * Z: pointer to sbox (already held due to the former permP execution)
 *
 * Used registers:
 * r0-r8: the input for mixBytes
 * r19: permQ loop/round counter
 * Y: buffer, holds the input and after execution the output
 * Z: temporary variable and register for sbox lookups
 */
permQ:
  ldi XH, hi8(temp_state)
  ldi XL, lo8(temp_state)
  ldi ZH, hi8(sbox)

  ldi r19, 0
  loop_permQ:
    permQ_Iteration

    ; Increment the round counter and abort after 10 rounds
    cpi r19, 9
    breq loop_permQ_end

    inc r19
    rjmp loop_permQ
  loop_permQ_end:

  ret

/**
 * crypto_hash_groestl256_avr8asm_lowram192b:
 *
 * Handed-over registers:
 * ARG1: pointer to output. Also used as temporary variable
 * ARG2: pointer to message text
 * ARG3: 64-bit message length (but only 16-bits are used)
 *
 * Used registers:
 * r0, r1, r2: used with temporary values
 * r16: padding block length (padded msg length - msg length)
 * r17: amount of blocks and irreducible polynomial
 * r18: amount of blocks (decremented within the loop)
 * r19: temporary register for loop comparison
 * X, Y, Z: holding buffer, h_state, p_state or temporary calculations
 */
crypto_hash_groestl256_avr8asm_lowram192b:
  ; Push all call-saved registers
  push_registers 0,17
  push YL
  push YH

  ; We've got a 64-bit message length starting in r14. For practical reasons
  ; only the first 16 bits are really used (r14, r15)
  movw ARG3_L, r14

  ; (Re-)set h_state
  ldi ZH, hi8(h_state)
  ldi ZL, lo8(h_state)
  ldi r16, 64
  ldi r17, 0
  loop_resetH:
    st Z+, r17
    dec r16
  brne loop_resetH

  ; Set byte 62 in h_state to 0x01
  sbiw ZL, 2
  ldi r16, 0x01
  st Z, r16

  ; Calculate the padded message length: (ARG3 + 8) / 64) * 64 + 64
  movw ZL, ARG3_L
  subi ZL, 0xF8
  sbci ZH, 0xFF
  andi ZL, 0xC0
  subi ZL, 0xC0
  sbci ZH, 0xFF

  ; Calculate the pad block length in r16
  movw YL, ZL
  sub YL, ARG3_L
  sbc YH, ARG3_H
  mov r16, YL

  ; Store the amount of needed blocks (padded_len >> 6) in r18
  ; and temporarily in r17 (because r18 is going to be decremented)
  ldi r18, 6
  loop_blockamount:
    lsr ZH
    ror ZL
    dec r18
  brne loop_blockamount
  mov r18, ZL

  ; r17 is only used once within the last block when padding is applied
  mov r17, ZL
  andi r17, 0xff ; (blocks & 0xFF)

  ; Temporary use ARG1_L as boolean flag which should indicate if the
  ; message has been read once (for permP) or twice (for permQ).
  push ARG1_L
  ldi ARG1_L, 0

  ; Now process each block
  loop_blocks:
    ; buffer is loaded to X here because it's needed in if, else-if and else
    ; Furthermore, all clauses need YL to be 64 so it's also set here
    ldi XH, hi8(buffer)
    ldi XL, lo8(buffer)
    ldi YL, 64

    ; Check if the remaining msg length (ARG3) is > 64
    ; Note: at this point r19 is always 0
    cpi ARG3_L, 65
    cpc ARG3_H, r19
    brlo loop_blocks_elsif

      ; Copy the next 64 bytes from ARG2 to buffer
      movw ZL, ARG2_L

      loop_blocks_if:
        ld r0, Z+
        st X+, r0
        dec YL
      brne loop_blocks_if

      ; Condition for permQ
      cpi ARG1_L, 1
      brlo loop_blocks_endif

        ; Save the pointer position for the next iteration
        movw ARG2_L, ZL

        ; Update the remaining message length
        subi ARG3_L, 64 ; message_left_len -= 64;
        sbci ARG3_H, 0

    rjmp loop_blocks_endif

    loop_blocks_elsif: ; part message, part padding block
      ; else if (message_left_len > 0)
      cpi ARG3_L, 1
      brlo loop_blocks_else

      ; Calculate the remaining bytes
      sub YL, ARG3_L ; remaining = 64 - message_left_len;

      ; Copy the remaining message from ARG2 to buffer
      movw ZL, ARG2_L
      mov r19, ARG3_L
      loop_blocks_elsif1:
        ld r0, Z+
        st X+, r0
        dec r19
      brne loop_blocks_elsif1

      ; If the message is read the second time, the msg length can be zeroed
      cpi ARG1_L, 1
      brlo .+2

        ldi ARG3_L, 0

      ; Add a padding block if there are remaining bytes to be filled
      cpi YL, 1 ; if (YL > 0)
      brlo loop_blocks_endif

        ; Assume the last byte is complete and write 0x80
        ldi ZL, 0x80
        st X+, ZL

        ; By having written 0x80, the bytes remaining are one less now
        dec YL
        breq loop_blocks_elsif3

        ; Set the other remaining bytes (amount in YL) to 0 (= ARG3_L)
        ldi ZL, 0
        loop_blocks_elsif2: ; while (--remaining)
          st X+, ZL
          dec YL
        brne loop_blocks_elsif2

        loop_blocks_elsif3:

        ; The size is only stored in the last block
        cpi r16, 64 ; if (pad_block_len < 64)
        brsh loop_blocks_endif

        ; r17 gets (blocks & 0xFF)
        st -X, r17

    rjmp loop_blocks_endif

    loop_blocks_else: ; only padding

      ; If a full padding block should be added, the first byte is 0x80
      cpi r16, 64 ; if (pad_block_len == 64)
      brne loop_blocks_else2

        ldi ZL, 0x80
        st X+, ZL
        dec YL

      ; Set the other remaining bytes to 0 (= ARG3_L)
      ldi ZL, 0
      loop_blocks_else2:
        st X+, ARG3_L
        dec YL
      brne loop_blocks_else2

      ; The last byte represents the total blocks amount.
      ; r17 gets (blocks & 0xFF)
      st -X, r17

    loop_blocks_endif:

    ; Both P and Q need buffer in Y and the polynomial in r17
    ldi YH, hi8(buffer)
    ldi YL, lo8(buffer)
    push r17
    ldi r17, 0x1b ; x^8 + x^4 + x^3 + x + 1

    ; If the message is read in the second time (ARG1_L = 1), go to processQ
    cpi ARG1_L, 1
    breq processQ

      ; Calculate the input for permP
      ; for (i = 0; i < 64; i++) buffer[i] ^= h_state[i];
      ldi XH, hi8(h_state)
      ldi XL, lo8(h_state)

      ldi r19, 64
      loop_permPIn:
        ld r0, Y
        ld r1, X+
        eor r0, r1
        st Y+, r0
        dec r19
      brne loop_permPIn

      ldi YH, hi8(buffer)
      ldi YL, lo8(buffer)

      ; Permute P and then drop the polynomial in r17
      rcall permP
      pop r17

      ; Update h_state by XOR-ing (Note: the result is already in Y!)
      ; for (i = 0; i < 64; i++) h_state[i] ^= p_state[i];
      ldi ZH, hi8(h_state)
      ldi ZL, lo8(h_state)
      ldi r19, 64
      ploop_hstate:
        ld r0, Z
        ld r1, Y+
        eor r0, r1
        st Z+, r0
        dec r19
      brne ploop_hstate

      ; Switch the flag to 1: Next time the permQ routine is executed
      ldi ARG1_L, 1
    rjmp loop_blocks

    ; Now Q is permuted
    processQ:

      ; Switch back the flag to 0: Next time the permP routine is executed
      ldi ARG1_L, 0

      ; Permute Q and then drop the polynomial in r17
      rcall permQ
      pop r17

      ; Update h_state by XOR-ing (Note: the result is already in Y!)
      ; for (i = 0; i < 64; i++) h_state[i] ^= q_state[i];
      ldi ZH, hi8(h_state)
      ldi ZL, lo8(h_state)
      ldi r19, 64
      qloop_hstate:
        ld r0, Z
        ld r2, Y+
        eor r0, r2
        st Z+, r0
        dec r19
      brne qloop_hstate

  dec r18
  breq loop_blocks_end
  rjmp loop_blocks

  loop_blocks_end:

  ; Instead of a temp. variable, the real ARG1 parameter is needed now
  pop ARG1_L

  ; The last 32 bytes of h_state are written to the output (ARG1). The pointer
  ; of h_state (Y) is at pos. 64 due to the loop above, so we go down to pos. 32
  movw XL, ARG1_L
  subi ZL, 32

  ldi r19, 32
  loop_output1:
    ld r1, Z+
    st X+, r1
    dec r19
  brne loop_output1

  ; permP expects h_state in Y. In loop_hstate above, buffer was loaded to Y.
  ; The pointer position is now 64 which means: start of h_state
  ldi r17, 0x1b ; x^8 + x^4 + x^3 + x + 1
  rcall permP ; permP(h_state, p_state);

  ; The last 32 bytes of p_state are now XOR-ed
  ; with h_state, already held by ARG1
  movw XL, ARG1_L
  ldi r19, 32
  add YL, r19

  loop_output2:
    ld r1, X
    ld r2, Y+
    eor r1, r2
    st X+, r1
    dec r19
  brne loop_output2

  ; Set the return value 0
  mov r24, r19
  mov r25, r19

  pop YH
  pop YL
  pop_registers 0,17

  ret

; The sbox table resides in flash memory
; as it's are belonging to the .text section

.balign 256

sbox:
.byte 0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76
.byte 0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0
.byte 0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15
.byte 0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75
.byte 0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84
.byte 0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF
.byte 0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8
.byte 0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2
.byte 0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73
.byte 0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB
.byte 0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79
.byte 0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08
.byte 0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A
.byte 0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E
.byte 0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF
.byte 0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16

; Four tables (in RAM) need not to be initialized, so they belong to .bss
.section .bss

buffer:
.fill 64, 1, 0
h_state:
.fill 64, 1, 0
temp_state:
.fill 64, 1, 0
