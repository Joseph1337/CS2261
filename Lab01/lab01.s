	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"lab01.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L11
	push	{r4, lr}
	rsb	r1, r1, r1, lsl #4
	ldr	lr, [r3]
	add	r0, r0, r1, lsl #4
	add	r2, lr, r0, lsl #1
	mov	r3, r2
	mov	r1, #31
	add	ip, lr, #50
	lsl	r4, r0, #1
	add	ip, ip, r0, lsl #1
.L6:
	strh	r1, [r3]	@ movhi
	add	r0, r3, #7680
	add	r3, r3, #2
	cmp	r3, ip
	strh	r1, [r0]	@ movhi
	bne	.L6
	mov	r3, #31
	add	r1, lr, #8128
	add	r1, r1, #32
	add	r1, r1, r4
.L7:
	strh	r3, [r2]	@ movhi
	strh	r3, [r2, #50]	@ movhi
	add	r2, r2, #480
	cmp	r1, r2
	bne	.L7
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	drawLetter
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLetter, %function
drawLetter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mvn	lr, #64512
	ldr	r3, .L19
	ldr	r2, [r3]
	rsb	r1, r1, r1, lsl #4
	add	r4, r2, #7168
	add	r3, r0, r1, lsl #4
	add	ip, r4, #32
	add	ip, ip, r3, lsl #1
	lsl	r5, r3, #1
	lsl	r1, r1, #4
	add	r3, r2, r3, lsl #1
.L14:
	strh	lr, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, ip
	bne	.L14
	add	r3, r0, r1
	add	r3, r3, #1680
	add	r3, r3, #1
	add	r3, r2, r3, lsl #1
	mov	r2, r3
	mvn	r1, #64512
	add	r0, r4, #50
	add	r0, r0, r5
.L15:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	add	r3, r3, #2
	strh	r1, [r2]	@ movhi
	cmp	r3, r0
	sub	r2, r2, #476
	sub	r2, r2, #2
	bne	.L15
	pop	{r4, r5, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	drawLetter, .-drawLetter
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L24
	push	{r4, lr}
	mov	r1, #15
	strh	r2, [r3]	@ movhi
	mov	r0, #30
	ldr	r3, .L24+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L24+8
	mov	r1, #40
	mov	r0, #60
	mov	lr, pc
	bx	r4
	mov	r1, #60
	mov	r0, #80
	mov	lr, pc
	bx	r4
.L22:
	b	.L22
.L25:
	.align	2
.L24:
	.word	1027
	.word	drawRect
	.word	drawLetter
	.size	main, .-main
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
