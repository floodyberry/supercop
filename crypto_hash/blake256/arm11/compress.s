
# qhasm: int32 input_0

# qhasm: int32 input_1

# qhasm: int32 input_2

# qhasm: int32 input_3

# qhasm: stack32 input_4

# qhasm: stack32 input_5

# qhasm: stack32 input_6

# qhasm: stack32 input_7

# qhasm: int32 caller_r4

# qhasm: int32 caller_r5

# qhasm: int32 caller_r6

# qhasm: int32 caller_r7

# qhasm: int32 caller_r8

# qhasm: int32 caller_r9

# qhasm: int32 caller_r10

# qhasm: int32 caller_r11

# qhasm: int32 caller_r14

# qhasm: reg128 caller_q4

# qhasm: reg128 caller_q5

# qhasm: reg128 caller_q6

# qhasm: reg128 caller_q7

# qhasm: startcode
.fpu neon
.text

# qhasm: int32 t0

# qhasm: int32 t1

# qhasm: int32 t2

# qhasm: int32 t3

# qhasm: int32 t4

# qhasm: int32 t5

# qhasm: int32 t6

# qhasm: int32 t7

# qhasm: int32 t8

# qhasm: int32 t9

# qhasm: int32 t10

# qhasm: int32 t11

# qhasm: int32 t12

# qhasm: int32 t13

# qhasm: int32 t14

# qhasm: int32 t15

# qhasm: int32 t16

# qhasm: int32 t17

# qhasm: int32 t18

# qhasm: int32 t19

# qhasm: int32 t20

# qhasm: int32 t21

# qhasm: int32 t22

# qhasm: int32 t23

# qhasm: int32 t24

# qhasm: int32 t25

# qhasm: int32 t26

# qhasm: int32 t27

# qhasm: int32 t28

# qhasm: int32 t29

# qhasm: int32 t30

# qhasm: int32 t31

# qhasm: int32 t32

# qhasm: int32 t33

# qhasm: int32 t34

# qhasm: int32 t35

# qhasm: int32 t36

# qhasm: int32 t37

# qhasm: int32 t38

# qhasm: int32 t39

# qhasm: int32 t40

# qhasm: int32 t41

# qhasm: int32 t42

# qhasm: int32 t43

# qhasm: int32 t44

# qhasm: int32 t45

# qhasm: int32 t46

# qhasm: int32 t47

# qhasm: int32 t48

# qhasm: int32 t49

# qhasm: int32 t50

# qhasm: int32 t51

# qhasm: int32 t52

# qhasm: int32 t53

# qhasm: int32 t54

# qhasm: int32 t55

# qhasm: int32 t56

# qhasm: int32 t57

# qhasm: int32 t58

# qhasm: int32 t59

# qhasm: int32 t60

# qhasm: int32 t61

# qhasm: int32 t62

# qhasm: int32 t63

# qhasm: int32 t64

# qhasm: int32 t65

# qhasm: int32 t66

# qhasm: int32 t67

# qhasm: int32 t68

# qhasm: int32 t69

# qhasm: int32 t70

# qhasm: int32 t71

# qhasm: int32 t72

# qhasm: int32 t73

# qhasm: int32 t74

# qhasm: int32 t75

# qhasm: int32 t76

# qhasm: int32 t77

# qhasm: int32 t78

# qhasm: int32 t79

# qhasm: int32 t80

# qhasm: int32 t81

# qhasm: int32 t82

# qhasm: int32 t83

# qhasm: int32 t84

# qhasm: int32 t85

# qhasm: int32 t86

# qhasm: int32 t87

# qhasm: int32 t88

# qhasm: int32 t89

# qhasm: int32 t90

# qhasm: int32 t91

# qhasm: int32 t92

# qhasm: int32 t93

# qhasm: int32 t94

# qhasm: int32 t95

# qhasm: int32 t96

# qhasm: int32 t97

# qhasm: int32 t98

# qhasm: int32 t99

# qhasm: int32 t100

# qhasm: int32 t101

# qhasm: int32 t102

# qhasm: int32 t103

# qhasm: int32 t104

# qhasm: int32 t105

# qhasm: int32 t106

# qhasm: int32 t107

# qhasm: int32 t108

# qhasm: int32 t109

# qhasm: int32 t110

# qhasm: int32 t111

# qhasm: int32 t112

# qhasm: int32 t113

# qhasm: int32 t114

# qhasm: int32 t115

# qhasm: int32 t116

# qhasm: int32 t117

# qhasm: int32 t118

# qhasm: int32 t119

# qhasm: int32 t120

# qhasm: int32 t121

# qhasm: int32 t122

# qhasm: int32 t123

# qhasm: int32 t124

# qhasm: int32 t125

# qhasm: int32 t126

# qhasm: int32 t127

# qhasm: int32 t128

# qhasm: int32 t129

# qhasm: int32 t130

# qhasm: int32 t131

# qhasm: int32 t132

# qhasm: int32 t133

# qhasm: int32 t134

# qhasm: int32 t135

# qhasm: int32 t136

# qhasm: int32 t137

# qhasm: int32 t138

# qhasm: int32 t139

# qhasm: int32 t140

# qhasm: int32 t141

# qhasm: int32 t142

# qhasm: int32 t143

# qhasm: int32 t144

# qhasm: int32 t145

# qhasm: int32 t146

# qhasm: int32 t147

# qhasm: int32 t148

# qhasm: int32 t149

# qhasm: int32 t150

# qhasm: int32 t151

# qhasm: int32 t152

# qhasm: int32 t153

# qhasm: int32 t154

# qhasm: int32 t155

# qhasm: int32 t156

# qhasm: int32 t157

# qhasm: int32 t158

# qhasm: int32 t159

# qhasm: int32 t160

# qhasm: int32 t161

# qhasm: int32 t162

# qhasm: int32 t163

# qhasm: int32 t164

# qhasm: int32 t165

# qhasm: int32 t166

# qhasm: int32 t167

# qhasm: int32 t168

# qhasm: int32 t169

# qhasm: int32 t170

# qhasm: int32 t171

# qhasm: int32 t172

# qhasm: int32 t173

# qhasm: int32 t174

# qhasm: int32 t175

# qhasm: int32 t176

# qhasm: int32 t177

# qhasm: int32 t178

# qhasm: int32 t179

# qhasm: int32 t180

# qhasm: int32 t181

# qhasm: int32 t182

# qhasm: int32 t183

# qhasm: int32 t184

# qhasm: int32 t185

# qhasm: int32 t186

# qhasm: int32 t187

# qhasm: int32 t188

# qhasm: int32 t189

# qhasm: int32 t190

# qhasm: int32 t191

# qhasm: int32 t192

# qhasm: int32 t193

# qhasm: int32 t194

# qhasm: int32 t195

# qhasm: int32 t196

# qhasm: int32 t197

# qhasm: int32 t198

# qhasm: int32 t199

# qhasm: int32 t200

# qhasm: int32 t201

# qhasm: int32 t202

# qhasm: int32 t203

# qhasm: int32 t204

# qhasm: int32 t205

# qhasm: int32 t206

# qhasm: int32 t207

# qhasm: int32 t208

# qhasm: int32 t209

# qhasm: int32 t210

# qhasm: int32 t211

# qhasm: int32 t212

# qhasm: int32 t213

# qhasm: int32 t214

# qhasm: int32 t215

# qhasm: int32 t216

# qhasm: int32 t217

# qhasm: int32 t218

# qhasm: int32 t219

# qhasm: int32 t220

# qhasm: int32 t221

# qhasm: int32 t222

# qhasm: int32 t223

# qhasm: int32 c0

# qhasm: int32 c1

# qhasm: int32 c2

# qhasm: int32 c3

# qhasm: int32 c4

# qhasm: int32 c5

# qhasm: int32 c6

# qhasm: int32 c7

# qhasm: int32 c8

# qhasm: int32 c9

# qhasm: int32 c10

# qhasm: int32 c11

# qhasm: int32 c12

# qhasm: int32 c13

# qhasm: int32 c14

# qhasm: int32 c15

# qhasm: int32 v0

# qhasm: int32 v1

# qhasm: int32 v2

# qhasm: int32 v3

# qhasm: int32 v4

# qhasm: int32 v5

# qhasm: int32 v6

# qhasm: int32 v7

# qhasm: int32 v8

# qhasm: int32 v9

# qhasm: int32 v10

# qhasm: int32 v11

# qhasm: int32 v12

# qhasm: int32 v13

# qhasm: int32 v14

# qhasm: int32 v15

# qhasm: stack32 v8_stack

# qhasm: stack32 v9_stack

# qhasm: stack32 v10_stack

# qhasm: stack32 v11_stack

# qhasm: stack32 v12_stack

# qhasm: stack32 v13_stack

# qhasm: stack32 v14_stack

# qhasm: stack32 v15_stack

# qhasm: stack64 v8v12_stack

# qhasm: stack64 v9v13_stack

# qhasm: stack64 v10v14_stack

# qhasm: stack64 v11v15_stack

# qhasm: stack64 v9v14_stack

# qhasm: stack64 v8v13_stack

# qhasm: stack64 v10v15_stack

# qhasm: stack64 v11v12_stack

# qhasm: int32 h0

# qhasm: int32 h1

# qhasm: int32 h2

# qhasm: int32 h3

# qhasm: int32 h4

# qhasm: int32 h5

# qhasm: int32 h6

# qhasm: int32 h7

# qhasm: int32 s0

# qhasm: int32 s1

# qhasm: int32 s2

# qhasm: int32 s3

# qhasm: stack64 m0m1_stack

# qhasm: stack64 m2m3_stack

# qhasm: stack64 m4m5_stack

# qhasm: stack64 m6m7_stack

# qhasm: stack64 m8m9_stack

# qhasm: stack64 m10m11_stack

# qhasm: stack64 m12m13_stack

# qhasm: stack64 m14m15_stack

# qhasm: stack32 input_2_stack

# qhasm: stack32 input_1_stack

# qhasm: stack32 input_0_stack

# qhasm: stack32 c0_stack

# qhasm: stack32 c1_stack

# qhasm: stack32 c2_stack

# qhasm: stack32 c3_stack

# qhasm: stack32 c4_stack

# qhasm: stack32 c5_stack

# qhasm: stack32 c6_stack

# qhasm: stack32 c7_stack

# qhasm: stack32 c8_stack

# qhasm: stack32 c9_stack

# qhasm: stack32 c10_stack

# qhasm: stack32 c11_stack

# qhasm: stack32 c12_stack

# qhasm: stack32 c13_stack

# qhasm: stack32 c14_stack

# qhasm: stack32 c15_stack

# qhasm: stack32 caller_r4_stack

# qhasm: stack32 caller_r5_stack

# qhasm: stack32 caller_r6_stack

# qhasm: stack32 caller_r7_stack

# qhasm: stack32 caller_r8_stack

# qhasm: stack32 caller_r9_stack

# qhasm: stack32 caller_r10_stack

# qhasm: stack32 caller_r11_stack

# qhasm: stack32 caller_r14_stack

# qhasm: enter compress
.align 2
.global _compress
.global compress
_compress:
compress:
sub sp,sp,#256

# qhasm: unsigned<? input_2 - 1
# asm 1: cmp <input_2=int32#3,#1
# asm 2: cmp <input_2=r2,#1
cmp r2,#1

# qhasm: goto end if unsigned<
blo ._end

# qhasm: input_2_stack = input_2
# asm 1: str <input_2=int32#3,>input_2_stack=stack32#1
# asm 2: str <input_2=r2,>input_2_stack=[sp,#128]
str r2,[sp,#128]

# qhasm: caller_r4_stack = caller_r4
# asm 1: str <caller_r4=int32#5,>caller_r4_stack=stack32#2
# asm 2: str <caller_r4=r4,>caller_r4_stack=[sp,#132]
str r4,[sp,#132]

# qhasm: caller_r5_stack = caller_r5
# asm 1: str <caller_r5=int32#6,>caller_r5_stack=stack32#3
# asm 2: str <caller_r5=r5,>caller_r5_stack=[sp,#136]
str r5,[sp,#136]

# qhasm: caller_r6_stack = caller_r6
# asm 1: str <caller_r6=int32#7,>caller_r6_stack=stack32#4
# asm 2: str <caller_r6=r6,>caller_r6_stack=[sp,#140]
str r6,[sp,#140]

# qhasm: caller_r7_stack = caller_r7
# asm 1: str <caller_r7=int32#8,>caller_r7_stack=stack32#5
# asm 2: str <caller_r7=r7,>caller_r7_stack=[sp,#144]
str r7,[sp,#144]

# qhasm: caller_r8_stack = caller_r8
# asm 1: str <caller_r8=int32#9,>caller_r8_stack=stack32#6
# asm 2: str <caller_r8=r8,>caller_r8_stack=[sp,#148]
str r8,[sp,#148]

# qhasm: caller_r9_stack = caller_r9
# asm 1: str <caller_r9=int32#10,>caller_r9_stack=stack32#7
# asm 2: str <caller_r9=r9,>caller_r9_stack=[sp,#152]
str r9,[sp,#152]

# qhasm: caller_r10_stack = caller_r10
# asm 1: str <caller_r10=int32#11,>caller_r10_stack=stack32#8
# asm 2: str <caller_r10=r10,>caller_r10_stack=[sp,#156]
str r10,[sp,#156]

# qhasm: caller_r11_stack = caller_r11
# asm 1: str <caller_r11=int32#12,>caller_r11_stack=stack32#9
# asm 2: str <caller_r11=r11,>caller_r11_stack=[sp,#160]
str r11,[sp,#160]

# qhasm: caller_r14_stack = caller_r14
# asm 1: str <caller_r14=int32#14,>caller_r14_stack=stack32#10
# asm 2: str <caller_r14=r14,>caller_r14_stack=[sp,#164]
str r14,[sp,#164]

# qhasm: c0 = mem32[input_3 +  0]
# asm 1: ldr >c0=int32#3,[<input_3=int32#4,#0]
# asm 2: ldr >c0=r2,[<input_3=r3,#0]
ldr r2,[r3,#0]

# qhasm: c1 = mem32[input_3 +  4]
# asm 1: ldr >c1=int32#5,[<input_3=int32#4,#4]
# asm 2: ldr >c1=r4,[<input_3=r3,#4]
ldr r4,[r3,#4]

# qhasm: c2 = mem32[input_3 +  8]
# asm 1: ldr >c2=int32#6,[<input_3=int32#4,#8]
# asm 2: ldr >c2=r5,[<input_3=r3,#8]
ldr r5,[r3,#8]

# qhasm: c3 = mem32[input_3 + 12]
# asm 1: ldr >c3=int32#7,[<input_3=int32#4,#12]
# asm 2: ldr >c3=r6,[<input_3=r3,#12]
ldr r6,[r3,#12]

# qhasm: c4 = mem32[input_3 + 16]
# asm 1: ldr >c4=int32#8,[<input_3=int32#4,#16]
# asm 2: ldr >c4=r7,[<input_3=r3,#16]
ldr r7,[r3,#16]

# qhasm: c5 = mem32[input_3 + 20]
# asm 1: ldr >c5=int32#9,[<input_3=int32#4,#20]
# asm 2: ldr >c5=r8,[<input_3=r3,#20]
ldr r8,[r3,#20]

# qhasm: c6 = mem32[input_3 + 24]
# asm 1: ldr >c6=int32#10,[<input_3=int32#4,#24]
# asm 2: ldr >c6=r9,[<input_3=r3,#24]
ldr r9,[r3,#24]

# qhasm: c7 = mem32[input_3 + 28]
# asm 1: ldr >c7=int32#11,[<input_3=int32#4,#28]
# asm 2: ldr >c7=r10,[<input_3=r3,#28]
ldr r10,[r3,#28]

# qhasm: c0_stack = c0
# asm 1: str <c0=int32#3,>c0_stack=stack32#11
# asm 2: str <c0=r2,>c0_stack=[sp,#168]
str r2,[sp,#168]

# qhasm: c1_stack = c1
# asm 1: str <c1=int32#5,>c1_stack=stack32#12
# asm 2: str <c1=r4,>c1_stack=[sp,#172]
str r4,[sp,#172]

# qhasm: c2_stack = c2
# asm 1: str <c2=int32#6,>c2_stack=stack32#13
# asm 2: str <c2=r5,>c2_stack=[sp,#176]
str r5,[sp,#176]

# qhasm: c3_stack = c3
# asm 1: str <c3=int32#7,>c3_stack=stack32#14
# asm 2: str <c3=r6,>c3_stack=[sp,#180]
str r6,[sp,#180]

# qhasm: c4_stack = c4
# asm 1: str <c4=int32#8,>c4_stack=stack32#15
# asm 2: str <c4=r7,>c4_stack=[sp,#184]
str r7,[sp,#184]

# qhasm: c5_stack = c5
# asm 1: str <c5=int32#9,>c5_stack=stack32#16
# asm 2: str <c5=r8,>c5_stack=[sp,#188]
str r8,[sp,#188]

# qhasm: c6_stack = c6
# asm 1: str <c6=int32#10,>c6_stack=stack32#17
# asm 2: str <c6=r9,>c6_stack=[sp,#192]
str r9,[sp,#192]

# qhasm: c7_stack = c7
# asm 1: str <c7=int32#11,>c7_stack=stack32#18
# asm 2: str <c7=r10,>c7_stack=[sp,#196]
str r10,[sp,#196]

# qhasm: c8  = mem32[input_3 + 32]
# asm 1: ldr >c8=int32#3,[<input_3=int32#4,#32]
# asm 2: ldr >c8=r2,[<input_3=r3,#32]
ldr r2,[r3,#32]

# qhasm: c9  = mem32[input_3 + 36]
# asm 1: ldr >c9=int32#5,[<input_3=int32#4,#36]
# asm 2: ldr >c9=r4,[<input_3=r3,#36]
ldr r4,[r3,#36]

# qhasm: c10 = mem32[input_3 + 40]
# asm 1: ldr >c10=int32#6,[<input_3=int32#4,#40]
# asm 2: ldr >c10=r5,[<input_3=r3,#40]
ldr r5,[r3,#40]

# qhasm: c11 = mem32[input_3 + 44]
# asm 1: ldr >c11=int32#7,[<input_3=int32#4,#44]
# asm 2: ldr >c11=r6,[<input_3=r3,#44]
ldr r6,[r3,#44]

# qhasm: c12 = mem32[input_3 + 48]
# asm 1: ldr >c12=int32#8,[<input_3=int32#4,#48]
# asm 2: ldr >c12=r7,[<input_3=r3,#48]
ldr r7,[r3,#48]

# qhasm: c13 = mem32[input_3 + 52]
# asm 1: ldr >c13=int32#9,[<input_3=int32#4,#52]
# asm 2: ldr >c13=r8,[<input_3=r3,#52]
ldr r8,[r3,#52]

# qhasm: c14 = mem32[input_3 + 56]
# asm 1: ldr >c14=int32#10,[<input_3=int32#4,#56]
# asm 2: ldr >c14=r9,[<input_3=r3,#56]
ldr r9,[r3,#56]

# qhasm: c15 = mem32[input_3 + 60]
# asm 1: ldr >c15=int32#4,[<input_3=int32#4,#60]
# asm 2: ldr >c15=r3,[<input_3=r3,#60]
ldr r3,[r3,#60]

# qhasm: c8_stack  = c8
# asm 1: str <c8=int32#3,>c8_stack=stack32#19
# asm 2: str <c8=r2,>c8_stack=[sp,#200]
str r2,[sp,#200]

# qhasm: c9_stack  = c9
# asm 1: str <c9=int32#5,>c9_stack=stack32#20
# asm 2: str <c9=r4,>c9_stack=[sp,#204]
str r4,[sp,#204]

# qhasm: c10_stack = c10
# asm 1: str <c10=int32#6,>c10_stack=stack32#21
# asm 2: str <c10=r5,>c10_stack=[sp,#208]
str r5,[sp,#208]

# qhasm: c11_stack = c11
# asm 1: str <c11=int32#7,>c11_stack=stack32#22
# asm 2: str <c11=r6,>c11_stack=[sp,#212]
str r6,[sp,#212]

# qhasm: c12_stack = c12
# asm 1: str <c12=int32#8,>c12_stack=stack32#23
# asm 2: str <c12=r7,>c12_stack=[sp,#216]
str r7,[sp,#216]

# qhasm: c13_stack = c13
# asm 1: str <c13=int32#9,>c13_stack=stack32#24
# asm 2: str <c13=r8,>c13_stack=[sp,#220]
str r8,[sp,#220]

# qhasm: c14_stack = c14
# asm 1: str <c14=int32#10,>c14_stack=stack32#25
# asm 2: str <c14=r9,>c14_stack=[sp,#224]
str r9,[sp,#224]

# qhasm: c15_stack = c15
# asm 1: str <c15=int32#4,>c15_stack=stack32#26
# asm 2: str <c15=r3,>c15_stack=[sp,#228]
str r3,[sp,#228]

# qhasm: v0 = mem32[input_0 +  0]
# asm 1: ldr >v0=int32#3,[<input_0=int32#1,#0]
# asm 2: ldr >v0=r2,[<input_0=r0,#0]
ldr r2,[r0,#0]

# qhasm: v1 = mem32[input_0 +  4]
# asm 1: ldr >v1=int32#4,[<input_0=int32#1,#4]
# asm 2: ldr >v1=r3,[<input_0=r0,#4]
ldr r3,[r0,#4]

# qhasm: v2 = mem32[input_0 +  8]
# asm 1: ldr >v2=int32#5,[<input_0=int32#1,#8]
# asm 2: ldr >v2=r4,[<input_0=r0,#8]
ldr r4,[r0,#8]

# qhasm: v3 = mem32[input_0 + 12]
# asm 1: ldr >v3=int32#6,[<input_0=int32#1,#12]
# asm 2: ldr >v3=r5,[<input_0=r0,#12]
ldr r5,[r0,#12]

# qhasm: v4 = mem32[input_0 + 16]
# asm 1: ldr >v4=int32#7,[<input_0=int32#1,#16]
# asm 2: ldr >v4=r6,[<input_0=r0,#16]
ldr r6,[r0,#16]

# qhasm: v5 = mem32[input_0 + 20]
# asm 1: ldr >v5=int32#8,[<input_0=int32#1,#20]
# asm 2: ldr >v5=r7,[<input_0=r0,#20]
ldr r7,[r0,#20]

# qhasm: v6 = mem32[input_0 + 24]
# asm 1: ldr >v6=int32#9,[<input_0=int32#1,#24]
# asm 2: ldr >v6=r8,[<input_0=r0,#24]
ldr r8,[r0,#24]

# qhasm: v7 = mem32[input_0 + 28]
# asm 1: ldr >v7=int32#13,[<input_0=int32#1,#28]
# asm 2: ldr >v7=r12,[<input_0=r0,#28]
ldr r12,[r0,#28]

# qhasm: mainloop:
._mainloop:

# qhasm: v6 = v6
# asm 1: mov >v6=int32#14,<v6=int32#9
# asm 2: mov >v6=r14,<v6=r8
mov r14,r8

# qhasm: bigendian
setend be

# qhasm: assign r10 r11 to t0 t1 = mem64[input_1 + 0]
# asm 1: ldrd >t0=int32#11,[<input_1=int32#2,#0]
# asm 2: ldrd >t0=r10,[<input_1=r1,#0]
ldrd r10,[r1,#0]

# qhasm: assign r8 r9 to t2 t3 = mem64[input_1 + 8]
# asm 1: ldrd >t2=int32#9,[<input_1=int32#2,#8]
# asm 2: ldrd >t2=r8,[<input_1=r1,#8]
ldrd r8,[r1,#8]

# qhasm: littleendian
setend le

# qhasm: assign r10 r11 to t0 t1; m0m1_stack = t0 t1
# asm 1: strd <t0=int32#11,>m0m1_stack=stack64#6
# asm 2: strd <t0=r10,>m0m1_stack=[sp,#40]
strd r10,[sp,#40]

# qhasm: assign r10 r11 to t2 t3; m2m3_stack = t2 t3
# asm 1: strd <t2=int32#9,>m2m3_stack=stack64#7
# asm 2: strd <t2=r8,>m2m3_stack=[sp,#48]
strd r8,[sp,#48]

# qhasm: bigendian
setend be

# qhasm: assign r10 r11 to t4 t5 = mem64[input_1 + 16]
# asm 1: ldrd >t4=int32#11,[<input_1=int32#2,#16]
# asm 2: ldrd >t4=r10,[<input_1=r1,#16]
ldrd r10,[r1,#16]

# qhasm: assign r8 r9 to t6 t7 = mem64[input_1 + 24]
# asm 1: ldrd >t6=int32#9,[<input_1=int32#2,#24]
# asm 2: ldrd >t6=r8,[<input_1=r1,#24]
ldrd r8,[r1,#24]

# qhasm: littleendian
setend le

# qhasm: assign r10 r11 to t4 t5; m4m5_stack = t4 t5
# asm 1: strd <t4=int32#11,>m4m5_stack=stack64#8
# asm 2: strd <t4=r10,>m4m5_stack=[sp,#56]
strd r10,[sp,#56]

# qhasm: assign r8 r9 to t6 t7; m6m7_stack = t6 t7
# asm 1: strd <t6=int32#9,>m6m7_stack=stack64#9
# asm 2: strd <t6=r8,>m6m7_stack=[sp,#64]
strd r8,[sp,#64]

# qhasm: bigendian
setend be

# qhasm: assign r10 r11 to t8 t9 = mem64[input_1 + 32]
# asm 1: ldrd >t8=int32#11,[<input_1=int32#2,#32]
# asm 2: ldrd >t8=r10,[<input_1=r1,#32]
ldrd r10,[r1,#32]

# qhasm: assign r8 r9 to t10 t11 = mem64[input_1 + 40]
# asm 1: ldrd >t10=int32#9,[<input_1=int32#2,#40]
# asm 2: ldrd >t10=r8,[<input_1=r1,#40]
ldrd r8,[r1,#40]

# qhasm: littleendian
setend le

# qhasm: assign r10 r11 to t8 t9; m8m9_stack = t8 t9
# asm 1: strd <t8=int32#11,>m8m9_stack=stack64#10
# asm 2: strd <t8=r10,>m8m9_stack=[sp,#72]
strd r10,[sp,#72]

# qhasm: assign r8 r9 to t10 t11; m10m11_stack = t10 t11
# asm 1: strd <t10=int32#9,>m10m11_stack=stack64#11
# asm 2: strd <t10=r8,>m10m11_stack=[sp,#80]
strd r8,[sp,#80]

# qhasm: bigendian
setend be

# qhasm: assign r10 r11 to t12 t13 = mem64[input_1 + 48]
# asm 1: ldrd >t12=int32#11,[<input_1=int32#2,#48]
# asm 2: ldrd >t12=r10,[<input_1=r1,#48]
ldrd r10,[r1,#48]

# qhasm: assign r8 r9 to t14 t15 = mem64[input_1 + 56]
# asm 1: ldrd >t14=int32#9,[<input_1=int32#2,#56]
# asm 2: ldrd >t14=r8,[<input_1=r1,#56]
ldrd r8,[r1,#56]

# qhasm: littleendian
setend le

# qhasm: assign r10 r11 to t12 t13; m12m13_stack = t12 t13
# asm 1: strd <t12=int32#11,>m12m13_stack=stack64#12
# asm 2: strd <t12=r10,>m12m13_stack=[sp,#88]
strd r10,[sp,#88]

# qhasm: assign r8 r9 to t14 t15; m14m15_stack = t14 t15
# asm 1: strd <t14=int32#9,>m14m15_stack=stack64#13
# asm 2: strd <t14=r8,>m14m15_stack=[sp,#96]
strd r8,[sp,#96]

# qhasm: input_1_stack = input_1
# asm 1: str <input_1=int32#2,>input_1_stack=stack32#27
# asm 2: str <input_1=r1,>input_1_stack=[sp,#232]
str r1,[sp,#232]

# qhasm: v6 = v6
# asm 1: mov >v6=int32#2,<v6=int32#14
# asm 2: mov >v6=r1,<v6=r14
mov r1,r14

# qhasm: t0 = mem32[input_0 + 48]
# asm 1: ldr >t0=int32#9,[<input_0=int32#1,#48]
# asm 2: ldr >t0=r8,[<input_0=r0,#48]
ldr r8,[r0,#48]

# qhasm: t1 = mem32[input_0 + 52]
# asm 1: ldr >t1=int32#10,[<input_0=int32#1,#52]
# asm 2: ldr >t1=r9,[<input_0=r0,#52]
ldr r9,[r0,#52]

# qhasm: carry? t0 + 512
# asm 1: cmp <t0=int32#9,#-512
# asm 2: cmp <t0=r8,#-512
cmp r8,#-512

# qhasm: t0 = t0 + 512
# asm 1: add >t0=int32#9,<t0=int32#9,#512
# asm 2: add >t0=r8,<t0=r8,#512
add r8,r8,#512

# qhasm: t1 += 0 + carry
# asm 1: adc >t1=int32#10,<t1=int32#10,#0
# asm 2: adc >t1=r9,<t1=r9,#0
adc r9,r9,#0

# qhasm: mem32[input_0 + 48] = t0
# asm 1: str <t0=int32#9,[<input_0=int32#1,#48]
# asm 2: str <t0=r8,[<input_0=r0,#48]
str r8,[r0,#48]

# qhasm: mem32[input_0 + 52] = t1
# asm 1: str <t1=int32#10,[<input_0=int32#1,#52]
# asm 2: str <t1=r9,[<input_0=r0,#52]
str r9,[r0,#52]

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#9,<c1_stack=stack32#12
# asm 2: ldr >c1=r8,<c1_stack=[sp,#172]
ldr r8,[sp,#172]

# qhasm: v9 = mem32[input_0 + 36]
# asm 1: ldr >v9=int32#10,[<input_0=int32#1,#36]
# asm 2: ldr >v9=r9,[<input_0=r0,#36]
ldr r9,[r0,#36]

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#12,<c5_stack=stack32#16
# asm 2: ldr >c5=r11,<c5_stack=[sp,#188]
ldr r11,[sp,#188]

# qhasm: v13 = mem32[input_0 + 48]
# asm 1: ldr >v13=int32#14,[<input_0=int32#1,#48]
# asm 2: ldr >v13=r14,[<input_0=r0,#48]
ldr r14,[r0,#48]

# qhasm: v9 = v9 ^ c1
# asm 1: eor >v9=int32#11,<v9=int32#10,<c1=int32#9
# asm 2: eor >v9=r10,<v9=r9,<c1=r8
eor r10,r9,r8

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#9,<c2_stack=stack32#13
# asm 2: ldr >c2=r8,<c2_stack=[sp,#176]
ldr r8,[sp,#176]

# qhasm: v10 = mem32[input_0 + 40]
# asm 1: ldr >v10=int32#10,[<input_0=int32#1,#40]
# asm 2: ldr >v10=r9,[<input_0=r0,#40]
ldr r9,[r0,#40]

# qhasm: v13 = v13 ^ c5
# asm 1: eor >v13=int32#12,<v13=int32#14,<c5=int32#12
# asm 2: eor >v13=r11,<v13=r14,<c5=r11
eor r11,r14,r11

# qhasm: assign r10 r11 to v9 v13;v9v13_stack = v9 v13
# asm 1: strd <v9=int32#11,>v9v13_stack=stack64#14
# asm 2: strd <v9=r10,>v9v13_stack=[sp,#104]
strd r10,[sp,#104]

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#12,<c6_stack=stack32#17
# asm 2: ldr >c6=r11,<c6_stack=[sp,#192]
ldr r11,[sp,#192]

# qhasm: v14 = mem32[input_0 + 52]
# asm 1: ldr >v14=int32#14,[<input_0=int32#1,#52]
# asm 2: ldr >v14=r14,[<input_0=r0,#52]
ldr r14,[r0,#52]

# qhasm: v10 = v10 ^ c2
# asm 1: eor >v10=int32#11,<v10=int32#10,<c2=int32#9
# asm 2: eor >v10=r10,<v10=r9,<c2=r8
eor r10,r9,r8

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#9,<c3_stack=stack32#14
# asm 2: ldr >c3=r8,<c3_stack=[sp,#180]
ldr r8,[sp,#180]

# qhasm: v11 = mem32[input_0 + 44]
# asm 1: ldr >v11=int32#10,[<input_0=int32#1,#44]
# asm 2: ldr >v11=r9,[<input_0=r0,#44]
ldr r9,[r0,#44]

# qhasm: v14 = v14 ^ c6
# asm 1: eor >v14=int32#12,<v14=int32#14,<c6=int32#12
# asm 2: eor >v14=r11,<v14=r14,<c6=r11
eor r11,r14,r11

# qhasm: assign r10 r11 to v10 v14;v10v14_stack = v10 v14
# asm 1: strd <v10=int32#11,>v10v14_stack=stack64#15
# asm 2: strd <v10=r10,>v10v14_stack=[sp,#112]
strd r10,[sp,#112]

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#12,<c7_stack=stack32#18
# asm 2: ldr >c7=r11,<c7_stack=[sp,#196]
ldr r11,[sp,#196]

# qhasm: v15 = mem32[input_0 + 52]
# asm 1: ldr >v15=int32#14,[<input_0=int32#1,#52]
# asm 2: ldr >v15=r14,[<input_0=r0,#52]
ldr r14,[r0,#52]

# qhasm: v11 = v11 ^ c3
# asm 1: eor >v11=int32#11,<v11=int32#10,<c3=int32#9
# asm 2: eor >v11=r10,<v11=r9,<c3=r8
eor r10,r9,r8

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#9,<c0_stack=stack32#11
# asm 2: ldr >c0=r8,<c0_stack=[sp,#168]
ldr r8,[sp,#168]

# qhasm: v8 = mem32[input_0 + 32]
# asm 1: ldr >v8=int32#10,[<input_0=int32#1,#32]
# asm 2: ldr >v8=r9,[<input_0=r0,#32]
ldr r9,[r0,#32]

# qhasm: v15 = v15 ^ c7
# asm 1: eor >v15=int32#12,<v15=int32#14,<c7=int32#12
# asm 2: eor >v15=r11,<v15=r14,<c7=r11
eor r11,r14,r11

# qhasm: assign r10 r11 to v11 v15;v11v15_stack = v11 v15
# asm 1: strd <v11=int32#11,>v11v15_stack=stack64#16
# asm 2: strd <v11=r10,>v11v15_stack=[sp,#120]
strd r10,[sp,#120]

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#11,<c4_stack=stack32#15
# asm 2: ldr >c4=r10,<c4_stack=[sp,#184]
ldr r10,[sp,#184]

# qhasm: v12 = mem32[input_0 + 48]
# asm 1: ldr >v12=int32#12,[<input_0=int32#1,#48]
# asm 2: ldr >v12=r11,[<input_0=r0,#48]
ldr r11,[r0,#48]

# qhasm: v8 = v8 ^ c0
# asm 1: eor >v8=int32#9,<v8=int32#10,<c0=int32#9
# asm 2: eor >v8=r8,<v8=r9,<c0=r8
eor r8,r9,r8

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#10,<c1_stack=stack32#12
# asm 2: ldr >c1=r9,<c1_stack=[sp,#172]
ldr r9,[sp,#172]

# qhasm: t0 = mem32[&m0m1_stack]
# asm 1: ldr >t0=int32#14,<m0m1_stack=stack64#6
# asm 2: ldr >t0=r14,<m0m1_stack=[sp,#40]
ldr r14,[sp,#40]

# qhasm: v12 = v12 ^ c4
# asm 1: eor >v12=int32#11,<v12=int32#12,<c4=int32#11
# asm 2: eor >v12=r10,<v12=r11,<c4=r10
eor r10,r11,r10

# qhasm: input_0_stack = input_0
# asm 1: str <input_0=int32#1,>input_0_stack=stack32#28
# asm 2: str <input_0=r0,>input_0_stack=[sp,#236]
str r0,[sp,#236]

# qhasm: t0 ^= c1
# asm 1: eor >t0=int32#1,<t0=int32#14,<c1=int32#10
# asm 2: eor >t0=r0,<t0=r14,<c1=r9
eor r0,r14,r9

# qhasm: v0 += (v4 >>> 0)
# asm 1: add >v0=int32#3,<v0=int32#3,<v4=int32#7,ROR #0
# asm 2: add >v0=r2,<v0=r2,<v4=r6,ROR #0
add r2,r2,r6,ROR #0

# qhasm: v0 += (t0 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#3,<t0=int32#1,ROR #0
# asm 2: add >v0=r0,<v0=r2,<t0=r0,ROR #0
add r0,r2,r0,ROR #0

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#3,<c0_stack=stack32#11
# asm 2: ldr >c0=r2,<c0_stack=[sp,#168]
ldr r2,[sp,#168]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#11,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r10,<v0=r0,ROR #0
eor r9,r10,r0,ROR #0

# qhasm: t1 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t1=int32#11,<m0m1_stack=stack64#6
# asm 2: ldr >t1=r10,<m0m1_stack=[sp,#44]
ldr r10,[sp,#44]

# qhasm: v8 += (v12 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #16
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#14,<c3_stack=stack32#14
# asm 2: ldr >c3=r14,<c3_stack=[sp,#180]
ldr r14,[sp,#180]

# qhasm: v4 ^= (v8 >>> 0)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #0
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #0
eor r6,r6,r8,ROR #0

# qhasm: t1 ^= c0
# asm 1: eor >t1=int32#3,<t1=int32#11,<c0=int32#3
# asm 2: eor >t1=r2,<t1=r10,<c0=r2
eor r2,r10,r2

# qhasm: v0 += (v4 >>> 12)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #12
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #12
add r0,r0,r6,ROR #12

# qhasm: v0 += (t1 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t1=int32#3,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t1=r2,ROR #0
add r0,r0,r2,ROR #0

# qhasm: t2 = mem32[&m2m3_stack]
# asm 1: ldr >t2=int32#3,<m2m3_stack=stack64#7
# asm 2: ldr >t2=r2,<m2m3_stack=[sp,#48]
ldr r2,[sp,#48]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 24)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #24
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #24
add r8,r8,r9,ROR #24

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 20)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #20
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #20
eor r6,r6,r8,ROR #20

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t2 ^= c3
# asm 1: eor >t2=int32#3,<t2=int32#3,<c3=int32#14
# asm 2: eor >t2=r2,<t2=r2,<c3=r14
eor r2,r2,r14

# qhasm: v1 += (v5 >>> 0)
# asm 1: add >v1=int32#4,<v1=int32#4,<v5=int32#8,ROR #0
# asm 2: add >v1=r3,<v1=r3,<v5=r7,ROR #0
add r3,r3,r7,ROR #0

# qhasm: v1 += (t2 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#4,<t2=int32#3,ROR #0
# asm 2: add >v1=r2,<v1=r3,<t2=r2,ROR #0
add r2,r3,r2,ROR #0

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#4,<c2_stack=stack32#13
# asm 2: ldr >c2=r3,<c2_stack=[sp,#176]
ldr r3,[sp,#176]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #0
eor r8,r11,r2,ROR #0

# qhasm: t3 = mem32[&m2m3_stack+4]
# asm 1: ldr >t3=int32#10,<m2m3_stack=stack64#7
# asm 2: ldr >t3=r9,<m2m3_stack=[sp,#52]
ldr r9,[sp,#52]

# qhasm: v9 += (v13 >>> 16)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#14,<c5_stack=stack32#16
# asm 2: ldr >c5=r14,<c5_stack=[sp,#188]
ldr r14,[sp,#188]

# qhasm: v5 ^= (v9 >>> 0)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #0
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #0
eor r7,r7,r10,ROR #0

# qhasm: t3 ^= c2
# asm 1: eor >t3=int32#4,<t3=int32#10,<c2=int32#4
# asm 2: eor >t3=r3,<t3=r9,<c2=r3
eor r3,r9,r3

# qhasm: v1 += (v5 >>> 12)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #12
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #12
add r2,r2,r7,ROR #12

# qhasm: v1 += (t3 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t3=int32#4,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t3=r3,ROR #0
add r2,r2,r3,ROR #0

# qhasm: t4 = mem32[&m4m5_stack]
# asm 1: ldr >t4=int32#4,<m4m5_stack=stack64#8
# asm 2: ldr >t4=r3,<m4m5_stack=[sp,#56]
ldr r3,[sp,#56]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #16
eor r8,r8,r2,ROR #16

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 24)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #24
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 20)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #20
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #20
eor r7,r7,r8,ROR #20

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t4 ^= c5
# asm 1: eor >t4=int32#4,<t4=int32#4,<c5=int32#14
# asm 2: eor >t4=r3,<t4=r3,<c5=r14
eor r3,r3,r14

# qhasm: v2 += (v6 >>> 0)
# asm 1: add >v2=int32#5,<v2=int32#5,<v6=int32#2,ROR #0
# asm 2: add >v2=r4,<v2=r4,<v6=r1,ROR #0
add r4,r4,r1,ROR #0

# qhasm: v2 += (t4 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#5,<t4=int32#4,ROR #0
# asm 2: add >v2=r3,<v2=r4,<t4=r3,ROR #0
add r3,r4,r3,ROR #0

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#5,<c4_stack=stack32#15
# asm 2: ldr >c4=r4,<c4_stack=[sp,#184]
ldr r4,[sp,#184]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #0
eor r8,r11,r3,ROR #0

# qhasm: t5 = mem32[&m4m5_stack+4]
# asm 1: ldr >t5=int32#10,<m4m5_stack=stack64#8
# asm 2: ldr >t5=r9,<m4m5_stack=[sp,#60]
ldr r9,[sp,#60]

# qhasm: v10 += (v14 >>> 16)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#14,<c7_stack=stack32#18
# asm 2: ldr >c7=r14,<c7_stack=[sp,#196]
ldr r14,[sp,#196]

# qhasm: v6 ^= (v10 >>> 0)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #0
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #0
eor r1,r1,r10,ROR #0

# qhasm: t5 ^= c4
# asm 1: eor >t5=int32#5,<t5=int32#10,<c4=int32#5
# asm 2: eor >t5=r4,<t5=r9,<c4=r4
eor r4,r9,r4

# qhasm: v2 += (v6 >>> 12)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #12
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #12
add r3,r3,r1,ROR #12

# qhasm: v2 += (t5 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t5=int32#5,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t5=r4,ROR #0
add r3,r3,r4,ROR #0

# qhasm: t6 = mem32[&m6m7_stack]
# asm 1: ldr >t6=int32#5,<m6m7_stack=stack64#9
# asm 2: ldr >t6=r4,<m6m7_stack=[sp,#64]
ldr r4,[sp,#64]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #16
eor r8,r8,r3,ROR #16

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 24)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: v3 += (v7 >>> 0)
# asm 1: add >v3=int32#6,<v3=int32#6,<v7=int32#13,ROR #0
# asm 2: add >v3=r5,<v3=r5,<v7=r12,ROR #0
add r5,r5,r12,ROR #0

# qhasm: v6 ^= (v10 >>> 20)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #20
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #20
eor r1,r1,r8,ROR #20

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t6 ^= c7
# asm 1: eor >t6=int32#5,<t6=int32#5,<c7=int32#14
# asm 2: eor >t6=r4,<t6=r4,<c7=r14
eor r4,r4,r14

# qhasm: v3 += (t6 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#6,<t6=int32#5,ROR #0
# asm 2: add >v3=r4,<v3=r5,<t6=r4,ROR #0
add r4,r5,r4,ROR #0

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#6,<c6_stack=stack32#17
# asm 2: ldr >c6=r5,<c6_stack=[sp,#192]
ldr r5,[sp,#192]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#10,<v15=int32#12,<v3=int32#5,ROR #0
# asm 2: eor >v15=r9,<v15=r11,<v3=r4,ROR #0
eor r9,r11,r4,ROR #0

# qhasm: t7 = mem32[&m6m7_stack+4]
# asm 1: ldr >t7=int32#12,<m6m7_stack=stack64#9
# asm 2: ldr >t7=r11,<m6m7_stack=[sp,#68]
ldr r11,[sp,#68]

# qhasm: v11 += (v15 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#14,<c9_stack=stack32#20
# asm 2: ldr >c9=r14,<c9_stack=[sp,#204]
ldr r14,[sp,#204]

# qhasm: v7 ^= (v11 >>> 0)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #0
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #0
eor r12,r12,r10,ROR #0

# qhasm: t7 ^= c6
# asm 1: eor >t7=int32#6,<t7=int32#12,<c6=int32#6
# asm 2: eor >t7=r5,<t7=r11,<c6=r5
eor r5,r11,r5

# qhasm: v3 += (v7 >>> 12)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #12
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #12
add r4,r4,r12,ROR #12

# qhasm: v3 += (t7 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t7=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t7=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t8 = mem32[&m8m9_stack]
# asm 1: ldr >t8=int32#6,<m8m9_stack=stack64#10
# asm 2: ldr >t8=r5,<m8m9_stack=[sp,#72]
ldr r5,[sp,#72]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v3=int32#5,ROR #16
# asm 2: eor >v15=r9,<v15=r9,<v3=r4,ROR #16
eor r9,r9,r4,ROR #16

# qhasm: v0 += (v5 >>> 19)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #19
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #19
add r0,r0,r7,ROR #19

# qhasm: v11 += (v15 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #24
add r10,r10,r9,ROR #24

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 20)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #20
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #20
eor r12,r12,r10,ROR #20

# qhasm: t8 ^= c9
# asm 1: eor >t8=int32#6,<t8=int32#6,<c9=int32#14
# asm 2: eor >t8=r5,<t8=r5,<c9=r14
eor r5,r5,r14

# qhasm: v0 += (t8 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t8=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t8=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#6,<c8_stack=stack32#19
# asm 2: ldr >c8=r5,<c8_stack=[sp,#200]
ldr r5,[sp,#200]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #8
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #8
eor r9,r9,r0,ROR #8

# qhasm: t9 = mem32[&m8m9_stack+4]
# asm 1: ldr >t9=int32#11,<m8m9_stack=stack64#10
# asm 2: ldr >t9=r10,<m8m9_stack=[sp,#76]
ldr r10,[sp,#76]

# qhasm: v10 += (v15 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #8
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: c15 = c15_stack
# asm 1: ldr >c15=int32#14,<c15_stack=stack32#26
# asm 2: ldr >c15=r14,<c15_stack=[sp,#228]
ldr r14,[sp,#228]

# qhasm: v5 ^= (v10 >>> 13)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #13
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #13
eor r7,r7,r8,ROR #13

# qhasm: t9 ^= c8
# asm 1: eor >t9=int32#6,<t9=int32#11,<c8=int32#6
# asm 2: eor >t9=r5,<t9=r10,<c8=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 31)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #31
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #31
add r0,r0,r7,ROR #31

# qhasm: v0 += (t9 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t9=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t9=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t10 = mem32[&m14m15_stack]
# asm 1: ldr >t10=int32#6,<m14m15_stack=stack64#13
# asm 2: ldr >t10=r5,<m14m15_stack=[sp,#96]
ldr r5,[sp,#96]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #24
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #24
eor r9,r9,r0,ROR #24

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#10,<v11v15_stack=stack64#16
# asm 2: str <v15=r9,<v11v15_stack=[sp,#124]
str r9,[sp,#124]

# qhasm: v10 += (v15 >>> 16)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #16
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 1)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #1
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #1
eor r7,r7,r8,ROR #1

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t10 ^= c15
# asm 1: eor >t10=int32#6,<t10=int32#6,<c15=int32#14
# asm 2: eor >t10=r5,<t10=r5,<c15=r14
eor r5,r5,r14

# qhasm: v3 += (v4 >>> 19)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #19
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #19
add r4,r4,r6,ROR #19

# qhasm: v3 += (t10 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t10=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t10=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#6,<c14_stack=stack32#25
# asm 2: ldr >c14=r5,<c14_stack=[sp,#224]
ldr r5,[sp,#224]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#5,ROR #8
# asm 2: eor >v14=r8,<v14=r11,<v3=r4,ROR #8
eor r8,r11,r4,ROR #8

# qhasm: t11 = mem32[&m14m15_stack+4]
# asm 1: ldr >t11=int32#10,<m14m15_stack=stack64#13
# asm 2: ldr >t11=r9,<m14m15_stack=[sp,#100]
ldr r9,[sp,#100]

# qhasm: v9 += (v14 >>> 8)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#14,<c13_stack=stack32#24
# asm 2: ldr >c13=r14,<c13_stack=[sp,#220]
ldr r14,[sp,#220]

# qhasm: v4 ^= (v9 >>> 13)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #13
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #13
eor r6,r6,r10,ROR #13

# qhasm: t11 ^= c14
# asm 1: eor >t11=int32#6,<t11=int32#10,<c14=int32#6
# asm 2: eor >t11=r5,<t11=r9,<c14=r5
eor r5,r9,r5

# qhasm: v3 += (v4 >>> 31)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #31
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #31
add r4,r4,r6,ROR #31

# qhasm: v3 += (t11 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t11=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t11=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t12 = mem32[&m12m13_stack]
# asm 1: ldr >t12=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t12=r5,<m12m13_stack=[sp,#88]
ldr r5,[sp,#88]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v3=int32#5,ROR #24
# asm 2: eor >v14=r8,<v14=r8,<v3=r4,ROR #24
eor r8,r8,r4,ROR #24

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v14=r8,<v10v14_stack=[sp,#116]
str r8,[sp,#116]

# qhasm: v9 += (v14 >>> 16)
# asm 1: add >v9=int32#9,<v9=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v9=r8,<v9=r10,<v14=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v9=r8,<v9v13_stack=[sp,#104]
str r8,[sp,#104]

# qhasm: v4 ^= (v9 >>> 1)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#9,ROR #1
# asm 2: eor >v4=r6,<v4=r6,<v9=r8,ROR #1
eor r6,r6,r8,ROR #1

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t12 ^= c13
# asm 1: eor >t12=int32#6,<t12=int32#6,<c13=int32#14
# asm 2: eor >t12=r5,<t12=r5,<c13=r14
eor r5,r5,r14

# qhasm: v2 += (v7 >>> 19)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #19
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #19
add r3,r3,r12,ROR #19

# qhasm: v2 += (t12 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t12=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t12=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#6,<c12_stack=stack32#23
# asm 2: ldr >c12=r5,<c12_stack=[sp,#216]
ldr r5,[sp,#216]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v2=int32#4,ROR #8
# asm 2: eor >v13=r8,<v13=r11,<v2=r3,ROR #8
eor r8,r11,r3,ROR #8

# qhasm: t13 = mem32[&m12m13_stack+4]
# asm 1: ldr >t13=int32#10,<m12m13_stack=stack64#12
# asm 2: ldr >t13=r9,<m12m13_stack=[sp,#92]
ldr r9,[sp,#92]

# qhasm: v8 += (v13 >>> 8)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v8=r10,<v8=r10,<v13=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#14,<c11_stack=stack32#22
# asm 2: ldr >c11=r14,<c11_stack=[sp,#212]
ldr r14,[sp,#212]

# qhasm: v7 ^= (v8 >>> 13)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#11,ROR #13
# asm 2: eor >v7=r12,<v7=r12,<v8=r10,ROR #13
eor r12,r12,r10,ROR #13

# qhasm: t13 ^= c12
# asm 1: eor >t13=int32#6,<t13=int32#10,<c12=int32#6
# asm 2: eor >t13=r5,<t13=r9,<c12=r5
eor r5,r9,r5

# qhasm: v2 += (v7 >>> 31)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #31
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #31
add r3,r3,r12,ROR #31

# qhasm: v2 += (t13 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t13=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t13=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t14 = mem32[&m10m11_stack]
# asm 1: ldr >t14=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t14=r5,<m10m11_stack=[sp,#80]
ldr r5,[sp,#80]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v2=int32#4,ROR #24
# asm 2: eor >v13=r8,<v13=r8,<v2=r3,ROR #24
eor r8,r8,r3,ROR #24

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v13=r8,<v9v13_stack=[sp,#108]
str r8,[sp,#108]

# qhasm: v8 += (v13 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v8=r8,<v8=r10,<v13=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t14 ^= c11
# asm 1: eor >t14=int32#6,<t14=int32#6,<c11=int32#14
# asm 2: eor >t14=r5,<t14=r5,<c11=r14
eor r5,r5,r14

# qhasm: v1 += (v6 >>> 19)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #19
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #19
add r2,r2,r1,ROR #19

# qhasm: v1 += (t14 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t14=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t14=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c10 = c10_stack
# asm 1: ldr >c10=int32#6,<c10_stack=stack32#21
# asm 2: ldr >c10=r5,<c10_stack=[sp,#208]
ldr r5,[sp,#208]

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#10,<v12=int32#12,<v1=int32#3,ROR #8
# asm 2: eor >v12=r9,<v12=r11,<v1=r2,ROR #8
eor r9,r11,r2,ROR #8

# qhasm: t15 = mem32[&m10m11_stack+4]
# asm 1: ldr >t15=int32#12,<m10m11_stack=stack64#11
# asm 2: ldr >t15=r11,<m10m11_stack=[sp,#84]
ldr r11,[sp,#84]

# qhasm: v11 += (v12 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #8
add r10,r10,r9,ROR #8

# qhasm: v7 ^= (v8 >>> 1)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#9,ROR #1
# asm 2: eor >v7=r12,<v7=r12,<v8=r8,ROR #1
eor r12,r12,r8,ROR #1

# qhasm: v6 ^= (v11 >>> 13)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #13
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #13
eor r1,r1,r10,ROR #13

# qhasm: t15 ^= c10
# asm 1: eor >t15=int32#12,<t15=int32#12,<c10=int32#6
# asm 2: eor >t15=r11,<t15=r11,<c10=r5
eor r11,r11,r5

# qhasm: v1 += (v6 >>> 31)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #31
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #31
add r2,r2,r1,ROR #31

# qhasm: v1 += (t15 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t15=int32#12,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t15=r11,ROR #0
add r2,r2,r11,ROR #0

# qhasm: t16 = mem32[&m14m15_stack]
# asm 1: ldr >t16=int32#12,<m14m15_stack=stack64#13
# asm 2: ldr >t16=r11,<m14m15_stack=[sp,#96]
ldr r11,[sp,#96]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v1=int32#3,ROR #24
# asm 2: eor >v12=r9,<v12=r9,<v1=r2,ROR #24
eor r9,r9,r2,ROR #24

# qhasm: v0 += (v4 >>> 6)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #6
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #6
add r0,r0,r6,ROR #6

# qhasm: v11 += (v12 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#11,<v11v15_stack=stack64#16
# asm 2: str <v11=r10,<v11v15_stack=[sp,#120]
str r10,[sp,#120]

# qhasm: v6 ^= (v11 >>> 1)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #1
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #1
eor r1,r1,r10,ROR #1

# qhasm: t16 ^= c10
# asm 1: eor >t16=int32#6,<t16=int32#12,<c10=int32#6
# asm 2: eor >t16=r5,<t16=r11,<c10=r5
eor r5,r11,r5

# qhasm: v0 += (t16 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t16=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t16=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#6,<c14_stack=stack32#25
# asm 2: ldr >c14=r5,<c14_stack=[sp,#224]
ldr r5,[sp,#224]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: t17 = mem32[&m10m11_stack]
# asm 1: ldr >t17=int32#11,<m10m11_stack=stack64#11
# asm 2: ldr >t17=r10,<m10m11_stack=[sp,#80]
ldr r10,[sp,#80]

# qhasm: v8 += (v12 >>> 0)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #0
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #0
add r8,r8,r9,ROR #0

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#14,<c8_stack=stack32#19
# asm 2: ldr >c8=r14,<c8_stack=[sp,#200]
ldr r14,[sp,#200]

# qhasm: v4 ^= (v8 >>> 26)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #26
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #26
eor r6,r6,r8,ROR #26

# qhasm: t17 ^= c14
# asm 1: eor >t17=int32#6,<t17=int32#11,<c14=int32#6
# asm 2: eor >t17=r5,<t17=r10,<c14=r5
eor r5,r10,r5

# qhasm: v0 += (v4 >>> 18)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #18
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #18
add r0,r0,r6,ROR #18

# qhasm: v0 += (t17 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t17=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t17=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t18 = mem32[&m4m5_stack]
# asm 1: ldr >t18=int32#6,<m4m5_stack=stack64#8
# asm 2: ldr >t18=r5,<m4m5_stack=[sp,#56]
ldr r5,[sp,#56]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #0
eor r9,r9,r0,ROR #0

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 8)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #8
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 14)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #14
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #14
eor r6,r6,r8,ROR #14

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t18 ^= c8
# asm 1: eor >t18=int32#6,<t18=int32#6,<c8=int32#14
# asm 2: eor >t18=r5,<t18=r5,<c8=r14
eor r5,r5,r14

# qhasm: v1 += (v5 >>> 6)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #6
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #6
add r2,r2,r7,ROR #6

# qhasm: v1 += (t18 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t18=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t18=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#6,<c4_stack=stack32#15
# asm 2: ldr >c4=r5,<c4_stack=[sp,#184]
ldr r5,[sp,#184]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #16
eor r8,r11,r2,ROR #16

# qhasm: t19 = mem32[&m8m9_stack]
# asm 1: ldr >t19=int32#10,<m8m9_stack=stack64#10
# asm 2: ldr >t19=r9,<m8m9_stack=[sp,#72]
ldr r9,[sp,#72]

# qhasm: v9 += (v13 >>> 0)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #0
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c15 = c15_stack
# asm 1: ldr >c15=int32#14,<c15_stack=stack32#26
# asm 2: ldr >c15=r14,<c15_stack=[sp,#228]
ldr r14,[sp,#228]

# qhasm: v5 ^= (v9 >>> 26)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #26
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #26
eor r7,r7,r10,ROR #26

# qhasm: t19 ^= c4
# asm 1: eor >t19=int32#6,<t19=int32#10,<c4=int32#6
# asm 2: eor >t19=r5,<t19=r9,<c4=r5
eor r5,r9,r5

# qhasm: v1 += (v5 >>> 18)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #18
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #18
add r2,r2,r7,ROR #18

# qhasm: v1 += (t19 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t19=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t19=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t20 = mem32[&m8m9_stack+4]
# asm 1: ldr >t20=int32#6,<m8m9_stack=stack64#10
# asm 2: ldr >t20=r5,<m8m9_stack=[sp,#76]
ldr r5,[sp,#76]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #0
eor r8,r8,r2,ROR #0

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 8)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 14)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #14
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #14
eor r7,r7,r8,ROR #14

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t20 ^= c15
# asm 1: eor >t20=int32#6,<t20=int32#6,<c15=int32#14
# asm 2: eor >t20=r5,<t20=r5,<c15=r14
eor r5,r5,r14

# qhasm: v2 += (v6 >>> 6)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #6
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #6
add r3,r3,r1,ROR #6

# qhasm: v2 += (t20 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t20=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t20=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#6,<c9_stack=stack32#20
# asm 2: ldr >c9=r5,<c9_stack=[sp,#204]
ldr r5,[sp,#204]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #16
eor r8,r11,r3,ROR #16

# qhasm: t21 = mem32[&m14m15_stack+4]
# asm 1: ldr >t21=int32#10,<m14m15_stack=stack64#13
# asm 2: ldr >t21=r9,<m14m15_stack=[sp,#100]
ldr r9,[sp,#100]

# qhasm: v10 += (v14 >>> 0)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #0
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#14,<c6_stack=stack32#17
# asm 2: ldr >c6=r14,<c6_stack=[sp,#192]
ldr r14,[sp,#192]

# qhasm: v6 ^= (v10 >>> 26)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #26
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #26
eor r1,r1,r10,ROR #26

# qhasm: t21 ^= c9
# asm 1: eor >t21=int32#6,<t21=int32#10,<c9=int32#6
# asm 2: eor >t21=r5,<t21=r9,<c9=r5
eor r5,r9,r5

# qhasm: v2 += (v6 >>> 18)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #18
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #18
add r3,r3,r1,ROR #18

# qhasm: v2 += (t21 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t21=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t21=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t22 = mem32[&m12m13_stack+4]
# asm 1: ldr >t22=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t22=r5,<m12m13_stack=[sp,#92]
ldr r5,[sp,#92]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #0
eor r8,r8,r3,ROR #0

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t22 ^= c6
# asm 1: eor >t22=int32#6,<t22=int32#6,<c6=int32#14
# asm 2: eor >t22=r5,<t22=r5,<c6=r14
eor r5,r5,r14

# qhasm: v3 += (v7 >>> 6)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #6
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #6
add r4,r4,r12,ROR #6

# qhasm: v3 += (t22 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t22=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t22=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#6,<c13_stack=stack32#24
# asm 2: ldr >c13=r5,<c13_stack=[sp,#220]
ldr r5,[sp,#220]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#10,<v15=int32#12,<v3=int32#5,ROR #16
# asm 2: eor >v15=r9,<v15=r11,<v3=r4,ROR #16
eor r9,r11,r4,ROR #16

# qhasm: t23 = mem32[&m6m7_stack]
# asm 1: ldr >t23=int32#12,<m6m7_stack=stack64#9
# asm 2: ldr >t23=r11,<m6m7_stack=[sp,#64]
ldr r11,[sp,#64]

# qhasm: v11 += (v15 >>> 0)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #0
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #0
add r10,r10,r9,ROR #0

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#14,<c12_stack=stack32#23
# asm 2: ldr >c12=r14,<c12_stack=[sp,#216]
ldr r14,[sp,#216]

# qhasm: v7 ^= (v11 >>> 26)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #26
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #26
eor r12,r12,r10,ROR #26

# qhasm: t23 ^= c13
# asm 1: eor >t23=int32#6,<t23=int32#12,<c13=int32#6
# asm 2: eor >t23=r5,<t23=r11,<c13=r5
eor r5,r11,r5

# qhasm: v3 += (v7 >>> 18)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #18
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #18
add r4,r4,r12,ROR #18

# qhasm: v3 += (t23 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t23=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t23=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t24 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t24=int32#6,<m0m1_stack=stack64#6
# asm 2: ldr >t24=r5,<m0m1_stack=[sp,#44]
ldr r5,[sp,#44]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v3=int32#5,ROR #0
# asm 2: eor >v15=r9,<v15=r9,<v3=r4,ROR #0
eor r9,r9,r4,ROR #0

# qhasm: v6 ^= (v10 >>> 14)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #14
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #14
eor r1,r1,r8,ROR #14

# qhasm: v11 += (v15 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #8
add r10,r10,r9,ROR #8

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 14)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #14
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #14
eor r12,r12,r10,ROR #14

# qhasm: t24 ^= c12
# asm 1: eor >t24=int32#6,<t24=int32#6,<c12=int32#14
# asm 2: eor >t24=r5,<t24=r5,<c12=r14
eor r5,r5,r14

# qhasm: v0 += (v5 >>> 25)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #25
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #25
add r0,r0,r7,ROR #25

# qhasm: v0 += (t24 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t24=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t24=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#6,<c1_stack=stack32#12
# asm 2: ldr >c1=r5,<c1_stack=[sp,#172]
ldr r5,[sp,#172]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #24
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #24
eor r9,r9,r0,ROR #24

# qhasm: t25 = mem32[&m12m13_stack]
# asm 1: ldr >t25=int32#11,<m12m13_stack=stack64#12
# asm 2: ldr >t25=r10,<m12m13_stack=[sp,#88]
ldr r10,[sp,#88]

# qhasm: v10 += (v15 >>> 24)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #24
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #24
add r8,r8,r9,ROR #24

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#14,<c3_stack=stack32#14
# asm 2: ldr >c3=r14,<c3_stack=[sp,#180]
ldr r14,[sp,#180]

# qhasm: v5 ^= (v10 >>> 7)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #7
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #7
eor r7,r7,r8,ROR #7

# qhasm: t25 ^= c1
# asm 1: eor >t25=int32#6,<t25=int32#11,<c1=int32#6
# asm 2: eor >t25=r5,<t25=r10,<c1=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 5)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #5
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #5
add r0,r0,r7,ROR #5

# qhasm: v0 += (t25 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t25=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t25=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t26 = mem32[&m4m5_stack+4]
# asm 1: ldr >t26=int32#6,<m4m5_stack=stack64#8
# asm 2: ldr >t26=r5,<m4m5_stack=[sp,#60]
ldr r5,[sp,#60]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #8
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #8
eor r9,r9,r0,ROR #8

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#10,<v11v15_stack=stack64#16
# asm 2: str <v15=r9,<v11v15_stack=[sp,#124]
str r9,[sp,#124]

# qhasm: v10 += (v15 >>> 0)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #0
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #0
add r8,r8,r9,ROR #0

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 27)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #27
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #27
eor r7,r7,r8,ROR #27

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t26 ^= c3
# asm 1: eor >t26=int32#6,<t26=int32#6,<c3=int32#14
# asm 2: eor >t26=r5,<t26=r5,<c3=r14
eor r5,r5,r14

# qhasm: v3 += (v4 >>> 25)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #25
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #25
add r4,r4,r6,ROR #25

# qhasm: v3 += (t26 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t26=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t26=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#6,<c5_stack=stack32#16
# asm 2: ldr >c5=r5,<c5_stack=[sp,#188]
ldr r5,[sp,#188]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#5,ROR #24
# asm 2: eor >v14=r8,<v14=r11,<v3=r4,ROR #24
eor r8,r11,r4,ROR #24

# qhasm: t27 = mem32[&m2m3_stack+4]
# asm 1: ldr >t27=int32#10,<m2m3_stack=stack64#7
# asm 2: ldr >t27=r9,<m2m3_stack=[sp,#52]
ldr r9,[sp,#52]

# qhasm: v9 += (v14 >>> 24)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #24
add r10,r10,r8,ROR #24

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#14,<c7_stack=stack32#18
# asm 2: ldr >c7=r14,<c7_stack=[sp,#196]
ldr r14,[sp,#196]

# qhasm: v4 ^= (v9 >>> 7)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #7
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #7
eor r6,r6,r10,ROR #7

# qhasm: t27 ^= c5
# asm 1: eor >t27=int32#6,<t27=int32#10,<c5=int32#6
# asm 2: eor >t27=r5,<t27=r9,<c5=r5
eor r5,r9,r5

# qhasm: v3 += (v4 >>> 5)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #5
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #5
add r4,r4,r6,ROR #5

# qhasm: v3 += (t27 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t27=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t27=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t28 = mem32[&m10m11_stack+4]
# asm 1: ldr >t28=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t28=r5,<m10m11_stack=[sp,#84]
ldr r5,[sp,#84]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v3=int32#5,ROR #8
# asm 2: eor >v14=r8,<v14=r8,<v3=r4,ROR #8
eor r8,r8,r4,ROR #8

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v14=r8,<v10v14_stack=[sp,#116]
str r8,[sp,#116]

# qhasm: v9 += (v14 >>> 0)
# asm 1: add >v9=int32#9,<v9=int32#11,<v14=int32#9,ROR #0
# asm 2: add >v9=r8,<v9=r10,<v14=r8,ROR #0
add r8,r10,r8,ROR #0

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v9=r8,<v9v13_stack=[sp,#104]
str r8,[sp,#104]

# qhasm: v4 ^= (v9 >>> 27)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#9,ROR #27
# asm 2: eor >v4=r6,<v4=r6,<v9=r8,ROR #27
eor r6,r6,r8,ROR #27

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t28 ^= c7
# asm 1: eor >t28=int32#6,<t28=int32#6,<c7=int32#14
# asm 2: eor >t28=r5,<t28=r5,<c7=r14
eor r5,r5,r14

# qhasm: v2 += (v7 >>> 25)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #25
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #25
add r3,r3,r12,ROR #25

# qhasm: v2 += (t28 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t28=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t28=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#6,<c11_stack=stack32#22
# asm 2: ldr >c11=r5,<c11_stack=[sp,#212]
ldr r5,[sp,#212]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v2=int32#4,ROR #24
# asm 2: eor >v13=r8,<v13=r11,<v2=r3,ROR #24
eor r8,r11,r3,ROR #24

# qhasm: t29 = mem32[&m6m7_stack+4]
# asm 1: ldr >t29=int32#10,<m6m7_stack=stack64#9
# asm 2: ldr >t29=r9,<m6m7_stack=[sp,#68]
ldr r9,[sp,#68]

# qhasm: v8 += (v13 >>> 24)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#9,ROR #24
# asm 2: add >v8=r10,<v8=r10,<v13=r8,ROR #24
add r10,r10,r8,ROR #24

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#14,<c2_stack=stack32#13
# asm 2: ldr >c2=r14,<c2_stack=[sp,#176]
ldr r14,[sp,#176]

# qhasm: v7 ^= (v8 >>> 7)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#11,ROR #7
# asm 2: eor >v7=r12,<v7=r12,<v8=r10,ROR #7
eor r12,r12,r10,ROR #7

# qhasm: t29 ^= c11
# asm 1: eor >t29=int32#6,<t29=int32#10,<c11=int32#6
# asm 2: eor >t29=r5,<t29=r9,<c11=r5
eor r5,r9,r5

# qhasm: v2 += (v7 >>> 5)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #5
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #5
add r3,r3,r12,ROR #5

# qhasm: v2 += (t29 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t29=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t29=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t30 = mem32[&m0m1_stack]
# asm 1: ldr >t30=int32#6,<m0m1_stack=stack64#6
# asm 2: ldr >t30=r5,<m0m1_stack=[sp,#40]
ldr r5,[sp,#40]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v2=int32#4,ROR #8
# asm 2: eor >v13=r8,<v13=r8,<v2=r3,ROR #8
eor r8,r8,r3,ROR #8

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v13=r8,<v9v13_stack=[sp,#108]
str r8,[sp,#108]

# qhasm: v8 += (v13 >>> 0)
# asm 1: add >v8=int32#9,<v8=int32#11,<v13=int32#9,ROR #0
# asm 2: add >v8=r8,<v8=r10,<v13=r8,ROR #0
add r8,r10,r8,ROR #0

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t30 ^= c2
# asm 1: eor >t30=int32#6,<t30=int32#6,<c2=int32#14
# asm 2: eor >t30=r5,<t30=r5,<c2=r14
eor r5,r5,r14

# qhasm: v1 += (v6 >>> 25)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #25
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #25
add r2,r2,r1,ROR #25

# qhasm: v1 += (t30 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t30=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t30=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#6,<c0_stack=stack32#11
# asm 2: ldr >c0=r5,<c0_stack=[sp,#168]
ldr r5,[sp,#168]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#10,<v12=int32#12,<v1=int32#3,ROR #24
# asm 2: eor >v12=r9,<v12=r11,<v1=r2,ROR #24
eor r9,r11,r2,ROR #24

# qhasm: t31 = mem32[&m2m3_stack]
# asm 1: ldr >t31=int32#12,<m2m3_stack=stack64#7
# asm 2: ldr >t31=r11,<m2m3_stack=[sp,#48]
ldr r11,[sp,#48]

# qhasm: v11 += (v12 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #24
add r10,r10,r9,ROR #24

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#14,<c8_stack=stack32#19
# asm 2: ldr >c8=r14,<c8_stack=[sp,#200]
ldr r14,[sp,#200]

# qhasm: v6 ^= (v11 >>> 7)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #7
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #7
eor r1,r1,r10,ROR #7

# qhasm: t31 ^= c0
# asm 1: eor >t31=int32#6,<t31=int32#12,<c0=int32#6
# asm 2: eor >t31=r5,<t31=r11,<c0=r5
eor r5,r11,r5

# qhasm: v1 += (v6 >>> 5)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #5
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #5
add r2,r2,r1,ROR #5

# qhasm: v1 += (t31 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t31=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t31=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t32 = mem32[&m10m11_stack+4]
# asm 1: ldr >t32=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t32=r5,<m10m11_stack=[sp,#84]
ldr r5,[sp,#84]

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v1=int32#3,ROR #8
# asm 2: eor >v12=r9,<v12=r9,<v1=r2,ROR #8
eor r9,r9,r2,ROR #8

# qhasm: v7 ^= (v8 >>> 27)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#9,ROR #27
# asm 2: eor >v7=r12,<v7=r12,<v8=r8,ROR #27
eor r12,r12,r8,ROR #27

# qhasm: v11 += (v12 >>> 0)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #0
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #0
add r10,r10,r9,ROR #0

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#11,<v11v15_stack=stack64#16
# asm 2: str <v11=r10,<v11v15_stack=[sp,#120]
str r10,[sp,#120]

# qhasm: v6 ^= (v11 >>> 27)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #27
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #27
eor r1,r1,r10,ROR #27

# qhasm: t32 ^= c8
# asm 1: eor >t32=int32#6,<t32=int32#6,<c8=int32#14
# asm 2: eor >t32=r5,<t32=r5,<c8=r14
eor r5,r5,r14

# qhasm: v0 += (v4 >>> 12)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #12
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #12
add r0,r0,r6,ROR #12

# qhasm: v0 += (t32 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t32=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t32=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#6,<c11_stack=stack32#22
# asm 2: ldr >c11=r5,<c11_stack=[sp,#212]
ldr r5,[sp,#212]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #0
eor r9,r9,r0,ROR #0

# qhasm: t33 = mem32[&m8m9_stack]
# asm 1: ldr >t33=int32#11,<m8m9_stack=stack64#10
# asm 2: ldr >t33=r10,<m8m9_stack=[sp,#72]
ldr r10,[sp,#72]

# qhasm: v8 += (v12 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #16
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#14,<c0_stack=stack32#11
# asm 2: ldr >c0=r14,<c0_stack=[sp,#168]
ldr r14,[sp,#168]

# qhasm: v4 ^= (v8 >>> 20)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #20
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #20
eor r6,r6,r8,ROR #20

# qhasm: t33 ^= c11
# asm 1: eor >t33=int32#6,<t33=int32#11,<c11=int32#6
# asm 2: eor >t33=r5,<t33=r10,<c11=r5
eor r5,r10,r5

# qhasm: v0 += (v4 >>> 24)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #24
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #24
add r0,r0,r6,ROR #24

# qhasm: v0 += (t33 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t33=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t33=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t34 = mem32[&m12m13_stack]
# asm 1: ldr >t34=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t34=r5,<m12m13_stack=[sp,#88]
ldr r5,[sp,#88]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 24)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #24
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #24
add r8,r8,r9,ROR #24

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 8)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #8
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #8
eor r6,r6,r8,ROR #8

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t34 ^= c0
# asm 1: eor >t34=int32#6,<t34=int32#6,<c0=int32#14
# asm 2: eor >t34=r5,<t34=r5,<c0=r14
eor r5,r5,r14

# qhasm: v1 += (v5 >>> 12)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #12
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #12
add r2,r2,r7,ROR #12

# qhasm: v1 += (t34 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t34=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t34=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#6,<c12_stack=stack32#23
# asm 2: ldr >c12=r5,<c12_stack=[sp,#216]
ldr r5,[sp,#216]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #0
eor r8,r11,r2,ROR #0

# qhasm: t35 = mem32[&m0m1_stack]
# asm 1: ldr >t35=int32#10,<m0m1_stack=stack64#6
# asm 2: ldr >t35=r9,<m0m1_stack=[sp,#40]
ldr r9,[sp,#40]

# qhasm: v9 += (v13 >>> 16)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#14,<c2_stack=stack32#13
# asm 2: ldr >c2=r14,<c2_stack=[sp,#176]
ldr r14,[sp,#176]

# qhasm: v5 ^= (v9 >>> 20)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #20
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #20
eor r7,r7,r10,ROR #20

# qhasm: t35 ^= c12
# asm 1: eor >t35=int32#6,<t35=int32#10,<c12=int32#6
# asm 2: eor >t35=r5,<t35=r9,<c12=r5
eor r5,r9,r5

# qhasm: v1 += (v5 >>> 24)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #24
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #24
add r2,r2,r7,ROR #24

# qhasm: v1 += (t35 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t35=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t35=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t36 = mem32[&m4m5_stack+4]
# asm 1: ldr >t36=int32#6,<m4m5_stack=stack64#8
# asm 2: ldr >t36=r5,<m4m5_stack=[sp,#60]
ldr r5,[sp,#60]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #16
eor r8,r8,r2,ROR #16

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 24)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #24
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 8)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #8
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #8
eor r7,r7,r8,ROR #8

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t36 ^= c2
# asm 1: eor >t36=int32#6,<t36=int32#6,<c2=int32#14
# asm 2: eor >t36=r5,<t36=r5,<c2=r14
eor r5,r5,r14

# qhasm: v2 += (v6 >>> 12)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #12
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #12
add r3,r3,r1,ROR #12

# qhasm: v2 += (t36 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t36=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t36=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#6,<c5_stack=stack32#16
# asm 2: ldr >c5=r5,<c5_stack=[sp,#188]
ldr r5,[sp,#188]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #0
eor r8,r11,r3,ROR #0

# qhasm: t37 = mem32[&m2m3_stack]
# asm 1: ldr >t37=int32#10,<m2m3_stack=stack64#7
# asm 2: ldr >t37=r9,<m2m3_stack=[sp,#48]
ldr r9,[sp,#48]

# qhasm: v10 += (v14 >>> 16)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#14,<c13_stack=stack32#24
# asm 2: ldr >c13=r14,<c13_stack=[sp,#220]
ldr r14,[sp,#220]

# qhasm: v6 ^= (v10 >>> 20)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #20
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #20
eor r1,r1,r10,ROR #20

# qhasm: t37 ^= c5
# asm 1: eor >t37=int32#6,<t37=int32#10,<c5=int32#6
# asm 2: eor >t37=r5,<t37=r9,<c5=r5
eor r5,r9,r5

# qhasm: v2 += (v6 >>> 24)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #24
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #24
add r3,r3,r1,ROR #24

# qhasm: v2 += (t37 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t37=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t37=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t38 = mem32[&m14m15_stack+4]
# asm 1: ldr >t38=int32#6,<m14m15_stack=stack64#13
# asm 2: ldr >t38=r5,<m14m15_stack=[sp,#100]
ldr r5,[sp,#100]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #16
eor r8,r8,r3,ROR #16

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 24)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t38 ^= c13
# asm 1: eor >t38=int32#6,<t38=int32#6,<c13=int32#14
# asm 2: eor >t38=r5,<t38=r5,<c13=r14
eor r5,r5,r14

# qhasm: v3 += (v7 >>> 12)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #12
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #12
add r4,r4,r12,ROR #12

# qhasm: v3 += (t38 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t38=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t38=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c15 = c15_stack
# asm 1: ldr >c15=int32#6,<c15_stack=stack32#26
# asm 2: ldr >c15=r5,<c15_stack=[sp,#228]
ldr r5,[sp,#228]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#10,<v15=int32#12,<v3=int32#5,ROR #0
# asm 2: eor >v15=r9,<v15=r11,<v3=r4,ROR #0
eor r9,r11,r4,ROR #0

# qhasm: t39 = mem32[&m12m13_stack+4]
# asm 1: ldr >t39=int32#12,<m12m13_stack=stack64#12
# asm 2: ldr >t39=r11,<m12m13_stack=[sp,#92]
ldr r11,[sp,#92]

# qhasm: v11 += (v15 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#14,<c14_stack=stack32#25
# asm 2: ldr >c14=r14,<c14_stack=[sp,#224]
ldr r14,[sp,#224]

# qhasm: v7 ^= (v11 >>> 20)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #20
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #20
eor r12,r12,r10,ROR #20

# qhasm: t39 ^= c15
# asm 1: eor >t39=int32#6,<t39=int32#12,<c15=int32#6
# asm 2: eor >t39=r5,<t39=r11,<c15=r5
eor r5,r11,r5

# qhasm: v3 += (v7 >>> 24)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #24
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #24
add r4,r4,r12,ROR #24

# qhasm: v3 += (t39 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t39=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t39=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t40 = mem32[&m10m11_stack]
# asm 1: ldr >t40=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t40=r5,<m10m11_stack=[sp,#80]
ldr r5,[sp,#80]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v3=int32#5,ROR #16
# asm 2: eor >v15=r9,<v15=r9,<v3=r4,ROR #16
eor r9,r9,r4,ROR #16

# qhasm: v6 ^= (v10 >>> 8)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #8
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #8
eor r1,r1,r8,ROR #8

# qhasm: v11 += (v15 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #24
add r10,r10,r9,ROR #24

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 8)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #8
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #8
eor r12,r12,r10,ROR #8

# qhasm: t40 ^= c14
# asm 1: eor >t40=int32#6,<t40=int32#6,<c14=int32#14
# asm 2: eor >t40=r5,<t40=r5,<c14=r14
eor r5,r5,r14

# qhasm: v0 += (v5 >>> 31)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #31
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #31
add r0,r0,r7,ROR #31

# qhasm: v0 += (t40 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t40=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t40=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c10 = c10_stack
# asm 1: ldr >c10=int32#6,<c10_stack=stack32#21
# asm 2: ldr >c10=r5,<c10_stack=[sp,#208]
ldr r5,[sp,#208]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #8
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #8
eor r9,r9,r0,ROR #8

# qhasm: t41 = mem32[&m14m15_stack]
# asm 1: ldr >t41=int32#11,<m14m15_stack=stack64#13
# asm 2: ldr >t41=r10,<m14m15_stack=[sp,#96]
ldr r10,[sp,#96]

# qhasm: v10 += (v15 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #8
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#14,<c4_stack=stack32#15
# asm 2: ldr >c4=r14,<c4_stack=[sp,#184]
ldr r14,[sp,#184]

# qhasm: v5 ^= (v10 >>> 1)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #1
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #1
eor r7,r7,r8,ROR #1

# qhasm: t41 ^= c10
# asm 1: eor >t41=int32#6,<t41=int32#11,<c10=int32#6
# asm 2: eor >t41=r5,<t41=r10,<c10=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 11)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #11
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #11
add r0,r0,r7,ROR #11

# qhasm: v0 += (t41 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t41=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t41=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t42 = mem32[&m8m9_stack+4]
# asm 1: ldr >t42=int32#6,<m8m9_stack=stack64#10
# asm 2: ldr >t42=r5,<m8m9_stack=[sp,#76]
ldr r5,[sp,#76]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #24
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #24
eor r9,r9,r0,ROR #24

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#10,<v11v15_stack=stack64#16
# asm 2: str <v15=r9,<v11v15_stack=[sp,#124]
str r9,[sp,#124]

# qhasm: v10 += (v15 >>> 16)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #16
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 21)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #21
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #21
eor r7,r7,r8,ROR #21

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t42 ^= c4
# asm 1: eor >t42=int32#6,<t42=int32#6,<c4=int32#14
# asm 2: eor >t42=r5,<t42=r5,<c4=r14
eor r5,r5,r14

# qhasm: v3 += (v4 >>> 31)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #31
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #31
add r4,r4,r6,ROR #31

# qhasm: v3 += (t42 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t42=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t42=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#6,<c9_stack=stack32#20
# asm 2: ldr >c9=r5,<c9_stack=[sp,#204]
ldr r5,[sp,#204]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#5,ROR #8
# asm 2: eor >v14=r8,<v14=r11,<v3=r4,ROR #8
eor r8,r11,r4,ROR #8

# qhasm: t43 = mem32[&m4m5_stack]
# asm 1: ldr >t43=int32#10,<m4m5_stack=stack64#8
# asm 2: ldr >t43=r9,<m4m5_stack=[sp,#56]
ldr r9,[sp,#56]

# qhasm: v9 += (v14 >>> 8)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#14,<c1_stack=stack32#12
# asm 2: ldr >c1=r14,<c1_stack=[sp,#172]
ldr r14,[sp,#172]

# qhasm: v4 ^= (v9 >>> 1)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #1
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #1
eor r6,r6,r10,ROR #1

# qhasm: t43 ^= c9
# asm 1: eor >t43=int32#6,<t43=int32#10,<c9=int32#6
# asm 2: eor >t43=r5,<t43=r9,<c9=r5
eor r5,r9,r5

# qhasm: v3 += (v4 >>> 11)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #11
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #11
add r4,r4,r6,ROR #11

# qhasm: v3 += (t43 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t43=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t43=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t44 = mem32[&m6m7_stack+4]
# asm 1: ldr >t44=int32#6,<m6m7_stack=stack64#9
# asm 2: ldr >t44=r5,<m6m7_stack=[sp,#68]
ldr r5,[sp,#68]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v3=int32#5,ROR #24
# asm 2: eor >v14=r8,<v14=r8,<v3=r4,ROR #24
eor r8,r8,r4,ROR #24

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v14=r8,<v10v14_stack=[sp,#116]
str r8,[sp,#116]

# qhasm: v9 += (v14 >>> 16)
# asm 1: add >v9=int32#9,<v9=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v9=r8,<v9=r10,<v14=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v9=r8,<v9v13_stack=[sp,#104]
str r8,[sp,#104]

# qhasm: v4 ^= (v9 >>> 21)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#9,ROR #21
# asm 2: eor >v4=r6,<v4=r6,<v9=r8,ROR #21
eor r6,r6,r8,ROR #21

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t44 ^= c1
# asm 1: eor >t44=int32#6,<t44=int32#6,<c1=int32#14
# asm 2: eor >t44=r5,<t44=r5,<c1=r14
eor r5,r5,r14

# qhasm: v2 += (v7 >>> 31)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #31
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #31
add r3,r3,r12,ROR #31

# qhasm: v2 += (t44 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t44=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t44=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#6,<c7_stack=stack32#18
# asm 2: ldr >c7=r5,<c7_stack=[sp,#196]
ldr r5,[sp,#196]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v2=int32#4,ROR #8
# asm 2: eor >v13=r8,<v13=r11,<v2=r3,ROR #8
eor r8,r11,r3,ROR #8

# qhasm: t45 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t45=int32#10,<m0m1_stack=stack64#6
# asm 2: ldr >t45=r9,<m0m1_stack=[sp,#44]
ldr r9,[sp,#44]

# qhasm: v8 += (v13 >>> 8)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v8=r10,<v8=r10,<v13=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#14,<c6_stack=stack32#17
# asm 2: ldr >c6=r14,<c6_stack=[sp,#192]
ldr r14,[sp,#192]

# qhasm: v7 ^= (v8 >>> 1)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#11,ROR #1
# asm 2: eor >v7=r12,<v7=r12,<v8=r10,ROR #1
eor r12,r12,r10,ROR #1

# qhasm: t45 ^= c7
# asm 1: eor >t45=int32#6,<t45=int32#10,<c7=int32#6
# asm 2: eor >t45=r5,<t45=r9,<c7=r5
eor r5,r9,r5

# qhasm: v2 += (v7 >>> 11)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #11
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #11
add r3,r3,r12,ROR #11

# qhasm: v2 += (t45 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t45=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t45=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t46 = mem32[&m2m3_stack+4]
# asm 1: ldr >t46=int32#6,<m2m3_stack=stack64#7
# asm 2: ldr >t46=r5,<m2m3_stack=[sp,#52]
ldr r5,[sp,#52]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v2=int32#4,ROR #24
# asm 2: eor >v13=r8,<v13=r8,<v2=r3,ROR #24
eor r8,r8,r3,ROR #24

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v13=r8,<v9v13_stack=[sp,#108]
str r8,[sp,#108]

# qhasm: v8 += (v13 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v8=r8,<v8=r10,<v13=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t46 ^= c6
# asm 1: eor >t46=int32#6,<t46=int32#6,<c6=int32#14
# asm 2: eor >t46=r5,<t46=r5,<c6=r14
eor r5,r5,r14

# qhasm: v1 += (v6 >>> 31)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #31
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #31
add r2,r2,r1,ROR #31

# qhasm: v1 += (t46 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t46=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t46=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#6,<c3_stack=stack32#14
# asm 2: ldr >c3=r5,<c3_stack=[sp,#180]
ldr r5,[sp,#180]

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#10,<v12=int32#12,<v1=int32#3,ROR #8
# asm 2: eor >v12=r9,<v12=r11,<v1=r2,ROR #8
eor r9,r11,r2,ROR #8

# qhasm: t47 = mem32[&m6m7_stack]
# asm 1: ldr >t47=int32#12,<m6m7_stack=stack64#9
# asm 2: ldr >t47=r11,<m6m7_stack=[sp,#64]
ldr r11,[sp,#64]

# qhasm: v11 += (v12 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #8
add r10,r10,r9,ROR #8

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#14,<c9_stack=stack32#20
# asm 2: ldr >c9=r14,<c9_stack=[sp,#204]
ldr r14,[sp,#204]

# qhasm: v6 ^= (v11 >>> 1)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #1
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #1
eor r1,r1,r10,ROR #1

# qhasm: t47 ^= c3
# asm 1: eor >t47=int32#6,<t47=int32#12,<c3=int32#6
# asm 2: eor >t47=r5,<t47=r11,<c3=r5
eor r5,r11,r5

# qhasm: v1 += (v6 >>> 11)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #11
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #11
add r2,r2,r1,ROR #11

# qhasm: v1 += (t47 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t47=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t47=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t48 = mem32[&m6m7_stack+4]
# asm 1: ldr >t48=int32#6,<m6m7_stack=stack64#9
# asm 2: ldr >t48=r5,<m6m7_stack=[sp,#68]
ldr r5,[sp,#68]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v1=int32#3,ROR #24
# asm 2: eor >v12=r9,<v12=r9,<v1=r2,ROR #24
eor r9,r9,r2,ROR #24

# qhasm: v7 ^= (v8 >>> 21)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#9,ROR #21
# asm 2: eor >v7=r12,<v7=r12,<v8=r8,ROR #21
eor r12,r12,r8,ROR #21

# qhasm: v11 += (v12 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#11,<v11v15_stack=stack64#16
# asm 2: str <v11=r10,<v11v15_stack=[sp,#120]
str r10,[sp,#120]

# qhasm: v6 ^= (v11 >>> 21)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #21
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #21
eor r1,r1,r10,ROR #21

# qhasm: t48 ^= c9
# asm 1: eor >t48=int32#6,<t48=int32#6,<c9=int32#14
# asm 2: eor >t48=r5,<t48=r5,<c9=r14
eor r5,r5,r14

# qhasm: v0 += (v4 >>> 18)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #18
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #18
add r0,r0,r6,ROR #18

# qhasm: v0 += (t48 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t48=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t48=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#6,<c7_stack=stack32#18
# asm 2: ldr >c7=r5,<c7_stack=[sp,#196]
ldr r5,[sp,#196]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: t49 = mem32[&m8m9_stack+4]
# asm 1: ldr >t49=int32#11,<m8m9_stack=stack64#10
# asm 2: ldr >t49=r10,<m8m9_stack=[sp,#76]
ldr r10,[sp,#76]

# qhasm: v8 += (v12 >>> 0)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #0
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #0
add r8,r8,r9,ROR #0

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#14,<c1_stack=stack32#12
# asm 2: ldr >c1=r14,<c1_stack=[sp,#172]
ldr r14,[sp,#172]

# qhasm: v4 ^= (v8 >>> 14)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #14
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #14
eor r6,r6,r8,ROR #14

# qhasm: t49 ^= c7
# asm 1: eor >t49=int32#6,<t49=int32#11,<c7=int32#6
# asm 2: eor >t49=r5,<t49=r10,<c7=r5
eor r5,r10,r5

# qhasm: v0 += (v4 >>> 30)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #30
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #30
add r0,r0,r6,ROR #30

# qhasm: v0 += (t49 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t49=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t49=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t50 = mem32[&m2m3_stack+4]
# asm 1: ldr >t50=int32#6,<m2m3_stack=stack64#7
# asm 2: ldr >t50=r5,<m2m3_stack=[sp,#52]
ldr r5,[sp,#52]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #0
eor r9,r9,r0,ROR #0

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 8)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #8
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 2)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #2
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #2
eor r6,r6,r8,ROR #2

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t50 ^= c1
# asm 1: eor >t50=int32#6,<t50=int32#6,<c1=int32#14
# asm 2: eor >t50=r5,<t50=r5,<c1=r14
eor r5,r5,r14

# qhasm: v1 += (v5 >>> 18)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #18
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #18
add r2,r2,r7,ROR #18

# qhasm: v1 += (t50 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t50=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t50=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#6,<c3_stack=stack32#14
# asm 2: ldr >c3=r5,<c3_stack=[sp,#180]
ldr r5,[sp,#180]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #16
eor r8,r11,r2,ROR #16

# qhasm: t51 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t51=int32#10,<m0m1_stack=stack64#6
# asm 2: ldr >t51=r9,<m0m1_stack=[sp,#44]
ldr r9,[sp,#44]

# qhasm: v9 += (v13 >>> 0)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #0
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#14,<c12_stack=stack32#23
# asm 2: ldr >c12=r14,<c12_stack=[sp,#216]
ldr r14,[sp,#216]

# qhasm: v5 ^= (v9 >>> 14)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #14
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #14
eor r7,r7,r10,ROR #14

# qhasm: t51 ^= c3
# asm 1: eor >t51=int32#6,<t51=int32#10,<c3=int32#6
# asm 2: eor >t51=r5,<t51=r9,<c3=r5
eor r5,r9,r5

# qhasm: v1 += (v5 >>> 30)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #30
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #30
add r2,r2,r7,ROR #30

# qhasm: v1 += (t51 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t51=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t51=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t52 = mem32[&m12m13_stack+4]
# asm 1: ldr >t52=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t52=r5,<m12m13_stack=[sp,#92]
ldr r5,[sp,#92]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #0
eor r8,r8,r2,ROR #0

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 8)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 2)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #2
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #2
eor r7,r7,r8,ROR #2

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t52 ^= c12
# asm 1: eor >t52=int32#6,<t52=int32#6,<c12=int32#14
# asm 2: eor >t52=r5,<t52=r5,<c12=r14
eor r5,r5,r14

# qhasm: v2 += (v6 >>> 18)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #18
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #18
add r3,r3,r1,ROR #18

# qhasm: v2 += (t52 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t52=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t52=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#6,<c13_stack=stack32#24
# asm 2: ldr >c13=r5,<c13_stack=[sp,#220]
ldr r5,[sp,#220]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #16
eor r8,r11,r3,ROR #16

# qhasm: t53 = mem32[&m12m13_stack]
# asm 1: ldr >t53=int32#10,<m12m13_stack=stack64#12
# asm 2: ldr >t53=r9,<m12m13_stack=[sp,#88]
ldr r9,[sp,#88]

# qhasm: v10 += (v14 >>> 0)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #0
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#14,<c14_stack=stack32#25
# asm 2: ldr >c14=r14,<c14_stack=[sp,#224]
ldr r14,[sp,#224]

# qhasm: v6 ^= (v10 >>> 14)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #14
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #14
eor r1,r1,r10,ROR #14

# qhasm: t53 ^= c13
# asm 1: eor >t53=int32#6,<t53=int32#10,<c13=int32#6
# asm 2: eor >t53=r5,<t53=r9,<c13=r5
eor r5,r9,r5

# qhasm: v2 += (v6 >>> 30)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #30
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #30
add r3,r3,r1,ROR #30

# qhasm: v2 += (t53 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t53=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t53=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t54 = mem32[&m10m11_stack+4]
# asm 1: ldr >t54=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t54=r5,<m10m11_stack=[sp,#84]
ldr r5,[sp,#84]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #0
eor r8,r8,r3,ROR #0

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t54 ^= c14
# asm 1: eor >t54=int32#6,<t54=int32#6,<c14=int32#14
# asm 2: eor >t54=r5,<t54=r5,<c14=r14
eor r5,r5,r14

# qhasm: v3 += (v7 >>> 18)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #18
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #18
add r4,r4,r12,ROR #18

# qhasm: v3 += (t54 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t54=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t54=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#6,<c11_stack=stack32#22
# asm 2: ldr >c11=r5,<c11_stack=[sp,#212]
ldr r5,[sp,#212]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#10,<v15=int32#12,<v3=int32#5,ROR #16
# asm 2: eor >v15=r9,<v15=r11,<v3=r4,ROR #16
eor r9,r11,r4,ROR #16

# qhasm: t55 = mem32[&m14m15_stack]
# asm 1: ldr >t55=int32#12,<m14m15_stack=stack64#13
# asm 2: ldr >t55=r11,<m14m15_stack=[sp,#96]
ldr r11,[sp,#96]

# qhasm: v11 += (v15 >>> 0)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #0
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #0
add r10,r10,r9,ROR #0

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#14,<c6_stack=stack32#17
# asm 2: ldr >c6=r14,<c6_stack=[sp,#192]
ldr r14,[sp,#192]

# qhasm: v7 ^= (v11 >>> 14)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #14
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #14
eor r12,r12,r10,ROR #14

# qhasm: t55 ^= c11
# asm 1: eor >t55=int32#6,<t55=int32#12,<c11=int32#6
# asm 2: eor >t55=r5,<t55=r11,<c11=r5
eor r5,r11,r5

# qhasm: v3 += (v7 >>> 30)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #30
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #30
add r4,r4,r12,ROR #30

# qhasm: v3 += (t55 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t55=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t55=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t56 = mem32[&m2m3_stack]
# asm 1: ldr >t56=int32#6,<m2m3_stack=stack64#7
# asm 2: ldr >t56=r5,<m2m3_stack=[sp,#48]
ldr r5,[sp,#48]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v3=int32#5,ROR #0
# asm 2: eor >v15=r9,<v15=r9,<v3=r4,ROR #0
eor r9,r9,r4,ROR #0

# qhasm: v6 ^= (v10 >>> 2)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #2
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #2
eor r1,r1,r8,ROR #2

# qhasm: v11 += (v15 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #8
add r10,r10,r9,ROR #8

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 2)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #2
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #2
eor r12,r12,r10,ROR #2

# qhasm: t56 ^= c6
# asm 1: eor >t56=int32#6,<t56=int32#6,<c6=int32#14
# asm 2: eor >t56=r5,<t56=r5,<c6=r14
eor r5,r5,r14

# qhasm: v0 += (v5 >>> 5)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #5
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #5
add r0,r0,r7,ROR #5

# qhasm: v0 += (t56 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t56=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t56=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#6,<c2_stack=stack32#13
# asm 2: ldr >c2=r5,<c2_stack=[sp,#176]
ldr r5,[sp,#176]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #24
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #24
eor r9,r9,r0,ROR #24

# qhasm: t57 = mem32[&m6m7_stack]
# asm 1: ldr >t57=int32#11,<m6m7_stack=stack64#9
# asm 2: ldr >t57=r10,<m6m7_stack=[sp,#64]
ldr r10,[sp,#64]

# qhasm: v10 += (v15 >>> 24)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #24
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #24
add r8,r8,r9,ROR #24

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#14,<c8_stack=stack32#19
# asm 2: ldr >c8=r14,<c8_stack=[sp,#200]
ldr r14,[sp,#200]

# qhasm: v5 ^= (v10 >>> 27)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #27
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #27
eor r7,r7,r8,ROR #27

# qhasm: t57 ^= c2
# asm 1: eor >t57=int32#6,<t57=int32#11,<c2=int32#6
# asm 2: eor >t57=r5,<t57=r10,<c2=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 17)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #17
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #17
add r0,r0,r7,ROR #17

# qhasm: v0 += (t57 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t57=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t57=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t58 = mem32[&m14m15_stack+4]
# asm 1: ldr >t58=int32#6,<m14m15_stack=stack64#13
# asm 2: ldr >t58=r5,<m14m15_stack=[sp,#100]
ldr r5,[sp,#100]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #8
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #8
eor r9,r9,r0,ROR #8

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#10,<v11v15_stack=stack64#16
# asm 2: str <v15=r9,<v11v15_stack=[sp,#124]
str r9,[sp,#124]

# qhasm: v10 += (v15 >>> 0)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #0
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #0
add r8,r8,r9,ROR #0

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 15)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #15
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #15
eor r7,r7,r8,ROR #15

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t58 ^= c8
# asm 1: eor >t58=int32#6,<t58=int32#6,<c8=int32#14
# asm 2: eor >t58=r5,<t58=r5,<c8=r14
eor r5,r5,r14

# qhasm: v3 += (v4 >>> 5)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #5
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #5
add r4,r4,r6,ROR #5

# qhasm: v3 += (t58 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t58=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t58=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c15 = c15_stack
# asm 1: ldr >c15=int32#6,<c15_stack=stack32#26
# asm 2: ldr >c15=r5,<c15_stack=[sp,#228]
ldr r5,[sp,#228]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#5,ROR #24
# asm 2: eor >v14=r8,<v14=r11,<v3=r4,ROR #24
eor r8,r11,r4,ROR #24

# qhasm: t59 = mem32[&m8m9_stack]
# asm 1: ldr >t59=int32#10,<m8m9_stack=stack64#10
# asm 2: ldr >t59=r9,<m8m9_stack=[sp,#72]
ldr r9,[sp,#72]

# qhasm: v9 += (v14 >>> 24)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #24
add r10,r10,r8,ROR #24

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#14,<c0_stack=stack32#11
# asm 2: ldr >c0=r14,<c0_stack=[sp,#168]
ldr r14,[sp,#168]

# qhasm: v4 ^= (v9 >>> 27)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #27
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #27
eor r6,r6,r10,ROR #27

# qhasm: t59 ^= c15
# asm 1: eor >t59=int32#6,<t59=int32#10,<c15=int32#6
# asm 2: eor >t59=r5,<t59=r9,<c15=r5
eor r5,r9,r5

# qhasm: v3 += (v4 >>> 17)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #17
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #17
add r4,r4,r6,ROR #17

# qhasm: v3 += (t59 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t59=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t59=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t60 = mem32[&m4m5_stack]
# asm 1: ldr >t60=int32#6,<m4m5_stack=stack64#8
# asm 2: ldr >t60=r5,<m4m5_stack=[sp,#56]
ldr r5,[sp,#56]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v3=int32#5,ROR #8
# asm 2: eor >v14=r8,<v14=r8,<v3=r4,ROR #8
eor r8,r8,r4,ROR #8

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v14=r8,<v10v14_stack=[sp,#116]
str r8,[sp,#116]

# qhasm: v9 += (v14 >>> 0)
# asm 1: add >v9=int32#9,<v9=int32#11,<v14=int32#9,ROR #0
# asm 2: add >v9=r8,<v9=r10,<v14=r8,ROR #0
add r8,r10,r8,ROR #0

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v9=r8,<v9v13_stack=[sp,#104]
str r8,[sp,#104]

# qhasm: v4 ^= (v9 >>> 15)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#9,ROR #15
# asm 2: eor >v4=r6,<v4=r6,<v9=r8,ROR #15
eor r6,r6,r8,ROR #15

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t60 ^= c0
# asm 1: eor >t60=int32#6,<t60=int32#6,<c0=int32#14
# asm 2: eor >t60=r5,<t60=r5,<c0=r14
eor r5,r5,r14

# qhasm: v2 += (v7 >>> 5)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #5
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #5
add r3,r3,r12,ROR #5

# qhasm: v2 += (t60 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t60=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t60=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#6,<c4_stack=stack32#15
# asm 2: ldr >c4=r5,<c4_stack=[sp,#184]
ldr r5,[sp,#184]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v2=int32#4,ROR #24
# asm 2: eor >v13=r8,<v13=r11,<v2=r3,ROR #24
eor r8,r11,r3,ROR #24

# qhasm: t61 = mem32[&m0m1_stack]
# asm 1: ldr >t61=int32#10,<m0m1_stack=stack64#6
# asm 2: ldr >t61=r9,<m0m1_stack=[sp,#40]
ldr r9,[sp,#40]

# qhasm: v8 += (v13 >>> 24)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#9,ROR #24
# asm 2: add >v8=r10,<v8=r10,<v13=r8,ROR #24
add r10,r10,r8,ROR #24

# qhasm: c10 = c10_stack
# asm 1: ldr >c10=int32#14,<c10_stack=stack32#21
# asm 2: ldr >c10=r14,<c10_stack=[sp,#208]
ldr r14,[sp,#208]

# qhasm: v7 ^= (v8 >>> 27)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#11,ROR #27
# asm 2: eor >v7=r12,<v7=r12,<v8=r10,ROR #27
eor r12,r12,r10,ROR #27

# qhasm: t61 ^= c4
# asm 1: eor >t61=int32#6,<t61=int32#10,<c4=int32#6
# asm 2: eor >t61=r5,<t61=r9,<c4=r5
eor r5,r9,r5

# qhasm: v2 += (v7 >>> 17)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #17
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #17
add r3,r3,r12,ROR #17

# qhasm: v2 += (t61 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t61=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t61=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t62 = mem32[&m4m5_stack+4]
# asm 1: ldr >t62=int32#6,<m4m5_stack=stack64#8
# asm 2: ldr >t62=r5,<m4m5_stack=[sp,#60]
ldr r5,[sp,#60]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v2=int32#4,ROR #8
# asm 2: eor >v13=r8,<v13=r8,<v2=r3,ROR #8
eor r8,r8,r3,ROR #8

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v13=r8,<v9v13_stack=[sp,#108]
str r8,[sp,#108]

# qhasm: v8 += (v13 >>> 0)
# asm 1: add >v8=int32#9,<v8=int32#11,<v13=int32#9,ROR #0
# asm 2: add >v8=r8,<v8=r10,<v13=r8,ROR #0
add r8,r10,r8,ROR #0

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t62 ^= c10
# asm 1: eor >t62=int32#6,<t62=int32#6,<c10=int32#14
# asm 2: eor >t62=r5,<t62=r5,<c10=r14
eor r5,r5,r14

# qhasm: v1 += (v6 >>> 5)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #5
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #5
add r2,r2,r1,ROR #5

# qhasm: v1 += (t62 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t62=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t62=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#6,<c5_stack=stack32#16
# asm 2: ldr >c5=r5,<c5_stack=[sp,#188]
ldr r5,[sp,#188]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#10,<v12=int32#12,<v1=int32#3,ROR #24
# asm 2: eor >v12=r9,<v12=r11,<v1=r2,ROR #24
eor r9,r11,r2,ROR #24

# qhasm: t63 = mem32[&m10m11_stack]
# asm 1: ldr >t63=int32#12,<m10m11_stack=stack64#11
# asm 2: ldr >t63=r11,<m10m11_stack=[sp,#80]
ldr r11,[sp,#80]

# qhasm: v11 += (v12 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #24
add r10,r10,r9,ROR #24

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#14,<c0_stack=stack32#11
# asm 2: ldr >c0=r14,<c0_stack=[sp,#168]
ldr r14,[sp,#168]

# qhasm: v6 ^= (v11 >>> 27)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #27
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #27
eor r1,r1,r10,ROR #27

# qhasm: t63 ^= c5
# asm 1: eor >t63=int32#6,<t63=int32#12,<c5=int32#6
# asm 2: eor >t63=r5,<t63=r11,<c5=r5
eor r5,r11,r5

# qhasm: v1 += (v6 >>> 17)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #17
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #17
add r2,r2,r1,ROR #17

# qhasm: v1 += (t63 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t63=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t63=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t64 = mem32[&m8m9_stack+4]
# asm 1: ldr >t64=int32#6,<m8m9_stack=stack64#10
# asm 2: ldr >t64=r5,<m8m9_stack=[sp,#76]
ldr r5,[sp,#76]

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v1=int32#3,ROR #8
# asm 2: eor >v12=r9,<v12=r9,<v1=r2,ROR #8
eor r9,r9,r2,ROR #8

# qhasm: v7 ^= (v8 >>> 15)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#9,ROR #15
# asm 2: eor >v7=r12,<v7=r12,<v8=r8,ROR #15
eor r12,r12,r8,ROR #15

# qhasm: v11 += (v12 >>> 0)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #0
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #0
add r10,r10,r9,ROR #0

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#11,<v11v15_stack=stack64#16
# asm 2: str <v11=r10,<v11v15_stack=[sp,#120]
str r10,[sp,#120]

# qhasm: v6 ^= (v11 >>> 15)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #15
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #15
eor r1,r1,r10,ROR #15

# qhasm: t64 ^= c0
# asm 1: eor >t64=int32#6,<t64=int32#6,<c0=int32#14
# asm 2: eor >t64=r5,<t64=r5,<c0=r14
eor r5,r5,r14

# qhasm: v0 += (v4 >>> 24)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #24
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #24
add r0,r0,r6,ROR #24

# qhasm: v0 += (t64 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t64=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t64=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#6,<c9_stack=stack32#20
# asm 2: ldr >c9=r5,<c9_stack=[sp,#204]
ldr r5,[sp,#204]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #0
eor r9,r9,r0,ROR #0

# qhasm: t65 = mem32[&m0m1_stack]
# asm 1: ldr >t65=int32#11,<m0m1_stack=stack64#6
# asm 2: ldr >t65=r10,<m0m1_stack=[sp,#40]
ldr r10,[sp,#40]

# qhasm: v8 += (v12 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #16
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#14,<c7_stack=stack32#18
# asm 2: ldr >c7=r14,<c7_stack=[sp,#196]
ldr r14,[sp,#196]

# qhasm: v4 ^= (v8 >>> 8)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #8
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #8
eor r6,r6,r8,ROR #8

# qhasm: t65 ^= c9
# asm 1: eor >t65=int32#6,<t65=int32#11,<c9=int32#6
# asm 2: eor >t65=r5,<t65=r10,<c9=r5
eor r5,r10,r5

# qhasm: v0 += (v4 >>> 4)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #4
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #4
add r0,r0,r6,ROR #4

# qhasm: v0 += (t65 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t65=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t65=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t66 = mem32[&m4m5_stack+4]
# asm 1: ldr >t66=int32#6,<m4m5_stack=stack64#8
# asm 2: ldr >t66=r5,<m4m5_stack=[sp,#60]
ldr r5,[sp,#60]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 24)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #24
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #24
add r8,r8,r9,ROR #24

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 28)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #28
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #28
eor r6,r6,r8,ROR #28

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t66 ^= c7
# asm 1: eor >t66=int32#6,<t66=int32#6,<c7=int32#14
# asm 2: eor >t66=r5,<t66=r5,<c7=r14
eor r5,r5,r14

# qhasm: v1 += (v5 >>> 24)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #24
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #24
add r2,r2,r7,ROR #24

# qhasm: v1 += (t66 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t66=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t66=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#6,<c5_stack=stack32#16
# asm 2: ldr >c5=r5,<c5_stack=[sp,#188]
ldr r5,[sp,#188]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #0
eor r8,r11,r2,ROR #0

# qhasm: t67 = mem32[&m6m7_stack+4]
# asm 1: ldr >t67=int32#10,<m6m7_stack=stack64#9
# asm 2: ldr >t67=r9,<m6m7_stack=[sp,#68]
ldr r9,[sp,#68]

# qhasm: v9 += (v13 >>> 16)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#14,<c4_stack=stack32#15
# asm 2: ldr >c4=r14,<c4_stack=[sp,#184]
ldr r14,[sp,#184]

# qhasm: v5 ^= (v9 >>> 8)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #8
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #8
eor r7,r7,r10,ROR #8

# qhasm: t67 ^= c5
# asm 1: eor >t67=int32#6,<t67=int32#10,<c5=int32#6
# asm 2: eor >t67=r5,<t67=r9,<c5=r5
eor r5,r9,r5

# qhasm: v1 += (v5 >>> 4)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #4
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #4
add r2,r2,r7,ROR #4

# qhasm: v1 += (t67 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t67=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t67=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t68 = mem32[&m2m3_stack]
# asm 1: ldr >t68=int32#6,<m2m3_stack=stack64#7
# asm 2: ldr >t68=r5,<m2m3_stack=[sp,#48]
ldr r5,[sp,#48]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #16
eor r8,r8,r2,ROR #16

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 24)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #24
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 28)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #28
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #28
eor r7,r7,r8,ROR #28

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t68 ^= c4
# asm 1: eor >t68=int32#6,<t68=int32#6,<c4=int32#14
# asm 2: eor >t68=r5,<t68=r5,<c4=r14
eor r5,r5,r14

# qhasm: v2 += (v6 >>> 24)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #24
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #24
add r3,r3,r1,ROR #24

# qhasm: v2 += (t68 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t68=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t68=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#6,<c2_stack=stack32#13
# asm 2: ldr >c2=r5,<c2_stack=[sp,#176]
ldr r5,[sp,#176]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #0
eor r8,r11,r3,ROR #0

# qhasm: t69 = mem32[&m4m5_stack]
# asm 1: ldr >t69=int32#10,<m4m5_stack=stack64#8
# asm 2: ldr >t69=r9,<m4m5_stack=[sp,#56]
ldr r9,[sp,#56]

# qhasm: v10 += (v14 >>> 16)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c15 = c15_stack
# asm 1: ldr >c15=int32#14,<c15_stack=stack32#26
# asm 2: ldr >c15=r14,<c15_stack=[sp,#228]
ldr r14,[sp,#228]

# qhasm: v6 ^= (v10 >>> 8)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #8
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #8
eor r1,r1,r10,ROR #8

# qhasm: t69 ^= c2
# asm 1: eor >t69=int32#6,<t69=int32#10,<c2=int32#6
# asm 2: eor >t69=r5,<t69=r9,<c2=r5
eor r5,r9,r5

# qhasm: v2 += (v6 >>> 4)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #4
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #4
add r3,r3,r1,ROR #4

# qhasm: v2 += (t69 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t69=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t69=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t70 = mem32[&m10m11_stack]
# asm 1: ldr >t70=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t70=r5,<m10m11_stack=[sp,#80]
ldr r5,[sp,#80]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #16
eor r8,r8,r3,ROR #16

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 24)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t70 ^= c15
# asm 1: eor >t70=int32#6,<t70=int32#6,<c15=int32#14
# asm 2: eor >t70=r5,<t70=r5,<c15=r14
eor r5,r5,r14

# qhasm: v3 += (v7 >>> 24)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #24
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #24
add r4,r4,r12,ROR #24

# qhasm: v3 += (t70 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t70=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t70=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c10 = c10_stack
# asm 1: ldr >c10=int32#6,<c10_stack=stack32#21
# asm 2: ldr >c10=r5,<c10_stack=[sp,#208]
ldr r5,[sp,#208]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#10,<v15=int32#12,<v3=int32#5,ROR #0
# asm 2: eor >v15=r9,<v15=r11,<v3=r4,ROR #0
eor r9,r11,r4,ROR #0

# qhasm: t71 = mem32[&m14m15_stack+4]
# asm 1: ldr >t71=int32#12,<m14m15_stack=stack64#13
# asm 2: ldr >t71=r11,<m14m15_stack=[sp,#100]
ldr r11,[sp,#100]

# qhasm: v11 += (v15 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#14,<c1_stack=stack32#12
# asm 2: ldr >c1=r14,<c1_stack=[sp,#172]
ldr r14,[sp,#172]

# qhasm: v7 ^= (v11 >>> 8)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #8
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #8
eor r12,r12,r10,ROR #8

# qhasm: t71 ^= c10
# asm 1: eor >t71=int32#6,<t71=int32#12,<c10=int32#6
# asm 2: eor >t71=r5,<t71=r11,<c10=r5
eor r5,r11,r5

# qhasm: v3 += (v7 >>> 4)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #4
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #4
add r4,r4,r12,ROR #4

# qhasm: v3 += (t71 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t71=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t71=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t72 = mem32[&m14m15_stack]
# asm 1: ldr >t72=int32#6,<m14m15_stack=stack64#13
# asm 2: ldr >t72=r5,<m14m15_stack=[sp,#96]
ldr r5,[sp,#96]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v3=int32#5,ROR #16
# asm 2: eor >v15=r9,<v15=r9,<v3=r4,ROR #16
eor r9,r9,r4,ROR #16

# qhasm: v6 ^= (v10 >>> 28)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #28
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #28
eor r1,r1,r8,ROR #28

# qhasm: v11 += (v15 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #24
add r10,r10,r9,ROR #24

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 28)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #28
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #28
eor r12,r12,r10,ROR #28

# qhasm: t72 ^= c1
# asm 1: eor >t72=int32#6,<t72=int32#6,<c1=int32#14
# asm 2: eor >t72=r5,<t72=r5,<c1=r14
eor r5,r5,r14

# qhasm: v0 += (v5 >>> 11)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #11
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #11
add r0,r0,r7,ROR #11

# qhasm: v0 += (t72 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t72=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t72=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#6,<c14_stack=stack32#25
# asm 2: ldr >c14=r5,<c14_stack=[sp,#224]
ldr r5,[sp,#224]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #8
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #8
eor r9,r9,r0,ROR #8

# qhasm: t73 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t73=int32#11,<m0m1_stack=stack64#6
# asm 2: ldr >t73=r10,<m0m1_stack=[sp,#44]
ldr r10,[sp,#44]

# qhasm: v10 += (v15 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #8
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#14,<c13_stack=stack32#24
# asm 2: ldr >c13=r14,<c13_stack=[sp,#220]
ldr r14,[sp,#220]

# qhasm: v5 ^= (v10 >>> 21)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #21
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #21
eor r7,r7,r8,ROR #21

# qhasm: t73 ^= c14
# asm 1: eor >t73=int32#6,<t73=int32#11,<c14=int32#6
# asm 2: eor >t73=r5,<t73=r10,<c14=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 23)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #23
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #23
add r0,r0,r7,ROR #23

# qhasm: v0 += (t73 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t73=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t73=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t74 = mem32[&m2m3_stack+4]
# asm 1: ldr >t74=int32#6,<m2m3_stack=stack64#7
# asm 2: ldr >t74=r5,<m2m3_stack=[sp,#52]
ldr r5,[sp,#52]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #24
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #24
eor r9,r9,r0,ROR #24

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#10,<v11v15_stack=stack64#16
# asm 2: str <v15=r9,<v11v15_stack=[sp,#124]
str r9,[sp,#124]

# qhasm: v10 += (v15 >>> 16)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #16
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 9)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #9
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #9
eor r7,r7,r8,ROR #9

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t74 ^= c13
# asm 1: eor >t74=int32#6,<t74=int32#6,<c13=int32#14
# asm 2: eor >t74=r5,<t74=r5,<c13=r14
eor r5,r5,r14

# qhasm: v3 += (v4 >>> 11)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #11
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #11
add r4,r4,r6,ROR #11

# qhasm: v3 += (t74 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t74=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t74=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#6,<c3_stack=stack32#14
# asm 2: ldr >c3=r5,<c3_stack=[sp,#180]
ldr r5,[sp,#180]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#5,ROR #8
# asm 2: eor >v14=r8,<v14=r11,<v3=r4,ROR #8
eor r8,r11,r4,ROR #8

# qhasm: t75 = mem32[&m12m13_stack+4]
# asm 1: ldr >t75=int32#10,<m12m13_stack=stack64#12
# asm 2: ldr >t75=r9,<m12m13_stack=[sp,#92]
ldr r9,[sp,#92]

# qhasm: v9 += (v14 >>> 8)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#14,<c8_stack=stack32#19
# asm 2: ldr >c8=r14,<c8_stack=[sp,#200]
ldr r14,[sp,#200]

# qhasm: v4 ^= (v9 >>> 21)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #21
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #21
eor r6,r6,r10,ROR #21

# qhasm: t75 ^= c3
# asm 1: eor >t75=int32#6,<t75=int32#10,<c3=int32#6
# asm 2: eor >t75=r5,<t75=r9,<c3=r5
eor r5,r9,r5

# qhasm: v3 += (v4 >>> 23)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #23
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #23
add r4,r4,r6,ROR #23

# qhasm: v3 += (t75 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t75=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t75=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t76 = mem32[&m6m7_stack]
# asm 1: ldr >t76=int32#6,<m6m7_stack=stack64#9
# asm 2: ldr >t76=r5,<m6m7_stack=[sp,#64]
ldr r5,[sp,#64]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v3=int32#5,ROR #24
# asm 2: eor >v14=r8,<v14=r8,<v3=r4,ROR #24
eor r8,r8,r4,ROR #24

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v14=r8,<v10v14_stack=[sp,#116]
str r8,[sp,#116]

# qhasm: v9 += (v14 >>> 16)
# asm 1: add >v9=int32#9,<v9=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v9=r8,<v9=r10,<v14=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v9=r8,<v9v13_stack=[sp,#104]
str r8,[sp,#104]

# qhasm: v4 ^= (v9 >>> 9)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#9,ROR #9
# asm 2: eor >v4=r6,<v4=r6,<v9=r8,ROR #9
eor r6,r6,r8,ROR #9

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t76 ^= c8
# asm 1: eor >t76=int32#6,<t76=int32#6,<c8=int32#14
# asm 2: eor >t76=r5,<t76=r5,<c8=r14
eor r5,r5,r14

# qhasm: v2 += (v7 >>> 11)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #11
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #11
add r3,r3,r12,ROR #11

# qhasm: v2 += (t76 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t76=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t76=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#6,<c6_stack=stack32#17
# asm 2: ldr >c6=r5,<c6_stack=[sp,#192]
ldr r5,[sp,#192]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v2=int32#4,ROR #8
# asm 2: eor >v13=r8,<v13=r11,<v2=r3,ROR #8
eor r8,r11,r3,ROR #8

# qhasm: t77 = mem32[&m8m9_stack]
# asm 1: ldr >t77=int32#10,<m8m9_stack=stack64#10
# asm 2: ldr >t77=r9,<m8m9_stack=[sp,#72]
ldr r9,[sp,#72]

# qhasm: v8 += (v13 >>> 8)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v8=r10,<v8=r10,<v13=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#14,<c12_stack=stack32#23
# asm 2: ldr >c12=r14,<c12_stack=[sp,#216]
ldr r14,[sp,#216]

# qhasm: v7 ^= (v8 >>> 21)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#11,ROR #21
# asm 2: eor >v7=r12,<v7=r12,<v8=r10,ROR #21
eor r12,r12,r10,ROR #21

# qhasm: t77 ^= c6
# asm 1: eor >t77=int32#6,<t77=int32#10,<c6=int32#6
# asm 2: eor >t77=r5,<t77=r9,<c6=r5
eor r5,r9,r5

# qhasm: v2 += (v7 >>> 23)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #23
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #23
add r3,r3,r12,ROR #23

# qhasm: v2 += (t77 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t77=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t77=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t78 = mem32[&m10m11_stack+4]
# asm 1: ldr >t78=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t78=r5,<m10m11_stack=[sp,#84]
ldr r5,[sp,#84]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v2=int32#4,ROR #24
# asm 2: eor >v13=r8,<v13=r8,<v2=r3,ROR #24
eor r8,r8,r3,ROR #24

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v13=r8,<v9v13_stack=[sp,#108]
str r8,[sp,#108]

# qhasm: v8 += (v13 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v8=r8,<v8=r10,<v13=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t78 ^= c12
# asm 1: eor >t78=int32#6,<t78=int32#6,<c12=int32#14
# asm 2: eor >t78=r5,<t78=r5,<c12=r14
eor r5,r5,r14

# qhasm: v1 += (v6 >>> 11)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #11
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #11
add r2,r2,r1,ROR #11

# qhasm: v1 += (t78 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t78=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t78=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#6,<c11_stack=stack32#22
# asm 2: ldr >c11=r5,<c11_stack=[sp,#212]
ldr r5,[sp,#212]

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#10,<v12=int32#12,<v1=int32#3,ROR #8
# asm 2: eor >v12=r9,<v12=r11,<v1=r2,ROR #8
eor r9,r11,r2,ROR #8

# qhasm: t79 = mem32[&m12m13_stack]
# asm 1: ldr >t79=int32#12,<m12m13_stack=stack64#12
# asm 2: ldr >t79=r11,<m12m13_stack=[sp,#88]
ldr r11,[sp,#88]

# qhasm: v11 += (v12 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #8
add r10,r10,r9,ROR #8

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#14,<c12_stack=stack32#23
# asm 2: ldr >c12=r14,<c12_stack=[sp,#216]
ldr r14,[sp,#216]

# qhasm: v6 ^= (v11 >>> 21)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #21
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #21
eor r1,r1,r10,ROR #21

# qhasm: t79 ^= c11
# asm 1: eor >t79=int32#6,<t79=int32#12,<c11=int32#6
# asm 2: eor >t79=r5,<t79=r11,<c11=r5
eor r5,r11,r5

# qhasm: v1 += (v6 >>> 23)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #23
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #23
add r2,r2,r1,ROR #23

# qhasm: v1 += (t79 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t79=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t79=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t80 = mem32[&m2m3_stack]
# asm 1: ldr >t80=int32#6,<m2m3_stack=stack64#7
# asm 2: ldr >t80=r5,<m2m3_stack=[sp,#48]
ldr r5,[sp,#48]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v1=int32#3,ROR #24
# asm 2: eor >v12=r9,<v12=r9,<v1=r2,ROR #24
eor r9,r9,r2,ROR #24

# qhasm: v7 ^= (v8 >>> 9)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#9,ROR #9
# asm 2: eor >v7=r12,<v7=r12,<v8=r8,ROR #9
eor r12,r12,r8,ROR #9

# qhasm: v11 += (v12 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#11,<v11v15_stack=stack64#16
# asm 2: str <v11=r10,<v11v15_stack=[sp,#120]
str r10,[sp,#120]

# qhasm: v6 ^= (v11 >>> 9)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #9
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #9
eor r1,r1,r10,ROR #9

# qhasm: t80 ^= c12
# asm 1: eor >t80=int32#6,<t80=int32#6,<c12=int32#14
# asm 2: eor >t80=r5,<t80=r5,<c12=r14
eor r5,r5,r14

# qhasm: v0 += (v4 >>> 30)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #30
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #30
add r0,r0,r6,ROR #30

# qhasm: v0 += (t80 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t80=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t80=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#6,<c2_stack=stack32#13
# asm 2: ldr >c2=r5,<c2_stack=[sp,#176]
ldr r5,[sp,#176]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: t81 = mem32[&m12m13_stack]
# asm 1: ldr >t81=int32#11,<m12m13_stack=stack64#12
# asm 2: ldr >t81=r10,<m12m13_stack=[sp,#88]
ldr r10,[sp,#88]

# qhasm: v8 += (v12 >>> 0)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #0
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #0
add r8,r8,r9,ROR #0

# qhasm: c10 = c10_stack
# asm 1: ldr >c10=int32#14,<c10_stack=stack32#21
# asm 2: ldr >c10=r14,<c10_stack=[sp,#208]
ldr r14,[sp,#208]

# qhasm: v4 ^= (v8 >>> 2)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #2
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #2
eor r6,r6,r8,ROR #2

# qhasm: t81 ^= c2
# asm 1: eor >t81=int32#6,<t81=int32#11,<c2=int32#6
# asm 2: eor >t81=r5,<t81=r10,<c2=r5
eor r5,r10,r5

# qhasm: v0 += (v4 >>> 10)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #10
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #10
add r0,r0,r6,ROR #10

# qhasm: v0 += (t81 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t81=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t81=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t82 = mem32[&m6m7_stack]
# asm 1: ldr >t82=int32#6,<m6m7_stack=stack64#9
# asm 2: ldr >t82=r5,<m6m7_stack=[sp,#64]
ldr r5,[sp,#64]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #0
eor r9,r9,r0,ROR #0

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 8)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #8
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 22)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #22
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #22
eor r6,r6,r8,ROR #22

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t82 ^= c10
# asm 1: eor >t82=int32#6,<t82=int32#6,<c10=int32#14
# asm 2: eor >t82=r5,<t82=r5,<c10=r14
eor r5,r5,r14

# qhasm: v1 += (v5 >>> 30)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #30
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #30
add r2,r2,r7,ROR #30

# qhasm: v1 += (t82 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t82=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t82=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#6,<c6_stack=stack32#17
# asm 2: ldr >c6=r5,<c6_stack=[sp,#192]
ldr r5,[sp,#192]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #16
eor r8,r11,r2,ROR #16

# qhasm: t83 = mem32[&m10m11_stack]
# asm 1: ldr >t83=int32#10,<m10m11_stack=stack64#11
# asm 2: ldr >t83=r9,<m10m11_stack=[sp,#80]
ldr r9,[sp,#80]

# qhasm: v9 += (v13 >>> 0)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #0
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#14,<c11_stack=stack32#22
# asm 2: ldr >c11=r14,<c11_stack=[sp,#212]
ldr r14,[sp,#212]

# qhasm: v5 ^= (v9 >>> 2)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #2
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #2
eor r7,r7,r10,ROR #2

# qhasm: t83 ^= c6
# asm 1: eor >t83=int32#6,<t83=int32#10,<c6=int32#6
# asm 2: eor >t83=r5,<t83=r9,<c6=r5
eor r5,r9,r5

# qhasm: v1 += (v5 >>> 10)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #10
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #10
add r2,r2,r7,ROR #10

# qhasm: v1 += (t83 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t83=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t83=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t84 = mem32[&m0m1_stack]
# asm 1: ldr >t84=int32#6,<m0m1_stack=stack64#6
# asm 2: ldr >t84=r5,<m0m1_stack=[sp,#40]
ldr r5,[sp,#40]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #0
eor r8,r8,r2,ROR #0

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 8)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 22)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #22
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #22
eor r7,r7,r8,ROR #22

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t84 ^= c11
# asm 1: eor >t84=int32#6,<t84=int32#6,<c11=int32#14
# asm 2: eor >t84=r5,<t84=r5,<c11=r14
eor r5,r5,r14

# qhasm: v2 += (v6 >>> 30)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #30
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #30
add r3,r3,r1,ROR #30

# qhasm: v2 += (t84 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t84=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t84=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#6,<c0_stack=stack32#11
# asm 2: ldr >c0=r5,<c0_stack=[sp,#168]
ldr r5,[sp,#168]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #16
eor r8,r11,r3,ROR #16

# qhasm: t85 = mem32[&m10m11_stack+4]
# asm 1: ldr >t85=int32#10,<m10m11_stack=stack64#11
# asm 2: ldr >t85=r9,<m10m11_stack=[sp,#84]
ldr r9,[sp,#84]

# qhasm: v10 += (v14 >>> 0)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #0
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#14,<c3_stack=stack32#14
# asm 2: ldr >c3=r14,<c3_stack=[sp,#180]
ldr r14,[sp,#180]

# qhasm: v6 ^= (v10 >>> 2)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #2
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #2
eor r1,r1,r10,ROR #2

# qhasm: t85 ^= c0
# asm 1: eor >t85=int32#6,<t85=int32#10,<c0=int32#6
# asm 2: eor >t85=r5,<t85=r9,<c0=r5
eor r5,r9,r5

# qhasm: v2 += (v6 >>> 10)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #10
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #10
add r3,r3,r1,ROR #10

# qhasm: v2 += (t85 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t85=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t85=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t86 = mem32[&m8m9_stack]
# asm 1: ldr >t86=int32#6,<m8m9_stack=stack64#10
# asm 2: ldr >t86=r5,<m8m9_stack=[sp,#72]
ldr r5,[sp,#72]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #0
eor r8,r8,r3,ROR #0

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t86 ^= c3
# asm 1: eor >t86=int32#6,<t86=int32#6,<c3=int32#14
# asm 2: eor >t86=r5,<t86=r5,<c3=r14
eor r5,r5,r14

# qhasm: v3 += (v7 >>> 30)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #30
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #30
add r4,r4,r12,ROR #30

# qhasm: v3 += (t86 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t86=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t86=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#6,<c8_stack=stack32#19
# asm 2: ldr >c8=r5,<c8_stack=[sp,#200]
ldr r5,[sp,#200]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#10,<v15=int32#12,<v3=int32#5,ROR #16
# asm 2: eor >v15=r9,<v15=r11,<v3=r4,ROR #16
eor r9,r11,r4,ROR #16

# qhasm: t87 = mem32[&m2m3_stack+4]
# asm 1: ldr >t87=int32#12,<m2m3_stack=stack64#7
# asm 2: ldr >t87=r11,<m2m3_stack=[sp,#52]
ldr r11,[sp,#52]

# qhasm: v11 += (v15 >>> 0)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #0
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #0
add r10,r10,r9,ROR #0

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#14,<c13_stack=stack32#24
# asm 2: ldr >c13=r14,<c13_stack=[sp,#220]
ldr r14,[sp,#220]

# qhasm: v7 ^= (v11 >>> 2)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #2
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #2
eor r12,r12,r10,ROR #2

# qhasm: t87 ^= c8
# asm 1: eor >t87=int32#6,<t87=int32#12,<c8=int32#6
# asm 2: eor >t87=r5,<t87=r11,<c8=r5
eor r5,r11,r5

# qhasm: v3 += (v7 >>> 10)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #10
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #10
add r4,r4,r12,ROR #10

# qhasm: v3 += (t87 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t87=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t87=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t88 = mem32[&m4m5_stack]
# asm 1: ldr >t88=int32#6,<m4m5_stack=stack64#8
# asm 2: ldr >t88=r5,<m4m5_stack=[sp,#56]
ldr r5,[sp,#56]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v3=int32#5,ROR #0
# asm 2: eor >v15=r9,<v15=r9,<v3=r4,ROR #0
eor r9,r9,r4,ROR #0

# qhasm: v6 ^= (v10 >>> 22)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #22
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #22
eor r1,r1,r8,ROR #22

# qhasm: v11 += (v15 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #8
add r10,r10,r9,ROR #8

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 22)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #22
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #22
eor r12,r12,r10,ROR #22

# qhasm: t88 ^= c13
# asm 1: eor >t88=int32#6,<t88=int32#6,<c13=int32#14
# asm 2: eor >t88=r5,<t88=r5,<c13=r14
eor r5,r5,r14

# qhasm: v0 += (v5 >>> 17)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #17
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #17
add r0,r0,r7,ROR #17

# qhasm: v0 += (t88 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t88=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t88=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#6,<c4_stack=stack32#15
# asm 2: ldr >c4=r5,<c4_stack=[sp,#184]
ldr r5,[sp,#184]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #24
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #24
eor r9,r9,r0,ROR #24

# qhasm: t89 = mem32[&m12m13_stack+4]
# asm 1: ldr >t89=int32#11,<m12m13_stack=stack64#12
# asm 2: ldr >t89=r10,<m12m13_stack=[sp,#92]
ldr r10,[sp,#92]

# qhasm: v10 += (v15 >>> 24)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #24
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #24
add r8,r8,r9,ROR #24

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#14,<c9_stack=stack32#20
# asm 2: ldr >c9=r14,<c9_stack=[sp,#204]
ldr r14,[sp,#204]

# qhasm: v5 ^= (v10 >>> 15)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #15
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #15
eor r7,r7,r8,ROR #15

# qhasm: t89 ^= c4
# asm 1: eor >t89=int32#6,<t89=int32#11,<c4=int32#6
# asm 2: eor >t89=r5,<t89=r10,<c4=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 29)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #29
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #29
add r0,r0,r7,ROR #29

# qhasm: v0 += (t89 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t89=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t89=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t90 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t90=int32#6,<m0m1_stack=stack64#6
# asm 2: ldr >t90=r5,<m0m1_stack=[sp,#44]
ldr r5,[sp,#44]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #8
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #8
eor r9,r9,r0,ROR #8

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#10,<v11v15_stack=stack64#16
# asm 2: str <v15=r9,<v11v15_stack=[sp,#124]
str r9,[sp,#124]

# qhasm: v10 += (v15 >>> 0)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #0
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #0
add r8,r8,r9,ROR #0

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 3)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #3
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #3
eor r7,r7,r8,ROR #3

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t90 ^= c9
# asm 1: eor >t90=int32#6,<t90=int32#6,<c9=int32#14
# asm 2: eor >t90=r5,<t90=r5,<c9=r14
eor r5,r5,r14

# qhasm: v3 += (v4 >>> 17)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #17
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #17
add r4,r4,r6,ROR #17

# qhasm: v3 += (t90 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t90=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t90=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#6,<c1_stack=stack32#12
# asm 2: ldr >c1=r5,<c1_stack=[sp,#172]
ldr r5,[sp,#172]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#5,ROR #24
# asm 2: eor >v14=r8,<v14=r11,<v3=r4,ROR #24
eor r8,r11,r4,ROR #24

# qhasm: t91 = mem32[&m8m9_stack+4]
# asm 1: ldr >t91=int32#10,<m8m9_stack=stack64#10
# asm 2: ldr >t91=r9,<m8m9_stack=[sp,#76]
ldr r9,[sp,#76]

# qhasm: v9 += (v14 >>> 24)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #24
add r10,r10,r8,ROR #24

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#14,<c14_stack=stack32#25
# asm 2: ldr >c14=r14,<c14_stack=[sp,#224]
ldr r14,[sp,#224]

# qhasm: v4 ^= (v9 >>> 15)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #15
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #15
eor r6,r6,r10,ROR #15

# qhasm: t91 ^= c1
# asm 1: eor >t91=int32#6,<t91=int32#10,<c1=int32#6
# asm 2: eor >t91=r5,<t91=r9,<c1=r5
eor r5,r9,r5

# qhasm: v3 += (v4 >>> 29)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #29
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #29
add r4,r4,r6,ROR #29

# qhasm: v3 += (t91 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t91=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t91=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t92 = mem32[&m14m15_stack+4]
# asm 1: ldr >t92=int32#6,<m14m15_stack=stack64#13
# asm 2: ldr >t92=r5,<m14m15_stack=[sp,#100]
ldr r5,[sp,#100]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v3=int32#5,ROR #8
# asm 2: eor >v14=r8,<v14=r8,<v3=r4,ROR #8
eor r8,r8,r4,ROR #8

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v14=r8,<v10v14_stack=[sp,#116]
str r8,[sp,#116]

# qhasm: v9 += (v14 >>> 0)
# asm 1: add >v9=int32#9,<v9=int32#11,<v14=int32#9,ROR #0
# asm 2: add >v9=r8,<v9=r10,<v14=r8,ROR #0
add r8,r10,r8,ROR #0

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v9=r8,<v9v13_stack=[sp,#104]
str r8,[sp,#104]

# qhasm: v4 ^= (v9 >>> 3)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#9,ROR #3
# asm 2: eor >v4=r6,<v4=r6,<v9=r8,ROR #3
eor r6,r6,r8,ROR #3

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t92 ^= c14
# asm 1: eor >t92=int32#6,<t92=int32#6,<c14=int32#14
# asm 2: eor >t92=r5,<t92=r5,<c14=r14
eor r5,r5,r14

# qhasm: v2 += (v7 >>> 17)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #17
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #17
add r3,r3,r12,ROR #17

# qhasm: v2 += (t92 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t92=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t92=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c15 = c15_stack
# asm 1: ldr >c15=int32#6,<c15_stack=stack32#26
# asm 2: ldr >c15=r5,<c15_stack=[sp,#228]
ldr r5,[sp,#228]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v2=int32#4,ROR #24
# asm 2: eor >v13=r8,<v13=r11,<v2=r3,ROR #24
eor r8,r11,r3,ROR #24

# qhasm: t93 = mem32[&m14m15_stack]
# asm 1: ldr >t93=int32#10,<m14m15_stack=stack64#13
# asm 2: ldr >t93=r9,<m14m15_stack=[sp,#96]
ldr r9,[sp,#96]

# qhasm: v8 += (v13 >>> 24)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#9,ROR #24
# asm 2: add >v8=r10,<v8=r10,<v13=r8,ROR #24
add r10,r10,r8,ROR #24

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#14,<c5_stack=stack32#16
# asm 2: ldr >c5=r14,<c5_stack=[sp,#188]
ldr r14,[sp,#188]

# qhasm: v7 ^= (v8 >>> 15)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#11,ROR #15
# asm 2: eor >v7=r12,<v7=r12,<v8=r10,ROR #15
eor r12,r12,r10,ROR #15

# qhasm: t93 ^= c15
# asm 1: eor >t93=int32#6,<t93=int32#10,<c15=int32#6
# asm 2: eor >t93=r5,<t93=r9,<c15=r5
eor r5,r9,r5

# qhasm: v2 += (v7 >>> 29)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #29
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #29
add r3,r3,r12,ROR #29

# qhasm: v2 += (t93 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t93=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t93=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t94 = mem32[&m6m7_stack+4]
# asm 1: ldr >t94=int32#6,<m6m7_stack=stack64#9
# asm 2: ldr >t94=r5,<m6m7_stack=[sp,#68]
ldr r5,[sp,#68]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v2=int32#4,ROR #8
# asm 2: eor >v13=r8,<v13=r8,<v2=r3,ROR #8
eor r8,r8,r3,ROR #8

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v13=r8,<v9v13_stack=[sp,#108]
str r8,[sp,#108]

# qhasm: v8 += (v13 >>> 0)
# asm 1: add >v8=int32#9,<v8=int32#11,<v13=int32#9,ROR #0
# asm 2: add >v8=r8,<v8=r10,<v13=r8,ROR #0
add r8,r10,r8,ROR #0

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t94 ^= c5
# asm 1: eor >t94=int32#6,<t94=int32#6,<c5=int32#14
# asm 2: eor >t94=r5,<t94=r5,<c5=r14
eor r5,r5,r14

# qhasm: v1 += (v6 >>> 17)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #17
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #17
add r2,r2,r1,ROR #17

# qhasm: v1 += (t94 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t94=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t94=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#6,<c7_stack=stack32#18
# asm 2: ldr >c7=r5,<c7_stack=[sp,#196]
ldr r5,[sp,#196]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#10,<v12=int32#12,<v1=int32#3,ROR #24
# asm 2: eor >v12=r9,<v12=r11,<v1=r2,ROR #24
eor r9,r11,r2,ROR #24

# qhasm: t95 = mem32[&m4m5_stack+4]
# asm 1: ldr >t95=int32#12,<m4m5_stack=stack64#8
# asm 2: ldr >t95=r11,<m4m5_stack=[sp,#60]
ldr r11,[sp,#60]

# qhasm: v11 += (v12 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #24
add r10,r10,r9,ROR #24

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#14,<c5_stack=stack32#16
# asm 2: ldr >c5=r14,<c5_stack=[sp,#188]
ldr r14,[sp,#188]

# qhasm: v6 ^= (v11 >>> 15)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #15
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #15
eor r1,r1,r10,ROR #15

# qhasm: t95 ^= c7
# asm 1: eor >t95=int32#6,<t95=int32#12,<c7=int32#6
# asm 2: eor >t95=r5,<t95=r11,<c7=r5
eor r5,r11,r5

# qhasm: v1 += (v6 >>> 29)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #29
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #29
add r2,r2,r1,ROR #29

# qhasm: v1 += (t95 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t95=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t95=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t96 = mem32[&m12m13_stack]
# asm 1: ldr >t96=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t96=r5,<m12m13_stack=[sp,#88]
ldr r5,[sp,#88]

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v1=int32#3,ROR #8
# asm 2: eor >v12=r9,<v12=r9,<v1=r2,ROR #8
eor r9,r9,r2,ROR #8

# qhasm: v7 ^= (v8 >>> 3)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#9,ROR #3
# asm 2: eor >v7=r12,<v7=r12,<v8=r8,ROR #3
eor r12,r12,r8,ROR #3

# qhasm: v11 += (v12 >>> 0)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #0
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #0
add r10,r10,r9,ROR #0

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#11,<v11v15_stack=stack64#16
# asm 2: str <v11=r10,<v11v15_stack=[sp,#120]
str r10,[sp,#120]

# qhasm: v6 ^= (v11 >>> 3)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #3
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #3
eor r1,r1,r10,ROR #3

# qhasm: t96 ^= c5
# asm 1: eor >t96=int32#6,<t96=int32#6,<c5=int32#14
# asm 2: eor >t96=r5,<t96=r5,<c5=r14
eor r5,r5,r14

# qhasm: v0 += (v4 >>> 4)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #4
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #4
add r0,r0,r6,ROR #4

# qhasm: v0 += (t96 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t96=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t96=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#6,<c12_stack=stack32#23
# asm 2: ldr >c12=r5,<c12_stack=[sp,#216]
ldr r5,[sp,#216]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #0
eor r9,r9,r0,ROR #0

# qhasm: t97 = mem32[&m4m5_stack+4]
# asm 1: ldr >t97=int32#11,<m4m5_stack=stack64#8
# asm 2: ldr >t97=r10,<m4m5_stack=[sp,#60]
ldr r10,[sp,#60]

# qhasm: v8 += (v12 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #16
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: c15 = c15_stack
# asm 1: ldr >c15=int32#14,<c15_stack=stack32#26
# asm 2: ldr >c15=r14,<c15_stack=[sp,#228]
ldr r14,[sp,#228]

# qhasm: v4 ^= (v8 >>> 28)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #28
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #28
eor r6,r6,r8,ROR #28

# qhasm: t97 ^= c12
# asm 1: eor >t97=int32#6,<t97=int32#11,<c12=int32#6
# asm 2: eor >t97=r5,<t97=r10,<c12=r5
eor r5,r10,r5

# qhasm: v0 += (v4 >>> 16)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #16
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #16
add r0,r0,r6,ROR #16

# qhasm: v0 += (t97 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t97=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t97=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t98 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t98=int32#6,<m0m1_stack=stack64#6
# asm 2: ldr >t98=r5,<m0m1_stack=[sp,#44]
ldr r5,[sp,#44]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 24)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #24
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #24
add r8,r8,r9,ROR #24

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 16)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #16
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #16
eor r6,r6,r8,ROR #16

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t98 ^= c15
# asm 1: eor >t98=int32#6,<t98=int32#6,<c15=int32#14
# asm 2: eor >t98=r5,<t98=r5,<c15=r14
eor r5,r5,r14

# qhasm: v1 += (v5 >>> 4)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #4
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #4
add r2,r2,r7,ROR #4

# qhasm: v1 += (t98 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t98=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t98=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#6,<c1_stack=stack32#12
# asm 2: ldr >c1=r5,<c1_stack=[sp,#172]
ldr r5,[sp,#172]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #0
eor r8,r11,r2,ROR #0

# qhasm: t99 = mem32[&m14m15_stack+4]
# asm 1: ldr >t99=int32#10,<m14m15_stack=stack64#13
# asm 2: ldr >t99=r9,<m14m15_stack=[sp,#100]
ldr r9,[sp,#100]

# qhasm: v9 += (v13 >>> 16)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#14,<c13_stack=stack32#24
# asm 2: ldr >c13=r14,<c13_stack=[sp,#220]
ldr r14,[sp,#220]

# qhasm: v5 ^= (v9 >>> 28)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #28
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #28
eor r7,r7,r10,ROR #28

# qhasm: t99 ^= c1
# asm 1: eor >t99=int32#6,<t99=int32#10,<c1=int32#6
# asm 2: eor >t99=r5,<t99=r9,<c1=r5
eor r5,r9,r5

# qhasm: v1 += (v5 >>> 16)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #16
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #16
add r2,r2,r7,ROR #16

# qhasm: v1 += (t99 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t99=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t99=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t100 = mem32[&m14m15_stack]
# asm 1: ldr >t100=int32#6,<m14m15_stack=stack64#13
# asm 2: ldr >t100=r5,<m14m15_stack=[sp,#96]
ldr r5,[sp,#96]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #16
eor r8,r8,r2,ROR #16

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 24)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #24
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 16)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #16
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #16
eor r7,r7,r8,ROR #16

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t100 ^= c13
# asm 1: eor >t100=int32#6,<t100=int32#6,<c13=int32#14
# asm 2: eor >t100=r5,<t100=r5,<c13=r14
eor r5,r5,r14

# qhasm: v2 += (v6 >>> 4)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #4
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #4
add r3,r3,r1,ROR #4

# qhasm: v2 += (t100 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t100=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t100=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#6,<c14_stack=stack32#25
# asm 2: ldr >c14=r5,<c14_stack=[sp,#224]
ldr r5,[sp,#224]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #0
eor r8,r11,r3,ROR #0

# qhasm: t101 = mem32[&m12m13_stack+4]
# asm 1: ldr >t101=int32#10,<m12m13_stack=stack64#12
# asm 2: ldr >t101=r9,<m12m13_stack=[sp,#92]
ldr r9,[sp,#92]

# qhasm: v10 += (v14 >>> 16)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c10 = c10_stack
# asm 1: ldr >c10=int32#14,<c10_stack=stack32#21
# asm 2: ldr >c10=r14,<c10_stack=[sp,#208]
ldr r14,[sp,#208]

# qhasm: v6 ^= (v10 >>> 28)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #28
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #28
eor r1,r1,r10,ROR #28

# qhasm: t101 ^= c14
# asm 1: eor >t101=int32#6,<t101=int32#10,<c14=int32#6
# asm 2: eor >t101=r5,<t101=r9,<c14=r5
eor r5,r9,r5

# qhasm: v2 += (v6 >>> 16)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #16
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #16
add r3,r3,r1,ROR #16

# qhasm: v2 += (t101 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t101=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t101=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t102 = mem32[&m4m5_stack]
# asm 1: ldr >t102=int32#6,<m4m5_stack=stack64#8
# asm 2: ldr >t102=r5,<m4m5_stack=[sp,#56]
ldr r5,[sp,#56]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #16
eor r8,r8,r3,ROR #16

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 24)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t102 ^= c10
# asm 1: eor >t102=int32#6,<t102=int32#6,<c10=int32#14
# asm 2: eor >t102=r5,<t102=r5,<c10=r14
eor r5,r5,r14

# qhasm: v3 += (v7 >>> 4)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #4
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #4
add r4,r4,r12,ROR #4

# qhasm: v3 += (t102 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t102=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t102=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#6,<c4_stack=stack32#15
# asm 2: ldr >c4=r5,<c4_stack=[sp,#184]
ldr r5,[sp,#184]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#10,<v15=int32#12,<v3=int32#5,ROR #0
# asm 2: eor >v15=r9,<v15=r11,<v3=r4,ROR #0
eor r9,r11,r4,ROR #0

# qhasm: t103 = mem32[&m10m11_stack]
# asm 1: ldr >t103=int32#12,<m10m11_stack=stack64#11
# asm 2: ldr >t103=r11,<m10m11_stack=[sp,#80]
ldr r11,[sp,#80]

# qhasm: v11 += (v15 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#14,<c7_stack=stack32#18
# asm 2: ldr >c7=r14,<c7_stack=[sp,#196]
ldr r14,[sp,#196]

# qhasm: v7 ^= (v11 >>> 28)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #28
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #28
eor r12,r12,r10,ROR #28

# qhasm: t103 ^= c4
# asm 1: eor >t103=int32#6,<t103=int32#12,<c4=int32#6
# asm 2: eor >t103=r5,<t103=r11,<c4=r5
eor r5,r11,r5

# qhasm: v3 += (v7 >>> 16)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #16
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #16
add r4,r4,r12,ROR #16

# qhasm: v3 += (t103 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t103=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t103=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t104 = mem32[&m0m1_stack]
# asm 1: ldr >t104=int32#6,<m0m1_stack=stack64#6
# asm 2: ldr >t104=r5,<m0m1_stack=[sp,#40]
ldr r5,[sp,#40]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v3=int32#5,ROR #16
# asm 2: eor >v15=r9,<v15=r9,<v3=r4,ROR #16
eor r9,r9,r4,ROR #16

# qhasm: v6 ^= (v10 >>> 16)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #16
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #16
eor r1,r1,r8,ROR #16

# qhasm: v11 += (v15 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #24
add r10,r10,r9,ROR #24

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 16)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #16
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #16
eor r12,r12,r10,ROR #16

# qhasm: t104 ^= c7
# asm 1: eor >t104=int32#6,<t104=int32#6,<c7=int32#14
# asm 2: eor >t104=r5,<t104=r5,<c7=r14
eor r5,r5,r14

# qhasm: v0 += (v5 >>> 23)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #23
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #23
add r0,r0,r7,ROR #23

# qhasm: v0 += (t104 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t104=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t104=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#6,<c0_stack=stack32#11
# asm 2: ldr >c0=r5,<c0_stack=[sp,#168]
ldr r5,[sp,#168]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #8
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #8
eor r9,r9,r0,ROR #8

# qhasm: t105 = mem32[&m6m7_stack+4]
# asm 1: ldr >t105=int32#11,<m6m7_stack=stack64#9
# asm 2: ldr >t105=r10,<m6m7_stack=[sp,#68]
ldr r10,[sp,#68]

# qhasm: v10 += (v15 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #8
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#14,<c11_stack=stack32#22
# asm 2: ldr >c11=r14,<c11_stack=[sp,#212]
ldr r14,[sp,#212]

# qhasm: v5 ^= (v10 >>> 9)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #9
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #9
eor r7,r7,r8,ROR #9

# qhasm: t105 ^= c0
# asm 1: eor >t105=int32#6,<t105=int32#11,<c0=int32#6
# asm 2: eor >t105=r5,<t105=r10,<c0=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 3)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #3
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #3
add r0,r0,r7,ROR #3

# qhasm: v0 += (t105 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t105=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t105=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t106 = mem32[&m8m9_stack]
# asm 1: ldr >t106=int32#6,<m8m9_stack=stack64#10
# asm 2: ldr >t106=r5,<m8m9_stack=[sp,#72]
ldr r5,[sp,#72]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #24
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #24
eor r9,r9,r0,ROR #24

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#10,<v11v15_stack=stack64#16
# asm 2: str <v15=r9,<v11v15_stack=[sp,#124]
str r9,[sp,#124]

# qhasm: v10 += (v15 >>> 16)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #16
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 29)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #29
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #29
eor r7,r7,r8,ROR #29

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t106 ^= c11
# asm 1: eor >t106=int32#6,<t106=int32#6,<c11=int32#14
# asm 2: eor >t106=r5,<t106=r5,<c11=r14
eor r5,r5,r14

# qhasm: v3 += (v4 >>> 23)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #23
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #23
add r4,r4,r6,ROR #23

# qhasm: v3 += (t106 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t106=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t106=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#6,<c8_stack=stack32#19
# asm 2: ldr >c8=r5,<c8_stack=[sp,#200]
ldr r5,[sp,#200]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#5,ROR #8
# asm 2: eor >v14=r8,<v14=r11,<v3=r4,ROR #8
eor r8,r11,r4,ROR #8

# qhasm: t107 = mem32[&m10m11_stack+4]
# asm 1: ldr >t107=int32#10,<m10m11_stack=stack64#11
# asm 2: ldr >t107=r9,<m10m11_stack=[sp,#84]
ldr r9,[sp,#84]

# qhasm: v9 += (v14 >>> 8)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#14,<c2_stack=stack32#13
# asm 2: ldr >c2=r14,<c2_stack=[sp,#176]
ldr r14,[sp,#176]

# qhasm: v4 ^= (v9 >>> 9)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #9
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #9
eor r6,r6,r10,ROR #9

# qhasm: t107 ^= c8
# asm 1: eor >t107=int32#6,<t107=int32#10,<c8=int32#6
# asm 2: eor >t107=r5,<t107=r9,<c8=r5
eor r5,r9,r5

# qhasm: v3 += (v4 >>> 3)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #3
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #3
add r4,r4,r6,ROR #3

# qhasm: v3 += (t107 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t107=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t107=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t108 = mem32[&m8m9_stack+4]
# asm 1: ldr >t108=int32#6,<m8m9_stack=stack64#10
# asm 2: ldr >t108=r5,<m8m9_stack=[sp,#76]
ldr r5,[sp,#76]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v3=int32#5,ROR #24
# asm 2: eor >v14=r8,<v14=r8,<v3=r4,ROR #24
eor r8,r8,r4,ROR #24

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v14=r8,<v10v14_stack=[sp,#116]
str r8,[sp,#116]

# qhasm: v9 += (v14 >>> 16)
# asm 1: add >v9=int32#9,<v9=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v9=r8,<v9=r10,<v14=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v9=r8,<v9v13_stack=[sp,#104]
str r8,[sp,#104]

# qhasm: v4 ^= (v9 >>> 29)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#9,ROR #29
# asm 2: eor >v4=r6,<v4=r6,<v9=r8,ROR #29
eor r6,r6,r8,ROR #29

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t108 ^= c2
# asm 1: eor >t108=int32#6,<t108=int32#6,<c2=int32#14
# asm 2: eor >t108=r5,<t108=r5,<c2=r14
eor r5,r5,r14

# qhasm: v2 += (v7 >>> 23)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #23
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #23
add r3,r3,r12,ROR #23

# qhasm: v2 += (t108 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t108=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t108=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#6,<c9_stack=stack32#20
# asm 2: ldr >c9=r5,<c9_stack=[sp,#204]
ldr r5,[sp,#204]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v2=int32#4,ROR #8
# asm 2: eor >v13=r8,<v13=r11,<v2=r3,ROR #8
eor r8,r11,r3,ROR #8

# qhasm: t109 = mem32[&m2m3_stack]
# asm 1: ldr >t109=int32#10,<m2m3_stack=stack64#7
# asm 2: ldr >t109=r9,<m2m3_stack=[sp,#48]
ldr r9,[sp,#48]

# qhasm: v8 += (v13 >>> 8)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v8=r10,<v8=r10,<v13=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#14,<c3_stack=stack32#14
# asm 2: ldr >c3=r14,<c3_stack=[sp,#180]
ldr r14,[sp,#180]

# qhasm: v7 ^= (v8 >>> 9)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#11,ROR #9
# asm 2: eor >v7=r12,<v7=r12,<v8=r10,ROR #9
eor r12,r12,r10,ROR #9

# qhasm: t109 ^= c9
# asm 1: eor >t109=int32#6,<t109=int32#10,<c9=int32#6
# asm 2: eor >t109=r5,<t109=r9,<c9=r5
eor r5,r9,r5

# qhasm: v2 += (v7 >>> 3)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #3
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #3
add r3,r3,r12,ROR #3

# qhasm: v2 += (t109 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t109=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t109=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t110 = mem32[&m6m7_stack]
# asm 1: ldr >t110=int32#6,<m6m7_stack=stack64#9
# asm 2: ldr >t110=r5,<m6m7_stack=[sp,#64]
ldr r5,[sp,#64]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v2=int32#4,ROR #24
# asm 2: eor >v13=r8,<v13=r8,<v2=r3,ROR #24
eor r8,r8,r3,ROR #24

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v13=r8,<v9v13_stack=[sp,#108]
str r8,[sp,#108]

# qhasm: v8 += (v13 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v8=r8,<v8=r10,<v13=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t110 ^= c3
# asm 1: eor >t110=int32#6,<t110=int32#6,<c3=int32#14
# asm 2: eor >t110=r5,<t110=r5,<c3=r14
eor r5,r5,r14

# qhasm: v1 += (v6 >>> 23)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #23
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #23
add r2,r2,r1,ROR #23

# qhasm: v1 += (t110 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t110=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t110=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#6,<c6_stack=stack32#17
# asm 2: ldr >c6=r5,<c6_stack=[sp,#192]
ldr r5,[sp,#192]

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#10,<v12=int32#12,<v1=int32#3,ROR #8
# asm 2: eor >v12=r9,<v12=r11,<v1=r2,ROR #8
eor r9,r11,r2,ROR #8

# qhasm: t111 = mem32[&m2m3_stack+4]
# asm 1: ldr >t111=int32#12,<m2m3_stack=stack64#7
# asm 2: ldr >t111=r11,<m2m3_stack=[sp,#52]
ldr r11,[sp,#52]

# qhasm: v11 += (v12 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #8
add r10,r10,r9,ROR #8

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#14,<c11_stack=stack32#22
# asm 2: ldr >c11=r14,<c11_stack=[sp,#212]
ldr r14,[sp,#212]

# qhasm: v6 ^= (v11 >>> 9)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #9
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #9
eor r1,r1,r10,ROR #9

# qhasm: t111 ^= c6
# asm 1: eor >t111=int32#6,<t111=int32#12,<c6=int32#6
# asm 2: eor >t111=r5,<t111=r11,<c6=r5
eor r5,r11,r5

# qhasm: v1 += (v6 >>> 3)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #3
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #3
add r2,r2,r1,ROR #3

# qhasm: v1 += (t111 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t111=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t111=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t112 = mem32[&m12m13_stack+4]
# asm 1: ldr >t112=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t112=r5,<m12m13_stack=[sp,#92]
ldr r5,[sp,#92]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v1=int32#3,ROR #24
# asm 2: eor >v12=r9,<v12=r9,<v1=r2,ROR #24
eor r9,r9,r2,ROR #24

# qhasm: v7 ^= (v8 >>> 29)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#9,ROR #29
# asm 2: eor >v7=r12,<v7=r12,<v8=r8,ROR #29
eor r12,r12,r8,ROR #29

# qhasm: v11 += (v12 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#11,<v11v15_stack=stack64#16
# asm 2: str <v11=r10,<v11v15_stack=[sp,#120]
str r10,[sp,#120]

# qhasm: v6 ^= (v11 >>> 29)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #29
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #29
eor r1,r1,r10,ROR #29

# qhasm: t112 ^= c11
# asm 1: eor >t112=int32#6,<t112=int32#6,<c11=int32#14
# asm 2: eor >t112=r5,<t112=r5,<c11=r14
eor r5,r5,r14

# qhasm: v0 += (v4 >>> 10)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #10
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #10
add r0,r0,r6,ROR #10

# qhasm: v0 += (t112 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t112=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t112=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#6,<c13_stack=stack32#24
# asm 2: ldr >c13=r5,<c13_stack=[sp,#220]
ldr r5,[sp,#220]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: t113 = mem32[&m10m11_stack+4]
# asm 1: ldr >t113=int32#11,<m10m11_stack=stack64#11
# asm 2: ldr >t113=r10,<m10m11_stack=[sp,#84]
ldr r10,[sp,#84]

# qhasm: v8 += (v12 >>> 0)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #0
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #0
add r8,r8,r9,ROR #0

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#14,<c14_stack=stack32#25
# asm 2: ldr >c14=r14,<c14_stack=[sp,#224]
ldr r14,[sp,#224]

# qhasm: v4 ^= (v8 >>> 22)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #22
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #22
eor r6,r6,r8,ROR #22

# qhasm: t113 ^= c13
# asm 1: eor >t113=int32#6,<t113=int32#11,<c13=int32#6
# asm 2: eor >t113=r5,<t113=r10,<c13=r5
eor r5,r10,r5

# qhasm: v0 += (v4 >>> 22)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #22
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #22
add r0,r0,r6,ROR #22

# qhasm: v0 += (t113 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t113=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t113=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t114 = mem32[&m6m7_stack+4]
# asm 1: ldr >t114=int32#6,<m6m7_stack=stack64#9
# asm 2: ldr >t114=r5,<m6m7_stack=[sp,#68]
ldr r5,[sp,#68]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #0
eor r9,r9,r0,ROR #0

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 8)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #8
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 10)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #10
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #10
eor r6,r6,r8,ROR #10

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t114 ^= c14
# asm 1: eor >t114=int32#6,<t114=int32#6,<c14=int32#14
# asm 2: eor >t114=r5,<t114=r5,<c14=r14
eor r5,r5,r14

# qhasm: v1 += (v5 >>> 10)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #10
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #10
add r2,r2,r7,ROR #10

# qhasm: v1 += (t114 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t114=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t114=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#6,<c7_stack=stack32#18
# asm 2: ldr >c7=r5,<c7_stack=[sp,#196]
ldr r5,[sp,#196]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #16
eor r8,r11,r2,ROR #16

# qhasm: t115 = mem32[&m14m15_stack]
# asm 1: ldr >t115=int32#10,<m14m15_stack=stack64#13
# asm 2: ldr >t115=r9,<m14m15_stack=[sp,#96]
ldr r9,[sp,#96]

# qhasm: v9 += (v13 >>> 0)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #0
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#14,<c1_stack=stack32#12
# asm 2: ldr >c1=r14,<c1_stack=[sp,#172]
ldr r14,[sp,#172]

# qhasm: v5 ^= (v9 >>> 22)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #22
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #22
eor r7,r7,r10,ROR #22

# qhasm: t115 ^= c7
# asm 1: eor >t115=int32#6,<t115=int32#10,<c7=int32#6
# asm 2: eor >t115=r5,<t115=r9,<c7=r5
eor r5,r9,r5

# qhasm: v1 += (v5 >>> 22)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #22
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #22
add r2,r2,r7,ROR #22

# qhasm: v1 += (t115 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t115=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t115=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t116 = mem32[&m12m13_stack]
# asm 1: ldr >t116=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t116=r5,<m12m13_stack=[sp,#88]
ldr r5,[sp,#88]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #0
eor r8,r8,r2,ROR #0

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 8)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 10)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #10
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #10
eor r7,r7,r8,ROR #10

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t116 ^= c1
# asm 1: eor >t116=int32#6,<t116=int32#6,<c1=int32#14
# asm 2: eor >t116=r5,<t116=r5,<c1=r14
eor r5,r5,r14

# qhasm: v2 += (v6 >>> 10)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #10
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #10
add r3,r3,r1,ROR #10

# qhasm: v2 += (t116 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t116=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t116=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#6,<c12_stack=stack32#23
# asm 2: ldr >c12=r5,<c12_stack=[sp,#216]
ldr r5,[sp,#216]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #16
eor r8,r11,r3,ROR #16

# qhasm: t117 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t117=int32#10,<m0m1_stack=stack64#6
# asm 2: ldr >t117=r9,<m0m1_stack=[sp,#44]
ldr r9,[sp,#44]

# qhasm: v10 += (v14 >>> 0)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #0
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#14,<c9_stack=stack32#20
# asm 2: ldr >c9=r14,<c9_stack=[sp,#204]
ldr r14,[sp,#204]

# qhasm: v6 ^= (v10 >>> 22)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #22
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #22
eor r1,r1,r10,ROR #22

# qhasm: t117 ^= c12
# asm 1: eor >t117=int32#6,<t117=int32#10,<c12=int32#6
# asm 2: eor >t117=r5,<t117=r9,<c12=r5
eor r5,r9,r5

# qhasm: v2 += (v6 >>> 22)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #22
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #22
add r3,r3,r1,ROR #22

# qhasm: v2 += (t117 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t117=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t117=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t118 = mem32[&m2m3_stack+4]
# asm 1: ldr >t118=int32#6,<m2m3_stack=stack64#7
# asm 2: ldr >t118=r5,<m2m3_stack=[sp,#52]
ldr r5,[sp,#52]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #0
eor r8,r8,r3,ROR #0

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t118 ^= c9
# asm 1: eor >t118=int32#6,<t118=int32#6,<c9=int32#14
# asm 2: eor >t118=r5,<t118=r5,<c9=r14
eor r5,r5,r14

# qhasm: v3 += (v7 >>> 10)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #10
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #10
add r4,r4,r12,ROR #10

# qhasm: v3 += (t118 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t118=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t118=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#6,<c3_stack=stack32#14
# asm 2: ldr >c3=r5,<c3_stack=[sp,#180]
ldr r5,[sp,#180]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#10,<v15=int32#12,<v3=int32#5,ROR #16
# asm 2: eor >v15=r9,<v15=r11,<v3=r4,ROR #16
eor r9,r11,r4,ROR #16

# qhasm: t119 = mem32[&m8m9_stack+4]
# asm 1: ldr >t119=int32#12,<m8m9_stack=stack64#10
# asm 2: ldr >t119=r11,<m8m9_stack=[sp,#76]
ldr r11,[sp,#76]

# qhasm: v11 += (v15 >>> 0)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #0
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #0
add r10,r10,r9,ROR #0

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#14,<c0_stack=stack32#11
# asm 2: ldr >c0=r14,<c0_stack=[sp,#168]
ldr r14,[sp,#168]

# qhasm: v7 ^= (v11 >>> 22)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #22
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #22
eor r12,r12,r10,ROR #22

# qhasm: t119 ^= c3
# asm 1: eor >t119=int32#6,<t119=int32#12,<c3=int32#6
# asm 2: eor >t119=r5,<t119=r11,<c3=r5
eor r5,r11,r5

# qhasm: v3 += (v7 >>> 22)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #22
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #22
add r4,r4,r12,ROR #22

# qhasm: v3 += (t119 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t119=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t119=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t120 = mem32[&m4m5_stack+4]
# asm 1: ldr >t120=int32#6,<m4m5_stack=stack64#8
# asm 2: ldr >t120=r5,<m4m5_stack=[sp,#60]
ldr r5,[sp,#60]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v3=int32#5,ROR #0
# asm 2: eor >v15=r9,<v15=r9,<v3=r4,ROR #0
eor r9,r9,r4,ROR #0

# qhasm: v6 ^= (v10 >>> 10)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #10
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #10
eor r1,r1,r8,ROR #10

# qhasm: v11 += (v15 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #8
add r10,r10,r9,ROR #8

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 10)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #10
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #10
eor r12,r12,r10,ROR #10

# qhasm: t120 ^= c0
# asm 1: eor >t120=int32#6,<t120=int32#6,<c0=int32#14
# asm 2: eor >t120=r5,<t120=r5,<c0=r14
eor r5,r5,r14

# qhasm: v0 += (v5 >>> 29)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #29
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #29
add r0,r0,r7,ROR #29

# qhasm: v0 += (t120 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t120=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t120=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#6,<c5_stack=stack32#16
# asm 2: ldr >c5=r5,<c5_stack=[sp,#188]
ldr r5,[sp,#188]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #24
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #24
eor r9,r9,r0,ROR #24

# qhasm: t121 = mem32[&m0m1_stack]
# asm 1: ldr >t121=int32#11,<m0m1_stack=stack64#6
# asm 2: ldr >t121=r10,<m0m1_stack=[sp,#40]
ldr r10,[sp,#40]

# qhasm: v10 += (v15 >>> 24)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #24
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #24
add r8,r8,r9,ROR #24

# qhasm: c10 = c10_stack
# asm 1: ldr >c10=int32#14,<c10_stack=stack32#21
# asm 2: ldr >c10=r14,<c10_stack=[sp,#208]
ldr r14,[sp,#208]

# qhasm: v5 ^= (v10 >>> 3)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #3
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #3
eor r7,r7,r8,ROR #3

# qhasm: t121 ^= c5
# asm 1: eor >t121=int32#6,<t121=int32#11,<c5=int32#6
# asm 2: eor >t121=r5,<t121=r10,<c5=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 9)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #9
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #9
add r0,r0,r7,ROR #9

# qhasm: v0 += (t121 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t121=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t121=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t122 = mem32[&m2m3_stack]
# asm 1: ldr >t122=int32#6,<m2m3_stack=stack64#7
# asm 2: ldr >t122=r5,<m2m3_stack=[sp,#48]
ldr r5,[sp,#48]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #8
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #8
eor r9,r9,r0,ROR #8

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#10,<v11v15_stack=stack64#16
# asm 2: str <v15=r9,<v11v15_stack=[sp,#124]
str r9,[sp,#124]

# qhasm: v10 += (v15 >>> 0)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #0
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #0
add r8,r8,r9,ROR #0

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 23)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #23
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #23
eor r7,r7,r8,ROR #23

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t122 ^= c10
# asm 1: eor >t122=int32#6,<t122=int32#6,<c10=int32#14
# asm 2: eor >t122=r5,<t122=r5,<c10=r14
eor r5,r5,r14

# qhasm: v3 += (v4 >>> 29)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #29
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #29
add r4,r4,r6,ROR #29

# qhasm: v3 += (t122 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t122=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t122=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#6,<c2_stack=stack32#13
# asm 2: ldr >c2=r5,<c2_stack=[sp,#176]
ldr r5,[sp,#176]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#5,ROR #24
# asm 2: eor >v14=r8,<v14=r11,<v3=r4,ROR #24
eor r8,r11,r4,ROR #24

# qhasm: t123 = mem32[&m10m11_stack]
# asm 1: ldr >t123=int32#10,<m10m11_stack=stack64#11
# asm 2: ldr >t123=r9,<m10m11_stack=[sp,#80]
ldr r9,[sp,#80]

# qhasm: v9 += (v14 >>> 24)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #24
add r10,r10,r8,ROR #24

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#14,<c6_stack=stack32#17
# asm 2: ldr >c6=r14,<c6_stack=[sp,#192]
ldr r14,[sp,#192]

# qhasm: v4 ^= (v9 >>> 3)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #3
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #3
eor r6,r6,r10,ROR #3

# qhasm: t123 ^= c2
# asm 1: eor >t123=int32#6,<t123=int32#10,<c2=int32#6
# asm 2: eor >t123=r5,<t123=r9,<c2=r5
eor r5,r9,r5

# qhasm: v3 += (v4 >>> 9)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #9
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #9
add r4,r4,r6,ROR #9

# qhasm: v3 += (t123 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t123=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t123=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t124 = mem32[&m8m9_stack]
# asm 1: ldr >t124=int32#6,<m8m9_stack=stack64#10
# asm 2: ldr >t124=r5,<m8m9_stack=[sp,#72]
ldr r5,[sp,#72]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v3=int32#5,ROR #8
# asm 2: eor >v14=r8,<v14=r8,<v3=r4,ROR #8
eor r8,r8,r4,ROR #8

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v14=r8,<v10v14_stack=[sp,#116]
str r8,[sp,#116]

# qhasm: v9 += (v14 >>> 0)
# asm 1: add >v9=int32#9,<v9=int32#11,<v14=int32#9,ROR #0
# asm 2: add >v9=r8,<v9=r10,<v14=r8,ROR #0
add r8,r10,r8,ROR #0

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v9=r8,<v9v13_stack=[sp,#104]
str r8,[sp,#104]

# qhasm: v4 ^= (v9 >>> 23)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#9,ROR #23
# asm 2: eor >v4=r6,<v4=r6,<v9=r8,ROR #23
eor r6,r6,r8,ROR #23

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t124 ^= c6
# asm 1: eor >t124=int32#6,<t124=int32#6,<c6=int32#14
# asm 2: eor >t124=r5,<t124=r5,<c6=r14
eor r5,r5,r14

# qhasm: v2 += (v7 >>> 29)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #29
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #29
add r3,r3,r12,ROR #29

# qhasm: v2 += (t124 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t124=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t124=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#6,<c8_stack=stack32#19
# asm 2: ldr >c8=r5,<c8_stack=[sp,#200]
ldr r5,[sp,#200]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v2=int32#4,ROR #24
# asm 2: eor >v13=r8,<v13=r11,<v2=r3,ROR #24
eor r8,r11,r3,ROR #24

# qhasm: t125 = mem32[&m6m7_stack]
# asm 1: ldr >t125=int32#10,<m6m7_stack=stack64#9
# asm 2: ldr >t125=r9,<m6m7_stack=[sp,#64]
ldr r9,[sp,#64]

# qhasm: v8 += (v13 >>> 24)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#9,ROR #24
# asm 2: add >v8=r10,<v8=r10,<v13=r8,ROR #24
add r10,r10,r8,ROR #24

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#14,<c4_stack=stack32#15
# asm 2: ldr >c4=r14,<c4_stack=[sp,#184]
ldr r14,[sp,#184]

# qhasm: v7 ^= (v8 >>> 3)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#11,ROR #3
# asm 2: eor >v7=r12,<v7=r12,<v8=r10,ROR #3
eor r12,r12,r10,ROR #3

# qhasm: t125 ^= c8
# asm 1: eor >t125=int32#6,<t125=int32#10,<c8=int32#6
# asm 2: eor >t125=r5,<t125=r9,<c8=r5
eor r5,r9,r5

# qhasm: v2 += (v7 >>> 9)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #9
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #9
add r3,r3,r12,ROR #9

# qhasm: v2 += (t125 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t125=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t125=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t126 = mem32[&m14m15_stack+4]
# asm 1: ldr >t126=int32#6,<m14m15_stack=stack64#13
# asm 2: ldr >t126=r5,<m14m15_stack=[sp,#100]
ldr r5,[sp,#100]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v2=int32#4,ROR #8
# asm 2: eor >v13=r8,<v13=r8,<v2=r3,ROR #8
eor r8,r8,r3,ROR #8

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v13=r8,<v9v13_stack=[sp,#108]
str r8,[sp,#108]

# qhasm: v8 += (v13 >>> 0)
# asm 1: add >v8=int32#9,<v8=int32#11,<v13=int32#9,ROR #0
# asm 2: add >v8=r8,<v8=r10,<v13=r8,ROR #0
add r8,r10,r8,ROR #0

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t126 ^= c4
# asm 1: eor >t126=int32#6,<t126=int32#6,<c4=int32#14
# asm 2: eor >t126=r5,<t126=r5,<c4=r14
eor r5,r5,r14

# qhasm: v1 += (v6 >>> 29)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #29
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #29
add r2,r2,r1,ROR #29

# qhasm: v1 += (t126 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t126=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t126=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c15 = c15_stack
# asm 1: ldr >c15=int32#6,<c15_stack=stack32#26
# asm 2: ldr >c15=r5,<c15_stack=[sp,#228]
ldr r5,[sp,#228]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#10,<v12=int32#12,<v1=int32#3,ROR #24
# asm 2: eor >v12=r9,<v12=r11,<v1=r2,ROR #24
eor r9,r11,r2,ROR #24

# qhasm: t127 = mem32[&m4m5_stack]
# asm 1: ldr >t127=int32#12,<m4m5_stack=stack64#8
# asm 2: ldr >t127=r11,<m4m5_stack=[sp,#56]
ldr r11,[sp,#56]

# qhasm: v11 += (v12 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #24
add r10,r10,r9,ROR #24

# qhasm: v7 ^= (v8 >>> 23)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#9,ROR #23
# asm 2: eor >v7=r12,<v7=r12,<v8=r8,ROR #23
eor r12,r12,r8,ROR #23

# qhasm: v6 ^= (v11 >>> 3)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #3
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #3
eor r1,r1,r10,ROR #3

# qhasm: t127 ^= c15
# asm 1: eor >t127=int32#12,<t127=int32#12,<c15=int32#6
# asm 2: eor >t127=r11,<t127=r11,<c15=r5
eor r11,r11,r5

# qhasm: v1 += (v6 >>> 9)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #9
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #9
add r2,r2,r1,ROR #9

# qhasm: v1 += (t127 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t127=int32#12,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t127=r11,ROR #0
add r2,r2,r11,ROR #0

# qhasm: t128 = mem32[&m6m7_stack]
# asm 1: ldr >t128=int32#12,<m6m7_stack=stack64#9
# asm 2: ldr >t128=r11,<m6m7_stack=[sp,#64]
ldr r11,[sp,#64]

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v1=int32#3,ROR #8
# asm 2: eor >v12=r9,<v12=r9,<v1=r2,ROR #8
eor r9,r9,r2,ROR #8

# qhasm: v0 += (v4 >>> 16)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #16
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #16
add r0,r0,r6,ROR #16

# qhasm: v11 += (v12 >>> 0)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #0
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #0
add r10,r10,r9,ROR #0

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#11,<v11v15_stack=stack64#16
# asm 2: str <v11=r10,<v11v15_stack=[sp,#120]
str r10,[sp,#120]

# qhasm: v6 ^= (v11 >>> 23)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #23
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #23
eor r1,r1,r10,ROR #23

# qhasm: t128 ^= c15
# asm 1: eor >t128=int32#6,<t128=int32#12,<c15=int32#6
# asm 2: eor >t128=r5,<t128=r11,<c15=r5
eor r5,r11,r5

# qhasm: v0 += (t128 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t128=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t128=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#6,<c6_stack=stack32#17
# asm 2: ldr >c6=r5,<c6_stack=[sp,#192]
ldr r5,[sp,#192]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #0
eor r9,r9,r0,ROR #0

# qhasm: t129 = mem32[&m14m15_stack+4]
# asm 1: ldr >t129=int32#11,<m14m15_stack=stack64#13
# asm 2: ldr >t129=r10,<m14m15_stack=[sp,#100]
ldr r10,[sp,#100]

# qhasm: v8 += (v12 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #16
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#14,<c9_stack=stack32#20
# asm 2: ldr >c9=r14,<c9_stack=[sp,#204]
ldr r14,[sp,#204]

# qhasm: v4 ^= (v8 >>> 16)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #16
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #16
eor r6,r6,r8,ROR #16

# qhasm: t129 ^= c6
# asm 1: eor >t129=int32#6,<t129=int32#11,<c6=int32#6
# asm 2: eor >t129=r5,<t129=r10,<c6=r5
eor r5,r10,r5

# qhasm: v0 += (v4 >>> 28)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #28
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #28
add r0,r0,r6,ROR #28

# qhasm: v0 += (t129 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t129=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t129=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t130 = mem32[&m14m15_stack]
# asm 1: ldr >t130=int32#6,<m14m15_stack=stack64#13
# asm 2: ldr >t130=r5,<m14m15_stack=[sp,#96]
ldr r5,[sp,#96]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 24)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #24
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #24
add r8,r8,r9,ROR #24

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 4)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #4
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #4
eor r6,r6,r8,ROR #4

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t130 ^= c9
# asm 1: eor >t130=int32#6,<t130=int32#6,<c9=int32#14
# asm 2: eor >t130=r5,<t130=r5,<c9=r14
eor r5,r5,r14

# qhasm: v1 += (v5 >>> 16)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #16
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #16
add r2,r2,r7,ROR #16

# qhasm: v1 += (t130 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t130=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t130=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#6,<c14_stack=stack32#25
# asm 2: ldr >c14=r5,<c14_stack=[sp,#224]
ldr r5,[sp,#224]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #0
eor r8,r11,r2,ROR #0

# qhasm: t131 = mem32[&m8m9_stack+4]
# asm 1: ldr >t131=int32#10,<m8m9_stack=stack64#10
# asm 2: ldr >t131=r9,<m8m9_stack=[sp,#76]
ldr r9,[sp,#76]

# qhasm: v9 += (v13 >>> 16)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#14,<c3_stack=stack32#14
# asm 2: ldr >c3=r14,<c3_stack=[sp,#180]
ldr r14,[sp,#180]

# qhasm: v5 ^= (v9 >>> 16)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #16
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #16
eor r7,r7,r10,ROR #16

# qhasm: t131 ^= c14
# asm 1: eor >t131=int32#6,<t131=int32#10,<c14=int32#6
# asm 2: eor >t131=r5,<t131=r9,<c14=r5
eor r5,r9,r5

# qhasm: v1 += (v5 >>> 28)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #28
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #28
add r2,r2,r7,ROR #28

# qhasm: v1 += (t131 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t131=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t131=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t132 = mem32[&m10m11_stack+4]
# asm 1: ldr >t132=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t132=r5,<m10m11_stack=[sp,#84]
ldr r5,[sp,#84]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #16
eor r8,r8,r2,ROR #16

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 24)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #24
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 4)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #4
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #4
eor r7,r7,r8,ROR #4

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t132 ^= c3
# asm 1: eor >t132=int32#6,<t132=int32#6,<c3=int32#14
# asm 2: eor >t132=r5,<t132=r5,<c3=r14
eor r5,r5,r14

# qhasm: v2 += (v6 >>> 16)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #16
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #16
add r3,r3,r1,ROR #16

# qhasm: v2 += (t132 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t132=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t132=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#6,<c11_stack=stack32#22
# asm 2: ldr >c11=r5,<c11_stack=[sp,#212]
ldr r5,[sp,#212]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #0
eor r8,r11,r3,ROR #0

# qhasm: t133 = mem32[&m2m3_stack+4]
# asm 1: ldr >t133=int32#10,<m2m3_stack=stack64#7
# asm 2: ldr >t133=r9,<m2m3_stack=[sp,#52]
ldr r9,[sp,#52]

# qhasm: v10 += (v14 >>> 16)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#14,<c8_stack=stack32#19
# asm 2: ldr >c8=r14,<c8_stack=[sp,#200]
ldr r14,[sp,#200]

# qhasm: v6 ^= (v10 >>> 16)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #16
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #16
eor r1,r1,r10,ROR #16

# qhasm: t133 ^= c11
# asm 1: eor >t133=int32#6,<t133=int32#10,<c11=int32#6
# asm 2: eor >t133=r5,<t133=r9,<c11=r5
eor r5,r9,r5

# qhasm: v2 += (v6 >>> 28)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #28
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #28
add r3,r3,r1,ROR #28

# qhasm: v2 += (t133 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t133=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t133=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t134 = mem32[&m0m1_stack]
# asm 1: ldr >t134=int32#6,<m0m1_stack=stack64#6
# asm 2: ldr >t134=r5,<m0m1_stack=[sp,#40]
ldr r5,[sp,#40]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #16
eor r8,r8,r3,ROR #16

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 24)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t134 ^= c8
# asm 1: eor >t134=int32#6,<t134=int32#6,<c8=int32#14
# asm 2: eor >t134=r5,<t134=r5,<c8=r14
eor r5,r5,r14

# qhasm: v3 += (v7 >>> 16)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #16
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #16
add r4,r4,r12,ROR #16

# qhasm: v3 += (t134 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t134=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t134=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#6,<c0_stack=stack32#11
# asm 2: ldr >c0=r5,<c0_stack=[sp,#168]
ldr r5,[sp,#168]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#10,<v15=int32#12,<v3=int32#5,ROR #0
# asm 2: eor >v15=r9,<v15=r11,<v3=r4,ROR #0
eor r9,r11,r4,ROR #0

# qhasm: t135 = mem32[&m8m9_stack]
# asm 1: ldr >t135=int32#12,<m8m9_stack=stack64#10
# asm 2: ldr >t135=r11,<m8m9_stack=[sp,#72]
ldr r11,[sp,#72]

# qhasm: v11 += (v15 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#14,<c2_stack=stack32#13
# asm 2: ldr >c2=r14,<c2_stack=[sp,#176]
ldr r14,[sp,#176]

# qhasm: v7 ^= (v11 >>> 16)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #16
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #16
eor r12,r12,r10,ROR #16

# qhasm: t135 ^= c0
# asm 1: eor >t135=int32#6,<t135=int32#12,<c0=int32#6
# asm 2: eor >t135=r5,<t135=r11,<c0=r5
eor r5,r11,r5

# qhasm: v3 += (v7 >>> 28)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #28
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #28
add r4,r4,r12,ROR #28

# qhasm: v3 += (t135 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t135=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t135=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t136 = mem32[&m12m13_stack]
# asm 1: ldr >t136=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t136=r5,<m12m13_stack=[sp,#88]
ldr r5,[sp,#88]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v3=int32#5,ROR #16
# asm 2: eor >v15=r9,<v15=r9,<v3=r4,ROR #16
eor r9,r9,r4,ROR #16

# qhasm: v6 ^= (v10 >>> 4)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #4
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #4
eor r1,r1,r8,ROR #4

# qhasm: v11 += (v15 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #24
add r10,r10,r9,ROR #24

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 4)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #4
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #4
eor r12,r12,r10,ROR #4

# qhasm: t136 ^= c2
# asm 1: eor >t136=int32#6,<t136=int32#6,<c2=int32#14
# asm 2: eor >t136=r5,<t136=r5,<c2=r14
eor r5,r5,r14

# qhasm: v0 += (v5 >>> 3)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #3
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #3
add r0,r0,r7,ROR #3

# qhasm: v0 += (t136 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t136=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t136=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#6,<c12_stack=stack32#23
# asm 2: ldr >c12=r5,<c12_stack=[sp,#216]
ldr r5,[sp,#216]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #8
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #8
eor r9,r9,r0,ROR #8

# qhasm: t137 = mem32[&m2m3_stack]
# asm 1: ldr >t137=int32#11,<m2m3_stack=stack64#7
# asm 2: ldr >t137=r10,<m2m3_stack=[sp,#48]
ldr r10,[sp,#48]

# qhasm: v10 += (v15 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #8
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#14,<c5_stack=stack32#16
# asm 2: ldr >c5=r14,<c5_stack=[sp,#188]
ldr r14,[sp,#188]

# qhasm: v5 ^= (v10 >>> 29)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #29
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #29
eor r7,r7,r8,ROR #29

# qhasm: t137 ^= c12
# asm 1: eor >t137=int32#6,<t137=int32#11,<c12=int32#6
# asm 2: eor >t137=r5,<t137=r10,<c12=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 15)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #15
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #15
add r0,r0,r7,ROR #15

# qhasm: v0 += (t137 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t137=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t137=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t138 = mem32[&m10m11_stack]
# asm 1: ldr >t138=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t138=r5,<m10m11_stack=[sp,#80]
ldr r5,[sp,#80]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #24
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #24
eor r9,r9,r0,ROR #24

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#10,<v11v15_stack=stack64#16
# asm 2: str <v15=r9,<v11v15_stack=[sp,#124]
str r9,[sp,#124]

# qhasm: v10 += (v15 >>> 16)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #16
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 17)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #17
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #17
eor r7,r7,r8,ROR #17

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t138 ^= c5
# asm 1: eor >t138=int32#6,<t138=int32#6,<c5=int32#14
# asm 2: eor >t138=r5,<t138=r5,<c5=r14
eor r5,r5,r14

# qhasm: v3 += (v4 >>> 3)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #3
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #3
add r4,r4,r6,ROR #3

# qhasm: v3 += (t138 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t138=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t138=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c10 = c10_stack
# asm 1: ldr >c10=int32#6,<c10_stack=stack32#21
# asm 2: ldr >c10=r5,<c10_stack=[sp,#208]
ldr r5,[sp,#208]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#5,ROR #8
# asm 2: eor >v14=r8,<v14=r11,<v3=r4,ROR #8
eor r8,r11,r4,ROR #8

# qhasm: t139 = mem32[&m4m5_stack+4]
# asm 1: ldr >t139=int32#10,<m4m5_stack=stack64#8
# asm 2: ldr >t139=r9,<m4m5_stack=[sp,#60]
ldr r9,[sp,#60]

# qhasm: v9 += (v14 >>> 8)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#14,<c4_stack=stack32#15
# asm 2: ldr >c4=r14,<c4_stack=[sp,#184]
ldr r14,[sp,#184]

# qhasm: v4 ^= (v9 >>> 29)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #29
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #29
eor r6,r6,r10,ROR #29

# qhasm: t139 ^= c10
# asm 1: eor >t139=int32#6,<t139=int32#10,<c10=int32#6
# asm 2: eor >t139=r5,<t139=r9,<c10=r5
eor r5,r9,r5

# qhasm: v3 += (v4 >>> 15)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #15
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #15
add r4,r4,r6,ROR #15

# qhasm: v3 += (t139 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t139=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t139=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t140 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t140=int32#6,<m0m1_stack=stack64#6
# asm 2: ldr >t140=r5,<m0m1_stack=[sp,#44]
ldr r5,[sp,#44]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v3=int32#5,ROR #24
# asm 2: eor >v14=r8,<v14=r8,<v3=r4,ROR #24
eor r8,r8,r4,ROR #24

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v14=r8,<v10v14_stack=[sp,#116]
str r8,[sp,#116]

# qhasm: v9 += (v14 >>> 16)
# asm 1: add >v9=int32#9,<v9=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v9=r8,<v9=r10,<v14=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v9=r8,<v9v13_stack=[sp,#104]
str r8,[sp,#104]

# qhasm: v4 ^= (v9 >>> 17)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#9,ROR #17
# asm 2: eor >v4=r6,<v4=r6,<v9=r8,ROR #17
eor r6,r6,r8,ROR #17

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t140 ^= c4
# asm 1: eor >t140=int32#6,<t140=int32#6,<c4=int32#14
# asm 2: eor >t140=r5,<t140=r5,<c4=r14
eor r5,r5,r14

# qhasm: v2 += (v7 >>> 3)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #3
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #3
add r3,r3,r12,ROR #3

# qhasm: v2 += (t140 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t140=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t140=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#6,<c1_stack=stack32#12
# asm 2: ldr >c1=r5,<c1_stack=[sp,#172]
ldr r5,[sp,#172]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v2=int32#4,ROR #8
# asm 2: eor >v13=r8,<v13=r11,<v2=r3,ROR #8
eor r8,r11,r3,ROR #8

# qhasm: t141 = mem32[&m4m5_stack]
# asm 1: ldr >t141=int32#10,<m4m5_stack=stack64#8
# asm 2: ldr >t141=r9,<m4m5_stack=[sp,#56]
ldr r9,[sp,#56]

# qhasm: v8 += (v13 >>> 8)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v8=r10,<v8=r10,<v13=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#14,<c7_stack=stack32#18
# asm 2: ldr >c7=r14,<c7_stack=[sp,#196]
ldr r14,[sp,#196]

# qhasm: v7 ^= (v8 >>> 29)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#11,ROR #29
# asm 2: eor >v7=r12,<v7=r12,<v8=r10,ROR #29
eor r12,r12,r10,ROR #29

# qhasm: t141 ^= c1
# asm 1: eor >t141=int32#6,<t141=int32#10,<c1=int32#6
# asm 2: eor >t141=r5,<t141=r9,<c1=r5
eor r5,r9,r5

# qhasm: v2 += (v7 >>> 15)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #15
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #15
add r3,r3,r12,ROR #15

# qhasm: v2 += (t141 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t141=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t141=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t142 = mem32[&m12m13_stack+4]
# asm 1: ldr >t142=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t142=r5,<m12m13_stack=[sp,#92]
ldr r5,[sp,#92]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v2=int32#4,ROR #24
# asm 2: eor >v13=r8,<v13=r8,<v2=r3,ROR #24
eor r8,r8,r3,ROR #24

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v13=r8,<v9v13_stack=[sp,#108]
str r8,[sp,#108]

# qhasm: v8 += (v13 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v8=r8,<v8=r10,<v13=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t142 ^= c7
# asm 1: eor >t142=int32#6,<t142=int32#6,<c7=int32#14
# asm 2: eor >t142=r5,<t142=r5,<c7=r14
eor r5,r5,r14

# qhasm: v1 += (v6 >>> 3)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #3
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #3
add r2,r2,r1,ROR #3

# qhasm: v1 += (t142 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t142=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t142=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#6,<c13_stack=stack32#24
# asm 2: ldr >c13=r5,<c13_stack=[sp,#220]
ldr r5,[sp,#220]

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#10,<v12=int32#12,<v1=int32#3,ROR #8
# asm 2: eor >v12=r9,<v12=r11,<v1=r2,ROR #8
eor r9,r11,r2,ROR #8

# qhasm: t143 = mem32[&m6m7_stack+4]
# asm 1: ldr >t143=int32#12,<m6m7_stack=stack64#9
# asm 2: ldr >t143=r11,<m6m7_stack=[sp,#68]
ldr r11,[sp,#68]

# qhasm: v11 += (v12 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #8
add r10,r10,r9,ROR #8

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#14,<c2_stack=stack32#13
# asm 2: ldr >c2=r14,<c2_stack=[sp,#176]
ldr r14,[sp,#176]

# qhasm: v6 ^= (v11 >>> 29)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #29
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #29
eor r1,r1,r10,ROR #29

# qhasm: t143 ^= c13
# asm 1: eor >t143=int32#6,<t143=int32#12,<c13=int32#6
# asm 2: eor >t143=r5,<t143=r11,<c13=r5
eor r5,r11,r5

# qhasm: v1 += (v6 >>> 15)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #15
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #15
add r2,r2,r1,ROR #15

# qhasm: v1 += (t143 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t143=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t143=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t144 = mem32[&m10m11_stack]
# asm 1: ldr >t144=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t144=r5,<m10m11_stack=[sp,#80]
ldr r5,[sp,#80]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v1=int32#3,ROR #24
# asm 2: eor >v12=r9,<v12=r9,<v1=r2,ROR #24
eor r9,r9,r2,ROR #24

# qhasm: v7 ^= (v8 >>> 17)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#9,ROR #17
# asm 2: eor >v7=r12,<v7=r12,<v8=r8,ROR #17
eor r12,r12,r8,ROR #17

# qhasm: v11 += (v12 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#11,<v11v15_stack=stack64#16
# asm 2: str <v11=r10,<v11v15_stack=[sp,#120]
str r10,[sp,#120]

# qhasm: v6 ^= (v11 >>> 17)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #17
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #17
eor r1,r1,r10,ROR #17

# qhasm: t144 ^= c2
# asm 1: eor >t144=int32#6,<t144=int32#6,<c2=int32#14
# asm 2: eor >t144=r5,<t144=r5,<c2=r14
eor r5,r5,r14

# qhasm: v0 += (v4 >>> 22)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #22
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #22
add r0,r0,r6,ROR #22

# qhasm: v0 += (t144 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t144=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t144=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c10 = c10_stack
# asm 1: ldr >c10=int32#6,<c10_stack=stack32#21
# asm 2: ldr >c10=r5,<c10_stack=[sp,#208]
ldr r5,[sp,#208]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: t145 = mem32[&m2m3_stack]
# asm 1: ldr >t145=int32#11,<m2m3_stack=stack64#7
# asm 2: ldr >t145=r10,<m2m3_stack=[sp,#48]
ldr r10,[sp,#48]

# qhasm: v8 += (v12 >>> 0)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #0
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #0
add r8,r8,r9,ROR #0

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#14,<c4_stack=stack32#15
# asm 2: ldr >c4=r14,<c4_stack=[sp,#184]
ldr r14,[sp,#184]

# qhasm: v4 ^= (v8 >>> 10)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #10
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #10
eor r6,r6,r8,ROR #10

# qhasm: t145 ^= c10
# asm 1: eor >t145=int32#6,<t145=int32#11,<c10=int32#6
# asm 2: eor >t145=r5,<t145=r10,<c10=r5
eor r5,r10,r5

# qhasm: v0 += (v4 >>> 2)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #2
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #2
add r0,r0,r6,ROR #2

# qhasm: v0 += (t145 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t145=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t145=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t146 = mem32[&m8m9_stack]
# asm 1: ldr >t146=int32#6,<m8m9_stack=stack64#10
# asm 2: ldr >t146=r5,<m8m9_stack=[sp,#72]
ldr r5,[sp,#72]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #0
eor r9,r9,r0,ROR #0

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 8)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #8
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 30)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #30
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #30
eor r6,r6,r8,ROR #30

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t146 ^= c4
# asm 1: eor >t146=int32#6,<t146=int32#6,<c4=int32#14
# asm 2: eor >t146=r5,<t146=r5,<c4=r14
eor r5,r5,r14

# qhasm: v1 += (v5 >>> 22)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #22
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #22
add r2,r2,r7,ROR #22

# qhasm: v1 += (t146 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t146=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t146=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#6,<c8_stack=stack32#19
# asm 2: ldr >c8=r5,<c8_stack=[sp,#200]
ldr r5,[sp,#200]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #16
eor r8,r11,r2,ROR #16

# qhasm: t147 = mem32[&m4m5_stack]
# asm 1: ldr >t147=int32#10,<m4m5_stack=stack64#8
# asm 2: ldr >t147=r9,<m4m5_stack=[sp,#56]
ldr r9,[sp,#56]

# qhasm: v9 += (v13 >>> 0)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #0
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#14,<c6_stack=stack32#17
# asm 2: ldr >c6=r14,<c6_stack=[sp,#192]
ldr r14,[sp,#192]

# qhasm: v5 ^= (v9 >>> 10)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #10
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #10
eor r7,r7,r10,ROR #10

# qhasm: t147 ^= c8
# asm 1: eor >t147=int32#6,<t147=int32#10,<c8=int32#6
# asm 2: eor >t147=r5,<t147=r9,<c8=r5
eor r5,r9,r5

# qhasm: v1 += (v5 >>> 2)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #2
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #2
add r2,r2,r7,ROR #2

# qhasm: v1 += (t147 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t147=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t147=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t148 = mem32[&m6m7_stack+4]
# asm 1: ldr >t148=int32#6,<m6m7_stack=stack64#9
# asm 2: ldr >t148=r5,<m6m7_stack=[sp,#68]
ldr r5,[sp,#68]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #0
eor r8,r8,r2,ROR #0

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 8)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 30)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #30
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #30
eor r7,r7,r8,ROR #30

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t148 ^= c6
# asm 1: eor >t148=int32#6,<t148=int32#6,<c6=int32#14
# asm 2: eor >t148=r5,<t148=r5,<c6=r14
eor r5,r5,r14

# qhasm: v2 += (v6 >>> 22)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #22
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #22
add r3,r3,r1,ROR #22

# qhasm: v2 += (t148 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t148=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t148=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#6,<c7_stack=stack32#18
# asm 2: ldr >c7=r5,<c7_stack=[sp,#196]
ldr r5,[sp,#196]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #16
eor r8,r11,r3,ROR #16

# qhasm: t149 = mem32[&m6m7_stack]
# asm 1: ldr >t149=int32#10,<m6m7_stack=stack64#9
# asm 2: ldr >t149=r9,<m6m7_stack=[sp,#64]
ldr r9,[sp,#64]

# qhasm: v10 += (v14 >>> 0)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #0
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#14,<c5_stack=stack32#16
# asm 2: ldr >c5=r14,<c5_stack=[sp,#188]
ldr r14,[sp,#188]

# qhasm: v6 ^= (v10 >>> 10)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #10
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #10
eor r1,r1,r10,ROR #10

# qhasm: t149 ^= c7
# asm 1: eor >t149=int32#6,<t149=int32#10,<c7=int32#6
# asm 2: eor >t149=r5,<t149=r9,<c7=r5
eor r5,r9,r5

# qhasm: v2 += (v6 >>> 2)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #2
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #2
add r3,r3,r1,ROR #2

# qhasm: v2 += (t149 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t149=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t149=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t150 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t150=int32#6,<m0m1_stack=stack64#6
# asm 2: ldr >t150=r5,<m0m1_stack=[sp,#44]
ldr r5,[sp,#44]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #0
eor r8,r8,r3,ROR #0

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t150 ^= c5
# asm 1: eor >t150=int32#6,<t150=int32#6,<c5=int32#14
# asm 2: eor >t150=r5,<t150=r5,<c5=r14
eor r5,r5,r14

# qhasm: v3 += (v7 >>> 22)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #22
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #22
add r4,r4,r12,ROR #22

# qhasm: v3 += (t150 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t150=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t150=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#6,<c1_stack=stack32#12
# asm 2: ldr >c1=r5,<c1_stack=[sp,#172]
ldr r5,[sp,#172]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#10,<v15=int32#12,<v3=int32#5,ROR #16
# asm 2: eor >v15=r9,<v15=r11,<v3=r4,ROR #16
eor r9,r11,r4,ROR #16

# qhasm: t151 = mem32[&m4m5_stack+4]
# asm 1: ldr >t151=int32#12,<m4m5_stack=stack64#8
# asm 2: ldr >t151=r11,<m4m5_stack=[sp,#60]
ldr r11,[sp,#60]

# qhasm: v11 += (v15 >>> 0)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #0
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #0
add r10,r10,r9,ROR #0

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#14,<c11_stack=stack32#22
# asm 2: ldr >c11=r14,<c11_stack=[sp,#212]
ldr r14,[sp,#212]

# qhasm: v7 ^= (v11 >>> 10)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #10
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #10
eor r12,r12,r10,ROR #10

# qhasm: t151 ^= c1
# asm 1: eor >t151=int32#6,<t151=int32#12,<c1=int32#6
# asm 2: eor >t151=r5,<t151=r11,<c1=r5
eor r5,r11,r5

# qhasm: v3 += (v7 >>> 2)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #2
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #2
add r4,r4,r12,ROR #2

# qhasm: v3 += (t151 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t151=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t151=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t152 = mem32[&m14m15_stack+4]
# asm 1: ldr >t152=int32#6,<m14m15_stack=stack64#13
# asm 2: ldr >t152=r5,<m14m15_stack=[sp,#100]
ldr r5,[sp,#100]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v3=int32#5,ROR #0
# asm 2: eor >v15=r9,<v15=r9,<v3=r4,ROR #0
eor r9,r9,r4,ROR #0

# qhasm: v6 ^= (v10 >>> 30)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #30
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #30
eor r1,r1,r8,ROR #30

# qhasm: v11 += (v15 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #8
add r10,r10,r9,ROR #8

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 30)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #30
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #30
eor r12,r12,r10,ROR #30

# qhasm: t152 ^= c11
# asm 1: eor >t152=int32#6,<t152=int32#6,<c11=int32#14
# asm 2: eor >t152=r5,<t152=r5,<c11=r14
eor r5,r5,r14

# qhasm: v0 += (v5 >>> 9)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #9
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #9
add r0,r0,r7,ROR #9

# qhasm: v0 += (t152 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t152=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t152=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c15 = c15_stack
# asm 1: ldr >c15=int32#6,<c15_stack=stack32#26
# asm 2: ldr >c15=r5,<c15_stack=[sp,#228]
ldr r5,[sp,#228]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #24
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #24
eor r9,r9,r0,ROR #24

# qhasm: t153 = mem32[&m10m11_stack+4]
# asm 1: ldr >t153=int32#11,<m10m11_stack=stack64#11
# asm 2: ldr >t153=r10,<m10m11_stack=[sp,#84]
ldr r10,[sp,#84]

# qhasm: v10 += (v15 >>> 24)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #24
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #24
add r8,r8,r9,ROR #24

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#14,<c0_stack=stack32#11
# asm 2: ldr >c0=r14,<c0_stack=[sp,#168]
ldr r14,[sp,#168]

# qhasm: v5 ^= (v10 >>> 23)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #23
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #23
eor r7,r7,r8,ROR #23

# qhasm: t153 ^= c15
# asm 1: eor >t153=int32#6,<t153=int32#11,<c15=int32#6
# asm 2: eor >t153=r5,<t153=r10,<c15=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 21)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #21
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #21
add r0,r0,r7,ROR #21

# qhasm: v0 += (t153 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t153=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t153=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t154 = mem32[&m12m13_stack+4]
# asm 1: ldr >t154=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t154=r5,<m12m13_stack=[sp,#92]
ldr r5,[sp,#92]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #8
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #8
eor r9,r9,r0,ROR #8

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#10,<v11v15_stack=stack64#16
# asm 2: str <v15=r9,<v11v15_stack=[sp,#124]
str r9,[sp,#124]

# qhasm: v10 += (v15 >>> 0)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #0
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #0
add r8,r8,r9,ROR #0

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 11)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #11
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #11
eor r7,r7,r8,ROR #11

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t154 ^= c0
# asm 1: eor >t154=int32#6,<t154=int32#6,<c0=int32#14
# asm 2: eor >t154=r5,<t154=r5,<c0=r14
eor r5,r5,r14

# qhasm: v3 += (v4 >>> 9)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #9
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #9
add r4,r4,r6,ROR #9

# qhasm: v3 += (t154 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t154=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t154=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#6,<c13_stack=stack32#24
# asm 2: ldr >c13=r5,<c13_stack=[sp,#220]
ldr r5,[sp,#220]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#5,ROR #24
# asm 2: eor >v14=r8,<v14=r11,<v3=r4,ROR #24
eor r8,r11,r4,ROR #24

# qhasm: t155 = mem32[&m0m1_stack]
# asm 1: ldr >t155=int32#10,<m0m1_stack=stack64#6
# asm 2: ldr >t155=r9,<m0m1_stack=[sp,#40]
ldr r9,[sp,#40]

# qhasm: v9 += (v14 >>> 24)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #24
add r10,r10,r8,ROR #24

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#14,<c12_stack=stack32#23
# asm 2: ldr >c12=r14,<c12_stack=[sp,#216]
ldr r14,[sp,#216]

# qhasm: v4 ^= (v9 >>> 23)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #23
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #23
eor r6,r6,r10,ROR #23

# qhasm: t155 ^= c13
# asm 1: eor >t155=int32#6,<t155=int32#10,<c13=int32#6
# asm 2: eor >t155=r5,<t155=r9,<c13=r5
eor r5,r9,r5

# qhasm: v3 += (v4 >>> 21)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #21
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #21
add r4,r4,r6,ROR #21

# qhasm: v3 += (t155 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t155=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t155=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t156 = mem32[&m2m3_stack+4]
# asm 1: ldr >t156=int32#6,<m2m3_stack=stack64#7
# asm 2: ldr >t156=r5,<m2m3_stack=[sp,#52]
ldr r5,[sp,#52]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v3=int32#5,ROR #8
# asm 2: eor >v14=r8,<v14=r8,<v3=r4,ROR #8
eor r8,r8,r4,ROR #8

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v14=r8,<v10v14_stack=[sp,#116]
str r8,[sp,#116]

# qhasm: v9 += (v14 >>> 0)
# asm 1: add >v9=int32#9,<v9=int32#11,<v14=int32#9,ROR #0
# asm 2: add >v9=r8,<v9=r10,<v14=r8,ROR #0
add r8,r10,r8,ROR #0

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v9=r8,<v9v13_stack=[sp,#104]
str r8,[sp,#104]

# qhasm: v4 ^= (v9 >>> 11)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#9,ROR #11
# asm 2: eor >v4=r6,<v4=r6,<v9=r8,ROR #11
eor r6,r6,r8,ROR #11

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t156 ^= c12
# asm 1: eor >t156=int32#6,<t156=int32#6,<c12=int32#14
# asm 2: eor >t156=r5,<t156=r5,<c12=r14
eor r5,r5,r14

# qhasm: v2 += (v7 >>> 9)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #9
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #9
add r3,r3,r12,ROR #9

# qhasm: v2 += (t156 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t156=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t156=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#6,<c3_stack=stack32#14
# asm 2: ldr >c3=r5,<c3_stack=[sp,#180]
ldr r5,[sp,#180]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v2=int32#4,ROR #24
# asm 2: eor >v13=r8,<v13=r11,<v2=r3,ROR #24
eor r8,r11,r3,ROR #24

# qhasm: t157 = mem32[&m12m13_stack]
# asm 1: ldr >t157=int32#10,<m12m13_stack=stack64#12
# asm 2: ldr >t157=r9,<m12m13_stack=[sp,#88]
ldr r9,[sp,#88]

# qhasm: v8 += (v13 >>> 24)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#9,ROR #24
# asm 2: add >v8=r10,<v8=r10,<v13=r8,ROR #24
add r10,r10,r8,ROR #24

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#14,<c14_stack=stack32#25
# asm 2: ldr >c14=r14,<c14_stack=[sp,#224]
ldr r14,[sp,#224]

# qhasm: v7 ^= (v8 >>> 23)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#11,ROR #23
# asm 2: eor >v7=r12,<v7=r12,<v8=r10,ROR #23
eor r12,r12,r10,ROR #23

# qhasm: t157 ^= c3
# asm 1: eor >t157=int32#6,<t157=int32#10,<c3=int32#6
# asm 2: eor >t157=r5,<t157=r9,<c3=r5
eor r5,r9,r5

# qhasm: v2 += (v7 >>> 21)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #21
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #21
add r3,r3,r12,ROR #21

# qhasm: v2 += (t157 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t157=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t157=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t158 = mem32[&m8m9_stack+4]
# asm 1: ldr >t158=int32#6,<m8m9_stack=stack64#10
# asm 2: ldr >t158=r5,<m8m9_stack=[sp,#76]
ldr r5,[sp,#76]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v2=int32#4,ROR #8
# asm 2: eor >v13=r8,<v13=r8,<v2=r3,ROR #8
eor r8,r8,r3,ROR #8

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v13=r8,<v9v13_stack=[sp,#108]
str r8,[sp,#108]

# qhasm: v8 += (v13 >>> 0)
# asm 1: add >v8=int32#9,<v8=int32#11,<v13=int32#9,ROR #0
# asm 2: add >v8=r8,<v8=r10,<v13=r8,ROR #0
add r8,r10,r8,ROR #0

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t158 ^= c14
# asm 1: eor >t158=int32#6,<t158=int32#6,<c14=int32#14
# asm 2: eor >t158=r5,<t158=r5,<c14=r14
eor r5,r5,r14

# qhasm: v1 += (v6 >>> 9)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #9
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #9
add r2,r2,r1,ROR #9

# qhasm: v1 += (t158 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t158=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t158=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#6,<c9_stack=stack32#20
# asm 2: ldr >c9=r5,<c9_stack=[sp,#204]
ldr r5,[sp,#204]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#10,<v12=int32#12,<v1=int32#3,ROR #24
# asm 2: eor >v12=r9,<v12=r11,<v1=r2,ROR #24
eor r9,r11,r2,ROR #24

# qhasm: t159 = mem32[&m14m15_stack]
# asm 1: ldr >t159=int32#12,<m14m15_stack=stack64#13
# asm 2: ldr >t159=r11,<m14m15_stack=[sp,#96]
ldr r11,[sp,#96]

# qhasm: v11 += (v12 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #24
add r10,r10,r9,ROR #24

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#14,<c1_stack=stack32#12
# asm 2: ldr >c1=r14,<c1_stack=[sp,#172]
ldr r14,[sp,#172]

# qhasm: v6 ^= (v11 >>> 23)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #23
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #23
eor r1,r1,r10,ROR #23

# qhasm: t159 ^= c9
# asm 1: eor >t159=int32#6,<t159=int32#12,<c9=int32#6
# asm 2: eor >t159=r5,<t159=r11,<c9=r5
eor r5,r11,r5

# qhasm: v1 += (v6 >>> 21)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #21
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #21
add r2,r2,r1,ROR #21

# qhasm: v1 += (t159 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t159=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t159=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t160 = mem32[&m0m1_stack]
# asm 1: ldr >t160=int32#6,<m0m1_stack=stack64#6
# asm 2: ldr >t160=r5,<m0m1_stack=[sp,#40]
ldr r5,[sp,#40]

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v1=int32#3,ROR #8
# asm 2: eor >v12=r9,<v12=r9,<v1=r2,ROR #8
eor r9,r9,r2,ROR #8

# qhasm: v7 ^= (v8 >>> 11)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#9,ROR #11
# asm 2: eor >v7=r12,<v7=r12,<v8=r8,ROR #11
eor r12,r12,r8,ROR #11

# qhasm: v11 += (v12 >>> 0)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #0
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #0
add r10,r10,r9,ROR #0

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#11,<v11v15_stack=stack64#16
# asm 2: str <v11=r10,<v11v15_stack=[sp,#120]
str r10,[sp,#120]

# qhasm: v6 ^= (v11 >>> 11)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #11
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #11
eor r1,r1,r10,ROR #11

# qhasm: t160 ^= c1
# asm 1: eor >t160=int32#6,<t160=int32#6,<c1=int32#14
# asm 2: eor >t160=r5,<t160=r5,<c1=r14
eor r5,r5,r14

# qhasm: v0 += (v4 >>> 28)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #28
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #28
add r0,r0,r6,ROR #28

# qhasm: v0 += (t160 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t160=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t160=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#6,<c0_stack=stack32#11
# asm 2: ldr >c0=r5,<c0_stack=[sp,#168]
ldr r5,[sp,#168]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #0
eor r9,r9,r0,ROR #0

# qhasm: t161 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t161=int32#11,<m0m1_stack=stack64#6
# asm 2: ldr >t161=r10,<m0m1_stack=[sp,#44]
ldr r10,[sp,#44]

# qhasm: v8 += (v12 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #16
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#14,<c3_stack=stack32#14
# asm 2: ldr >c3=r14,<c3_stack=[sp,#180]
ldr r14,[sp,#180]

# qhasm: v4 ^= (v8 >>> 4)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #4
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #4
eor r6,r6,r8,ROR #4

# qhasm: t161 ^= c0
# asm 1: eor >t161=int32#6,<t161=int32#11,<c0=int32#6
# asm 2: eor >t161=r5,<t161=r10,<c0=r5
eor r5,r10,r5

# qhasm: v0 += (v4 >>> 8)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #8
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #8
add r0,r0,r6,ROR #8

# qhasm: v0 += (t161 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t161=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t161=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t162 = mem32[&m2m3_stack]
# asm 1: ldr >t162=int32#6,<m2m3_stack=stack64#7
# asm 2: ldr >t162=r5,<m2m3_stack=[sp,#48]
ldr r5,[sp,#48]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 24)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #24
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #24
add r8,r8,r9,ROR #24

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 24)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #24
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #24
eor r6,r6,r8,ROR #24

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t162 ^= c3
# asm 1: eor >t162=int32#6,<t162=int32#6,<c3=int32#14
# asm 2: eor >t162=r5,<t162=r5,<c3=r14
eor r5,r5,r14

# qhasm: v1 += (v5 >>> 28)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #28
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #28
add r2,r2,r7,ROR #28

# qhasm: v1 += (t162 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t162=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t162=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#6,<c2_stack=stack32#13
# asm 2: ldr >c2=r5,<c2_stack=[sp,#176]
ldr r5,[sp,#176]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #0
eor r8,r11,r2,ROR #0

# qhasm: t163 = mem32[&m2m3_stack+4]
# asm 1: ldr >t163=int32#10,<m2m3_stack=stack64#7
# asm 2: ldr >t163=r9,<m2m3_stack=[sp,#52]
ldr r9,[sp,#52]

# qhasm: v9 += (v13 >>> 16)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#14,<c5_stack=stack32#16
# asm 2: ldr >c5=r14,<c5_stack=[sp,#188]
ldr r14,[sp,#188]

# qhasm: v5 ^= (v9 >>> 4)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #4
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #4
eor r7,r7,r10,ROR #4

# qhasm: t163 ^= c2
# asm 1: eor >t163=int32#6,<t163=int32#10,<c2=int32#6
# asm 2: eor >t163=r5,<t163=r9,<c2=r5
eor r5,r9,r5

# qhasm: v1 += (v5 >>> 8)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #8
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #8
add r2,r2,r7,ROR #8

# qhasm: v1 += (t163 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t163=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t163=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t164 = mem32[&m4m5_stack]
# asm 1: ldr >t164=int32#6,<m4m5_stack=stack64#8
# asm 2: ldr >t164=r5,<m4m5_stack=[sp,#56]
ldr r5,[sp,#56]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #16
eor r8,r8,r2,ROR #16

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 24)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #24
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 24)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #24
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #24
eor r7,r7,r8,ROR #24

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t164 ^= c5
# asm 1: eor >t164=int32#6,<t164=int32#6,<c5=int32#14
# asm 2: eor >t164=r5,<t164=r5,<c5=r14
eor r5,r5,r14

# qhasm: v2 += (v6 >>> 28)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #28
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #28
add r3,r3,r1,ROR #28

# qhasm: v2 += (t164 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t164=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t164=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#6,<c4_stack=stack32#15
# asm 2: ldr >c4=r5,<c4_stack=[sp,#184]
ldr r5,[sp,#184]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #0
eor r8,r11,r3,ROR #0

# qhasm: t165 = mem32[&m4m5_stack+4]
# asm 1: ldr >t165=int32#10,<m4m5_stack=stack64#8
# asm 2: ldr >t165=r9,<m4m5_stack=[sp,#60]
ldr r9,[sp,#60]

# qhasm: v10 += (v14 >>> 16)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#14,<c7_stack=stack32#18
# asm 2: ldr >c7=r14,<c7_stack=[sp,#196]
ldr r14,[sp,#196]

# qhasm: v6 ^= (v10 >>> 4)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #4
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #4
eor r1,r1,r10,ROR #4

# qhasm: t165 ^= c4
# asm 1: eor >t165=int32#6,<t165=int32#10,<c4=int32#6
# asm 2: eor >t165=r5,<t165=r9,<c4=r5
eor r5,r9,r5

# qhasm: v2 += (v6 >>> 8)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #8
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #8
add r3,r3,r1,ROR #8

# qhasm: v2 += (t165 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t165=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t165=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t166 = mem32[&m6m7_stack]
# asm 1: ldr >t166=int32#6,<m6m7_stack=stack64#9
# asm 2: ldr >t166=r5,<m6m7_stack=[sp,#64]
ldr r5,[sp,#64]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #16
eor r8,r8,r3,ROR #16

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 24)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t166 ^= c7
# asm 1: eor >t166=int32#6,<t166=int32#6,<c7=int32#14
# asm 2: eor >t166=r5,<t166=r5,<c7=r14
eor r5,r5,r14

# qhasm: v3 += (v7 >>> 28)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #28
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #28
add r4,r4,r12,ROR #28

# qhasm: v3 += (t166 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t166=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t166=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#6,<c6_stack=stack32#17
# asm 2: ldr >c6=r5,<c6_stack=[sp,#192]
ldr r5,[sp,#192]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#10,<v15=int32#12,<v3=int32#5,ROR #0
# asm 2: eor >v15=r9,<v15=r11,<v3=r4,ROR #0
eor r9,r11,r4,ROR #0

# qhasm: t167 = mem32[&m6m7_stack+4]
# asm 1: ldr >t167=int32#12,<m6m7_stack=stack64#9
# asm 2: ldr >t167=r11,<m6m7_stack=[sp,#68]
ldr r11,[sp,#68]

# qhasm: v11 += (v15 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#14,<c9_stack=stack32#20
# asm 2: ldr >c9=r14,<c9_stack=[sp,#204]
ldr r14,[sp,#204]

# qhasm: v7 ^= (v11 >>> 4)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #4
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #4
eor r12,r12,r10,ROR #4

# qhasm: t167 ^= c6
# asm 1: eor >t167=int32#6,<t167=int32#12,<c6=int32#6
# asm 2: eor >t167=r5,<t167=r11,<c6=r5
eor r5,r11,r5

# qhasm: v3 += (v7 >>> 8)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #8
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #8
add r4,r4,r12,ROR #8

# qhasm: v3 += (t167 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t167=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t167=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t168 = mem32[&m8m9_stack]
# asm 1: ldr >t168=int32#6,<m8m9_stack=stack64#10
# asm 2: ldr >t168=r5,<m8m9_stack=[sp,#72]
ldr r5,[sp,#72]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v3=int32#5,ROR #16
# asm 2: eor >v15=r9,<v15=r9,<v3=r4,ROR #16
eor r9,r9,r4,ROR #16

# qhasm: v6 ^= (v10 >>> 24)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #24
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #24
eor r1,r1,r8,ROR #24

# qhasm: v11 += (v15 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #24
add r10,r10,r9,ROR #24

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 24)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #24
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #24
eor r12,r12,r10,ROR #24

# qhasm: t168 ^= c9
# asm 1: eor >t168=int32#6,<t168=int32#6,<c9=int32#14
# asm 2: eor >t168=r5,<t168=r5,<c9=r14
eor r5,r5,r14

# qhasm: v0 += (v5 >>> 15)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #15
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #15
add r0,r0,r7,ROR #15

# qhasm: v0 += (t168 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t168=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t168=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#6,<c8_stack=stack32#19
# asm 2: ldr >c8=r5,<c8_stack=[sp,#200]
ldr r5,[sp,#200]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #8
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #8
eor r9,r9,r0,ROR #8

# qhasm: t169 = mem32[&m8m9_stack+4]
# asm 1: ldr >t169=int32#11,<m8m9_stack=stack64#10
# asm 2: ldr >t169=r10,<m8m9_stack=[sp,#76]
ldr r10,[sp,#76]

# qhasm: v10 += (v15 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #8
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: c15 = c15_stack
# asm 1: ldr >c15=int32#14,<c15_stack=stack32#26
# asm 2: ldr >c15=r14,<c15_stack=[sp,#228]
ldr r14,[sp,#228]

# qhasm: v5 ^= (v10 >>> 17)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #17
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #17
eor r7,r7,r8,ROR #17

# qhasm: t169 ^= c8
# asm 1: eor >t169=int32#6,<t169=int32#11,<c8=int32#6
# asm 2: eor >t169=r5,<t169=r10,<c8=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 27)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #27
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #27
add r0,r0,r7,ROR #27

# qhasm: v0 += (t169 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t169=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t169=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t170 = mem32[&m14m15_stack]
# asm 1: ldr >t170=int32#6,<m14m15_stack=stack64#13
# asm 2: ldr >t170=r5,<m14m15_stack=[sp,#96]
ldr r5,[sp,#96]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #24
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #24
eor r9,r9,r0,ROR #24

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#10,<v11v15_stack=stack64#16
# asm 2: str <v15=r9,<v11v15_stack=[sp,#124]
str r9,[sp,#124]

# qhasm: v10 += (v15 >>> 16)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #16
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 5)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #5
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #5
eor r7,r7,r8,ROR #5

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t170 ^= c15
# asm 1: eor >t170=int32#6,<t170=int32#6,<c15=int32#14
# asm 2: eor >t170=r5,<t170=r5,<c15=r14
eor r5,r5,r14

# qhasm: v3 += (v4 >>> 15)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #15
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #15
add r4,r4,r6,ROR #15

# qhasm: v3 += (t170 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t170=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t170=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#6,<c14_stack=stack32#25
# asm 2: ldr >c14=r5,<c14_stack=[sp,#224]
ldr r5,[sp,#224]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#5,ROR #8
# asm 2: eor >v14=r8,<v14=r11,<v3=r4,ROR #8
eor r8,r11,r4,ROR #8

# qhasm: t171 = mem32[&m14m15_stack+4]
# asm 1: ldr >t171=int32#10,<m14m15_stack=stack64#13
# asm 2: ldr >t171=r9,<m14m15_stack=[sp,#100]
ldr r9,[sp,#100]

# qhasm: v9 += (v14 >>> 8)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#14,<c13_stack=stack32#24
# asm 2: ldr >c13=r14,<c13_stack=[sp,#220]
ldr r14,[sp,#220]

# qhasm: v4 ^= (v9 >>> 17)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #17
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #17
eor r6,r6,r10,ROR #17

# qhasm: t171 ^= c14
# asm 1: eor >t171=int32#6,<t171=int32#10,<c14=int32#6
# asm 2: eor >t171=r5,<t171=r9,<c14=r5
eor r5,r9,r5

# qhasm: v3 += (v4 >>> 27)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #27
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #27
add r4,r4,r6,ROR #27

# qhasm: v3 += (t171 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t171=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t171=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t172 = mem32[&m12m13_stack]
# asm 1: ldr >t172=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t172=r5,<m12m13_stack=[sp,#88]
ldr r5,[sp,#88]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v3=int32#5,ROR #24
# asm 2: eor >v14=r8,<v14=r8,<v3=r4,ROR #24
eor r8,r8,r4,ROR #24

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v14=r8,<v10v14_stack=[sp,#116]
str r8,[sp,#116]

# qhasm: v9 += (v14 >>> 16)
# asm 1: add >v9=int32#9,<v9=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v9=r8,<v9=r10,<v14=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v9=r8,<v9v13_stack=[sp,#104]
str r8,[sp,#104]

# qhasm: v4 ^= (v9 >>> 5)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#9,ROR #5
# asm 2: eor >v4=r6,<v4=r6,<v9=r8,ROR #5
eor r6,r6,r8,ROR #5

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t172 ^= c13
# asm 1: eor >t172=int32#6,<t172=int32#6,<c13=int32#14
# asm 2: eor >t172=r5,<t172=r5,<c13=r14
eor r5,r5,r14

# qhasm: v2 += (v7 >>> 15)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #15
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #15
add r3,r3,r12,ROR #15

# qhasm: v2 += (t172 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t172=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t172=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#6,<c12_stack=stack32#23
# asm 2: ldr >c12=r5,<c12_stack=[sp,#216]
ldr r5,[sp,#216]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v2=int32#4,ROR #8
# asm 2: eor >v13=r8,<v13=r11,<v2=r3,ROR #8
eor r8,r11,r3,ROR #8

# qhasm: t173 = mem32[&m12m13_stack+4]
# asm 1: ldr >t173=int32#10,<m12m13_stack=stack64#12
# asm 2: ldr >t173=r9,<m12m13_stack=[sp,#92]
ldr r9,[sp,#92]

# qhasm: v8 += (v13 >>> 8)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v8=r10,<v8=r10,<v13=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#14,<c11_stack=stack32#22
# asm 2: ldr >c11=r14,<c11_stack=[sp,#212]
ldr r14,[sp,#212]

# qhasm: v7 ^= (v8 >>> 17)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#11,ROR #17
# asm 2: eor >v7=r12,<v7=r12,<v8=r10,ROR #17
eor r12,r12,r10,ROR #17

# qhasm: t173 ^= c12
# asm 1: eor >t173=int32#6,<t173=int32#10,<c12=int32#6
# asm 2: eor >t173=r5,<t173=r9,<c12=r5
eor r5,r9,r5

# qhasm: v2 += (v7 >>> 27)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #27
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #27
add r3,r3,r12,ROR #27

# qhasm: v2 += (t173 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t173=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t173=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t174 = mem32[&m10m11_stack]
# asm 1: ldr >t174=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t174=r5,<m10m11_stack=[sp,#80]
ldr r5,[sp,#80]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v2=int32#4,ROR #24
# asm 2: eor >v13=r8,<v13=r8,<v2=r3,ROR #24
eor r8,r8,r3,ROR #24

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v13=r8,<v9v13_stack=[sp,#108]
str r8,[sp,#108]

# qhasm: v8 += (v13 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v8=r8,<v8=r10,<v13=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t174 ^= c11
# asm 1: eor >t174=int32#6,<t174=int32#6,<c11=int32#14
# asm 2: eor >t174=r5,<t174=r5,<c11=r14
eor r5,r5,r14

# qhasm: v1 += (v6 >>> 15)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #15
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #15
add r2,r2,r1,ROR #15

# qhasm: v1 += (t174 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t174=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t174=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c10 = c10_stack
# asm 1: ldr >c10=int32#6,<c10_stack=stack32#21
# asm 2: ldr >c10=r5,<c10_stack=[sp,#208]
ldr r5,[sp,#208]

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#10,<v12=int32#12,<v1=int32#3,ROR #8
# asm 2: eor >v12=r9,<v12=r11,<v1=r2,ROR #8
eor r9,r11,r2,ROR #8

# qhasm: t175 = mem32[&m10m11_stack+4]
# asm 1: ldr >t175=int32#12,<m10m11_stack=stack64#11
# asm 2: ldr >t175=r11,<m10m11_stack=[sp,#84]
ldr r11,[sp,#84]

# qhasm: v11 += (v12 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #8
add r10,r10,r9,ROR #8

# qhasm: v7 ^= (v8 >>> 5)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#9,ROR #5
# asm 2: eor >v7=r12,<v7=r12,<v8=r8,ROR #5
eor r12,r12,r8,ROR #5

# qhasm: v6 ^= (v11 >>> 17)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #17
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #17
eor r1,r1,r10,ROR #17

# qhasm: t175 ^= c10
# asm 1: eor >t175=int32#12,<t175=int32#12,<c10=int32#6
# asm 2: eor >t175=r11,<t175=r11,<c10=r5
eor r11,r11,r5

# qhasm: v1 += (v6 >>> 27)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #27
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #27
add r2,r2,r1,ROR #27

# qhasm: v1 += (t175 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t175=int32#12,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t175=r11,ROR #0
add r2,r2,r11,ROR #0

# qhasm: t176 = mem32[&m14m15_stack]
# asm 1: ldr >t176=int32#12,<m14m15_stack=stack64#13
# asm 2: ldr >t176=r11,<m14m15_stack=[sp,#96]
ldr r11,[sp,#96]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v1=int32#3,ROR #24
# asm 2: eor >v12=r9,<v12=r9,<v1=r2,ROR #24
eor r9,r9,r2,ROR #24

# qhasm: v0 += (v4 >>> 2)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #2
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #2
add r0,r0,r6,ROR #2

# qhasm: v11 += (v12 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#11,<v11v15_stack=stack64#16
# asm 2: str <v11=r10,<v11v15_stack=[sp,#120]
str r10,[sp,#120]

# qhasm: v6 ^= (v11 >>> 5)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #5
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #5
eor r1,r1,r10,ROR #5

# qhasm: t176 ^= c10
# asm 1: eor >t176=int32#6,<t176=int32#12,<c10=int32#6
# asm 2: eor >t176=r5,<t176=r11,<c10=r5
eor r5,r11,r5

# qhasm: v0 += (t176 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t176=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t176=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#6,<c14_stack=stack32#25
# asm 2: ldr >c14=r5,<c14_stack=[sp,#224]
ldr r5,[sp,#224]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: t177 = mem32[&m10m11_stack]
# asm 1: ldr >t177=int32#11,<m10m11_stack=stack64#11
# asm 2: ldr >t177=r10,<m10m11_stack=[sp,#80]
ldr r10,[sp,#80]

# qhasm: v8 += (v12 >>> 0)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #0
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #0
add r8,r8,r9,ROR #0

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#14,<c8_stack=stack32#19
# asm 2: ldr >c8=r14,<c8_stack=[sp,#200]
ldr r14,[sp,#200]

# qhasm: v4 ^= (v8 >>> 30)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #30
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #30
eor r6,r6,r8,ROR #30

# qhasm: t177 ^= c14
# asm 1: eor >t177=int32#6,<t177=int32#11,<c14=int32#6
# asm 2: eor >t177=r5,<t177=r10,<c14=r5
eor r5,r10,r5

# qhasm: v0 += (v4 >>> 14)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #14
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #14
add r0,r0,r6,ROR #14

# qhasm: v0 += (t177 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t177=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t177=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t178 = mem32[&m4m5_stack]
# asm 1: ldr >t178=int32#6,<m4m5_stack=stack64#8
# asm 2: ldr >t178=r5,<m4m5_stack=[sp,#56]
ldr r5,[sp,#56]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #0
eor r9,r9,r0,ROR #0

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 8)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #8
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 18)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #18
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #18
eor r6,r6,r8,ROR #18

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t178 ^= c8
# asm 1: eor >t178=int32#6,<t178=int32#6,<c8=int32#14
# asm 2: eor >t178=r5,<t178=r5,<c8=r14
eor r5,r5,r14

# qhasm: v1 += (v5 >>> 2)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #2
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #2
add r2,r2,r7,ROR #2

# qhasm: v1 += (t178 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t178=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t178=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#6,<c4_stack=stack32#15
# asm 2: ldr >c4=r5,<c4_stack=[sp,#184]
ldr r5,[sp,#184]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #16
eor r8,r11,r2,ROR #16

# qhasm: t179 = mem32[&m8m9_stack]
# asm 1: ldr >t179=int32#10,<m8m9_stack=stack64#10
# asm 2: ldr >t179=r9,<m8m9_stack=[sp,#72]
ldr r9,[sp,#72]

# qhasm: v9 += (v13 >>> 0)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #0
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c15 = c15_stack
# asm 1: ldr >c15=int32#14,<c15_stack=stack32#26
# asm 2: ldr >c15=r14,<c15_stack=[sp,#228]
ldr r14,[sp,#228]

# qhasm: v5 ^= (v9 >>> 30)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #30
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #30
eor r7,r7,r10,ROR #30

# qhasm: t179 ^= c4
# asm 1: eor >t179=int32#6,<t179=int32#10,<c4=int32#6
# asm 2: eor >t179=r5,<t179=r9,<c4=r5
eor r5,r9,r5

# qhasm: v1 += (v5 >>> 14)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #14
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #14
add r2,r2,r7,ROR #14

# qhasm: v1 += (t179 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t179=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t179=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t180 = mem32[&m8m9_stack+4]
# asm 1: ldr >t180=int32#6,<m8m9_stack=stack64#10
# asm 2: ldr >t180=r5,<m8m9_stack=[sp,#76]
ldr r5,[sp,#76]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #0
eor r8,r8,r2,ROR #0

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 8)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 18)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #18
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #18
eor r7,r7,r8,ROR #18

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t180 ^= c15
# asm 1: eor >t180=int32#6,<t180=int32#6,<c15=int32#14
# asm 2: eor >t180=r5,<t180=r5,<c15=r14
eor r5,r5,r14

# qhasm: v2 += (v6 >>> 2)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #2
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #2
add r3,r3,r1,ROR #2

# qhasm: v2 += (t180 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t180=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t180=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#6,<c9_stack=stack32#20
# asm 2: ldr >c9=r5,<c9_stack=[sp,#204]
ldr r5,[sp,#204]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #16
eor r8,r11,r3,ROR #16

# qhasm: t181 = mem32[&m14m15_stack+4]
# asm 1: ldr >t181=int32#10,<m14m15_stack=stack64#13
# asm 2: ldr >t181=r9,<m14m15_stack=[sp,#100]
ldr r9,[sp,#100]

# qhasm: v10 += (v14 >>> 0)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #0
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#14,<c6_stack=stack32#17
# asm 2: ldr >c6=r14,<c6_stack=[sp,#192]
ldr r14,[sp,#192]

# qhasm: v6 ^= (v10 >>> 30)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #30
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #30
eor r1,r1,r10,ROR #30

# qhasm: t181 ^= c9
# asm 1: eor >t181=int32#6,<t181=int32#10,<c9=int32#6
# asm 2: eor >t181=r5,<t181=r9,<c9=r5
eor r5,r9,r5

# qhasm: v2 += (v6 >>> 14)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #14
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #14
add r3,r3,r1,ROR #14

# qhasm: v2 += (t181 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t181=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t181=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t182 = mem32[&m12m13_stack+4]
# asm 1: ldr >t182=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t182=r5,<m12m13_stack=[sp,#92]
ldr r5,[sp,#92]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #0
eor r8,r8,r3,ROR #0

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t182 ^= c6
# asm 1: eor >t182=int32#6,<t182=int32#6,<c6=int32#14
# asm 2: eor >t182=r5,<t182=r5,<c6=r14
eor r5,r5,r14

# qhasm: v3 += (v7 >>> 2)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #2
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #2
add r4,r4,r12,ROR #2

# qhasm: v3 += (t182 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t182=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t182=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#6,<c13_stack=stack32#24
# asm 2: ldr >c13=r5,<c13_stack=[sp,#220]
ldr r5,[sp,#220]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#10,<v15=int32#12,<v3=int32#5,ROR #16
# asm 2: eor >v15=r9,<v15=r11,<v3=r4,ROR #16
eor r9,r11,r4,ROR #16

# qhasm: t183 = mem32[&m6m7_stack]
# asm 1: ldr >t183=int32#12,<m6m7_stack=stack64#9
# asm 2: ldr >t183=r11,<m6m7_stack=[sp,#64]
ldr r11,[sp,#64]

# qhasm: v11 += (v15 >>> 0)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #0
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #0
add r10,r10,r9,ROR #0

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#14,<c12_stack=stack32#23
# asm 2: ldr >c12=r14,<c12_stack=[sp,#216]
ldr r14,[sp,#216]

# qhasm: v7 ^= (v11 >>> 30)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #30
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #30
eor r12,r12,r10,ROR #30

# qhasm: t183 ^= c13
# asm 1: eor >t183=int32#6,<t183=int32#12,<c13=int32#6
# asm 2: eor >t183=r5,<t183=r11,<c13=r5
eor r5,r11,r5

# qhasm: v3 += (v7 >>> 14)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #14
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #14
add r4,r4,r12,ROR #14

# qhasm: v3 += (t183 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t183=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t183=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t184 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t184=int32#6,<m0m1_stack=stack64#6
# asm 2: ldr >t184=r5,<m0m1_stack=[sp,#44]
ldr r5,[sp,#44]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v3=int32#5,ROR #0
# asm 2: eor >v15=r9,<v15=r9,<v3=r4,ROR #0
eor r9,r9,r4,ROR #0

# qhasm: v6 ^= (v10 >>> 18)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #18
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #18
eor r1,r1,r8,ROR #18

# qhasm: v11 += (v15 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #8
add r10,r10,r9,ROR #8

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 18)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #18
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #18
eor r12,r12,r10,ROR #18

# qhasm: t184 ^= c12
# asm 1: eor >t184=int32#6,<t184=int32#6,<c12=int32#14
# asm 2: eor >t184=r5,<t184=r5,<c12=r14
eor r5,r5,r14

# qhasm: v0 += (v5 >>> 21)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #21
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #21
add r0,r0,r7,ROR #21

# qhasm: v0 += (t184 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t184=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t184=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#6,<c1_stack=stack32#12
# asm 2: ldr >c1=r5,<c1_stack=[sp,#172]
ldr r5,[sp,#172]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #24
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #24
eor r9,r9,r0,ROR #24

# qhasm: t185 = mem32[&m12m13_stack]
# asm 1: ldr >t185=int32#11,<m12m13_stack=stack64#12
# asm 2: ldr >t185=r10,<m12m13_stack=[sp,#88]
ldr r10,[sp,#88]

# qhasm: v10 += (v15 >>> 24)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #24
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #24
add r8,r8,r9,ROR #24

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#14,<c3_stack=stack32#14
# asm 2: ldr >c3=r14,<c3_stack=[sp,#180]
ldr r14,[sp,#180]

# qhasm: v5 ^= (v10 >>> 11)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #11
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #11
eor r7,r7,r8,ROR #11

# qhasm: t185 ^= c1
# asm 1: eor >t185=int32#6,<t185=int32#11,<c1=int32#6
# asm 2: eor >t185=r5,<t185=r10,<c1=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 1)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #1
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #1
add r0,r0,r7,ROR #1

# qhasm: v0 += (t185 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t185=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t185=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t186 = mem32[&m4m5_stack+4]
# asm 1: ldr >t186=int32#6,<m4m5_stack=stack64#8
# asm 2: ldr >t186=r5,<m4m5_stack=[sp,#60]
ldr r5,[sp,#60]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #8
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #8
eor r9,r9,r0,ROR #8

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#10,<v11v15_stack=stack64#16
# asm 2: str <v15=r9,<v11v15_stack=[sp,#124]
str r9,[sp,#124]

# qhasm: v10 += (v15 >>> 0)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #0
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #0
add r8,r8,r9,ROR #0

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 31)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #31
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #31
eor r7,r7,r8,ROR #31

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t186 ^= c3
# asm 1: eor >t186=int32#6,<t186=int32#6,<c3=int32#14
# asm 2: eor >t186=r5,<t186=r5,<c3=r14
eor r5,r5,r14

# qhasm: v3 += (v4 >>> 21)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #21
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #21
add r4,r4,r6,ROR #21

# qhasm: v3 += (t186 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t186=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t186=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#6,<c5_stack=stack32#16
# asm 2: ldr >c5=r5,<c5_stack=[sp,#188]
ldr r5,[sp,#188]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#5,ROR #24
# asm 2: eor >v14=r8,<v14=r11,<v3=r4,ROR #24
eor r8,r11,r4,ROR #24

# qhasm: t187 = mem32[&m2m3_stack+4]
# asm 1: ldr >t187=int32#10,<m2m3_stack=stack64#7
# asm 2: ldr >t187=r9,<m2m3_stack=[sp,#52]
ldr r9,[sp,#52]

# qhasm: v9 += (v14 >>> 24)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #24
add r10,r10,r8,ROR #24

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#14,<c7_stack=stack32#18
# asm 2: ldr >c7=r14,<c7_stack=[sp,#196]
ldr r14,[sp,#196]

# qhasm: v4 ^= (v9 >>> 11)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #11
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #11
eor r6,r6,r10,ROR #11

# qhasm: t187 ^= c5
# asm 1: eor >t187=int32#6,<t187=int32#10,<c5=int32#6
# asm 2: eor >t187=r5,<t187=r9,<c5=r5
eor r5,r9,r5

# qhasm: v3 += (v4 >>> 1)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #1
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #1
add r4,r4,r6,ROR #1

# qhasm: v3 += (t187 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t187=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t187=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t188 = mem32[&m10m11_stack+4]
# asm 1: ldr >t188=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t188=r5,<m10m11_stack=[sp,#84]
ldr r5,[sp,#84]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v3=int32#5,ROR #8
# asm 2: eor >v14=r8,<v14=r8,<v3=r4,ROR #8
eor r8,r8,r4,ROR #8

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v14=r8,<v10v14_stack=[sp,#116]
str r8,[sp,#116]

# qhasm: v9 += (v14 >>> 0)
# asm 1: add >v9=int32#9,<v9=int32#11,<v14=int32#9,ROR #0
# asm 2: add >v9=r8,<v9=r10,<v14=r8,ROR #0
add r8,r10,r8,ROR #0

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v9=r8,<v9v13_stack=[sp,#104]
str r8,[sp,#104]

# qhasm: v4 ^= (v9 >>> 31)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#9,ROR #31
# asm 2: eor >v4=r6,<v4=r6,<v9=r8,ROR #31
eor r6,r6,r8,ROR #31

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t188 ^= c7
# asm 1: eor >t188=int32#6,<t188=int32#6,<c7=int32#14
# asm 2: eor >t188=r5,<t188=r5,<c7=r14
eor r5,r5,r14

# qhasm: v2 += (v7 >>> 21)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #21
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #21
add r3,r3,r12,ROR #21

# qhasm: v2 += (t188 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t188=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t188=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#6,<c11_stack=stack32#22
# asm 2: ldr >c11=r5,<c11_stack=[sp,#212]
ldr r5,[sp,#212]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v2=int32#4,ROR #24
# asm 2: eor >v13=r8,<v13=r11,<v2=r3,ROR #24
eor r8,r11,r3,ROR #24

# qhasm: t189 = mem32[&m6m7_stack+4]
# asm 1: ldr >t189=int32#10,<m6m7_stack=stack64#9
# asm 2: ldr >t189=r9,<m6m7_stack=[sp,#68]
ldr r9,[sp,#68]

# qhasm: v8 += (v13 >>> 24)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#9,ROR #24
# asm 2: add >v8=r10,<v8=r10,<v13=r8,ROR #24
add r10,r10,r8,ROR #24

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#14,<c2_stack=stack32#13
# asm 2: ldr >c2=r14,<c2_stack=[sp,#176]
ldr r14,[sp,#176]

# qhasm: v7 ^= (v8 >>> 11)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#11,ROR #11
# asm 2: eor >v7=r12,<v7=r12,<v8=r10,ROR #11
eor r12,r12,r10,ROR #11

# qhasm: t189 ^= c11
# asm 1: eor >t189=int32#6,<t189=int32#10,<c11=int32#6
# asm 2: eor >t189=r5,<t189=r9,<c11=r5
eor r5,r9,r5

# qhasm: v2 += (v7 >>> 1)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #1
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #1
add r3,r3,r12,ROR #1

# qhasm: v2 += (t189 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t189=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t189=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t190 = mem32[&m0m1_stack]
# asm 1: ldr >t190=int32#6,<m0m1_stack=stack64#6
# asm 2: ldr >t190=r5,<m0m1_stack=[sp,#40]
ldr r5,[sp,#40]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v2=int32#4,ROR #8
# asm 2: eor >v13=r8,<v13=r8,<v2=r3,ROR #8
eor r8,r8,r3,ROR #8

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v13=r8,<v9v13_stack=[sp,#108]
str r8,[sp,#108]

# qhasm: v8 += (v13 >>> 0)
# asm 1: add >v8=int32#9,<v8=int32#11,<v13=int32#9,ROR #0
# asm 2: add >v8=r8,<v8=r10,<v13=r8,ROR #0
add r8,r10,r8,ROR #0

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t190 ^= c2
# asm 1: eor >t190=int32#6,<t190=int32#6,<c2=int32#14
# asm 2: eor >t190=r5,<t190=r5,<c2=r14
eor r5,r5,r14

# qhasm: v1 += (v6 >>> 21)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #21
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #21
add r2,r2,r1,ROR #21

# qhasm: v1 += (t190 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t190=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t190=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#6,<c0_stack=stack32#11
# asm 2: ldr >c0=r5,<c0_stack=[sp,#168]
ldr r5,[sp,#168]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#10,<v12=int32#12,<v1=int32#3,ROR #24
# asm 2: eor >v12=r9,<v12=r11,<v1=r2,ROR #24
eor r9,r11,r2,ROR #24

# qhasm: t191 = mem32[&m2m3_stack]
# asm 1: ldr >t191=int32#12,<m2m3_stack=stack64#7
# asm 2: ldr >t191=r11,<m2m3_stack=[sp,#48]
ldr r11,[sp,#48]

# qhasm: v11 += (v12 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #24
add r10,r10,r9,ROR #24

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#14,<c8_stack=stack32#19
# asm 2: ldr >c8=r14,<c8_stack=[sp,#200]
ldr r14,[sp,#200]

# qhasm: v6 ^= (v11 >>> 11)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #11
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #11
eor r1,r1,r10,ROR #11

# qhasm: t191 ^= c0
# asm 1: eor >t191=int32#6,<t191=int32#12,<c0=int32#6
# asm 2: eor >t191=r5,<t191=r11,<c0=r5
eor r5,r11,r5

# qhasm: v1 += (v6 >>> 1)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #1
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #1
add r2,r2,r1,ROR #1

# qhasm: v1 += (t191 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t191=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t191=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t192 = mem32[&m10m11_stack+4]
# asm 1: ldr >t192=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t192=r5,<m10m11_stack=[sp,#84]
ldr r5,[sp,#84]

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v1=int32#3,ROR #8
# asm 2: eor >v12=r9,<v12=r9,<v1=r2,ROR #8
eor r9,r9,r2,ROR #8

# qhasm: v7 ^= (v8 >>> 31)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#9,ROR #31
# asm 2: eor >v7=r12,<v7=r12,<v8=r8,ROR #31
eor r12,r12,r8,ROR #31

# qhasm: v11 += (v12 >>> 0)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #0
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #0
add r10,r10,r9,ROR #0

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#11,<v11v15_stack=stack64#16
# asm 2: str <v11=r10,<v11v15_stack=[sp,#120]
str r10,[sp,#120]

# qhasm: v6 ^= (v11 >>> 31)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #31
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #31
eor r1,r1,r10,ROR #31

# qhasm: t192 ^= c8
# asm 1: eor >t192=int32#6,<t192=int32#6,<c8=int32#14
# asm 2: eor >t192=r5,<t192=r5,<c8=r14
eor r5,r5,r14

# qhasm: v0 += (v4 >>> 8)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #8
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #8
add r0,r0,r6,ROR #8

# qhasm: v0 += (t192 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t192=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t192=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#6,<c11_stack=stack32#22
# asm 2: ldr >c11=r5,<c11_stack=[sp,#212]
ldr r5,[sp,#212]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #0
eor r9,r9,r0,ROR #0

# qhasm: t193 = mem32[&m8m9_stack]
# asm 1: ldr >t193=int32#11,<m8m9_stack=stack64#10
# asm 2: ldr >t193=r10,<m8m9_stack=[sp,#72]
ldr r10,[sp,#72]

# qhasm: v8 += (v12 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #16
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#14,<c0_stack=stack32#11
# asm 2: ldr >c0=r14,<c0_stack=[sp,#168]
ldr r14,[sp,#168]

# qhasm: v4 ^= (v8 >>> 24)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #24
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #24
eor r6,r6,r8,ROR #24

# qhasm: t193 ^= c11
# asm 1: eor >t193=int32#6,<t193=int32#11,<c11=int32#6
# asm 2: eor >t193=r5,<t193=r10,<c11=r5
eor r5,r10,r5

# qhasm: v0 += (v4 >>> 20)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #20
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #20
add r0,r0,r6,ROR #20

# qhasm: v0 += (t193 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t193=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t193=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t194 = mem32[&m12m13_stack]
# asm 1: ldr >t194=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t194=r5,<m12m13_stack=[sp,#88]
ldr r5,[sp,#88]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 24)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #24
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #24
add r8,r8,r9,ROR #24

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 12)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #12
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #12
eor r6,r6,r8,ROR #12

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t194 ^= c0
# asm 1: eor >t194=int32#6,<t194=int32#6,<c0=int32#14
# asm 2: eor >t194=r5,<t194=r5,<c0=r14
eor r5,r5,r14

# qhasm: v1 += (v5 >>> 8)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #8
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #8
add r2,r2,r7,ROR #8

# qhasm: v1 += (t194 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t194=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t194=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#6,<c12_stack=stack32#23
# asm 2: ldr >c12=r5,<c12_stack=[sp,#216]
ldr r5,[sp,#216]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #0
eor r8,r11,r2,ROR #0

# qhasm: t195 = mem32[&m0m1_stack]
# asm 1: ldr >t195=int32#10,<m0m1_stack=stack64#6
# asm 2: ldr >t195=r9,<m0m1_stack=[sp,#40]
ldr r9,[sp,#40]

# qhasm: v9 += (v13 >>> 16)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#14,<c2_stack=stack32#13
# asm 2: ldr >c2=r14,<c2_stack=[sp,#176]
ldr r14,[sp,#176]

# qhasm: v5 ^= (v9 >>> 24)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #24
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #24
eor r7,r7,r10,ROR #24

# qhasm: t195 ^= c12
# asm 1: eor >t195=int32#6,<t195=int32#10,<c12=int32#6
# asm 2: eor >t195=r5,<t195=r9,<c12=r5
eor r5,r9,r5

# qhasm: v1 += (v5 >>> 20)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #20
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #20
add r2,r2,r7,ROR #20

# qhasm: v1 += (t195 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t195=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t195=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t196 = mem32[&m4m5_stack+4]
# asm 1: ldr >t196=int32#6,<m4m5_stack=stack64#8
# asm 2: ldr >t196=r5,<m4m5_stack=[sp,#60]
ldr r5,[sp,#60]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #16
eor r8,r8,r2,ROR #16

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 24)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #24
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 12)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #12
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #12
eor r7,r7,r8,ROR #12

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t196 ^= c2
# asm 1: eor >t196=int32#6,<t196=int32#6,<c2=int32#14
# asm 2: eor >t196=r5,<t196=r5,<c2=r14
eor r5,r5,r14

# qhasm: v2 += (v6 >>> 8)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #8
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #8
add r3,r3,r1,ROR #8

# qhasm: v2 += (t196 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t196=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t196=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#6,<c5_stack=stack32#16
# asm 2: ldr >c5=r5,<c5_stack=[sp,#188]
ldr r5,[sp,#188]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #0
eor r8,r11,r3,ROR #0

# qhasm: t197 = mem32[&m2m3_stack]
# asm 1: ldr >t197=int32#10,<m2m3_stack=stack64#7
# asm 2: ldr >t197=r9,<m2m3_stack=[sp,#48]
ldr r9,[sp,#48]

# qhasm: v10 += (v14 >>> 16)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #16
add r10,r10,r8,ROR #16

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#14,<c13_stack=stack32#24
# asm 2: ldr >c13=r14,<c13_stack=[sp,#220]
ldr r14,[sp,#220]

# qhasm: v6 ^= (v10 >>> 24)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #24
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #24
eor r1,r1,r10,ROR #24

# qhasm: t197 ^= c5
# asm 1: eor >t197=int32#6,<t197=int32#10,<c5=int32#6
# asm 2: eor >t197=r5,<t197=r9,<c5=r5
eor r5,r9,r5

# qhasm: v2 += (v6 >>> 20)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #20
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #20
add r3,r3,r1,ROR #20

# qhasm: v2 += (t197 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t197=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t197=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t198 = mem32[&m14m15_stack+4]
# asm 1: ldr >t198=int32#6,<m14m15_stack=stack64#13
# asm 2: ldr >t198=r5,<m14m15_stack=[sp,#100]
ldr r5,[sp,#100]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #16
eor r8,r8,r3,ROR #16

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 24)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #24
add r8,r10,r8,ROR #24

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t198 ^= c13
# asm 1: eor >t198=int32#6,<t198=int32#6,<c13=int32#14
# asm 2: eor >t198=r5,<t198=r5,<c13=r14
eor r5,r5,r14

# qhasm: v3 += (v7 >>> 8)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #8
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #8
add r4,r4,r12,ROR #8

# qhasm: v3 += (t198 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t198=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t198=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c15 = c15_stack
# asm 1: ldr >c15=int32#6,<c15_stack=stack32#26
# asm 2: ldr >c15=r5,<c15_stack=[sp,#228]
ldr r5,[sp,#228]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#10,<v15=int32#12,<v3=int32#5,ROR #0
# asm 2: eor >v15=r9,<v15=r11,<v3=r4,ROR #0
eor r9,r11,r4,ROR #0

# qhasm: t199 = mem32[&m12m13_stack+4]
# asm 1: ldr >t199=int32#12,<m12m13_stack=stack64#12
# asm 2: ldr >t199=r11,<m12m13_stack=[sp,#92]
ldr r11,[sp,#92]

# qhasm: v11 += (v15 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#14,<c14_stack=stack32#25
# asm 2: ldr >c14=r14,<c14_stack=[sp,#224]
ldr r14,[sp,#224]

# qhasm: v7 ^= (v11 >>> 24)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #24
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #24
eor r12,r12,r10,ROR #24

# qhasm: t199 ^= c15
# asm 1: eor >t199=int32#6,<t199=int32#12,<c15=int32#6
# asm 2: eor >t199=r5,<t199=r11,<c15=r5
eor r5,r11,r5

# qhasm: v3 += (v7 >>> 20)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #20
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #20
add r4,r4,r12,ROR #20

# qhasm: v3 += (t199 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t199=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t199=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t200 = mem32[&m10m11_stack]
# asm 1: ldr >t200=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t200=r5,<m10m11_stack=[sp,#80]
ldr r5,[sp,#80]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v3=int32#5,ROR #16
# asm 2: eor >v15=r9,<v15=r9,<v3=r4,ROR #16
eor r9,r9,r4,ROR #16

# qhasm: v6 ^= (v10 >>> 12)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #12
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #12
eor r1,r1,r8,ROR #12

# qhasm: v11 += (v15 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#10,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v15=r9,ROR #24
add r10,r10,r9,ROR #24

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 12)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #12
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #12
eor r12,r12,r10,ROR #12

# qhasm: t200 ^= c14
# asm 1: eor >t200=int32#6,<t200=int32#6,<c14=int32#14
# asm 2: eor >t200=r5,<t200=r5,<c14=r14
eor r5,r5,r14

# qhasm: v0 += (v5 >>> 27)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #27
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #27
add r0,r0,r7,ROR #27

# qhasm: v0 += (t200 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t200=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t200=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c10 = c10_stack
# asm 1: ldr >c10=int32#6,<c10_stack=stack32#21
# asm 2: ldr >c10=r5,<c10_stack=[sp,#208]
ldr r5,[sp,#208]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #8
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #8
eor r9,r9,r0,ROR #8

# qhasm: t201 = mem32[&m14m15_stack]
# asm 1: ldr >t201=int32#11,<m14m15_stack=stack64#13
# asm 2: ldr >t201=r10,<m14m15_stack=[sp,#96]
ldr r10,[sp,#96]

# qhasm: v10 += (v15 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #8
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#14,<c4_stack=stack32#15
# asm 2: ldr >c4=r14,<c4_stack=[sp,#184]
ldr r14,[sp,#184]

# qhasm: v5 ^= (v10 >>> 5)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #5
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #5
eor r7,r7,r8,ROR #5

# qhasm: t201 ^= c10
# asm 1: eor >t201=int32#6,<t201=int32#11,<c10=int32#6
# asm 2: eor >t201=r5,<t201=r10,<c10=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 7)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #7
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #7
add r0,r0,r7,ROR #7

# qhasm: v0 += (t201 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t201=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t201=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t202 = mem32[&m8m9_stack+4]
# asm 1: ldr >t202=int32#6,<m8m9_stack=stack64#10
# asm 2: ldr >t202=r5,<m8m9_stack=[sp,#76]
ldr r5,[sp,#76]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#10,<v15=int32#10,<v0=int32#1,ROR #24
# asm 2: eor >v15=r9,<v15=r9,<v0=r0,ROR #24
eor r9,r9,r0,ROR #24

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#10,<v11v15_stack=stack64#16
# asm 2: str <v15=r9,<v11v15_stack=[sp,#124]
str r9,[sp,#124]

# qhasm: v10 += (v15 >>> 16)
# asm 1: add >v10=int32#9,<v10=int32#9,<v15=int32#10,ROR #16
# asm 2: add >v10=r8,<v10=r8,<v15=r9,ROR #16
add r8,r8,r9,ROR #16

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 25)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #25
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #25
eor r7,r7,r8,ROR #25

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t202 ^= c4
# asm 1: eor >t202=int32#6,<t202=int32#6,<c4=int32#14
# asm 2: eor >t202=r5,<t202=r5,<c4=r14
eor r5,r5,r14

# qhasm: v3 += (v4 >>> 27)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #27
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #27
add r4,r4,r6,ROR #27

# qhasm: v3 += (t202 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t202=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t202=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#6,<c9_stack=stack32#20
# asm 2: ldr >c9=r5,<c9_stack=[sp,#204]
ldr r5,[sp,#204]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#5,ROR #8
# asm 2: eor >v14=r8,<v14=r11,<v3=r4,ROR #8
eor r8,r11,r4,ROR #8

# qhasm: t203 = mem32[&m4m5_stack]
# asm 1: ldr >t203=int32#10,<m4m5_stack=stack64#8
# asm 2: ldr >t203=r9,<m4m5_stack=[sp,#56]
ldr r9,[sp,#56]

# qhasm: v9 += (v14 >>> 8)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#14,<c1_stack=stack32#12
# asm 2: ldr >c1=r14,<c1_stack=[sp,#172]
ldr r14,[sp,#172]

# qhasm: v4 ^= (v9 >>> 5)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #5
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #5
eor r6,r6,r10,ROR #5

# qhasm: t203 ^= c9
# asm 1: eor >t203=int32#6,<t203=int32#10,<c9=int32#6
# asm 2: eor >t203=r5,<t203=r9,<c9=r5
eor r5,r9,r5

# qhasm: v3 += (v4 >>> 7)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #7
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #7
add r4,r4,r6,ROR #7

# qhasm: v3 += (t203 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t203=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t203=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t204 = mem32[&m6m7_stack+4]
# asm 1: ldr >t204=int32#6,<m6m7_stack=stack64#9
# asm 2: ldr >t204=r5,<m6m7_stack=[sp,#68]
ldr r5,[sp,#68]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v3=int32#5,ROR #24
# asm 2: eor >v14=r8,<v14=r8,<v3=r4,ROR #24
eor r8,r8,r4,ROR #24

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v14=r8,<v10v14_stack=[sp,#116]
str r8,[sp,#116]

# qhasm: v9 += (v14 >>> 16)
# asm 1: add >v9=int32#9,<v9=int32#11,<v14=int32#9,ROR #16
# asm 2: add >v9=r8,<v9=r10,<v14=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v9=r8,<v9v13_stack=[sp,#104]
str r8,[sp,#104]

# qhasm: v4 ^= (v9 >>> 25)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#9,ROR #25
# asm 2: eor >v4=r6,<v4=r6,<v9=r8,ROR #25
eor r6,r6,r8,ROR #25

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t204 ^= c1
# asm 1: eor >t204=int32#6,<t204=int32#6,<c1=int32#14
# asm 2: eor >t204=r5,<t204=r5,<c1=r14
eor r5,r5,r14

# qhasm: v2 += (v7 >>> 27)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #27
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #27
add r3,r3,r12,ROR #27

# qhasm: v2 += (t204 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t204=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t204=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#6,<c7_stack=stack32#18
# asm 2: ldr >c7=r5,<c7_stack=[sp,#196]
ldr r5,[sp,#196]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v2=int32#4,ROR #8
# asm 2: eor >v13=r8,<v13=r11,<v2=r3,ROR #8
eor r8,r11,r3,ROR #8

# qhasm: t205 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t205=int32#10,<m0m1_stack=stack64#6
# asm 2: ldr >t205=r9,<m0m1_stack=[sp,#44]
ldr r9,[sp,#44]

# qhasm: v8 += (v13 >>> 8)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v8=r10,<v8=r10,<v13=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#14,<c6_stack=stack32#17
# asm 2: ldr >c6=r14,<c6_stack=[sp,#192]
ldr r14,[sp,#192]

# qhasm: v7 ^= (v8 >>> 5)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#11,ROR #5
# asm 2: eor >v7=r12,<v7=r12,<v8=r10,ROR #5
eor r12,r12,r10,ROR #5

# qhasm: t205 ^= c7
# asm 1: eor >t205=int32#6,<t205=int32#10,<c7=int32#6
# asm 2: eor >t205=r5,<t205=r9,<c7=r5
eor r5,r9,r5

# qhasm: v2 += (v7 >>> 7)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #7
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #7
add r3,r3,r12,ROR #7

# qhasm: v2 += (t205 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t205=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t205=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t206 = mem32[&m2m3_stack+4]
# asm 1: ldr >t206=int32#6,<m2m3_stack=stack64#7
# asm 2: ldr >t206=r5,<m2m3_stack=[sp,#52]
ldr r5,[sp,#52]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v2=int32#4,ROR #24
# asm 2: eor >v13=r8,<v13=r8,<v2=r3,ROR #24
eor r8,r8,r3,ROR #24

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v9v13_stack=stack64#14
# asm 2: str <v13=r8,<v9v13_stack=[sp,#108]
str r8,[sp,#108]

# qhasm: v8 += (v13 >>> 16)
# asm 1: add >v8=int32#9,<v8=int32#11,<v13=int32#9,ROR #16
# asm 2: add >v8=r8,<v8=r10,<v13=r8,ROR #16
add r8,r10,r8,ROR #16

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t206 ^= c6
# asm 1: eor >t206=int32#6,<t206=int32#6,<c6=int32#14
# asm 2: eor >t206=r5,<t206=r5,<c6=r14
eor r5,r5,r14

# qhasm: v1 += (v6 >>> 27)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #27
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #27
add r2,r2,r1,ROR #27

# qhasm: v1 += (t206 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t206=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t206=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#6,<c3_stack=stack32#14
# asm 2: ldr >c3=r5,<c3_stack=[sp,#180]
ldr r5,[sp,#180]

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#10,<v12=int32#12,<v1=int32#3,ROR #8
# asm 2: eor >v12=r9,<v12=r11,<v1=r2,ROR #8
eor r9,r11,r2,ROR #8

# qhasm: t207 = mem32[&m6m7_stack]
# asm 1: ldr >t207=int32#12,<m6m7_stack=stack64#9
# asm 2: ldr >t207=r11,<m6m7_stack=[sp,#64]
ldr r11,[sp,#64]

# qhasm: v11 += (v12 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #8
add r10,r10,r9,ROR #8

# qhasm: c9 = c9_stack
# asm 1: ldr >c9=int32#14,<c9_stack=stack32#20
# asm 2: ldr >c9=r14,<c9_stack=[sp,#204]
ldr r14,[sp,#204]

# qhasm: v6 ^= (v11 >>> 5)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #5
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #5
eor r1,r1,r10,ROR #5

# qhasm: t207 ^= c3
# asm 1: eor >t207=int32#6,<t207=int32#12,<c3=int32#6
# asm 2: eor >t207=r5,<t207=r11,<c3=r5
eor r5,r11,r5

# qhasm: v1 += (v6 >>> 7)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #7
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #7
add r2,r2,r1,ROR #7

# qhasm: v1 += (t207 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t207=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t207=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t208 = mem32[&m6m7_stack+4]
# asm 1: ldr >t208=int32#6,<m6m7_stack=stack64#9
# asm 2: ldr >t208=r5,<m6m7_stack=[sp,#68]
ldr r5,[sp,#68]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v1=int32#3,ROR #24
# asm 2: eor >v12=r9,<v12=r9,<v1=r2,ROR #24
eor r9,r9,r2,ROR #24

# qhasm: v7 ^= (v8 >>> 25)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v8=int32#9,ROR #25
# asm 2: eor >v7=r12,<v7=r12,<v8=r8,ROR #25
eor r12,r12,r8,ROR #25

# qhasm: v11 += (v12 >>> 16)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#10,ROR #16
# asm 2: add >v11=r10,<v11=r10,<v12=r9,ROR #16
add r10,r10,r9,ROR #16

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#11,<v11v15_stack=stack64#16
# asm 2: str <v11=r10,<v11v15_stack=[sp,#120]
str r10,[sp,#120]

# qhasm: v6 ^= (v11 >>> 25)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #25
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #25
eor r1,r1,r10,ROR #25

# qhasm: t208 ^= c9
# asm 1: eor >t208=int32#6,<t208=int32#6,<c9=int32#14
# asm 2: eor >t208=r5,<t208=r5,<c9=r14
eor r5,r5,r14

# qhasm: v0 += (v4 >>> 14)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #14
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #14
add r0,r0,r6,ROR #14

# qhasm: v0 += (t208 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t208=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t208=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c7 = c7_stack
# asm 1: ldr >c7=int32#6,<c7_stack=stack32#18
# asm 2: ldr >c7=r5,<c7_stack=[sp,#196]
ldr r5,[sp,#196]

# qhasm: v12 ^= (v0 >>> 16)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #16
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #16
eor r9,r9,r0,ROR #16

# qhasm: t209 = mem32[&m8m9_stack+4]
# asm 1: ldr >t209=int32#11,<m8m9_stack=stack64#10
# asm 2: ldr >t209=r10,<m8m9_stack=[sp,#76]
ldr r10,[sp,#76]

# qhasm: v8 += (v12 >>> 0)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #0
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #0
add r8,r8,r9,ROR #0

# qhasm: c1 = c1_stack
# asm 1: ldr >c1=int32#14,<c1_stack=stack32#12
# asm 2: ldr >c1=r14,<c1_stack=[sp,#172]
ldr r14,[sp,#172]

# qhasm: v4 ^= (v8 >>> 18)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #18
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #18
eor r6,r6,r8,ROR #18

# qhasm: t209 ^= c7
# asm 1: eor >t209=int32#6,<t209=int32#11,<c7=int32#6
# asm 2: eor >t209=r5,<t209=r10,<c7=r5
eor r5,r10,r5

# qhasm: v0 += (v4 >>> 26)
# asm 1: add >v0=int32#1,<v0=int32#1,<v4=int32#7,ROR #26
# asm 2: add >v0=r0,<v0=r0,<v4=r6,ROR #26
add r0,r0,r6,ROR #26

# qhasm: v0 += (t209 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t209=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t209=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: t210 = mem32[&m2m3_stack+4]
# asm 1: ldr >t210=int32#6,<m2m3_stack=stack64#7
# asm 2: ldr >t210=r5,<m2m3_stack=[sp,#52]
ldr r5,[sp,#52]

# qhasm: v12 ^= (v0 >>> 0)
# asm 1: eor >v12=int32#10,<v12=int32#10,<v0=int32#1,ROR #0
# asm 2: eor >v12=r9,<v12=r9,<v0=r0,ROR #0
eor r9,r9,r0,ROR #0

# qhasm: mem32[&v11v12_stack+4] = v12
# asm 1: str <v12=int32#10,<v11v12_stack=stack64#2
# asm 2: str <v12=r9,<v11v12_stack=[sp,#12]
str r9,[sp,#12]

# qhasm: v8 += (v12 >>> 8)
# asm 1: add >v8=int32#9,<v8=int32#9,<v12=int32#10,ROR #8
# asm 2: add >v8=r8,<v8=r8,<v12=r9,ROR #8
add r8,r8,r9,ROR #8

# qhasm: mem32[&v8v13_stack] = v8
# asm 1: str <v8=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v8=r8,<v8v13_stack=[sp,#24]
str r8,[sp,#24]

# qhasm: v4 ^= (v8 >>> 6)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v8=int32#9,ROR #6
# asm 2: eor >v4=r6,<v4=r6,<v8=r8,ROR #6
eor r6,r6,r8,ROR #6

# qhasm: assign r10 r11 to v9 v13 = v9v13_stack
# asm 1: ldrd >v9=int32#11,<v9v13_stack=stack64#14
# asm 2: ldrd >v9=r10,<v9v13_stack=[sp,#104]
ldrd r10,[sp,#104]

# qhasm: t210 ^= c1
# asm 1: eor >t210=int32#6,<t210=int32#6,<c1=int32#14
# asm 2: eor >t210=r5,<t210=r5,<c1=r14
eor r5,r5,r14

# qhasm: v1 += (v5 >>> 14)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #14
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #14
add r2,r2,r7,ROR #14

# qhasm: v1 += (t210 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t210=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t210=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: c3 = c3_stack
# asm 1: ldr >c3=int32#6,<c3_stack=stack32#14
# asm 2: ldr >c3=r5,<c3_stack=[sp,#180]
ldr r5,[sp,#180]

# qhasm: v13 ^= (v1 >>> 16)
# asm 1: eor >v13=int32#9,<v13=int32#12,<v1=int32#3,ROR #16
# asm 2: eor >v13=r8,<v13=r11,<v1=r2,ROR #16
eor r8,r11,r2,ROR #16

# qhasm: t211 = mem32[&m0m1_stack + 4]
# asm 1: ldr >t211=int32#10,<m0m1_stack=stack64#6
# asm 2: ldr >t211=r9,<m0m1_stack=[sp,#44]
ldr r9,[sp,#44]

# qhasm: v9 += (v13 >>> 0)
# asm 1: add >v9=int32#11,<v9=int32#11,<v13=int32#9,ROR #0
# asm 2: add >v9=r10,<v9=r10,<v13=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c12 = c12_stack
# asm 1: ldr >c12=int32#14,<c12_stack=stack32#23
# asm 2: ldr >c12=r14,<c12_stack=[sp,#216]
ldr r14,[sp,#216]

# qhasm: v5 ^= (v9 >>> 18)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#11,ROR #18
# asm 2: eor >v5=r7,<v5=r7,<v9=r10,ROR #18
eor r7,r7,r10,ROR #18

# qhasm: t211 ^= c3
# asm 1: eor >t211=int32#6,<t211=int32#10,<c3=int32#6
# asm 2: eor >t211=r5,<t211=r9,<c3=r5
eor r5,r9,r5

# qhasm: v1 += (v5 >>> 26)
# asm 1: add >v1=int32#3,<v1=int32#3,<v5=int32#8,ROR #26
# asm 2: add >v1=r2,<v1=r2,<v5=r7,ROR #26
add r2,r2,r7,ROR #26

# qhasm: v1 += (t211 >>> 0)
# asm 1: add >v1=int32#3,<v1=int32#3,<t211=int32#6,ROR #0
# asm 2: add >v1=r2,<v1=r2,<t211=r5,ROR #0
add r2,r2,r5,ROR #0

# qhasm: t212 = mem32[&m12m13_stack+4]
# asm 1: ldr >t212=int32#6,<m12m13_stack=stack64#12
# asm 2: ldr >t212=r5,<m12m13_stack=[sp,#92]
ldr r5,[sp,#92]

# qhasm: v13 ^= (v1 >>> 0)
# asm 1: eor >v13=int32#9,<v13=int32#9,<v1=int32#3,ROR #0
# asm 2: eor >v13=r8,<v13=r8,<v1=r2,ROR #0
eor r8,r8,r2,ROR #0

# qhasm: mem32[&v8v13_stack+4] = v13
# asm 1: str <v13=int32#9,<v8v13_stack=stack64#4
# asm 2: str <v13=r8,<v8v13_stack=[sp,#28]
str r8,[sp,#28]

# qhasm: v9 += (v13 >>> 8)
# asm 1: add >v9=int32#9,<v9=int32#11,<v13=int32#9,ROR #8
# asm 2: add >v9=r8,<v9=r10,<v13=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: mem32[&v9v14_stack] = v9
# asm 1: str <v9=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v9=r8,<v9v14_stack=[sp,#32]
str r8,[sp,#32]

# qhasm: v5 ^= (v9 >>> 6)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v9=int32#9,ROR #6
# asm 2: eor >v5=r7,<v5=r7,<v9=r8,ROR #6
eor r7,r7,r8,ROR #6

# qhasm: assign r10 r11 to v10 v14 = v10v14_stack
# asm 1: ldrd >v10=int32#11,<v10v14_stack=stack64#15
# asm 2: ldrd >v10=r10,<v10v14_stack=[sp,#112]
ldrd r10,[sp,#112]

# qhasm: t212 ^= c12
# asm 1: eor >t212=int32#6,<t212=int32#6,<c12=int32#14
# asm 2: eor >t212=r5,<t212=r5,<c12=r14
eor r5,r5,r14

# qhasm: v2 += (v6 >>> 14)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #14
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #14
add r3,r3,r1,ROR #14

# qhasm: v2 += (t212 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t212=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t212=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: c13 = c13_stack
# asm 1: ldr >c13=int32#6,<c13_stack=stack32#24
# asm 2: ldr >c13=r5,<c13_stack=[sp,#220]
ldr r5,[sp,#220]

# qhasm: v14 ^= (v2 >>> 16)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v2=int32#4,ROR #16
# asm 2: eor >v14=r8,<v14=r11,<v2=r3,ROR #16
eor r8,r11,r3,ROR #16

# qhasm: t213 = mem32[&m12m13_stack]
# asm 1: ldr >t213=int32#10,<m12m13_stack=stack64#12
# asm 2: ldr >t213=r9,<m12m13_stack=[sp,#88]
ldr r9,[sp,#88]

# qhasm: v10 += (v14 >>> 0)
# asm 1: add >v10=int32#11,<v10=int32#11,<v14=int32#9,ROR #0
# asm 2: add >v10=r10,<v10=r10,<v14=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c14 = c14_stack
# asm 1: ldr >c14=int32#14,<c14_stack=stack32#25
# asm 2: ldr >c14=r14,<c14_stack=[sp,#224]
ldr r14,[sp,#224]

# qhasm: v6 ^= (v10 >>> 18)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#11,ROR #18
# asm 2: eor >v6=r1,<v6=r1,<v10=r10,ROR #18
eor r1,r1,r10,ROR #18

# qhasm: t213 ^= c13
# asm 1: eor >t213=int32#6,<t213=int32#10,<c13=int32#6
# asm 2: eor >t213=r5,<t213=r9,<c13=r5
eor r5,r9,r5

# qhasm: v2 += (v6 >>> 26)
# asm 1: add >v2=int32#4,<v2=int32#4,<v6=int32#2,ROR #26
# asm 2: add >v2=r3,<v2=r3,<v6=r1,ROR #26
add r3,r3,r1,ROR #26

# qhasm: v2 += (t213 >>> 0)
# asm 1: add >v2=int32#4,<v2=int32#4,<t213=int32#6,ROR #0
# asm 2: add >v2=r3,<v2=r3,<t213=r5,ROR #0
add r3,r3,r5,ROR #0

# qhasm: t214 = mem32[&m10m11_stack+4]
# asm 1: ldr >t214=int32#6,<m10m11_stack=stack64#11
# asm 2: ldr >t214=r5,<m10m11_stack=[sp,#84]
ldr r5,[sp,#84]

# qhasm: v14 ^= (v2 >>> 0)
# asm 1: eor >v14=int32#9,<v14=int32#9,<v2=int32#4,ROR #0
# asm 2: eor >v14=r8,<v14=r8,<v2=r3,ROR #0
eor r8,r8,r3,ROR #0

# qhasm: mem32[&v9v14_stack+4] = v14
# asm 1: str <v14=int32#9,<v9v14_stack=stack64#5
# asm 2: str <v14=r8,<v9v14_stack=[sp,#36]
str r8,[sp,#36]

# qhasm: v10 += (v14 >>> 8)
# asm 1: add >v10=int32#9,<v10=int32#11,<v14=int32#9,ROR #8
# asm 2: add >v10=r8,<v10=r10,<v14=r8,ROR #8
add r8,r10,r8,ROR #8

# qhasm: mem32[&v10v15_stack] = v10
# asm 1: str <v10=int32#9,<v10v15_stack=stack64#1
# asm 2: str <v10=r8,<v10v15_stack=[sp,#0]
str r8,[sp,#0]

# qhasm: v6 ^= (v10 >>> 6)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v10=int32#9,ROR #6
# asm 2: eor >v6=r1,<v6=r1,<v10=r8,ROR #6
eor r1,r1,r8,ROR #6

# qhasm: assign r10 r11 to v11 v15 = v11v15_stack
# asm 1: ldrd >v11=int32#11,<v11v15_stack=stack64#16
# asm 2: ldrd >v11=r10,<v11v15_stack=[sp,#120]
ldrd r10,[sp,#120]

# qhasm: t214 ^= c14
# asm 1: eor >t214=int32#6,<t214=int32#6,<c14=int32#14
# asm 2: eor >t214=r5,<t214=r5,<c14=r14
eor r5,r5,r14

# qhasm: v3 += (v7 >>> 14)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #14
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #14
add r4,r4,r12,ROR #14

# qhasm: v3 += (t214 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t214=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t214=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: c11 = c11_stack
# asm 1: ldr >c11=int32#6,<c11_stack=stack32#22
# asm 2: ldr >c11=r5,<c11_stack=[sp,#212]
ldr r5,[sp,#212]

# qhasm: v15 ^= (v3 >>> 16)
# asm 1: eor >v15=int32#9,<v15=int32#12,<v3=int32#5,ROR #16
# asm 2: eor >v15=r8,<v15=r11,<v3=r4,ROR #16
eor r8,r11,r4,ROR #16

# qhasm: t215 = mem32[&m14m15_stack]
# asm 1: ldr >t215=int32#10,<m14m15_stack=stack64#13
# asm 2: ldr >t215=r9,<m14m15_stack=[sp,#96]
ldr r9,[sp,#96]

# qhasm: v11 += (v15 >>> 0)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#9,ROR #0
# asm 2: add >v11=r10,<v11=r10,<v15=r8,ROR #0
add r10,r10,r8,ROR #0

# qhasm: c6 = c6_stack
# asm 1: ldr >c6=int32#12,<c6_stack=stack32#17
# asm 2: ldr >c6=r11,<c6_stack=[sp,#192]
ldr r11,[sp,#192]

# qhasm: v7 ^= (v11 >>> 18)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #18
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #18
eor r12,r12,r10,ROR #18

# qhasm: t215 ^= c11
# asm 1: eor >t215=int32#6,<t215=int32#10,<c11=int32#6
# asm 2: eor >t215=r5,<t215=r9,<c11=r5
eor r5,r9,r5

# qhasm: v3 += (v7 >>> 26)
# asm 1: add >v3=int32#5,<v3=int32#5,<v7=int32#13,ROR #26
# asm 2: add >v3=r4,<v3=r4,<v7=r12,ROR #26
add r4,r4,r12,ROR #26

# qhasm: v3 += (t215 >>> 0)
# asm 1: add >v3=int32#5,<v3=int32#5,<t215=int32#6,ROR #0
# asm 2: add >v3=r4,<v3=r4,<t215=r5,ROR #0
add r4,r4,r5,ROR #0

# qhasm: t216 = mem32[&m2m3_stack]
# asm 1: ldr >t216=int32#6,<m2m3_stack=stack64#7
# asm 2: ldr >t216=r5,<m2m3_stack=[sp,#48]
ldr r5,[sp,#48]

# qhasm: v15 ^= (v3 >>> 0)
# asm 1: eor >v15=int32#9,<v15=int32#9,<v3=int32#5,ROR #0
# asm 2: eor >v15=r8,<v15=r8,<v3=r4,ROR #0
eor r8,r8,r4,ROR #0

# qhasm: v10 = mem32[&v10v15_stack]
# asm 1: ldr >v10=int32#10,<v10v15_stack=stack64#1
# asm 2: ldr >v10=r9,<v10v15_stack=[sp,#0]
ldr r9,[sp,#0]

# qhasm: v11 += (v15 >>> 8)
# asm 1: add >v11=int32#11,<v11=int32#11,<v15=int32#9,ROR #8
# asm 2: add >v11=r10,<v11=r10,<v15=r8,ROR #8
add r10,r10,r8,ROR #8

# qhasm: mem32[&v11v12_stack] = v11
# asm 1: str <v11=int32#11,<v11v12_stack=stack64#2
# asm 2: str <v11=r10,<v11v12_stack=[sp,#8]
str r10,[sp,#8]

# qhasm: v7 ^= (v11 >>> 6)
# asm 1: eor >v7=int32#13,<v7=int32#13,<v11=int32#11,ROR #6
# asm 2: eor >v7=r12,<v7=r12,<v11=r10,ROR #6
eor r12,r12,r10,ROR #6

# qhasm: t216 ^= c6
# asm 1: eor >t216=int32#6,<t216=int32#6,<c6=int32#12
# asm 2: eor >t216=r5,<t216=r5,<c6=r11
eor r5,r5,r11

# qhasm: v0 += (v5 >>> 1)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #1
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #1
add r0,r0,r7,ROR #1

# qhasm: v0 += (t216 >>> 0)
# asm 1: add >v0=int32#1,<v0=int32#1,<t216=int32#6,ROR #0
# asm 2: add >v0=r0,<v0=r0,<t216=r5,ROR #0
add r0,r0,r5,ROR #0

# qhasm: c2 = c2_stack
# asm 1: ldr >c2=int32#6,<c2_stack=stack32#13
# asm 2: ldr >c2=r5,<c2_stack=[sp,#176]
ldr r5,[sp,#176]

# qhasm: v15 ^= (v0 >>> 24)
# asm 1: eor >v15=int32#9,<v15=int32#9,<v0=int32#1,ROR #24
# asm 2: eor >v15=r8,<v15=r8,<v0=r0,ROR #24
eor r8,r8,r0,ROR #24

# qhasm: t217 = mem32[&m6m7_stack]
# asm 1: ldr >t217=int32#11,<m6m7_stack=stack64#9
# asm 2: ldr >t217=r10,<m6m7_stack=[sp,#64]
ldr r10,[sp,#64]

# qhasm: v10 += (v15 >>> 24)
# asm 1: add >v10=int32#10,<v10=int32#10,<v15=int32#9,ROR #24
# asm 2: add >v10=r9,<v10=r9,<v15=r8,ROR #24
add r9,r9,r8,ROR #24

# qhasm: c8 = c8_stack
# asm 1: ldr >c8=int32#14,<c8_stack=stack32#19
# asm 2: ldr >c8=r14,<c8_stack=[sp,#200]
ldr r14,[sp,#200]

# qhasm: v5 ^= (v10 >>> 31)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#10,ROR #31
# asm 2: eor >v5=r7,<v5=r7,<v10=r9,ROR #31
eor r7,r7,r9,ROR #31

# qhasm: t217 ^= c2
# asm 1: eor >t217=int32#6,<t217=int32#11,<c2=int32#6
# asm 2: eor >t217=r5,<t217=r10,<c2=r5
eor r5,r10,r5

# qhasm: v0 += (v5 >>> 13)
# asm 1: add >v0=int32#1,<v0=int32#1,<v5=int32#8,ROR #13
# asm 2: add >v0=r0,<v0=r0,<v5=r7,ROR #13
add r0,r0,r7,ROR #13

# qhasm: v0 += (t217 >>> 0)
# asm 1: add >v0=int32#6,<v0=int32#1,<t217=int32#6,ROR #0
# asm 2: add >v0=r5,<v0=r0,<t217=r5,ROR #0
add r5,r0,r5,ROR #0

# qhasm: t218 = mem32[&m14m15_stack+4]
# asm 1: ldr >t218=int32#1,<m14m15_stack=stack64#13
# asm 2: ldr >t218=r0,<m14m15_stack=[sp,#100]
ldr r0,[sp,#100]

# qhasm: v15 ^= (v0 >>> 8)
# asm 1: eor >v15=int32#9,<v15=int32#9,<v0=int32#6,ROR #8
# asm 2: eor >v15=r8,<v15=r8,<v0=r5,ROR #8
eor r8,r8,r5,ROR #8

# qhasm: mem32[&v11v15_stack+4] = v15
# asm 1: str <v15=int32#9,<v11v15_stack=stack64#16
# asm 2: str <v15=r8,<v11v15_stack=[sp,#124]
str r8,[sp,#124]

# qhasm: v10 += (v15 >>> 0)
# asm 1: add >v10=int32#9,<v10=int32#10,<v15=int32#9,ROR #0
# asm 2: add >v10=r8,<v10=r9,<v15=r8,ROR #0
add r8,r9,r8,ROR #0

# qhasm: mem32[&v10v14_stack] = v10
# asm 1: str <v10=int32#9,<v10v14_stack=stack64#15
# asm 2: str <v10=r8,<v10v14_stack=[sp,#112]
str r8,[sp,#112]

# qhasm: v5 ^= (v10 >>> 19)
# asm 1: eor >v5=int32#8,<v5=int32#8,<v10=int32#9,ROR #19
# asm 2: eor >v5=r7,<v5=r7,<v10=r8,ROR #19
eor r7,r7,r8,ROR #19

# qhasm: assign r10 r11 to v9 v14 = v9v14_stack
# asm 1: ldrd >v9=int32#11,<v9v14_stack=stack64#5
# asm 2: ldrd >v9=r10,<v9v14_stack=[sp,#32]
ldrd r10,[sp,#32]

# qhasm: t218 ^= c8
# asm 1: eor >t218=int32#1,<t218=int32#1,<c8=int32#14
# asm 2: eor >t218=r0,<t218=r0,<c8=r14
eor r0,r0,r14

# qhasm: v3 += (v4 >>> 1)
# asm 1: add >v3=int32#5,<v3=int32#5,<v4=int32#7,ROR #1
# asm 2: add >v3=r4,<v3=r4,<v4=r6,ROR #1
add r4,r4,r6,ROR #1

# qhasm: v3 += (t218 >>> 0)
# asm 1: add >v3=int32#1,<v3=int32#5,<t218=int32#1,ROR #0
# asm 2: add >v3=r0,<v3=r4,<t218=r0,ROR #0
add r0,r4,r0,ROR #0

# qhasm: c15 = c15_stack
# asm 1: ldr >c15=int32#5,<c15_stack=stack32#26
# asm 2: ldr >c15=r4,<c15_stack=[sp,#228]
ldr r4,[sp,#228]

# qhasm: v14 ^= (v3 >>> 24)
# asm 1: eor >v14=int32#9,<v14=int32#12,<v3=int32#1,ROR #24
# asm 2: eor >v14=r8,<v14=r11,<v3=r0,ROR #24
eor r8,r11,r0,ROR #24

# qhasm: t219 = mem32[&m8m9_stack]
# asm 1: ldr >t219=int32#10,<m8m9_stack=stack64#10
# asm 2: ldr >t219=r9,<m8m9_stack=[sp,#72]
ldr r9,[sp,#72]

# qhasm: v9 += (v14 >>> 24)
# asm 1: add >v9=int32#11,<v9=int32#11,<v14=int32#9,ROR #24
# asm 2: add >v9=r10,<v9=r10,<v14=r8,ROR #24
add r10,r10,r8,ROR #24

# qhasm: c0 = c0_stack
# asm 1: ldr >c0=int32#14,<c0_stack=stack32#11
# asm 2: ldr >c0=r14,<c0_stack=[sp,#168]
ldr r14,[sp,#168]

# qhasm: v4 ^= (v9 >>> 31)
# asm 1: eor >v4=int32#7,<v4=int32#7,<v9=int32#11,ROR #31
# asm 2: eor >v4=r6,<v4=r6,<v9=r10,ROR #31
eor r6,r6,r10,ROR #31

# qhasm: t219 ^= c15
# asm 1: eor >t219=int32#5,<t219=int32#10,<c15=int32#5
# asm 2: eor >t219=r4,<t219=r9,<c15=r4
eor r4,r9,r4

# qhasm: v3 += (v4 >>> 13)
# asm 1: add >v3=int32#1,<v3=int32#1,<v4=int32#7,ROR #13
# asm 2: add >v3=r0,<v3=r0,<v4=r6,ROR #13
add r0,r0,r6,ROR #13

# qhasm: v3 += (t219 >>> 0)
# asm 1: add >v3=int32#10,<v3=int32#1,<t219=int32#5,ROR #0
# asm 2: add >v3=r9,<v3=r0,<t219=r4,ROR #0
add r9,r0,r4,ROR #0

# qhasm: t220 = mem32[&m4m5_stack]
# asm 1: ldr >t220=int32#1,<m4m5_stack=stack64#8
# asm 2: ldr >t220=r0,<m4m5_stack=[sp,#56]
ldr r0,[sp,#56]

# qhasm: v14 ^= (v3 >>> 8)
# asm 1: eor >v14=int32#5,<v14=int32#9,<v3=int32#10,ROR #8
# asm 2: eor >v14=r4,<v14=r8,<v3=r9,ROR #8
eor r4,r8,r9,ROR #8

# qhasm: mem32[&v10v14_stack+4] = v14
# asm 1: str <v14=int32#5,<v10v14_stack=stack64#15
# asm 2: str <v14=r4,<v10v14_stack=[sp,#116]
str r4,[sp,#116]

# qhasm: v9 += (v14 >>> 0)
# asm 1: add >v9=int32#5,<v9=int32#11,<v14=int32#5,ROR #0
# asm 2: add >v9=r4,<v9=r10,<v14=r4,ROR #0
add r4,r10,r4,ROR #0

# qhasm: mem32[&v9v13_stack] = v9
# asm 1: str <v9=int32#5,<v9v13_stack=stack64#14
# asm 2: str <v9=r4,<v9v13_stack=[sp,#104]
str r4,[sp,#104]

# qhasm: v4 ^= (v9 >>> 19)
# asm 1: eor >v4=int32#5,<v4=int32#7,<v9=int32#5,ROR #19
# asm 2: eor >v4=r4,<v4=r6,<v9=r4,ROR #19
eor r4,r6,r4,ROR #19

# qhasm: assign r10 r11 to v8 v13 = v8v13_stack
# asm 1: ldrd >v8=int32#11,<v8v13_stack=stack64#4
# asm 2: ldrd >v8=r10,<v8v13_stack=[sp,#24]
ldrd r10,[sp,#24]

# qhasm: t220 ^= c0
# asm 1: eor >t220=int32#1,<t220=int32#1,<c0=int32#14
# asm 2: eor >t220=r0,<t220=r0,<c0=r14
eor r0,r0,r14

# qhasm: v2 += (v7 >>> 1)
# asm 1: add >v2=int32#4,<v2=int32#4,<v7=int32#13,ROR #1
# asm 2: add >v2=r3,<v2=r3,<v7=r12,ROR #1
add r3,r3,r12,ROR #1

# qhasm: v2 += (t220 >>> 0)
# asm 1: add >v2=int32#1,<v2=int32#4,<t220=int32#1,ROR #0
# asm 2: add >v2=r0,<v2=r3,<t220=r0,ROR #0
add r0,r3,r0,ROR #0

# qhasm: c4 = c4_stack
# asm 1: ldr >c4=int32#4,<c4_stack=stack32#15
# asm 2: ldr >c4=r3,<c4_stack=[sp,#184]
ldr r3,[sp,#184]

# qhasm: v13 ^= (v2 >>> 24)
# asm 1: eor >v13=int32#7,<v13=int32#12,<v2=int32#1,ROR #24
# asm 2: eor >v13=r6,<v13=r11,<v2=r0,ROR #24
eor r6,r11,r0,ROR #24

# qhasm: t221 = mem32[&m0m1_stack]
# asm 1: ldr >t221=int32#9,<m0m1_stack=stack64#6
# asm 2: ldr >t221=r8,<m0m1_stack=[sp,#40]
ldr r8,[sp,#40]

# qhasm: v8 += (v13 >>> 24)
# asm 1: add >v8=int32#11,<v8=int32#11,<v13=int32#7,ROR #24
# asm 2: add >v8=r10,<v8=r10,<v13=r6,ROR #24
add r10,r10,r6,ROR #24

# qhasm: c10 = c10_stack
# asm 1: ldr >c10=int32#14,<c10_stack=stack32#21
# asm 2: ldr >c10=r14,<c10_stack=[sp,#208]
ldr r14,[sp,#208]

# qhasm: v7 ^= (v8 >>> 31)
# asm 1: eor >v7=int32#12,<v7=int32#13,<v8=int32#11,ROR #31
# asm 2: eor >v7=r11,<v7=r12,<v8=r10,ROR #31
eor r11,r12,r10,ROR #31

# qhasm: t221 ^= c4
# asm 1: eor >t221=int32#4,<t221=int32#9,<c4=int32#4
# asm 2: eor >t221=r3,<t221=r8,<c4=r3
eor r3,r8,r3

# qhasm: v2 += (v7 >>> 13)
# asm 1: add >v2=int32#1,<v2=int32#1,<v7=int32#12,ROR #13
# asm 2: add >v2=r0,<v2=r0,<v7=r11,ROR #13
add r0,r0,r11,ROR #13

# qhasm: v2 += (t221 >>> 0)
# asm 1: add >v2=int32#9,<v2=int32#1,<t221=int32#4,ROR #0
# asm 2: add >v2=r8,<v2=r0,<t221=r3,ROR #0
add r8,r0,r3,ROR #0

# qhasm: t222 = mem32[&m4m5_stack+4]
# asm 1: ldr >t222=int32#1,<m4m5_stack=stack64#8
# asm 2: ldr >t222=r0,<m4m5_stack=[sp,#60]
ldr r0,[sp,#60]

# qhasm: v13 ^= (v2 >>> 8)
# asm 1: eor >v13=int32#4,<v13=int32#7,<v2=int32#9,ROR #8
# asm 2: eor >v13=r3,<v13=r6,<v2=r8,ROR #8
eor r3,r6,r8,ROR #8

# qhasm: mem32[&v9v13_stack+4] = v13
# asm 1: str <v13=int32#4,<v9v13_stack=stack64#14
# asm 2: str <v13=r3,<v9v13_stack=[sp,#108]
str r3,[sp,#108]

# qhasm: v8 += (v13 >>> 0)
# asm 1: add >v8=int32#4,<v8=int32#11,<v13=int32#4,ROR #0
# asm 2: add >v8=r3,<v8=r10,<v13=r3,ROR #0
add r3,r10,r3,ROR #0

# qhasm: mem32[&v8v12_stack] = v8
# asm 1: str <v8=int32#4,<v8v12_stack=stack64#3
# asm 2: str <v8=r3,<v8v12_stack=[sp,#16]
str r3,[sp,#16]

# qhasm: v7 ^= (v8 >>> 19)
# asm 1: eor >v7=int32#4,<v7=int32#12,<v8=int32#4,ROR #19
# asm 2: eor >v7=r3,<v7=r11,<v8=r3,ROR #19
eor r3,r11,r3,ROR #19

# qhasm: assign r10 r11 to v11 v12 = v11v12_stack
# asm 1: ldrd >v11=int32#11,<v11v12_stack=stack64#2
# asm 2: ldrd >v11=r10,<v11v12_stack=[sp,#8]
ldrd r10,[sp,#8]

# qhasm: t222 ^= c10
# asm 1: eor >t222=int32#1,<t222=int32#1,<c10=int32#14
# asm 2: eor >t222=r0,<t222=r0,<c10=r14
eor r0,r0,r14

# qhasm: v1 += (v6 >>> 1)
# asm 1: add >v1=int32#3,<v1=int32#3,<v6=int32#2,ROR #1
# asm 2: add >v1=r2,<v1=r2,<v6=r1,ROR #1
add r2,r2,r1,ROR #1

# qhasm: v1 += (t222 >>> 0)
# asm 1: add >v1=int32#1,<v1=int32#3,<t222=int32#1,ROR #0
# asm 2: add >v1=r0,<v1=r2,<t222=r0,ROR #0
add r0,r2,r0,ROR #0

# qhasm: c5 = c5_stack
# asm 1: ldr >c5=int32#3,<c5_stack=stack32#16
# asm 2: ldr >c5=r2,<c5_stack=[sp,#188]
ldr r2,[sp,#188]

# qhasm: v12 ^= (v1 >>> 24)
# asm 1: eor >v12=int32#7,<v12=int32#12,<v1=int32#1,ROR #24
# asm 2: eor >v12=r6,<v12=r11,<v1=r0,ROR #24
eor r6,r11,r0,ROR #24

# qhasm: t223 = mem32[&m10m11_stack]
# asm 1: ldr >t223=int32#12,<m10m11_stack=stack64#11
# asm 2: ldr >t223=r11,<m10m11_stack=[sp,#80]
ldr r11,[sp,#80]

# qhasm: v11 += (v12 >>> 24)
# asm 1: add >v11=int32#11,<v11=int32#11,<v12=int32#7,ROR #24
# asm 2: add >v11=r10,<v11=r10,<v12=r6,ROR #24
add r10,r10,r6,ROR #24

# qhasm: v4 >>>= 20
# asm 1: mov >v4=int32#5,<v4=int32#5,ROR #20
# asm 2: mov >v4=r4,<v4=r4,ROR #20
mov r4,r4,ROR #20

# qhasm: v6 ^= (v11 >>> 31)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#11,ROR #31
# asm 2: eor >v6=r1,<v6=r1,<v11=r10,ROR #31
eor r1,r1,r10,ROR #31

# qhasm: t223 ^= c5
# asm 1: eor >t223=int32#3,<t223=int32#12,<c5=int32#3
# asm 2: eor >t223=r2,<t223=r11,<c5=r2
eor r2,r11,r2

# qhasm: v1 += (v6 >>> 13)
# asm 1: add >v1=int32#1,<v1=int32#1,<v6=int32#2,ROR #13
# asm 2: add >v1=r0,<v1=r0,<v6=r1,ROR #13
add r0,r0,r1,ROR #13

# qhasm: v1 += (t223 >>> 0)
# asm 1: add >v1=int32#12,<v1=int32#1,<t223=int32#3,ROR #0
# asm 2: add >v1=r11,<v1=r0,<t223=r2,ROR #0
add r11,r0,r2,ROR #0

# qhasm: v12 ^= (v1 >>> 8)
# asm 1: eor >v12=int32#1,<v12=int32#7,<v1=int32#12,ROR #8
# asm 2: eor >v12=r0,<v12=r6,<v1=r11,ROR #8
eor r0,r6,r11,ROR #8

# qhasm: mem32[&v8v12_stack+4] = v12
# asm 1: str <v12=int32#1,<v8v12_stack=stack64#3
# asm 2: str <v12=r0,<v8v12_stack=[sp,#20]
str r0,[sp,#20]

# qhasm: v11 += (v12 >>> 0)
# asm 1: add >v11=int32#1,<v11=int32#11,<v12=int32#1,ROR #0
# asm 2: add >v11=r0,<v11=r10,<v12=r0,ROR #0
add r0,r10,r0,ROR #0

# qhasm: mem32[&v11v15_stack] = v11
# asm 1: str <v11=int32#1,<v11v15_stack=stack64#16
# asm 2: str <v11=r0,<v11v15_stack=[sp,#120]
str r0,[sp,#120]

# qhasm: v6 ^= (v11 >>> 19)
# asm 1: eor >v6=int32#2,<v6=int32#2,<v11=int32#1,ROR #19
# asm 2: eor >v6=r1,<v6=r1,<v11=r0,ROR #19
eor r1,r1,r0,ROR #19

# qhasm: input_0 = input_0_stack
# asm 1: ldr >input_0=int32#1,<input_0_stack=stack32#28
# asm 2: ldr >input_0=r0,<input_0_stack=[sp,#236]
ldr r0,[sp,#236]

# qhasm: v5 >>>= 20
# asm 1: mov >v5=int32#8,<v5=int32#8,ROR #20
# asm 2: mov >v5=r7,<v5=r7,ROR #20
mov r7,r7,ROR #20

# qhasm: v6 >>>= 20
# asm 1: mov >v6=int32#2,<v6=int32#2,ROR #20
# asm 2: mov >v6=r1,<v6=r1,ROR #20
mov r1,r1,ROR #20

# qhasm: v7 >>>= 20
# asm 1: mov >v7=int32#11,<v7=int32#4,ROR #20
# asm 2: mov >v7=r10,<v7=r3,ROR #20
mov r10,r3,ROR #20

# qhasm: h0 = mem32[input_0 + 0]
# asm 1: ldr >h0=int32#3,[<input_0=int32#1,#0]
# asm 2: ldr >h0=r2,[<input_0=r0,#0]
ldr r2,[r0,#0]

# qhasm: s0 = mem32[input_0 + 32]
# asm 1: ldr >s0=int32#4,[<input_0=int32#1,#32]
# asm 2: ldr >s0=r3,[<input_0=r0,#32]
ldr r3,[r0,#32]

# qhasm: v8 = mem32[&v8v12_stack]
# asm 1: ldr >v8=int32#7,<v8v12_stack=stack64#3
# asm 2: ldr >v8=r6,<v8v12_stack=[sp,#16]
ldr r6,[sp,#16]

# qhasm: v0 ^= h0
# asm 1: eor >v0=int32#3,<v0=int32#6,<h0=int32#3
# asm 2: eor >v0=r2,<v0=r5,<h0=r2
eor r2,r5,r2

# qhasm: v0 ^= s0
# asm 1: eor >v0=int32#3,<v0=int32#3,<s0=int32#4
# asm 2: eor >v0=r2,<v0=r2,<s0=r3
eor r2,r2,r3

# qhasm: v0 ^= v8
# asm 1: eor >v0=int32#3,<v0=int32#3,<v8=int32#7
# asm 2: eor >v0=r2,<v0=r2,<v8=r6
eor r2,r2,r6

# qhasm: h4 = mem32[input_0 + 16]
# asm 1: ldr >h4=int32#6,[<input_0=int32#1,#16]
# asm 2: ldr >h4=r5,[<input_0=r0,#16]
ldr r5,[r0,#16]

# qhasm: v12 = mem32[&v8v12_stack+4]
# asm 1: ldr >v12=int32#7,<v8v12_stack=stack64#3
# asm 2: ldr >v12=r6,<v8v12_stack=[sp,#20]
ldr r6,[sp,#20]

# qhasm: v4 ^= s0
# asm 1: eor >v4=int32#4,<v4=int32#5,<s0=int32#4
# asm 2: eor >v4=r3,<v4=r4,<s0=r3
eor r3,r4,r3

# qhasm: v4 ^= h4
# asm 1: eor >v4=int32#4,<v4=int32#4,<h4=int32#6
# asm 2: eor >v4=r3,<v4=r3,<h4=r5
eor r3,r3,r5

# qhasm: v4 ^= v12
# asm 1: eor >v4=int32#7,<v4=int32#4,<v12=int32#7
# asm 2: eor >v4=r6,<v4=r3,<v12=r6
eor r6,r3,r6

# qhasm: h1 = mem32[input_0 + 4]
# asm 1: ldr >h1=int32#4,[<input_0=int32#1,#4]
# asm 2: ldr >h1=r3,[<input_0=r0,#4]
ldr r3,[r0,#4]

# qhasm: s1 = mem32[input_0 + 36]
# asm 1: ldr >s1=int32#5,[<input_0=int32#1,#36]
# asm 2: ldr >s1=r4,[<input_0=r0,#36]
ldr r4,[r0,#36]

# qhasm: v9 = mem32[&v9v13_stack]
# asm 1: ldr >v9=int32#6,<v9v13_stack=stack64#14
# asm 2: ldr >v9=r5,<v9v13_stack=[sp,#104]
ldr r5,[sp,#104]

# qhasm: v1 ^= h1
# asm 1: eor >v1=int32#4,<v1=int32#12,<h1=int32#4
# asm 2: eor >v1=r3,<v1=r11,<h1=r3
eor r3,r11,r3

# qhasm: v1 ^= s1
# asm 1: eor >v1=int32#4,<v1=int32#4,<s1=int32#5
# asm 2: eor >v1=r3,<v1=r3,<s1=r4
eor r3,r3,r4

# qhasm: v1 ^= v9
# asm 1: eor >v1=int32#4,<v1=int32#4,<v9=int32#6
# asm 2: eor >v1=r3,<v1=r3,<v9=r5
eor r3,r3,r5

# qhasm: h5 = mem32[input_0 + 20]
# asm 1: ldr >h5=int32#6,[<input_0=int32#1,#20]
# asm 2: ldr >h5=r5,[<input_0=r0,#20]
ldr r5,[r0,#20]

# qhasm: v13 = mem32[&v9v13_stack+4]
# asm 1: ldr >v13=int32#12,<v9v13_stack=stack64#14
# asm 2: ldr >v13=r11,<v9v13_stack=[sp,#108]
ldr r11,[sp,#108]

# qhasm: v5 ^= s1
# asm 1: eor >v5=int32#5,<v5=int32#8,<s1=int32#5
# asm 2: eor >v5=r4,<v5=r7,<s1=r4
eor r4,r7,r4

# qhasm: v5 ^= h5
# asm 1: eor >v5=int32#5,<v5=int32#5,<h5=int32#6
# asm 2: eor >v5=r4,<v5=r4,<h5=r5
eor r4,r4,r5

# qhasm: v5 ^= v13
# asm 1: eor >v5=int32#8,<v5=int32#5,<v13=int32#12
# asm 2: eor >v5=r7,<v5=r4,<v13=r11
eor r7,r4,r11

# qhasm: h2 = mem32[input_0 + 8]
# asm 1: ldr >h2=int32#5,[<input_0=int32#1,#8]
# asm 2: ldr >h2=r4,[<input_0=r0,#8]
ldr r4,[r0,#8]

# qhasm: s2 = mem32[input_0 + 40]
# asm 1: ldr >s2=int32#6,[<input_0=int32#1,#40]
# asm 2: ldr >s2=r5,[<input_0=r0,#40]
ldr r5,[r0,#40]

# qhasm: v10 = mem32[&v10v14_stack]
# asm 1: ldr >v10=int32#12,<v10v14_stack=stack64#15
# asm 2: ldr >v10=r11,<v10v14_stack=[sp,#112]
ldr r11,[sp,#112]

# qhasm: v2 ^= h2
# asm 1: eor >v2=int32#5,<v2=int32#9,<h2=int32#5
# asm 2: eor >v2=r4,<v2=r8,<h2=r4
eor r4,r8,r4

# qhasm: v2 ^= s2
# asm 1: eor >v2=int32#5,<v2=int32#5,<s2=int32#6
# asm 2: eor >v2=r4,<v2=r4,<s2=r5
eor r4,r4,r5

# qhasm: v2 ^= v10
# asm 1: eor >v2=int32#5,<v2=int32#5,<v10=int32#12
# asm 2: eor >v2=r4,<v2=r4,<v10=r11
eor r4,r4,r11

# qhasm: h6 = mem32[input_0 + 24]
# asm 1: ldr >h6=int32#9,[<input_0=int32#1,#24]
# asm 2: ldr >h6=r8,[<input_0=r0,#24]
ldr r8,[r0,#24]

# qhasm: v14 = mem32[&v10v14_stack+4]
# asm 1: ldr >v14=int32#12,<v10v14_stack=stack64#15
# asm 2: ldr >v14=r11,<v10v14_stack=[sp,#116]
ldr r11,[sp,#116]

# qhasm: v6 ^= s2
# asm 1: eor >v6=int32#2,<v6=int32#2,<s2=int32#6
# asm 2: eor >v6=r1,<v6=r1,<s2=r5
eor r1,r1,r5

# qhasm: v6 ^= h6
# asm 1: eor >v6=int32#2,<v6=int32#2,<h6=int32#9
# asm 2: eor >v6=r1,<v6=r1,<h6=r8
eor r1,r1,r8

# qhasm: v6 ^= v14
# asm 1: eor >v6=int32#9,<v6=int32#2,<v14=int32#12
# asm 2: eor >v6=r8,<v6=r1,<v14=r11
eor r8,r1,r11

# qhasm: h3 = mem32[input_0 + 12]
# asm 1: ldr >h3=int32#2,[<input_0=int32#1,#12]
# asm 2: ldr >h3=r1,[<input_0=r0,#12]
ldr r1,[r0,#12]

# qhasm: s3 = mem32[input_0 + 44]
# asm 1: ldr >s3=int32#12,[<input_0=int32#1,#44]
# asm 2: ldr >s3=r11,[<input_0=r0,#44]
ldr r11,[r0,#44]

# qhasm: v11 = mem32[&v11v15_stack]
# asm 1: ldr >v11=int32#6,<v11v15_stack=stack64#16
# asm 2: ldr >v11=r5,<v11v15_stack=[sp,#120]
ldr r5,[sp,#120]

# qhasm: v3 ^= h3
# asm 1: eor >v3=int32#2,<v3=int32#10,<h3=int32#2
# asm 2: eor >v3=r1,<v3=r9,<h3=r1
eor r1,r9,r1

# qhasm: v3 ^= s3
# asm 1: eor >v3=int32#2,<v3=int32#2,<s3=int32#12
# asm 2: eor >v3=r1,<v3=r1,<s3=r11
eor r1,r1,r11

# qhasm: v3 ^= v11
# asm 1: eor >v3=int32#6,<v3=int32#2,<v11=int32#6
# asm 2: eor >v3=r5,<v3=r1,<v11=r5
eor r5,r1,r5

# qhasm: h7 = mem32[input_0 + 28]
# asm 1: ldr >h7=int32#2,[<input_0=int32#1,#28]
# asm 2: ldr >h7=r1,[<input_0=r0,#28]
ldr r1,[r0,#28]

# qhasm: v15 = mem32[&v11v15_stack+4]
# asm 1: ldr >v15=int32#10,<v11v15_stack=stack64#16
# asm 2: ldr >v15=r9,<v11v15_stack=[sp,#124]
ldr r9,[sp,#124]

# qhasm: v7 ^= s3
# asm 1: eor >v7=int32#11,<v7=int32#11,<s3=int32#12
# asm 2: eor >v7=r10,<v7=r10,<s3=r11
eor r10,r10,r11

# qhasm: v7 ^= h7
# asm 1: eor >v7=int32#2,<v7=int32#11,<h7=int32#2
# asm 2: eor >v7=r1,<v7=r10,<h7=r1
eor r1,r10,r1

# qhasm: v7 ^= v15
# asm 1: eor >v7=int32#13,<v7=int32#2,<v15=int32#10
# asm 2: eor >v7=r12,<v7=r1,<v15=r9
eor r12,r1,r9

# qhasm: mem32[input_0 + 0] = v0
# asm 1: str <v0=int32#3,[<input_0=int32#1,#0]
# asm 2: str <v0=r2,[<input_0=r0,#0]
str r2,[r0,#0]

# qhasm: mem32[input_0 + 4] = v1
# asm 1: str <v1=int32#4,[<input_0=int32#1,#4]
# asm 2: str <v1=r3,[<input_0=r0,#4]
str r3,[r0,#4]

# qhasm: mem32[input_0 + 8] = v2
# asm 1: str <v2=int32#5,[<input_0=int32#1,#8]
# asm 2: str <v2=r4,[<input_0=r0,#8]
str r4,[r0,#8]

# qhasm: mem32[input_0 + 12] = v3
# asm 1: str <v3=int32#6,[<input_0=int32#1,#12]
# asm 2: str <v3=r5,[<input_0=r0,#12]
str r5,[r0,#12]

# qhasm: input_1 = input_1_stack
# asm 1: ldr >input_1=int32#2,<input_1_stack=stack32#27
# asm 2: ldr >input_1=r1,<input_1_stack=[sp,#232]
ldr r1,[sp,#232]

# qhasm: input_2 = input_2_stack
# asm 1: ldr >input_2=int32#10,<input_2_stack=stack32#1
# asm 2: ldr >input_2=r9,<input_2_stack=[sp,#128]
ldr r9,[sp,#128]

# qhasm: mem32[input_0 + 16] = v4
# asm 1: str <v4=int32#7,[<input_0=int32#1,#16]
# asm 2: str <v4=r6,[<input_0=r0,#16]
str r6,[r0,#16]

# qhasm: mem32[input_0 + 20] = v5
# asm 1: str <v5=int32#8,[<input_0=int32#1,#20]
# asm 2: str <v5=r7,[<input_0=r0,#20]
str r7,[r0,#20]

# qhasm: mem32[input_0 + 24] = v6
# asm 1: str <v6=int32#9,[<input_0=int32#1,#24]
# asm 2: str <v6=r8,[<input_0=r0,#24]
str r8,[r0,#24]

# qhasm: mem32[input_0 + 28] = v7
# asm 1: str <v7=int32#13,[<input_0=int32#1,#28]
# asm 2: str <v7=r12,[<input_0=r0,#28]
str r12,[r0,#28]

# qhasm: input_1 += 64
# asm 1: add >input_1=int32#2,<input_1=int32#2,#64
# asm 2: add >input_1=r1,<input_1=r1,#64
add r1,r1,#64

# qhasm: unsigned>? input_2 -= 1
# asm 1: subs >input_2=int32#10,<input_2=int32#10,#1
# asm 2: subs >input_2=r9,<input_2=r9,#1
subs r9,r9,#1

# qhasm: input_2_stack = input_2
# asm 1: str <input_2=int32#10,>input_2_stack=stack32#1
# asm 2: str <input_2=r9,>input_2_stack=[sp,#128]
str r9,[sp,#128]

# qhasm: goto mainloop if unsigned>
bhi ._mainloop

# qhasm: caller_r4 = caller_r4_stack
# asm 1: ldr >caller_r4=int32#5,<caller_r4_stack=stack32#2
# asm 2: ldr >caller_r4=r4,<caller_r4_stack=[sp,#132]
ldr r4,[sp,#132]

# qhasm: caller_r5 = caller_r5_stack
# asm 1: ldr >caller_r5=int32#6,<caller_r5_stack=stack32#3
# asm 2: ldr >caller_r5=r5,<caller_r5_stack=[sp,#136]
ldr r5,[sp,#136]

# qhasm: caller_r6 = caller_r6_stack
# asm 1: ldr >caller_r6=int32#7,<caller_r6_stack=stack32#4
# asm 2: ldr >caller_r6=r6,<caller_r6_stack=[sp,#140]
ldr r6,[sp,#140]

# qhasm: caller_r7 = caller_r7_stack
# asm 1: ldr >caller_r7=int32#8,<caller_r7_stack=stack32#5
# asm 2: ldr >caller_r7=r7,<caller_r7_stack=[sp,#144]
ldr r7,[sp,#144]

# qhasm: caller_r8 = caller_r8_stack
# asm 1: ldr >caller_r8=int32#9,<caller_r8_stack=stack32#6
# asm 2: ldr >caller_r8=r8,<caller_r8_stack=[sp,#148]
ldr r8,[sp,#148]

# qhasm: caller_r9 = caller_r9_stack
# asm 1: ldr >caller_r9=int32#10,<caller_r9_stack=stack32#7
# asm 2: ldr >caller_r9=r9,<caller_r9_stack=[sp,#152]
ldr r9,[sp,#152]

# qhasm: caller_r10 = caller_r10_stack
# asm 1: ldr >caller_r10=int32#11,<caller_r10_stack=stack32#8
# asm 2: ldr >caller_r10=r10,<caller_r10_stack=[sp,#156]
ldr r10,[sp,#156]

# qhasm: caller_r11 = caller_r11_stack
# asm 1: ldr >caller_r11=int32#12,<caller_r11_stack=stack32#9
# asm 2: ldr >caller_r11=r11,<caller_r11_stack=[sp,#160]
ldr r11,[sp,#160]

# qhasm: caller_r14 = caller_r14_stack
# asm 1: ldr >caller_r14=int32#14,<caller_r14_stack=stack32#10
# asm 2: ldr >caller_r14=r14,<caller_r14_stack=[sp,#164]
ldr r14,[sp,#164]

# qhasm: end:
._end:

# qhasm: return
add sp,sp,#256
bx lr
