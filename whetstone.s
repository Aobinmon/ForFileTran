	.arch armv8-a
	.file	"whetstone.c"
	.text
	.global	T
	.bss
	.align	3
	.type	T, %object
	.size	T, 8
T:
	.zero	8
	.global	T1
	.align	3
	.type	T1, %object
	.size	T1, 8
T1:
	.zero	8
	.global	T2
	.align	3
	.type	T2, %object
	.size	T2, 8
T2:
	.zero	8
	.global	E1
	.align	3
	.type	E1, %object
	.size	E1, 40
E1:
	.zero	40
	.global	J
	.align	2
	.type	J, %object
	.size	J, 4
J:
	.zero	4
	.global	K
	.align	2
	.type	K, %object
	.size	K, 4
K:
	.zero	4
	.global	L
	.align	2
	.type	L, %object
	.size	L, 4
L:
	.zero	4
	.section	.rodata
	.align	3
.LC0:
	.string	"-c"
	.align	3
.LC1:
	.string	"usage: whetdc [-c] [loops]\n"
	.align	3
.LC2:
	.string	"Insufficient duration- Increase the LOOP count"
	.align	3
.LC3:
	.string	"Loops: %ld, Iterations: %d, Duration: %ld sec.\n"
	.align	3
.LC4:
	.string	"C Converted Double Precision Whetstones: %.1f MIPS\n"
	.align	3
.LC5:
	.string	"C Converted Double Precision Whetstones: %.1f KIPS\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -256]!
	.cfi_def_cfa_offset 256
	.cfi_offset 29, -256
	.cfi_offset 30, -248
	mov	x29, sp
	stp	d8, d9, [sp, 16]
	.cfi_offset 72, -240
	.cfi_offset 73, -232
	str	w0, [sp, 44]
	str	x1, [sp, 32]
	mov	x0, 1000
	str	x0, [sp, 184]
	str	wzr, [sp, 180]
	mov	w0, 1
	str	w0, [sp, 196]
	b	.L2
.L8:
	ldrsw	x0, [sp, 196]
	lsl	x0, x0, 3
	ldr	x1, [sp, 32]
	add	x0, x1, x0
	ldr	x3, [x0]
	mov	x2, 2
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x3
	bl	strncmp
	cmp	w0, 0
	beq	.L3
	ldrsw	x0, [sp, 196]
	lsl	x0, x0, 3
	ldr	x1, [sp, 32]
	add	x0, x1, x0
	ldr	x0, [x0]
	ldrb	w0, [x0]
	cmp	w0, 99
	bne	.L4
.L3:
	mov	w0, 1
	str	w0, [sp, 180]
	b	.L5
.L4:
	ldrsw	x0, [sp, 196]
	lsl	x0, x0, 3
	ldr	x1, [sp, 32]
	add	x0, x1, x0
	ldr	x0, [x0]
	bl	atol
	cmp	x0, 0
	ble	.L6
	ldrsw	x0, [sp, 196]
	lsl	x0, x0, 3
	ldr	x1, [sp, 32]
	add	x0, x1, x0
	ldr	x0, [x0]
	bl	atol
	str	x0, [sp, 184]
	b	.L5
