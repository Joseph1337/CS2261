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
	.file	"myLib.c"
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
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	cmp	r2, #0
	ldrh	lr, [sp, #16]
	ble	.L10
	ldr	ip, .L15
	rsb	r5, r1, r1, lsl #4
	add	r4, r3, r1
	ldr	ip, [ip]
	add	r6, r0, r5, lsl #4
	rsb	r4, r4, r4, lsl #4
	sub	r4, r4, r5
	add	r5, r6, r2
	add	r5, ip, r5, lsl #1
	lsl	r4, r4, #5
	add	ip, ip, r6, lsl #1
.L9:
	strh	lr, [ip]	@ movhi
	strh	lr, [ip, r4]	@ movhi
	add	ip, ip, #2
	cmp	ip, r5
	bne	.L9
.L10:
	cmp	r3, #0
	blt	.L5
	ldr	r4, .L15
	add	ip, r1, r3
	ldr	r3, [r4]
	rsb	r1, r1, r1, lsl #4
	rsb	ip, ip, ip, lsl #4
	add	ip, r0, ip, lsl #4
	add	r0, r0, r1, lsl #4
	add	r1, r3, #480
	lsl	r2, r2, #1
	add	r3, r3, r0, lsl #1
	add	r1, r1, ip, lsl #1
.L11:
	strh	lr, [r3]	@ movhi
	strh	lr, [r3, r2]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L11
.L5:
	pop	{r4, r5, r6, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #100663296
	ldr	r2, .L21
.L18:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L18
	bx	lr
.L22:
	.align	2
.L21:
	.word	100740098
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L24:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L24
	mov	r2, #67108864
.L25:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L25
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [sp, #4]
	add	r3, r1, r3
	sub	r3, r3, #1
	cmp	r3, ip
	ble	.L33
	ldr	r3, [sp, #12]
	add	ip, ip, r3
	sub	ip, ip, #1
	cmp	ip, r1
	ble	.L33
	ldr	r3, [sp]
	add	r2, r0, r2
	sub	r2, r2, #1
	cmp	r2, r3
	ble	.L33
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	sub	r3, r3, #1
	cmp	r3, r0
	movle	r0, #0
	movgt	r0, #1
	bx	lr
.L33:
	mov	r0, #0
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