.L6:
	adrp	x0, :got:stderr
	ldr	x0, [x0, #:got_lo12:stderr]
	ldr	x0, [x0]
	mov	x3, x0
	mov	x2, 27
	mov	x1, 1
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	fwrite
	mov	w0, 1
	b	.L43
.L5:
	ldr	w0, [sp, 196]
	add	w0, w0, 1
	str	w0, [sp, 196]
.L2:
	ldr	w1, [sp, 196]
	ldr	w0, [sp, 44]
	cmp	w1, w0
	blt	.L8
	nop
.L9:
	mov	x0, 0
	bl	time
	str	x0, [sp, 168]
	adrp	x0, T
	add	x0, x0, :lo12:T
	adrp	x1, .LC6
	ldr	d0, [x1, #:lo12:.LC6]
	str	d0, [x0]
	adrp	x0, T1
	add	x0, x0, :lo12:T1
	adrp	x1, .LC7
	ldr	d0, [x1, #:lo12:.LC7]
	str	d0, [x0]
	adrp	x0, T2
	add	x0, x0, :lo12:T2
	fmov	d0, 2.0e+0
	str	d0, [x0]
	ldr	x0, [sp, 184]
	str	x0, [sp, 160]
	mov	w0, 1
	str	w0, [sp, 196]
	mov	w0, 1
	str	w0, [sp, 192]
.L10:
	str	xzr, [sp, 152]
	ldr	x1, [sp, 160]
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x0, x0, 2
	str	x0, [sp, 144]
	ldr	x1, [sp, 160]
	mov	x0, x1
	lsl	x0, x0, 3
	sub	x0, x0, x1
	lsl	x0, x0, 1
	str	x0, [sp, 136]
	ldr	x1, [sp, 160]
	mov	x0, 345
	mul	x0, x1, x0
	str	x0, [sp, 128]
	ldr	x1, [sp, 160]
	mov	x0, x1
	lsl	x0, x0, 3
	sub	x0, x0, x1
	lsl	x1, x0, 4
	sub	x1, x1, x0
	lsl	x0, x1, 1
	mov	x1, x0
	str	x1, [sp, 120]
	ldr	x0, [sp, 160]
	lsl	x0, x0, 5
	str	x0, [sp, 112]
	ldr	x1, [sp, 160]
	mov	x0, 899
	mul	x0, x1, x0
	str	x0, [sp, 104]
	ldr	x1, [sp, 160]
	mov	x0, 616
	mul	x0, x1, x0
	str	x0, [sp, 96]
	str	xzr, [sp, 88]
	ldr	x1, [sp, 160]
	mov	x0, x1
	lsl	x0, x0, 1
	add	x0, x0, x1
	lsl	x1, x0, 5
	sub	x0, x1, x0
	str	x0, [sp, 80]
	fmov	d0, 1.0e+0
	str	d0, [sp, 240]
	fmov	d0, -1.0e+0
	str	d0, [sp, 232]
	fmov	d0, -1.0e+0
	str	d0, [sp, 224]
	fmov	d0, -1.0e+0
	str	d0, [sp, 216]
	mov	x0, 1
	str	x0, [sp, 248]
	b	.L11
.L12:
	ldr	d1, [sp, 240]
	ldr	d0, [sp, 232]
	fadd	d1, d1, d0
	ldr	d0, [sp, 224]
	fadd	d1, d1, d0
	ldr	d0, [sp, 216]
	fsub	d1, d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	fmul	d0, d1, d0
	str	d0, [sp, 240]
	ldr	d1, [sp, 240]
	ldr	d0, [sp, 232]
	fadd	d1, d1, d0
	ldr	d0, [sp, 224]
	fsub	d1, d1, d0
	ldr	d0, [sp, 216]
	fadd	d1, d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	fmul	d0, d1, d0
	str	d0, [sp, 232]
	ldr	d1, [sp, 240]
	ldr	d0, [sp, 232]
	fsub	d1, d1, d0
	ldr	d0, [sp, 224]
	fadd	d1, d1, d0
	ldr	d0, [sp, 216]
	fadd	d1, d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	fmul	d0, d1, d0
	str	d0, [sp, 224]
	ldr	d1, [sp, 232]
	ldr	d0, [sp, 240]
	fsub	d1, d1, d0
	ldr	d0, [sp, 224]
	fadd	d1, d1, d0
	ldr	d0, [sp, 216]
	fadd	d1, d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	fmul	d0, d1, d0
	str	d0, [sp, 216]
	ldr	x0, [sp, 248]
	add	x0, x0, 1
	str	x0, [sp, 248]
.L11:
	ldr	x1, [sp, 248]
	ldr	x0, [sp, 152]
	cmp	x1, x0
	ble	.L12
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	fmov	d0, 1.0e+0
	str	d0, [x0, 8]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	fmov	d0, -1.0e+0
	str	d0, [x0, 16]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	fmov	d0, -1.0e+0
	str	d0, [x0, 24]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	fmov	d0, -1.0e+0
	str	d0, [x0, 32]
	mov	x0, 1
	str	x0, [sp, 248]
	b	.L13
.L14:
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d1, [x0, 8]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d0, [x0, 16]
	fadd	d1, d1, d0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d0, [x0, 24]
	fadd	d1, d1, d0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d0, [x0, 32]
	fsub	d1, d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	fmul	d0, d1, d0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	str	d0, [x0, 8]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d1, [x0, 8]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d0, [x0, 16]
	fadd	d1, d1, d0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d0, [x0, 24]
	fsub	d1, d1, d0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d0, [x0, 32]
	fadd	d1, d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	fmul	d0, d1, d0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	str	d0, [x0, 16]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d1, [x0, 8]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d0, [x0, 16]
	fsub	d1, d1, d0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d0, [x0, 24]
	fadd	d1, d1, d0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d0, [x0, 32]
	fadd	d1, d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	fmul	d0, d1, d0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	str	d0, [x0, 24]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d1, [x0, 16]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d0, [x0, 8]
	fsub	d1, d1, d0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d0, [x0, 24]
	fadd	d1, d1, d0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	ldr	d0, [x0, 32]
	fadd	d1, d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	fmul	d0, d1, d0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	str	d0, [x0, 32]
	ldr	x0, [sp, 248]
	add	x0, x0, 1
	str	x0, [sp, 248]
.L13:
	ldr	x1, [sp, 248]
	ldr	x0, [sp, 144]
	cmp	x1, x0
	ble	.L14
	mov	x0, 1
	str	x0, [sp, 248]
	b	.L15
.L16:
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	bl	PA
	ldr	x0, [sp, 248]
	add	x0, x0, 1
	str	x0, [sp, 248]
.L15:
	ldr	x1, [sp, 248]
	ldr	x0, [sp, 136]
	cmp	x1, x0
	ble	.L16
	adrp	x0, J
	add	x0, x0, :lo12:J
	mov	w1, 1
	str	w1, [x0]
	mov	x0, 1
	str	x0, [sp, 248]
	b	.L17
.L24:
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L18
	adrp	x0, J
	add	x0, x0, :lo12:J
	mov	w1, 2
	str	w1, [x0]
	b	.L19
.L18:
	adrp	x0, J
	add	x0, x0, :lo12:J
	mov	w1, 3
	str	w1, [x0]
.L19:
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w0, [x0]
	cmp	w0, 2
	ble	.L20
	adrp	x0, J
	add	x0, x0, :lo12:J
	str	wzr, [x0]
	b	.L21
.L20:
	adrp	x0, J
	add	x0, x0, :lo12:J
	mov	w1, 1
	str	w1, [x0]
.L21:
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w0, [x0]
	cmp	w0, 0
	bgt	.L22
	adrp	x0, J
	add	x0, x0, :lo12:J
	mov	w1, 1
	str	w1, [x0]
	b	.L23
.L22:
	adrp	x0, J
	add	x0, x0, :lo12:J
	str	wzr, [x0]
.L23:
	ldr	x0, [sp, 248]
	add	x0, x0, 1
	str	x0, [sp, 248]
.L17:
	ldr	x1, [sp, 248]
	ldr	x0, [sp, 128]
	cmp	x1, x0
	ble	.L24
	adrp	x0, J
	add	x0, x0, :lo12:J
	mov	w1, 1
	str	w1, [x0]
	adrp	x0, K
	add	x0, x0, :lo12:K
	mov	w1, 2
	str	w1, [x0]
	adrp	x0, L
	add	x0, x0, :lo12:L
	mov	w1, 3
	str	w1, [x0]
	mov	x0, 1
	str	x0, [sp, 248]
	b	.L25
.L26:
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w1, [x0]
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w0, [x0]
	sub	w1, w1, w0
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w0, [x0]
	mul	w1, w1, w0
	adrp	x0, L
	add	x0, x0, :lo12:L
	ldr	w2, [x0]
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w0, [x0]
	sub	w0, w2, w0
	mul	w1, w1, w0
	adrp	x0, J
	add	x0, x0, :lo12:J
	str	w1, [x0]
	adrp	x0, L
	add	x0, x0, :lo12:L
	ldr	w1, [x0]
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w0, [x0]
	mul	w1, w1, w0
	adrp	x0, L
	add	x0, x0, :lo12:L
	ldr	w2, [x0]
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w0, [x0]
	sub	w2, w2, w0
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w0, [x0]
	mul	w0, w2, w0
	sub	w1, w1, w0
	adrp	x0, K
	add	x0, x0, :lo12:K
	str	w1, [x0]
	adrp	x0, L
	add	x0, x0, :lo12:L
	ldr	w1, [x0]
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w0, [x0]
	sub	w1, w1, w0
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w2, [x0]
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w0, [x0]
	add	w0, w2, w0
	mul	w1, w1, w0
	adrp	x0, L
	add	x0, x0, :lo12:L
	str	w1, [x0]
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w1, [x0]
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w0, [x0]
	add	w1, w1, w0
	adrp	x0, L
	add	x0, x0, :lo12:L
	ldr	w0, [x0]
	add	w0, w1, w0
	adrp	x1, L
	add	x1, x1, :lo12:L
	ldr	w1, [x1]
	sub	w1, w1, #1
	scvtf	d0, w0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	sxtw	x1, w1
	str	d0, [x0, x1, lsl 3]
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w1, [x0]
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w0, [x0]
	mul	w1, w1, w0
	adrp	x0, L
	add	x0, x0, :lo12:L
	ldr	w0, [x0]
	mul	w0, w1, w0
	adrp	x1, K
	add	x1, x1, :lo12:K
	ldr	w1, [x1]
	sub	w1, w1, #1
	scvtf	d0, w0
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	sxtw	x1, w1
	str	d0, [x0, x1, lsl 3]
	ldr	x0, [sp, 248]
	add	x0, x0, 1
	str	x0, [sp, 248]
.L25:
	ldr	x1, [sp, 248]
	ldr	x0, [sp, 120]
	cmp	x1, x0
	ble	.L26
	fmov	d0, 5.0e-1
	str	d0, [sp, 208]
	fmov	d0, 5.0e-1
	str	d0, [sp, 200]
	mov	x0, 1
	str	x0, [sp, 248]
	b	.L27
.L28:
	ldr	d0, [sp, 208]
	bl	sin
	fmov	d1, d0
	adrp	x0, T2
	add	x0, x0, :lo12:T2
	ldr	d0, [x0]
	fmul	d8, d1, d0
	ldr	d0, [sp, 208]
	bl	cos
	fmul	d8, d8, d0
	ldr	d1, [sp, 208]
	ldr	d0, [sp, 200]
	fadd	d0, d1, d0
	bl	cos
	fmov	d9, d0
	ldr	d1, [sp, 208]
	ldr	d0, [sp, 200]
	fsub	d0, d1, d0
	bl	cos
	fadd	d1, d9, d0
	fmov	d0, 1.0e+0
	fsub	d0, d1, d0
	fdiv	d0, d8, d0
	bl	atan
	fmov	d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	fmul	d0, d1, d0
	str	d0, [sp, 208]
	ldr	d0, [sp, 200]
	bl	sin
	fmov	d1, d0
	adrp	x0, T2
	add	x0, x0, :lo12:T2
	ldr	d0, [x0]
	fmul	d8, d1, d0
	ldr	d0, [sp, 200]
	bl	cos
	fmul	d8, d8, d0
	ldr	d1, [sp, 208]
	ldr	d0, [sp, 200]
	fadd	d0, d1, d0
	bl	cos
	fmov	d9, d0
	ldr	d1, [sp, 208]
	ldr	d0, [sp, 200]
	fsub	d0, d1, d0
	bl	cos
	fadd	d1, d9, d0
	fmov	d0, 1.0e+0
	fsub	d0, d1, d0
	fdiv	d0, d8, d0
	bl	atan
	fmov	d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	fmul	d0, d1, d0
	str	d0, [sp, 200]
	ldr	x0, [sp, 248]
	add	x0, x0, 1
	str	x0, [sp, 248]
.L27:
	ldr	x1, [sp, 248]
	ldr	x0, [sp, 112]
	cmp	x1, x0
	ble	.L28
	fmov	d0, 1.0e+0
	str	d0, [sp, 208]
	fmov	d0, 1.0e+0
	str	d0, [sp, 200]
	fmov	d0, 1.0e+0
	str	d0, [sp, 56]
	mov	x0, 1
	str	x0, [sp, 248]
	b	.L29
.L30:
	add	x0, sp, 56
	ldr	d1, [sp, 200]
	ldr	d0, [sp, 208]
	bl	P3
	ldr	x0, [sp, 248]
	add	x0, x0, 1
	str	x0, [sp, 248]
.L29:
	ldr	x1, [sp, 248]
	ldr	x0, [sp, 104]
	cmp	x1, x0
	ble	.L30
	adrp	x0, J
	add	x0, x0, :lo12:J
	mov	w1, 1
	str	w1, [x0]
	adrp	x0, K
	add	x0, x0, :lo12:K
	mov	w1, 2
	str	w1, [x0]
	adrp	x0, L
	add	x0, x0, :lo12:L
	mov	w1, 3
	str	w1, [x0]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	fmov	d0, 1.0e+0
	str	d0, [x0, 8]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	fmov	d0, 2.0e+0
	str	d0, [x0, 16]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	fmov	d0, 3.0e+0
	str	d0, [x0, 24]
	mov	x0, 1
	str	x0, [sp, 248]
	b	.L31
.L32:
	bl	P0
	ldr	x0, [sp, 248]
	add	x0, x0, 1
	str	x0, [sp, 248]
.L31:
	ldr	x1, [sp, 248]
	ldr	x0, [sp, 96]
	cmp	x1, x0
	ble	.L32
	adrp	x0, J
	add	x0, x0, :lo12:J
	mov	w1, 2
	str	w1, [x0]
	adrp	x0, K
	add	x0, x0, :lo12:K
	mov	w1, 3
	str	w1, [x0]
	mov	x0, 1
	str	x0, [sp, 248]
	b	.L33
.L34:
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w1, [x0]
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w0, [x0]
	add	w1, w1, w0
	adrp	x0, J
	add	x0, x0, :lo12:J
	str	w1, [x0]
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w1, [x0]
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w0, [x0]
	add	w1, w1, w0
	adrp	x0, K
	add	x0, x0, :lo12:K
	str	w1, [x0]
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w1, [x0]
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w0, [x0]
	sub	w1, w1, w0
	adrp	x0, J
	add	x0, x0, :lo12:J
	str	w1, [x0]
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w1, [x0]
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w0, [x0]
	sub	w1, w1, w0
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w0, [x0]
	sub	w1, w1, w0
	adrp	x0, K
	add	x0, x0, :lo12:K
	str	w1, [x0]
	ldr	x0, [sp, 248]
	add	x0, x0, 1
	str	x0, [sp, 248]
.L33:
	ldr	x1, [sp, 248]
	ldr	x0, [sp, 88]
	cmp	x1, x0
	ble	.L34
	fmov	d0, 7.5e-1
	str	d0, [sp, 208]
	mov	x0, 1
	str	x0, [sp, 248]
	b	.L35
.L36:
	ldr	d0, [sp, 208]
	bl	log
	fmov	d1, d0
	adrp	x0, T1
	add	x0, x0, :lo12:T1
	ldr	d0, [x0]
	fdiv	d0, d1, d0
	bl	exp
	bl	sqrt
	str	d0, [sp, 208]
	ldr	x0, [sp, 248]
	add	x0, x0, 1
	str	x0, [sp, 248]
.L35:
	ldr	x1, [sp, 248]
	ldr	x0, [sp, 80]
	cmp	x1, x0
	ble	.L36
	ldr	w0, [sp, 192]
	add	w0, w0, 1
	str	w0, [sp, 192]
	ldr	w1, [sp, 192]
	ldr	w0, [sp, 196]
	cmp	w1, w0
	bgt	.L37
	b	.L10
.L37:
	mov	x0, 0
	bl	time
	str	x0, [sp, 72]
	mov	w0, 10
	bl	putchar
	ldr	x1, [sp, 72]
	ldr	x0, [sp, 168]
	sub	x0, x1, x0
	cmp	x0, 0
	bgt	.L38
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	puts
	mov	w0, 1
	b	.L43
.L38:
	ldr	x1, [sp, 72]
	ldr	x0, [sp, 168]
	sub	x0, x1, x0
	mov	x3, x0
	ldr	w2, [sp, 196]
	ldr	x1, [sp, 160]
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	printf
	ldr	d0, [sp, 160]
	scvtf	d0, d0
	mov	x0, 4636737291354636288
	fmov	d1, x0
	fmul	d1, d0, d1
	ldr	w0, [sp, 196]
	scvtf	d0, w0
	fmul	d1, d1, d0
	ldr	x1, [sp, 72]
	ldr	x0, [sp, 168]
	sub	x0, x1, x0
	scvtf	s0, x0
	fcvt	d0, s0
	fdiv	d0, d1, d0
	fcvt	s0, d0
	str	s0, [sp, 68]
	ldr	s0, [sp, 68]
	mov	w0, 1148846080
	fmov	s1, w0
	fcmpe	s0, s1
	bge	.L44
	b	.L45
.L44:
	ldr	s0, [sp, 68]
	fcvt	d0, s0
	mov	x0, 70368744177664
	movk	x0, 0x408f, lsl 48
	fmov	d1, x0
	fdiv	d0, d0, d1
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	b	.L41
.L45:
	ldr	s0, [sp, 68]
	fcvt	d0, s0
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	printf
.L41:
	ldr	w0, [sp, 180]
	cmp	w0, 0
	beq	.L42
	b	.L9
.L42:
	mov	w0, 0
.L43:
	ldp	d8, d9, [sp, 16]
	ldp	x29, x30, [sp], 256
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.align	2
	.global	PA
	.type	PA, %function
PA:
.LFB7:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	adrp	x0, J
	add	x0, x0, :lo12:J
	str	wzr, [x0]
.L47:
	ldr	x0, [sp, 8]
	add	x0, x0, 8
	ldr	d1, [x0]
	ldr	x0, [sp, 8]
	add	x0, x0, 16
	ldr	d0, [x0]
	fadd	d1, d1, d0
	ldr	x0, [sp, 8]
	add	x0, x0, 24
	ldr	d0, [x0]
	fadd	d1, d1, d0
	ldr	x0, [sp, 8]
	add	x0, x0, 32
	ldr	d0, [x0]
	fsub	d1, d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	ldr	x0, [sp, 8]
	add	x0, x0, 8
	fmul	d0, d1, d0
	str	d0, [x0]
	ldr	x0, [sp, 8]
	add	x0, x0, 8
	ldr	d1, [x0]
	ldr	x0, [sp, 8]
	add	x0, x0, 16
	ldr	d0, [x0]
	fadd	d1, d1, d0
	ldr	x0, [sp, 8]
	add	x0, x0, 24
	ldr	d0, [x0]
	fsub	d1, d1, d0
	ldr	x0, [sp, 8]
	add	x0, x0, 32
	ldr	d0, [x0]
	fadd	d1, d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	ldr	x0, [sp, 8]
	add	x0, x0, 16
	fmul	d0, d1, d0
	str	d0, [x0]
	ldr	x0, [sp, 8]
	add	x0, x0, 8
	ldr	d1, [x0]
	ldr	x0, [sp, 8]
	add	x0, x0, 16
	ldr	d0, [x0]
	fsub	d1, d1, d0
	ldr	x0, [sp, 8]
	add	x0, x0, 24
	ldr	d0, [x0]
	fadd	d1, d1, d0
	ldr	x0, [sp, 8]
	add	x0, x0, 32
	ldr	d0, [x0]
	fadd	d1, d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	ldr	x0, [sp, 8]
	add	x0, x0, 24
	fmul	d0, d1, d0
	str	d0, [x0]
	ldr	x0, [sp, 8]
	add	x0, x0, 16
	ldr	d1, [x0]
	ldr	x0, [sp, 8]
	add	x0, x0, 8
	ldr	d0, [x0]
	fsub	d1, d1, d0
	ldr	x0, [sp, 8]
	add	x0, x0, 24
	ldr	d0, [x0]
	fadd	d1, d1, d0
	ldr	x0, [sp, 8]
	add	x0, x0, 32
	ldr	d0, [x0]
	fadd	d1, d1, d0
	adrp	x0, T2
	add	x0, x0, :lo12:T2
	ldr	d0, [x0]
	ldr	x0, [sp, 8]
	add	x0, x0, 32
	fdiv	d0, d1, d0
	str	d0, [x0]
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w0, [x0]
	add	w1, w0, 1
	adrp	x0, J
	add	x0, x0, :lo12:J
	str	w1, [x0]
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w0, [x0]
	cmp	w0, 5
	bgt	.L49
	b	.L47
.L49:
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	PA, .-PA
	.align	2
	.global	P0
	.type	P0, %function
P0:
.LFB8:
	.cfi_startproc
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w1, [x0]
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w2, [x0]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	sxtw	x1, w1
	ldr	d0, [x0, x1, lsl 3]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	sxtw	x1, w2
	str	d0, [x0, x1, lsl 3]
	adrp	x0, L
	add	x0, x0, :lo12:L
	ldr	w1, [x0]
	adrp	x0, K
	add	x0, x0, :lo12:K
	ldr	w2, [x0]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	sxtw	x1, w1
	ldr	d0, [x0, x1, lsl 3]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	sxtw	x1, w2
	str	d0, [x0, x1, lsl 3]
	adrp	x0, J
	add	x0, x0, :lo12:J
	ldr	w1, [x0]
	adrp	x0, L
	add	x0, x0, :lo12:L
	ldr	w2, [x0]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	sxtw	x1, w1
	ldr	d0, [x0, x1, lsl 3]
	adrp	x0, E1
	add	x0, x0, :lo12:E1
	sxtw	x1, w2
	str	d0, [x0, x1, lsl 3]
	nop
	ret
	.cfi_endproc
.LFE8:
	.size	P0, .-P0
	.align	2
	.global	P3
	.type	P3, %function
P3:
.LFB9:
	.cfi_startproc
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	d0, [sp, 24]
	str	d1, [sp, 16]
	str	x0, [sp, 8]
	ldr	d0, [sp, 24]
	str	d0, [sp, 40]
	ldr	d0, [sp, 16]
	str	d0, [sp, 32]
	ldr	d1, [sp, 40]
	ldr	d0, [sp, 32]
	fadd	d1, d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	fmul	d0, d1, d0
	str	d0, [sp, 40]
	ldr	d1, [sp, 40]
	ldr	d0, [sp, 32]
	fadd	d1, d1, d0
	adrp	x0, T
	add	x0, x0, :lo12:T
	ldr	d0, [x0]
	fmul	d0, d1, d0
	str	d0, [sp, 32]
	ldr	d1, [sp, 40]
	ldr	d0, [sp, 32]
	fadd	d1, d1, d0
	adrp	x0, T2
	add	x0, x0, :lo12:T2
	ldr	d0, [x0]
	fdiv	d0, d1, d0
	ldr	x0, [sp, 8]
	str	d0, [x0]
	nop
	add	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	P3, .-P3
	.section	.rodata
	.align	3
.LC6:
	.word	611603343
	.word	1071644567
	.align	3
.LC7:
	.word	1236950581
	.word	1071645196
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
